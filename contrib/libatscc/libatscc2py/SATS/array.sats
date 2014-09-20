(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2014-09:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)

staload "./../basics_py.sats"

(* ****** ****** *)
//
abstype
array_t0ype_int_type (t@ype, int)
stadef array = array_t0ype_int_type
//
(* ****** ****** *)
//
fun
array_make_elt
  {a:t0p}{n:nat}
  (asz: int(n), init: a): array(a, n) = "mac#%"
//
(* ****** ****** *)
//
fun
array_length
  {a:t0p}{n:nat}(A: array(a, n)): int(n) = "mac#%"
//
(* ****** ****** *)
//
fun
array_get_at{a:t0p}
  {n:nat}(array(a, n), i: natLt(n)): (a) = "mac#%"
//
fun
array_set_at{a:t0p}
  {n:nat}(array(a, n), i: natLt(n), x: a): void = "mac#%"
//
(* ****** ****** *)

(* end of [array.sats] *)
