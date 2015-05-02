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
implement
arrszref_exists_cloref
  {a}(A, f) = let
  val n = arrszref_size(A)
in
  int_exists_cloref(n, $UN.cast{cfun1(int,bool)}(f))
end // end of [arrszref_exists_cloref]
//
implement
arrszref_forall_cloref
  {a}(A, f) = let
  val n = arrszref_size(A)
in
  int_forall_cloref(n, $UN.cast{cfun1(int,bool)}(f))
end // end of [arrszref_forall_cloref]
//
implement
arrszref_foreach_cloref
  {a}(A, f) = let
  val n = arrszref_size(A)
in
  int_foreach_cloref(n, $UN.cast{cfun1(int,void)}(f))
end // end of [arrszref_foreach_cloref]
//
(* ****** ****** *)

(* end of [arrayref.dats] *)
