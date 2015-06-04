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
staload _ = "{$LIBATSWDBLAIR}/jsmn/DATS/jsmn.dats"

(* ****** ****** *)

staload "libc/SATS/string.sats"
staload "libc/SATS/stdio.sats"
staload "libc/SATS/stdlib.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

assume jsonval = jsmntokptr

(* ****** ****** *)

implement{}
jsmn_src () = jsonval_src ()

(* ****** ****** *)

#define bufsize 1024

local

vtypedef buffer_gc ( l:addr, n:int) = @{
    pf= bytes n @ l,
    fpf= mfree_gc_v l,
    p= ptr l
}

(**
    This is unsafe because it assumes that bytes
    that lie outside the boundary m are initialized
    after the call, which they are not.
*)
extern
fun realloc_unsafe {l:addr} {m,n:int} (
    buffer_gc(l, m), size_t n
): [k:addr] (
    buffer_gc(k, n)
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

fun 
buffer_malloc_gc {n:int} (
    n: size_t n
): [l:addr] buffer_gc (l, n) = let
    val (pf, pfgc | p) = malloc_gc (n)
    prval pf = b0ytes2bytes_v (pf) (** cheating *)
in
    @{pf=pf, fpf=pfgc, p= p}
end

fun
buffer_mfree_gc {l:addr} {n:int} (
    buf: buffer_gc (l, n) 
): void = let
    prval pf = buf.pf
    prval pfgc = buf.fpf
    val p = buf.p
in
    mfree_gc (pf, pfgc | p)
end

in

implement
jsonval_parse_from_stdin () = let
    var parser : jsmn_parser
    val () = jsmn_init (parser)
    
    val (js) = buffer_malloc_gc (i2sz(0))
    val (tok) = buffer_malloc_gc (sizeof<jsmntok_t> * i2sz(2))

in
    loop (js, i2sz(0), tok, i2sz(2), parser, false)
end where {

    fun loop {k,l:addr} {m,n:int} (
        js: buffer_gc (k, m), m: size_t m, 
        tok: buffer_gc (l, sizeof(jsmntok_t)*n), n: size_t (n),
        parser: &jsmn_parser, parsed: bool
    ): (string, jsonval) = let
        val stdin = stdin_ref
        var buf : @[byte][bufsize]
        prval () = b0ytes2bytes (buf)
        
        val r = fread (buf, i2sz(1), i2sz(bufsize), stdin)
    in
        if r < i2sz (0) then let
            (** An error occured *)
            val () = buffer_mfree_gc (js)
            val () = buffer_mfree_gc (tok)
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
                val js = 
                    realloc_unsafe (js, m+i2sz(1))
                val ending = $UN.cast{ptr}(add_ptr_bsz (js.p, m))
                val () = $UN.ptr0_set (ending, '\0')

                val str = $UN.castvwtp0{string} (js)
                val jsv = $UN.castvwtp0{jsonval} (tok)
            in
                (str, jsv)
            end
            else let
                val () = buffer_mfree_gc (js)
                val () = buffer_mfree_gc (tok)
                val () = prerrln! ("unexpected end of file!")
            in
                exit (1)
            end
        else let
            (** Try parsing again. *)
            val (js) =
                realloc_unsafe (js, m+r)
            val newjs = add_ptr_bsz (js.p, m)
            val _ = strncpy_unsafe (newjs, $UN.cast{string} (buf), r)
            val jslen = m+r
            
            fun parse {k,l:addr} {m,n:int} (
                js: !buffer_gc (k, m), m: size_t m,  
                tok: buffer_gc (l, sizeof(jsmntok_t)*n), n: size_t n, 
                parser: &jsmn_parser
            ): [q:addr] [o:int] (
                buffer_gc (q, sizeof(jsmntok_t)*o), size_t o, bool
            ) = let
                prval pfjs = js.pf
                prval pftok = tok.pf

                val err = jsmn_parse (pfjs, pftok | parser, js.p, m, tok.p, sz2u(n))
                
                prval () = js.pf := pfjs
                prval () = tok.pf := pftok
            in
                if err < 0 then
                    if err = JSMN_ERROR_NOMEM then let
                        val tokcount = n * i2sz(2)
                        val newbytes = sizeof<jsmntok_t> * tokcount
                        val (tok) = 
                            realloc_unsafe (tok, newbytes)
                    in
                        parse (js, m, tok, tokcount, parser)
                    end
                    else
                        (tok, n, false)
                else
                    (tok, n, true)
            end
            
            val (tok, tokcount, finished) = parse (js, jslen, tok, n, parser)
        in
            loop (js, jslen, tok, tokcount, parser, finished)
        end  // end of [else]
        
    end  // end of [loop]  

}// end of [jsonval_parse_stdin]

end // end of [local]

(* ****** ****** *)

(**
	Need to account for negative numbers.
	Should just use "atoi" instead.
*)
implement{}
jsonval_is_int (jsv) =
  if jsv.type() != JSMN_PRIMITIVE then
    false
  else let
    val [n:int] n = g1ofg0(jsv.size())
    val () = assertloc (n >= 0)
    val src = $UN.cast{string(n)} (jsv.string())

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
jsonval_is_string (jsv) = jsv.type() = JSMN_STRING

(**
  Need to search for "true" or "false" at its token
  value.
*)
implement{}
jsonval_is_bool (jsv) =
  jsv.type() = JSMN_PRIMITIVE andalso 
    (strncmp("true", jsv.string(), i2sz(4)) = 0 orelse
     strncmp("false", jsv.string(), i2sz(4)) = 0)

implement{}
jsonval_is_array (jsv) = jsv.type() = JSMN_ARRAY

implement{}
jsonval_is_object (jsv) = jsv.type() = JSMN_OBJECT

(* ****** ****** *)

implement{}
int_of_jsonval (jsv) = let
    val str = jsv.string()
    val i = strtol (str, 10)
in
    $UN.cast{int} (i)
end

implement{}
bool_of_jsonval (jsv) = let
    val str = jsv.string()
in
    strcmp (str, "true") = 0
end

(* ****** ****** *)

implement{}
jsonval_get_string (jsv) = let
  val src = jsonval_src ()
  val buf = add_ptr_bsz($UN.cast{ptr}(src), g0i2u(jsv.start()))
in
  $UN.cast{string} (buf)
end

implement{}
jsonval_get_copy_string (jsv) = let
    val str = jsv.string()
    val size = g1ofg0(jsv.ending() - jsv.start())
    
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
    val str = jsv.string()
    val size = jsv.ending() - jsv.start()
    
    val p = $UN.cast{ptr} (str)
    val pend = add_ptr_bsz (p, g0i2u(size))
    val () = $UN.ptr0_set (pend, '\0')
in
    str
end

implement
jsonval_size (jsv) = jsmntok_size (jsv)

implement{}
jsonval_array_get_at_exn (jsv, i) = let
  val () = assertloc(i >= 0 andalso i < jsv.size())
  val p = $UN.cast{ptr} (jsv)
  
  fun loop (jsv: jsonval, j:int, n:int): int =
      if j = i then
          n
      else let
          val p = $UN.cast{ptr} (jsv) 
          val ofs =  g0i2u(n)*sizeof<jsmntok_t>
          val nextjsv = $UN.cast{jsonval} (add_ptr_bsz(p, ofs))
      in
          loop (jsv, succ(j), n + nextjsv.numtokens())
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
     (**
     val () = 
        if ~jsonval_is_object (jsv) then {
            val () = println! ("Expected object but found: ", jsv.type())
	    val () = println! ("Looking for label:", label)
            val () = println! ("Token starts @  ", jsv.start)
            val () = println! ("Data:", jsv.string_unsafe())
        }
     *)
    val () = assertloc (jsonval_is_object (jsv))

    fun loop (jsv: jsonval, i:int, n:int): jsonval =
         if i = jsv.size() then let
            val () = prerrln! ("key ", label, " not found")
         in
             exit(1)
         end
         else let
             val p = $UN.cast{ptr} (jsv)
             val ofs = g0i2u(n)*sizeof<jsmntok_t>
             val keyjsv = $UN.cast{jsonval} (add_ptr_bsz (p, ofs))
             (**
             val () = 
                 if ~jsonval_is_string (keyjsv) then begin
                     println! ("Key is not string! While looking for key ", label);
                     println! ("Found type: ", keyjsv.type());
                     println! ("ofs = ", n);
                     println! ("start =", keyjsv.start);
                 end
             *)    
             val () = assertloc (jsonval_is_string (keyjsv))
             val key = keyjsv.string()
             val ofs = g0i2u(n+1)*sizeof<jsmntok_t>
             val valjsv = $UN.cast{jsonval} (add_ptr_bsz(p, ofs))
         in
            if strncmp (key, label, length (label)) = 0 then let
               (**
               val () = println! ("Found value for key ", label)
               val () = println! ("JSON key is ", keyjsv.string_unsafe())
               val () = println! ("JSON value is ", valjsv.string_unsafe())
               *)
            in 
               valjsv
            end
            else let
               val valsize = valjsv.numtokens()
               (**
               val () = println! ("object_get_key: at offset ", n)
               val () = println! ("object_get_key: at key i=", i)
               val () = println! ("object_get_key: found object of size", valsize)
               *)
               val nextoffset = n + 1 + valsize
               // val () = println! ("object_get_key: looking at offset ", nextoffset, " next")   
            in          
               loop (jsv, succ(i), nextoffset)
            end
        end
in
    loop (jsv, 0, 1)
end

implement{}
jsonval_object_has_key (jsv, label) = let
    (**
    val () = 
        if ~jsonval_is_object (jsv) then {
            val () = println! ("Expected object but found: ", jsv.type())
	    val () = println! ("Looking for label:", label)
            val () = println! ("Token starts @  ", jsv.start)
            val () = println! ("Data:", jsv.string_unsafe())
        }
    *)
    val () = assertloc (jsonval_is_object (jsv))
    
    fun loop (jsv: jsonval, i:int, n:int): bool =
        if i = jsv.size() then
            false
        else let
             val p = $UN.cast{ptr} (jsv)
             val ofs = g0i2u(n)*sizeof<jsmntok_t>
             val keyjsv = $UN.cast{jsonval} (add_ptr_bsz (p, ofs))
             val () = assertloc (jsonval_is_string (keyjsv))
             val key = keyjsv.string()
             val targetlen = length (label)
             val srclen = keyjsv.ending() - keyjsv.start()
        in
            if targetlen = srclen andalso 
                   strncmp (key, label, length (label)) = 0 then
                true
            else let
                val ofs = g0i2u(n+1)*sizeof<jsmntok_t>
                val valjsv = $UN.cast{jsonval} (add_ptr_bsz(p, ofs))
            in
                loop (jsv, succ(i), n+1+valjsv.numtokens())
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
        if i = jsv.size() then
            list_vt_reverse (rs)
        else let
            val pjs = $UN.cast{ptr} (jsv)
            val ofs = g0i2u(n)*sizeof<jsmntok_t>
            val jsvi = $UN.cast{jsonval} (add_ptr_bsz (pjs, ofs))
            val jsmni = $UN.cast{jsmntokptr}(jsvi)
            (**
            val () = println! ("Parsing element i=", i)
            val () = println! ("Token starts @", jsmni.start)
            *) 
            val x = jsonval_parse<a> (jsvi)
         in
             loop (jsv, succ(i), n+jsvi.numtokens(), x :: rs)
         end
in
    loop (jsv0, 0, 1, nil)
end

end // end of [local]
          
    
         
    
