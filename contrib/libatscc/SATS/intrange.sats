(*
** libatscc-common
*)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
// HX-2013-04:
// intrange (l, r) is for integers i satisfying l <= i < r
//
(* ****** ****** *)
//
fun
int_repeat_lazy
  (n: int, f: lazy(void)): void = "mac#%"
fun
int_repeat_cloref
  (n: int, f: cfun0 (void)): void = "mac#%"
//
overload repeat with int_repeat_lazy
overload repeat with int_repeat_cloref
//
(* ****** ****** *)
//
fun
int_foreach_cloref
  (n: int, f: cfun1 (int, void)): void = "mac#%"
//
overload foreach with int_foreach_cloref
//
(* ****** ****** *)
//
fun
intrange_foreach_cloref
  (l: int, r: int, f: cfun1 (int, void)): void = "mac#%"
//
(* ****** ****** *)

(* end of [intrange.sats] *)
