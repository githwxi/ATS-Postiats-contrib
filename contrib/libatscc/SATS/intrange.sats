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
int_exists_cloref
  (n: int, f: cfun1 (int, bool)): bool = "mac#%"
fun
int_forall_cloref
  (n: int, f: cfun1 (int, bool)): bool = "mac#%"
//
fun
int_foreach_cloref
  (n: int, f: cfun1 (int, void)): void = "mac#%"
//
overload exists with int_exists_cloref
overload forall with int_forall_cloref
overload foreach with int_foreach_cloref
//
(* ****** ****** *)
//
fun
int2_exists_cloref
  (n1: int, n2: int, f: cfun2 (int, int, bool)): bool = "mac#%"
fun
int2_forall_cloref
  (n1: int, n2: int, f: cfun2 (int, int, bool)): bool = "mac#%"
//
fun
int2_foreach_cloref
  (n1: int, n2: int, f: cfun2 (int, int, void)): void = "mac#%"
//
overload exists with int2_exists_cloref
overload forall with int2_forall_cloref
overload foreach with int2_foreach_cloref
//
(* ****** ****** *)
//
fun
intrange_exists_cloref
  (l: int, r: int, f: cfun1 (int, bool)): bool = "mac#%"
fun
intrange_forall_cloref
  (l: int, r: int, f: cfun1 (int, bool)): bool = "mac#%"
//
fun
intrange_foreach_cloref
  (l: int, r: int, f: cfun1 (int, void)): void = "mac#%"
//
(* ****** ****** *)
//
fun
intrange2_exists_cloref
(
  l1: int, r1: int, l2: int, r2: int, f: cfun2 (int, int, bool)
) : bool = "mac#%" // end of [intrange2_exists_cloref]
fun
intrange2_forall_cloref
(
  l1: int, r1: int, l2: int, r2: int, f: cfun2 (int, int, bool)
) : bool = "mac#%" // end of [intrange2_forall_cloref]
//
fun
intrange2_foreach_cloref
(
  l1: int, r1: int, l2: int, r2: int, f: cfun2 (int, int, void)
) : void = "mac#%" // end of [intrange2_foreach_cloref]
//
(* ****** ****** *)

(* end of [intrange.sats] *)
