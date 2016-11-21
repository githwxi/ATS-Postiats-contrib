(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/list_vt.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
list_vt_reverse
  {a}(xs) =
  list_vt_reverse_append{a}(xs, list_vt_nil())
//
(* ****** ****** *)
//
implement
list_vt_reverse_append
  {a}(xs, ys) =
  loop(xs, ys) where
{
//
fun
loop
{i,j:nat} .<i>.
(
xs: list_vt(a, i), ys: list_vt(a, j)
) : list_vt(a, i+j) =
(
case+ xs of
| ~list_vt_nil() => ys
| ~list_vt_cons(x, xs) => loop(xs, list_vt_cons(x, ys))
)
//
prval () = lemma_list_vt_param(xs)
prval () = lemma_list_vt_param(ys)
//
} (* end of [list_vt_reverse_append] *)
//
(* ****** ****** *)

(* end of [list_vt.dats] *)
