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

val JSmath_E : double = "mac#%"
val JSmath_PI : double = "mac#%"
val JSmath_SQRT2 : double = "mac#%"
val JSmath_SQRT1_2 : double = "mac#%"
val JSmath_LN2 : double = "mac#%"
val JSmath_LN10 : double = "mac#%"
val JSmath_LOG2E : double = "mac#%"
val JSmath_LOG10E : double = "mac#%"

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
