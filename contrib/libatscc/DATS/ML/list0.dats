(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload
"./../../SATS/ML/list0.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
{}(*tmp*)
list0_is_nil(xs) =
(
case+ xs of list0_nil() => true | _ =>> false
)
implement
{}(*tmp*)
list0_is_cons(xs) =
(
case+ xs of list0_cons _ => true | _ =>> false
)
//
(* ****** ****** *)
//
implement
list0_length{a}(xs) =
  list_length{a}($UN.cast{List0(a)}(xs))
//
(* ****** ****** *)

implement
list0_last_opt
  {a}(xs) = let
//
fun
loop
(
  x0: a, xs: list0(a)
) : a =
(
case+ xs of
| list0_nil() => x0
| list0_cons(x1, xs) => loop(x1, xs)
)
//
in
  case+ xs of
  | list0_nil() => None()
  | list0_cons(x, xs) => Some(loop(x, xs))
end // end of [list0_last_opt]

(* ****** ****** *)
//
implement
list0_get_at_opt
  (xs, n) =
(
  case+ xs of
  | list0_nil() => None()
  | list0_cons(x, xs) =>
      if n > 0 then list0_get_at_opt(xs, n-1) else Some(x)
    // end of [list0_cons]
) (* end of [list0_get_at_opt] *)
//
(* ****** ****** *)
//
implement
list0_make_intrange_2
  (l, r) = $UN.cast(list_make_intrange_2(l, r))
implement
list0_make_intrange_3
  (l, r, d) = $UN.cast(list_make_intrange_3(l, r, d))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
fprint_list0
  (out, xs) = let
//
fun
loop
(
  xs: list0(a), i: int
) : void =
(
//
case+ xs of
| list0_nil () => ()
| list0_cons (x, xs) =>
  (
    if i > 0
      then fprint_list0$sep<> (out);
    // end of [if]
    fprint_val<a> (out, x); loop (xs, i+1)
  ) (* end of [list0_cons] *)
//
) (* end of [loop] *)
//
in
  loop (xs, 0)
end // end of [fprint_list0]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
fprint_list0$sep
  (out) =
(
  fprint_string (out, ", ")
)
//
(* ****** ****** *)

implement
{a}(*tmp*)
fprint_list0_sep
  (out, xs, sep) = let
//
implement
fprint_list0$sep<>
  (out) = fprint_string (out, ", ")
//
in
  fprint_list0<a> (out, xs)
end // end of [fprint_list0_sep]

(* ****** ****** *)
//
implement
list0_snoc{a}(xs, x0) =
  $UN.cast(list_snoc{a}($UN.cast(xs), x0))
implement
list0_extend{a}(xs, x0) =
  $UN.cast(list_extend{a}($UN.cast(xs), x0))
//
(* ****** ****** *)
//
implement
list0_append{a}(xs, ys) =
  $UN.cast(list_append{a}($UN.cast(xs), $UN.cast(ys)))
//
(* ****** ****** *)
//
implement
list0_reverse{a}(xs) =
  $UN.cast(list_reverse{a}($UN.cast(xs)))
implement
list0_reverse_append{a}(xs, ys) =
  $UN.cast(list_reverse_append{a}($UN.cast(xs), $UN.cast(ys)))
//
(* ****** ****** *)
//
implement
list0_app{a}(xs, f) = list0_foreach{a}(xs, f)
implement
list0_foreach{a}(xs, f) = list_foreach{a}($UN.cast(xs), f)
//
(* ****** ****** *)
//
implement
list0_filter
  {a}(xs, pred) =
  $UN.cast(list_filter($UN.cast(xs), pred))
//
(* ****** ****** *)
//
implement
list0_map
  {a}{b}(xs, fopr) = $UN.cast(list_map($UN.cast(xs), fopr))
//
(* ****** ****** *)

implement
list0_foldleft
  {res}{a}
  (xs, init, fopr) = let
//
fun
aux
(
  res: res, xs: list0(a)
) : res =
  case+ xs of
  | list0_nil() => res
  | list0_cons(x, xs) => aux(fopr(res, x), xs)
//
in
  aux(init, xs)
end // end of [list0_foldleft]

(* ****** ****** *)

implement
list0_foldright
  {a}{res}
  (xs, fopr, sink) = let
//
fun
aux
(
  xs: list0(a), res: res
) : res =
  case+ xs of
  | list0_nil() => res
  | list0_cons(x, xs) => fopr(x, aux(xs, sink))
//
in
  aux(xs, sink)
end // end of [list0_foldright]

(* ****** ****** *)

(* end of [list0.dats] *)
