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
arrayref_exists_cloref
  {a:t@ype}{n:int}
(
  arrayref(a, n)
, asz: int(n), ftest: natLt(n) -<cloref1> bool
) : bool = "mac#%" // end-of-fun
//
fun
arrayref_forall_cloref
  {a:t@ype}{n:int}
(
  arrayref(a, n)
, asz: int(n), ftest: natLt(n) -<cloref1> bool
) : bool = "mac#%" // end-of-fun
//
(* ****** ****** *)
//
fun
arrayref_foreach_cloref
  {a:t@ype}{n:int}
(
  arrayref(a, n)
, asz: int(n), fwork: natLt(n) -<cloref1> void
) : void = "mac#%" // end-of-fun
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
arrszref_size
  {a:t0p}(A: arrszref(a)): intGte(0) = "mac#%"
//
(* ****** ****** *)
//
fun
arrszref_get_at
  {a:t0p}(A: arrszref(a), i: int): a = "mac#%"
//
fun
arrszref_set_at
  {a:t0p}(A: arrszref(a), i: int, x: a): void = "mac#%"
//
(* ****** ****** *)

overload [] with arrszref_get_at of 100
overload [] with arrszref_set_at of 100

(* ****** ****** *)
//
fun
arrszref_foreach_cloref
  {a:t@ype}
  (arrszref(a), fwork: int -<cloref1> void): void = "mac#%"
//
(* ****** ****** *)

(* end of [arrayref.sats] *)
