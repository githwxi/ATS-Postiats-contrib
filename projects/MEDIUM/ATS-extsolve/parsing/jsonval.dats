(**
  Implementing jsonval using jsmn
*)
//
#include
"patsolve.hats"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "parsing/jsonval.sats"

(* ****** ****** *)

staload "{$LIBATSWDBLAIR}/jsmn/SATS/jsmn.sats"

(* ****** ****** *)

staload "libc/SATS/string.sats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

assume jsonval = jsmntokptr

(* ****** ****** *)

(**
    Get the number of tokens in a jsonval
*)
extern
fun jsonval_numtokens(jsonval): int


implement
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
                val p = $UN.cast{ptr}(jsv)
                val ofs =  g0i2u(n)*sizeof<jsmntok_t>
                val nextjsv = $UN.cast{jsonval}(add_ptr_bsz(p, ofs))
            in
                loop (jsv, succ(i), n + jsonval_numtokens(nextjsv))
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
jsonval_get_string (jsv) = let
  val src = jsonval_src ()
  val buf = add_ptr_bsz($UN.cast{ptr}(src), g0i2u(jsv.start))
in
  $UN.cast{string}(buf)
end

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
jsonval_object_get_exn (jsv, label) = let
    val () = assertloc (jsv.type = JSMN_OBJECT)

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
                
         
    
