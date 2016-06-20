(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../../basics.sats"
*)

(* ****** ****** *)

#define nil0 list0_nil
#define cons0 list0_cons

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
list0_length
  {a:t0p}(list0(a)): intGte(0) = "mac#%"
//
overload length with list0_length of 100
//
(* ****** ****** *)
//
fun
list0_last_opt
  {a:t0p}
  (xs: list0(INV(a))): Option(a) = "mac#%"
//
(* ****** ****** *)
//
fun
list0_get_at_opt
  {a:t0p}
  (list0(INV(a)), intGte(0)): Option(a) = "mac#%"
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
list0_snoc
  {a:t0p}
  (list0(INV(a)), x0: a): list0(a)= "mac#%"
//
fun
list0_extend
  {a:t0p}
  (list0(INV(a)), x0: a): list0(a)= "mac#%"
//
(* ****** ****** *)
//
fun
list0_append
  {a:t0p}
(
  xs: list0(INV(a)), ys: list0(a)
) : list0(a) = "mac#%" // end-of-fun
//
overload + with list0_append of 100 // infix
//
(* ****** ****** *)
//
fun
list0_reverse
  {a:t0p}
  (xs: list0(INV(a))): list0(a) = "mac#%"
fun
list0_reverse_append
  {a:t0p}
  (xs: list0(INV(a)), ys: list0(a)): list0(a) = "mac#%"
//
overload reverse with list0_reverse of 100
overload revappend with list0_reverse_append of 100
//
(* ****** ****** *)
//
fun
list0_app
  {a:t0p}
(
  xs: list0(INV(a)), fwork: cfun(a, void)
) : void = "mac#%" // end-of-function
fun
list0_foreach
  {a:t0p}
(
  xs: list0(INV(a)), fwork: cfun(a, void)
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)
//
fun
list0_filter
  {a:t0p}
(
  xs: list0(INV(a)), pred: cfun(a, bool)
) : list0(a) = "mac#%" // end-of-function
//
(* ****** ****** *)
//
fun
list0_map
  {a:t0p}{b:t0p}
  (xs: list0(INV(a)), fopr: cfun(a, b)): list0(b) = "mac#%"
//
(* ****** ****** *)

fun
list0_foldleft
  {res:t0p}{a:t0p}
(
  xs: list0(INV(a)), init: res, fopr: cfun(res, a, res)
) : res = "mac#%" // end-of-function
fun
list0_foldright
  {a:t0p}{res:t0p}
(
  xs: list0(INV(a)), fopr: cfun(a, res, res), sink: res
) : res = "mac#%" // end-of-function

(* ****** ****** *)

(* end of [list0.sats] *)
