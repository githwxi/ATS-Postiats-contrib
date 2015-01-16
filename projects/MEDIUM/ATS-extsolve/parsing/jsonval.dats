(**
  Implementing jsonval using jsmn
*)
//
#include
"patsolve.hats"
//
(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "parsing/jsonval.sats"

(* ****** ****** *)

staload "{$LIBATSWDBLAIR}/jsmn/SATS/jsmn.sats"

(* ****** ****** *)

staload "libc/SATS/string.sats"
staload "libc/SATS/stdio.sats"
staload "libc/SATS/stdlib.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

assume jsonval = jsmntokptr

(* ****** ****** *)

#define bufsize 1024

(**
    This is unsafe because it assumes that bytes
    that lie outside the boundary m are initialized
    after the call, which they are not.
*)
extern
fun realloc_unsafe {l:addr} {m,n:int} (
    bytes m @ l, mfree_gc_v(l) |
        ptr l, size_t(n)
): [k:addr] (
    bytes (n) @ k, mfree_gc_v (k) | ptr (k)
)  = "ext#"

%{
void* realloc_unsafe (void *p, size_t n) {
    void *r = realloc (p, n);
    
    if (r == NULL) {
        fprintf(stderr, "realloc failed!\n");
        exit(1);
    }
    
    return r;
}
%}

extern
praxi remove_proof {a:vt@ype} {l:addr} (
    a @ l , mfree_gc_v (l)
): void

extern
praxi array_to_bytes {a:t@ype} {n:int} {l:addr} (
    @[a][n] @ l 
): bytes(n*sizeof(a)) @ l

extern
praxi bytes_to_array {a:t@ype} {n:int} {l:addr} (
    bytes(n*sizeof(a)) @ l
):  @[a][n] @ l

(**
    This is as ugly as sin. It would be good to
    clean it up a little bit.
*)
implement
jsonval_parse_from_stdin () = let
    var parser : jsmn_parser
    val () = jsmn_init (parser)
    
    val (pfjs, pffjs | js) = malloc_gc (i2sz(0))
    val (pftok, pfftok | tok) = malloc_gc (sizeof<jsmntok_t> * i2sz(2))
    
    prval pfjs = b0ytes2bytes_v (pfjs)
    prval pftok = b0ytes2bytes_v (pftok)
    
    fun loop {k,l:addr} {m,n:int} (
        pfjson: bytes(m) @ k, pftok: bytes(sizeof(jsmntok_t)*n) @ l, 
        pffjson: mfree_gc_v(k), pfftok: mfree_gc_v(l) |
            parser: &jsmn_parser, json: ptr (k), tokens: ptr (l), 
            m: size_t (m), n: size_t (n),
            parsed: bool
    ): (string, jsonval) = let
        val stdin = stdin_ref
        var buf : @[byte][bufsize]
        prval () = b0ytes2bytes (buf)
        
        val r = fread (buf, i2sz(1), i2sz(bufsize), stdin)
    in
        if r < i2sz(0) then let
            (** An error occured *)
            val () = mfree_gc (pfjson, pffjson | json)
            val () = mfree_gc (pftok, pfftok | tokens)
            val () = prerrln! ("fread failed!")
        in
            exit (1)
        end
        else if r = 0 then
            (** Reached end of file *)
            
            if feof (stdin) != 0 andalso parsed then let
                (**
                     Make sure we have room for the null byte
                *)
                val (pfjson, pffjson | js) = 
                    realloc_unsafe (pfjson, pffjson | json, m+i2sz(1))
                val ending = $UN.cast{ptr}(add_ptr_bsz (js, m))
                val () = $UN.ptr0_set (ending, '\0')
                
                prval () = remove_proof (pfjson, pffjson)
                prval () = remove_proof (pftok, pfftok)
                
                val str = $UN.cast{string} (js)
                val jsv = $UN.cast{jsonval} (tokens)
            in
                (str, jsv)
            end
            else let
                val () = mfree_gc (pfjson, pffjson | json)
                val () = mfree_gc (pftok, pfftok | tokens)
                val () = prerrln! ("unexpected end of file!")
            in
                exit (1)
            end
        else let
            (** Try parsing again. *)
            val (pfjs, pffjs | js) =
                realloc_unsafe (pfjson, pffjson | json, m+r)
            val newjs = add_ptr_bsz (js, m)
            val _ = strncpy_unsafe (newjs, $UN.cast{string} (buf), r)
            val jslen = m+r
            
            fun parse {k,l:addr} {m,n:int} (
                pfjs: !bytes(m) @ k, pftok: bytes(sizeof(jsmntok_t)*n) @ l,
                pfftok: mfree_gc_v(l) |
                    parser: &jsmn_parser, js: ptr k, tok: ptr l, m: size_t m, n: size_t n
            ): [q:addr] [o:int](
                bytes(sizeof(jsmntok_t)*o) @ q, mfree_gc_v(q) | ptr q, size_t o, bool
            ) = let
                val err = jsmn_parse (pfjs, pftok | parser, js, m, tok, sz2u(n))
            in
                if err < 0 then
                    if err = JSMN_ERROR_NOMEM then let
                        val tokcount = n * i2sz(2)
                        val newbytes = sizeof<jsmntok_t> * tokcount
                        val (pftok, pfftok | tok) = 
                            realloc_unsafe (pftok, pfftok | tok, newbytes)
                    in
                        parse (pfjs, pftok, pfftok | parser, js, tok, m, tokcount)
                    end
                    else
                        (pftok, pfftok |  tok, n, false)
                else
                    (pftok, pfftok | tok, n, true)
            end
            
            val (pftok, pfftok | tok, tokcount, finished) = 
                parse (pfjs, pftok, pfftok | parser, js, tokens, jslen, n)
        in
            loop (pfjs, pftok, pffjs, pfftok | parser, js, tok, jslen, tokcount, finished)
        end  // end of [else]
        
    end  // end of [loop]  
in
    loop (pfjs, pftok, pffjs, pfftok | parser, js, tok, i2sz(0), i2sz(2), false)
end // end of [jsonval_parse_stdin]

(* ****** ****** *)

(**
    Get the number of tokens in a jsonval
*)
extern
fun{} jsonval_numtokens(jsonval): int

implement{}
jsonval_numtokens (jsv) = 
    if jsv.type = JSMN_PRIMITIVE then
        1
    else if jsv.type = JSMN_STRING then
        1
    else if jsv.type = JSMN_ARRAY then let
        //
        fun loop (jsv: jsonval, i: int, n:int): int =
            if i = jsv.size then
                n
            else let
                val p = $UN.cast{ptr} (jsv)
                val ofs =  g0i2u(n)*sizeof<jsmntok_t>
                val nextjsv = $UN.cast{jsonval} (add_ptr_bsz(p, ofs))
            in
                loop (jsv, succ (i), n + jsonval_numtokens (nextjsv))
            end
        //
    in
        loop (jsv, 0, 1)
    end
    else if jsv.type = JSMN_OBJECT then let

        fun loop (jsv: jsonval, i: int, n: int): int =
            if i = jsv.size then
                n
            else let
                val p =  $UN.cast{ptr}(jsv)
                val keyofs =  g0i2u(n)*sizeof<jsmntok_t>
                val keyjsv = $UN.cast{jsonval}(add_ptr_bsz(p, keyofs))
                val keysize = jsonval_numtokens (keyjsv)
                //
                val valueofs = g0i2u(n + keysize) * sizeof<jsmntok_t>
                val valuejsv = $UN.cast{jsonval}(add_ptr_bsz(p, valueofs))
                val valuesize = jsonval_numtokens (valuejsv)
            in
                loop (jsv, succ(i), n + keysize + valuesize)
            end

     in
         loop (jsv, 0, 1)
     end
     else let
         val () = prerrln! ("Invalid json value.")
     in
         exit(1)
     end

(* ****** ****** *)

implement{}
jsonval_is_int (jsv) =
  if jsv.type != JSMN_PRIMITIVE then
    false
  else let
    val [n:int] n = g1ofg0(jsv.size)
    val () = assertloc (n >= 0)
    val src = $UN.cast{string(n)} (jsv.string)

    fun loop {i:nat | i <= n} (src: string(n), i: int i): bool =
      if i = n then
        true
      else let
        val ok = $extfcall (bool, "isdigit", src[i])
      in
        if ~ok then
          false
        else
          loop (src, succ(i))
      end
   in
    loop (src, 0)
   end

implement{}
jsonval_is_string (jsv) = jsv.type = JSMN_STRING

(**
  Need to search for "true" or "false" at its token
  value.
*)
implement{}
jsonval_is_bool (jsv) =
  jsv.type = JSMN_PRIMITIVE andalso 
    (strncmp("true", jsv.string, i2sz(4)) = 0 orelse
     strncmp("false", jsv.string, i2sz(4)) = 0)

implement{}
jsonval_is_array (jsv) = jsv.type = JSMN_ARRAY

implement{}
jsonval_is_object (jsv) = jsv.type = JSMN_OBJECT

(* ****** ****** *)

implement{}
int_of_jsonval (jsv) = let
    val str = jsv.string
    val i = strtol (str, 10)
in
    $UN.cast{int} (i)
end

implement{}
bool_of_jsonval (jsv) = let
    val str = jsv.string
in
    strcmp (str, "true") = 0
end

(* ****** ****** *)

implement{}
jsonval_get_string (jsv) = let
  val src = jsonval_src ()
  val buf = add_ptr_bsz($UN.cast{ptr}(src), g0i2u(jsv.start))
in
  $UN.cast{string} (buf)
end

implement{}
jsonval_get_copy_string (jsv) = let
    val str = jsv.string
    val size = g1ofg0(jsv.ending - jsv.start)
    
    val () = assertloc(size >= 0)
    val size = i2sz(size)
    
    val buf = arrayptr_make_elt<char> (size+i2sz(1), '\0')
    val copy = $UN.castvwtp0{Ptr} (buf)
    val _ = strncpy_unsafe (copy, str, size)
in
    $UN.cast{string} (copy)
end

implement{}
jsonval_get_string_unsafe (jsv) = let
    val str = jsv.string
    val size = jsv.ending - jsv.start
    
    val p = $UN.cast{ptr} (str)
    val pend = add_ptr_bsz (p, g0i2u(size))
    val () = $UN.ptr0_set (pend, '\0')
in
    str
end

implement
jsonval_size (jsv) = jsmntok_size (jsv)

implement
jsonval_array_get_at_exn (jsv, i) = let
  val () = assertloc(i >= 0 andalso i < jsv.size)
  val p = $UN.cast{ptr} (jsv)
  
  fun loop (jsv: jsonval, j:int, n:int): int =
      if j = i then
          n
      else let
          val p = $UN.cast{ptr} (jsv) 
          val ofs =  g0i2u(n)*sizeof<jsmntok_t>
          val nextjsv = $UN.cast{jsonval} (add_ptr_bsz(p, ofs))
      in
          loop (jsv, succ(i), n + jsonval_numtokens (nextjsv))
      end
      
  val j = loop (jsv, 0, 1)
  val p = $UN.cast{ptr} (jsv)
  val ofs = g0i2u(j)*sizeof<jsmntok_t>
  val q = add_ptr_bsz(p, ofs)
in
  $UN.cast{jsonval}(q)
end

implement{}
jsonval_object_get_key_exn (jsv, label) = let
    val () = assertloc (jsonval_is_object (jsv))

    fun loop (jsv: jsonval, i:int, n:int): jsonval =
         if i = jsv.size then let
            val () = prerrln! ("key ", label, " not found")
         in
             exit(1)
         end
         else let
             val p = $UN.cast{ptr} (jsv)
             val ofs = g0i2u(n)*sizeof<jsmntok_t>
             val keyjsv = $UN.cast{jsonval} (add_ptr_bsz (p, ofs))
             val () = 
                 if ~jsonval_is_string (keyjsv) then begin
                     println! ("Key is not string! While looking for key ", label);
                     println! ("Found type: ", keyjsv.type);
                     println! ("ofs = ", n);
                     println! ("start =", keyjsv.start);
                 end
                          
             val () = assertloc (jsonval_is_string (keyjsv))
             val key = keyjsv.string
             val ofs = g0i2u(n+1)*sizeof<jsmntok_t>
             val valjsv = $UN.cast{jsonval} (add_ptr_bsz(p, ofs))
         in
            if strncmp (key, label, length (label)) = 0 then 
               valjsv
           else
               loop (jsv, succ(i), n+1+jsonval_numtokens (valjsv))
        end
in
    loop (jsv, 0, 1)
end

implement{}
jsonval_object_has_key (jsv, label) = let
    val () = assertloc (jsonval_is_object (jsv))
    
    fun loop (jsv: jsonval, i:int, n:int): bool =
        if i = jsv.size then
            false
        else let
             val p = $UN.cast{ptr} (jsv)
             val ofs = g0i2u(n)*sizeof<jsmntok_t>
             val keyjsv = $UN.cast{jsonval} (add_ptr_bsz (p, ofs))
             val () = assertloc (jsonval_is_string (keyjsv))
             val key = keyjsv.string
        in
            if strncmp (key, label, length (label)) = 0 then
                true
            else let
                val ofs = g0i2u(n+1)*sizeof<jsmntok_t>
                val valjsv = $UN.cast{jsonval} (add_ptr_bsz(p, ofs))
            in
                loop (jsv, succ(i), n+1+jsonval_numtokens (valjsv))
            end
        end
in
    loop (jsv, 0, 1)
end

local

#define :: list_vt_cons
#define nil list_vt_nil

in

implement {a}
jsonval_array_map (jsv0) = let
    
    val () = assertloc (jsonval_is_array (jsv0))
    
    fun loop (
        jsv: jsonval, i:int, n: int, rs: List0_vt (a)
    ): List0_vt (a) =
        if i = jsv.size then
            list_vt_reverse (rs)
        else let
            val pjs = $UN.cast{ptr} (jsv)
            val ofs = g0i2u(n)*sizeof<jsmntok_t>
            val jsvi = $UN.cast{jsonval} (add_ptr_bsz (pjs, ofs))
            val x = jsonval_parse<a> (jsvi)
         in
             loop (jsv, succ(i), n+jsonval_numtokens (jsvi), x :: rs)
         end
in
    loop (jsv0, 0, 1, nil)
end

end // end of [local]
          
    
         
    
