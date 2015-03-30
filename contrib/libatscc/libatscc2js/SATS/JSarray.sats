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
JSarray_nil{a:t0p}(): JSarray(a) = "mac#%"
fun
JSarray_sing{a:t0p}(a): JSarray(a) = "mac#%"
fun
JSarray_pair{a:t0p}(a, a): JSarray(a) = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_get_at
  {a:t0p}(JSarray(a), int): a = "mac#%"
fun
JSarray_set_at
  {a:t0p}(JSarray(a), int, a): void = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_length{a:t0p}(JSarray(a)): int = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_pop{a:t0p}(A: JSarray(a)): a = "mac#%"
fun
JSarray_push{a:t0p}(A: JSarray(a), x: a): int = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_shift{a:t0p}(A: JSarray(a)): a = "mac#%"
fun
JSarray_unshift{a:t0p}(A: JSarray(a), x: a): int = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_reverse{a:t0p}(A: JSarray(a)): void = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_copy{a:t0p}(JSarray(a)): JSarray(a) = "mac#%"
//
fun
JSarray_copy_arrayref
  {a:t0p}{n:int}
  (A: arrayref(a, n), asz: int(n)): JSarray(a) = "mac#"
//
(* ****** ****** *)
//
fun
JSarray_concat{a:t0p}
  (A1: JSarray(a), A2: JSarray(a)): JSarray(a) = "mac#%"
//
(* ****** ****** *)
//
// HX: these are based on [splice]
//
fun
JSarray_insert_at
  {a:t0p}(JSarray(a), int, a): void = "mac#%"
//
fun
JSarray_remove_at
  {a:t0p}(JSarray(a), ofs: int): void = "mac#%"
fun
JSarray_takeout_at
  {a:t0p}(JSarray(a), ofs: int): ( a ) = "mac#%"
//
(* ****** ****** *)
//
fun
JSarray_join
  {a:t0p}(JSarray(a)): string = "mac#%"
fun
JSarray_join_sep
  {a:t0p}(JSarray(a), sep: string): string = "mac#%"
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
(* ****** ****** *)
//
overload .pop with JSarray_pop
overload .push with JSarray_push
//
(* ****** ****** *)

overload length with JSarray_length

(* ****** ****** *)

(* end of [JSarray.sats] *)
