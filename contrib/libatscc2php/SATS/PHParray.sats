(*
** For writing ATS code
** that translates into PHP
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2phppre_"
//
(* ****** ****** *)
//
// Python datatypes
//
staload "./../basics_php.sats"
//
(* ****** ****** *)
//
fun
PHParray_nil
  {a:t0p} (): PHParray(a) = "mac#"
//
fun
PHParray_sing
  {a:t0p} (x: a): PHParray(a) = "mac#"
//
fun
PHParray_pair
  {a:t0p} (x1: a, x2: a): PHParray(a) = "mac#"
//
(* ****** ****** *)
//
fun
PHParray_make_elt
  {a:t0p}{n:nat}(n: int(n), x0: a): PHParray(a) = "mac#"
//
(* ****** ****** *)
//
fun
PHParray_is_nil
  {a:t0p} (xs: PHParray(a)): bool = "mac#"
//
fun
PHParray_isnot_nil
  {a:t0p} (xs: PHParray(a)): bool = "mac#"
//
(* ****** ****** *)
//
fun
PHParray_length{a:t0p}(PHParray(a)): int = "mac#"
//
(* ****** ****** *)
//
fun
PHParray_get_at{a:t0p}(PHParray(a), int): a = "mac#"
//
fun
PHParray_set_at{a:t0p}(PHParray(a), int, a): void = "mac#"
//
(* ****** ****** *)
//
fun
PHParray_copy{a:t0p}(PHParray(a)): PHParray(a) = "mac#"
//
(* ****** ****** *)

(* end of [PHParray.sats] *)
