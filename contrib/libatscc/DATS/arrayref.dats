(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/arrayref.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
arrayref_exists_cloref
  (A, n, f) =
(
  int_exists_cloref(n, $UN.cast{cfun1(int,bool)}(f))
)
implement
arrayref_forall_cloref
  (A, n, f) =
(
  int_forall_cloref(n, $UN.cast{cfun1(int,bool)}(f))
)
//
implement
arrayref_foreach_cloref
  (A, n, f) =
(
  int_foreach_cloref(n, $UN.cast{cfun1(int,void)}(f))
)
//
(* ****** ****** *)
//
// HX: array-with-size
//
(* ****** ****** *)
//
implement
arrszref_make_elt
  {a}(n, x0) = let
//
val A =
  arrayref_make_elt{a}(n, x0)
//
in
  arrszref_make_arrayref{a}(A, n)
end (* end of [arrszref_make_elt] *)
//
(* ****** ****** *)
//
implement
arrszref_exists_cloref
  {a}(A, pred) = let
  val n = arrszref_size(A)
in
  int_exists_cloref(n, $UN.cast{cfun1(int,bool)}(pred))
end // end of [arrszref_exists_cloref]
//
implement
arrszref_forall_cloref
  {a}(A, pred) = let
  val n = arrszref_size(A)
in
  int_forall_cloref(n, $UN.cast{cfun1(int,bool)}(pred))
end // end of [arrszref_forall_cloref]
//
implement
arrszref_foreach_cloref
  {a}(A, fwork) = let
  val n = arrszref_size(A)
in
  int_foreach_cloref(n, $UN.cast{cfun1(int,void)}(fwork))
end // end of [arrszref_foreach_cloref]
//
(* ****** ****** *)

(* end of [arrayref.dats] *)
