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
  A: arrayref(a, n), asz: int(n), f: natLt(n) -<cloref1> void
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)

(* end of [arrayref.sats] *)
