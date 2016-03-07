(*
** integer sets
*)

(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../SATS/intset.sats"
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
val ys = (
//
case+ xs of
| list_nil() => aux1(0, nil_vt)
| list_cons(x, xs) => aux2(0, x, xs, nil_vt)
//
) : List0_vt(int)
//
in
  list_vt2t(list_vt_reverse(ys))
end // end of [intset_ncomplement]

(* ****** ****** *)

implement
{}(*tmp*)
intset_foreach_cloref
  (xs, fwork) = let
in
  list_foreach_cloref(xs, $UN.cast(fwork))
end // end of [intset_foreach_cloref]

(* ****** ****** *)

implement
{}(*tmp*)
intset2_foreach_cloref
  {n}(xs, ys, fwork) = let
//
fun
aux
(
  x: int, ys: List0(int)
) : void =
(
case+ ys of
| list_nil() => ()
| list_cons(y, ys) => let
    val x =
      $UN.cast{natLt(n)}(y)
    val y =
      $UN.cast{natLt(n)}(y)
    val ((*void*)) = fwork(x, y) in aux(x, ys)
  end (* end of [list_cons] *)
)
//
fun
auxlst
(
  xs: List0(int), ys: List0(int)
) : void =
(
case+ xs of
| list_nil() => ()
| list_cons(x, xs) =>
  (
    let val () = aux(x, ys) in auxlst(xs, ys) end
  ) (* end of [list_cons] *)
)
in
  auxlst(xs, ys)  
end // end of [intset2_foreach_cloref]

(* ****** ****** *)

implement
fprint_intset(out, xs) = fprint_list_sep(out, xs, "->")

(* ****** ****** *)

(* end of [intset.dats] *)
