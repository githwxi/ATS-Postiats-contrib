(*
** libatscc-common
*)

(* ****** ****** *)

staload "./../../basics.sats"

(* ****** ****** *)
//
fun{}
list0_is_nil
  {a:t0p}(xs: list0(INV(a))): bool
//
fun{}
list0_is_cons
  {a:t0p}(xs: list0(INV(a))): bool
//
(* ****** ****** *)
//
fun
list0_make_intrange_2
  (l: int, r: int): list0(int) = "mac#%"
fun
list0_make_intrange_3
  (l: int, r: int, d: int): list0(int) = "mac#%"
//
symintr list0_make_intrange
//
overload
list0_make_intrange with list0_make_intrange_2
overload
list0_make_intrange with list0_make_intrange_3
//
(* ****** ****** *)
//
fun{a:t0p}
print_list0
  (xs: list0(INV(a))): void = "mac#%"
fun{a:t0p}
print_list0_sep
  (xs: list0(INV(a)), sep: string): void = "mac#%"
//
overload
print with print_list0 of 100
//
(* ****** ****** *)
//
fun
list0_length
  {a:t0p}(list0(a)): intGte(0) = "mac#%"
//
overload length with list0_length of 100
//
(* ****** ****** *)
//
fun
list0_append
  {a:t0p}
  (list0(INV(a)), list0(a)): list0(a)= "mac#%"
//
overload + with list0_append of 100 // infix
//
(* ****** ****** *)

(* end of [list0.sats] *)
