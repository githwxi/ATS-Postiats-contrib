(*
** libatscc-common
*)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
fun
arrayref_make_elt
  {a:t@ype}{n:nat}
  (int(n), a): arrayref(a, n) = "mac#%"
//
(* ****** ****** *)
//
fun
arrayref_get_at
  {a:t@ype}{n:int}
  (arrayref(a, n), natLt(n)): a = "mac#%"
//
fun
arrayref_set_at
  {a:t@ype}{n:int}
  (arrayref(a, n), natLt(n), a): void = "mac#%"
//
(* ****** ****** *)

overload [] with arrayref_get_at of 100
overload [] with arrayref_set_at of 100

(* ****** ****** *)
//
fun
arrayref_foreach_cloref
  {a:t@ype}{n:int}
(
  arrayref(a, n), int(n), fwork: natLt(n) -<cloref1> void
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)
//
// HX: array-with-size
//
(* ****** ****** *)

fun
arrszref_make_arrayref
  {a:t0p}{n:int}
  (arrayref(a, n), int(n)): arrszref(a) = "mac#%"
// end of [arrszref_make_arrayref]

(* ****** ****** *)
//
fun
arrszref_get_at
  {a:t0p}(A: arrszref(a), i: int): a = "mac#%"
//
fun
arrayref_set_at
  {a:t0p}(A: arrszref(a), i: int, x: a): void = "mac#%"
//
(* ****** ****** *)

overload [] with arrszref_get_at of 100
overload [] with arrszref_set_at of 100

(* ****** ****** *)

(* end of [arrayref.sats] *)
