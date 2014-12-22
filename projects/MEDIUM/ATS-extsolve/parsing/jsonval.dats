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

implement{}
jsonval_is_int (jsv) =
  if jsv.type != JSMN_PRIMITIVE then
    false
  else let
    val [n:int] n = g1ofg0(jsv.size)
    val () = assertloc (n >= 0)
    val src = $UN.cast{string(n)} (jsv.string)
    //
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

implement{}
jsonval_array_get_at_exn (jsv, i) = let
  val () = assertloc(i >= 0 andalso i < jsv.size)
  val p = $UN.cast{ptr}(jsv)
  val ofs =  g0i2u(i)*sizeof<jsonval>
  val q = add_ptr_bsz(p, ofs)
in
  $UN.cast{jsonval}(q)
end
