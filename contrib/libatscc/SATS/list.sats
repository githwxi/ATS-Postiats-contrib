(*
** libatscc-common
*)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
fun
list_make_intrange_2
  (l: int, r: int): List0(int) = "mac#%"
fun
list_make_intrange_3
  (l: int, r: int, d: int): List0(int) = "mac#%"
//
symintr list_make_intrange
//
overload
list_make_intrange with list_make_intrange_2
overload
list_make_intrange with list_make_intrange_3
//
(* ****** ****** *)
//
fun{a:t0p}
print_list
  (xs: List(INV(a))): void = "mac#%"
fun{a:t0p}
print_list_sep
  (xs: List(INV(a)), sep: string): void = "mac#%"
//
overload
print with print_list of 100
//
(* ****** ****** *)
//
fun
list_length
  {a:t0p}{n:int}(list(a, n)): int(n) = "mac#%"
//
overload
length with list_length of 100
//
(* ****** ****** *)
//
fun
list_get_at
  {a:t0p}{n:int}(list(a, n), natLt(n)): a = "mac#%"
//
overload [] with list_get_at of 100
//
(* ****** ****** *)
//
fun
list_append
  {a:t0p}{i,j:int}
  (list(INV(a), i), list(a, j)): list(a, i+j)= "mac#%"
//
overload + with list_append of 100 // infix
//
(* ****** ****** *)
//
fun
list_reverse
  {a:t0p}{n:int}
  (xs: list(INV(a), n)): list(a, n) = "mac#%"
fun
list_reverse_append
  {a:t0p}{i,j:int}
  (xs: list(a, i), ys: list(INV(a), j)): list(a, i+j) = "mac#%"
//
overload reverse with list_reverse of 100
overload revappend with list_reverse_append of 100
//
(* ****** ****** *)
//
fun
list_take
  {a:t0p}
  {n:int}{i:nat | i <= n}
  (xs: list(a, n), i: int(i)): list(a, i) = "mac#%"
fun
list_drop
  {a:t0p}
  {n:int}{i:nat | i <= n}
  (xs: list(a, n), i: int(i)): list(a, n-i) = "mac#%"
//
fun
list_split_at
  {a:t0p}
  {n:int}{i:nat | i <= n}
  (xs: list(a, n), i: int(i)): $tup(list(a, i), list(a, n-i)) = "mac#%"
//
(* ****** ****** *)
//
fun
list_insert_at
  {a:t0p}
  {n:int}{i:nat | i <= n}
  (xs: list(a, n), i: int(i), x0: a): list(a, n+1) = "mac#%"
//
fun
list_remove_at
  {a:t0p}
  {n:int}{i:nat | i < n}
  (xs: list(a, n), i: int(i)): $tup(a, list(a, n-1)) = "mac#%"
//
(* ****** ****** *)
//
fun
list_app
  {a:t0p}(xs: List(INV(a)), f: cfun(a, void)): void = "mac#%"
fun
list_foreach
  {a:t0p}(xs: List(INV(a)), f: cfun(a, void)): void = "mac#%"
//
(* ****** ****** *)
//
fun
list_map
  {a:t0p}{b:t0p}{n:int}
  (xs: list(INV(a), n), f: cfun(a, b)): list (b, n) = "mac#%"
//
(* ****** ****** *)

(* end of [list.sats] *)
