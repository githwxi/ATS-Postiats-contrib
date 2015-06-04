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

(* end of [matrixref.dats] *)
