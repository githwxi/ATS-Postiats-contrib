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

(* end of [array0.sats] *)
