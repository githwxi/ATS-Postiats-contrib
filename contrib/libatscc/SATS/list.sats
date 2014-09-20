(*
** libatscc-common
*)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
fun
list_make_intrange_2(l: int, r: int): List0(int)
fun
list_make_intrange_3(l: int, r: int, d: int): List0(int)
//
symintr list_make_intrange
overload list_make_intrange with list_make_intrange_2
overload list_make_intrange with list_make_intrange_3
//
(* ****** ****** *)
//
fun
list_append
  {a:t0p}{i,j:int}
  (list(a, i), list(a, j)): list(a, i+j)= "mac#%"
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
list_app
  {a:t0p}(xs: List(a), f: cfun(a, void)): void = "mac#%"
fun
list_foreach
  {a:t0p}(xs: List(a), f: cfun(a, void)): void = "mac#%"
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
