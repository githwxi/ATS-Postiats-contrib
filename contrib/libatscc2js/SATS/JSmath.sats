(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
//
(* ****** ****** *)

staload "./../basics_js.sats"

(* ****** ****** *)
//
fun JSmath_sin : double -> double = "mac#%"
fun JSmath_cos : double -> double = "mac#%"
fun JSmath_tan : double -> double = "mac#%"
//
(* ****** ****** *)

fun JSmath_random ((*void*)): double = "mac#%"

(* ****** ****** *)

(* end of [JSmath.sats] *)
