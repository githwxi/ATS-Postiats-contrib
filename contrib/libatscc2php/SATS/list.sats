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

staload "./../basics_php.sats"

(* ****** ****** *)
//
fun
list_length
  {a:t0p}{n:int}(xs: list(a, n)): int(n) = "mac#%"
//
overload length with list_length of 100
//
(* ****** ****** *)
//
fun
list_append
  {a:t0p}{i,j:int}
  (xs: list(a, i), ys: list(a, j)): list(a, i+j)= "mac#%"
//
(* ****** ****** *)
//
fun
list_reverse
  {a:t0p}{n:int}(xs: list(a, n)): list(a, n) = "mac#%"
fun
list_reverse_append
  {a:t0p}{i,j:int}
  (xs: list(a, i), ys: list(a, j)): list(a, i+j) = "mac#%"
//
(* ****** ****** *)
//
fun
list_map
  {a:t0p}{b:t0p}{n:int}
  (xs: list(a, n), f: cfun(a, b)): list (b, n) = "mac#%"
//
(* ****** ****** *)

(* end of [list.sats] *)
