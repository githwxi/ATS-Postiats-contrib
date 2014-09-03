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
fun
JSarray_get_at
  {a:t@ype}(JSarray(a), int): a = "mac#%"
fun
JSarray_set_at
  {a:t@ype}(JSarray(a), int, a): void = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_get_length
  {a:t@ype} (A: JSarray(a)): int = "mac#%"
fun
JSarray_set_length
  {a:t@ype} (A: JSarray(a), n: intGte(0)): void = "mac#%"
//
(* ****** ****** *)
//
overload [] with JSarray_get_at
overload [] with JSarray_set_at
//
overload .length with JSarray_get_length
overload .length with JSarray_set_length
//
(* ****** ****** *)

(* end of [JSarray.sats] *)
