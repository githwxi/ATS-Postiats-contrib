(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/qlistref.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
datatype
qlistref
(a:vt@ype) = Q of
(
  ref(List0_vt(a)), ref(List0_vt(a))
)
//
assume qlistref_type(a) = qlistref(a)
//
(* ****** ****** *)

implement
qlistref_length
  {a}(que) = let
//
val+Q(r0, r1) = que
//
val r0 =
  $UN.cast{ref(List0(a?))}(r0)
val r1 =
  $UN.cast{ref(List0(a?))}(r1)
//
in
  list_length(r0[]) + list_length(r1[])
end // end of [qlistref_length]

(* ****** ****** *)

implement
qlistref_enque
  {a}(que, x0) = let
//
val+Q(r0, r1) = que
//
val x0 =
  $UN.castvwtp0{a?}(x0)
//
val r0 =
  $UN.cast{ref(List0(a?))}(r0)
val r1 =
  $UN.cast{ref(List0(a?))}(r1)
//
in
  r0[] := list_cons{a?}(x0, r0[])
end // end of [qlistref_enque]

(* ****** ****** *)

implement
qlistref_deque_opt
  {a}(que) = let
//
val+Q(r0, r1) = que
//
val r0 =
  $UN.cast{ref(List0(a?))}(r0)
val r1 =
  $UN.cast{ref(List0(a?))}(r1)
//
in
//
case+ r1[] of
| list_nil() => let
    val xs = r0[]
    val () = r0[] := list_nil()
  in
    case+ xs of
    | list_nil() =>
        None_vt(*void*)
    | list_cons(x0, xs) =>
      (
        r1[] := xs;
        Some_vt($UN.castvwtp0{a}(x0))
      )
  end // end of [list_nil]
| list_cons(x0, xs) =>
  (
    r1[] := xs; Some_vt($UN.castvwtp0{a}(x0))
  ) (* end of [list_cons] *)
//
end // end of [qlistref_enque]

(* ****** ****** *)

(* end of [qlistref.dats] *)
