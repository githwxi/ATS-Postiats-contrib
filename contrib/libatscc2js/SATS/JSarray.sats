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
  {a:t@ype} (A: JSarray(a), i: int): void = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_pop{a:t@ype}(A: JSarray(a)): a = "mac#%"
fun
JSarray_push{a:t@ype}(A: JSarray(a), x: a): void = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_shift{a:t@ype}(A: JSarray(a)): a = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_reverse{a:t@ype}(A: JSarray(a)): void = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_concat{a:t@ype}
  (A1: JSarray(a), A2: JSarray(a)): JSarray(a) = "mac#%"
//
(* ****** ****** *)
//
// HX: these are based on [splice]
//
fun
JSarray_insert_at
  {a:t@ype}(A: JSarray(a), inserted: a): void = "mac#%"
//
fun
JSarray_remove_at{a:t@ype}(A: JSarray(a)): void = "mac#%"
//
(* ****** ****** *)
//
// Some function overloading
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
