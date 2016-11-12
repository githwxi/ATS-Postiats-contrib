(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../../basics.sats"
*)

(* ****** ****** *)
//
fun
array0_make_elt
  {a:t@ype}{n:nat}
  (asz: int(n), x0: a): array0(a) = "mac#%"
//
(* ****** ****** *)

//
fun
array0_size
  {a:t0p}(A: array0(a)): intGte(0) = "mac#%"
//
(* ****** ****** *)
//
fun
array0_get_at
  {a:t0p}(A: array0(a), i: int): a = "mac#%"
//
fun
array0_set_at
  {a:t0p}(A: array0(a), i: int, x0: a): void = "mac#%"
//
fun
array0_exch_at
  {a:vt0p}(A: array0(a), i: int, x0: a): (a) = "mac#%"
//
(* ****** ****** *)

overload [] with array0_get_at of 100
overload [] with array0_set_at of 100

(* ****** ****** *)
//
fun
array0_app
  {a:t0p}
(
  xs: array0(a), fwork: cfun(int, void)
) : void = "mac#%" // end-of-function
fun
array0_foreach_cloref
  {a:vt0p}
  (A: array0(a), fwork: Nat -<cloref1> void): void = "mac#%"
fun
array0_foreach_method
  {a:vt0p}
  (A: array0(a))(fwork: Nat -<cloref1> void): void = "mac#%"
//
overload .foreach with array0_foreach_method
//
(* ****** ****** *)

(* end of [array0.sats] *)
