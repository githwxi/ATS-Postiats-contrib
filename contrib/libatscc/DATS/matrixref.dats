(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/matrixref.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
matrixref_exists_cloref
  (M, m, n, f) =
(
  int2_exists_cloref(m, n, $UN.cast{cfun2(int,int,bool)}(f))
)
implement
matrixref_forall_cloref
  (M, m, n, f) =
(
  int2_forall_cloref(m, n, $UN.cast{cfun2(int,int,bool)}(f))
)
//
(* ****** ****** *)
//
implement
matrixref_foreach_cloref
  (M, m, n, f) =
(
  int2_foreach_cloref(m, n, $UN.cast{cfun2(int,int,void)}(f))
)
//
(* ****** ****** *)
//
// HX: matrix-with-size
//
(* ****** ****** *)
//
implement
mtrxszref_make_elt
  (m, n, x0) =
(
  mtrxszref_make_matrixref(matrixref_make_elt(m, n, x0), m, n)
) (* end of [mtrxszref_make_elt] *)
//
(* ****** ****** *)
//
implement
mtrxszref_exists_cloref
  (MSZ, ftest) = let
  val m = MSZ.nrow()
  val n = MSZ.ncol()
in
  int2_exists_cloref(m, n, $UN.cast{cfun2(int,int,bool)}(ftest))
end // end of [mtrxszref_exists_cloref]
//
(* ****** ****** *)
//
implement
mtrxszref_forall_cloref
  (MSZ, ftest) = let
  val m = MSZ.nrow()
  val n = MSZ.ncol()
in
  int2_forall_cloref(m, n, $UN.cast{cfun2(int,int,bool)}(ftest))
end // end of [mtrxszref_forall_cloref]
//
(* ****** ****** *)
//
implement
mtrxszref_foreach_cloref
  (MSZ, fwork) = let
  val m = MSZ.nrow()
  val n = MSZ.ncol()
in
  int2_foreach_cloref(m, n, $UN.cast{cfun2(int,int,void)}(fwork))
end // end of [mtrxszref_foreach_cloref]
//
(* ****** ****** *)

(* end of [matrixref.dats] *)
