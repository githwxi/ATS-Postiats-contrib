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
  (n: int, f: lazy(void)): void
fun
int_repeat_cloref
  (n: int, f: cfun0 (void)): void
//
overload .repeat with int_repeat_lazy
overload .repeat with int_repeat_cloref
//
(* ****** ****** *)
//
fun
int_foreach_cloref
  (n: int, f: cfun1 (int, void)): void
//
overload .foreach with int_foreach_cloref
//
(* ****** ****** *)
//
fun
intrange_foreach_cloref
  (l: int, r: int, f: cfun(int, void)): void
//
(* ****** ****** *)

(* end of [intrange.sats] *)
