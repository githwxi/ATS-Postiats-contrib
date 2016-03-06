(*
** integer sets
*)

(* ****** ****** *)
//
staload
"./../SATS/intset.sats"
//
(* ****** ****** *)

assume
intset(n:int, xs:iset) = List0(int)

(* ****** ****** *)
//
implement
{}(*tmp*)
intset_nil() = list_nil()
//
implement
{}(*tmp*)
intset_int(x) = list_sing(x)
//
implement
{}(*tmp*)
intset_int2(x1, x2) = $list{int}(x1, x2)
//
implement
{}(*tmp*)
intset_int3(x1, x2, x3) = $list{int}(x1, x2, x3)
//
(* ****** ****** *)

implement
{}(*tmp*)
intset_ncomplement
  (xs, n) = let
//
fun
aux1
(
  i: int
, res: List0_vt(int)
) : List0_vt(int) =
(
//
if (i < n)
  then aux1(i+1, cons_vt(i, res)) else res
//
) (* end of [aux1] *)
//
and
aux2
(
  i: int
, x0: int
, xs: List0(int)
, res: List0_vt(int)
) : List0_vt(int) = (
//
if
(i < x0)
then (
  aux2(i+1, x0, xs, cons_vt(i, res))
) else (
  case+ xs of
  | list_nil() => aux1(i+1, res)
  | list_cons(x, xs) => aux2(i+1, x, xs, res)
) (* end of [else] *)
//
) (* end of [aux2] *)
//
in
//
case+ xs of
| list_nil() =>
  list_vt2t(list_vt_reverse(aux1(0, nil_vt)))
| list_cons(x, xs) =>
  list_vt2t(list_vt_reverse(aux2(0, x, xs, nil_vt)))
//
end // end of [intset_ncomplement]

(* ****** ****** *)

implement
fprint_intset(out, xs) = fprint_list_sep(out, xs, "->")

(* ****** ****** *)

(* end of [intset.dats] *)
