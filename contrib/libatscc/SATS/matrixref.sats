(*
** libatscc-common
*)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
fun
matrixref_make_elt
  {a:t@ype}{m,n:nat}
  (int(m), int(n), a): matrixref(a, m, n) = "mac#%"
//
(* ****** ****** *)
//
fun
matrixref_get_at
  {a:t@ype}{m,n:int}
(
  matrixref(a, m, n), natLt(m), int(n), natLt(n)
) : a = "mac#%" // end-of-function
//
fun
matrixref_set_at
  {a:t@ype}{m,n:int}
(
  matrixref(a, m, n), natLt(m), int(n), natLt(n), a
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)

overload [] with matrixref_get_at of 100
overload [] with matrixref_set_at of 100

(* ****** ****** *)

(* end of [matrixref.sats] *)
