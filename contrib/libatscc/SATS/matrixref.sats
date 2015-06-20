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
//
fun
matrixref_exists_cloref
  {a:t@ype}{m,n:int}
(
  matrixref(a, m, n)
, int(m), int(n), ftest: (natLt(m), natLt(n)) -<cloref1> bool
) : bool = "mac#%" // end-of-fun
//
fun
matrixref_forall_cloref
  {a:t@ype}{m,n:int}
(
  matrixref(a, m, n)
, int(m), int(n), ftest: (natLt(m), natLt(n)) -<cloref1> bool
) : bool = "mac#%" // end-of-fun
//
(* ****** ****** *)
//
fun
matrixref_foreach_cloref
  {a:t@ype}{m,n:int}
(
  matrixref(a, m, n)
, int(m), int(n), fwork: (natLt(m), natLt(n)) -<cloref1> void
) : void = "mac#%" // end-of-fun
//
(* ****** ****** *)
//
// HX: matrix-with-size
//
(* ****** ****** *)
//
fun
mtrxszref_make_elt
  {a:t0p}{m,n:nat}
  (int(m), int(n), x0: a): mtrxszref(a) = "mac#%"
//
fun
mtrxszref_make_matrixref
  {a:t0p}{m,n:int}
  (matrixref(a, m, n), int(m), int(n)): mtrxszref(a) = "mac#%"
// end of [mtrxszref_make_matrixref]
//
(* ****** ****** *)

(* end of [matrixref.sats] *)
