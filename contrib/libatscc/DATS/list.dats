(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/list.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
{}(*tmp*)
list_is_nil(xs) =
(
case+ xs of list_nil() => true | _ =>> false
)
implement
{}(*tmp*)
list_is_cons(xs) =
(
case+ xs of list_cons _ => true | _ =>> false
)
//
(* ****** ****** *)
//
implement
list_make_intrange_2
  (l, r) = list_make_intrange_3 (l, r, 1)
//
(* ****** ****** *)

implement
list_make_intrange_3
  (l, r, d) = let
//
fun loop1
(
  n: int, x: int, d: intGt(0), res: List0(int)
) : List0(int) =
  if n > 0 then loop1 (n-1, x - d, d, list_cons (x, res)) else res
fun loop2
(
  n: int, x: int, d: intGt(0), res: List0(int)
) : List0(int) =
  if n > 0 then loop2 (n-1, x + d, d, list_cons (x, res)) else res
//
in
//
case+ 0 of
| _ when d > 0 =>
    if l < r then let
      val d =
        $UN.cast{intGt(0)}(d)
      // end of [val]
      val n = (r - l + d - 1) / d
    in
      loop1 (n, l + (n - 1) * d, d, list_nil)
    end else list_nil ()
| _ when d < 0 =>
    if l > r then let
      val d =
        $UN.cast{intGt(0)}(~d)
      val n = (l - r + d - 1) / d
    in
      loop2 (n, l - (n - 1) * d, d, list_nil)
    end else list_nil ()
| _ (* d = 0 *) => list_nil ()
//
end // end of [list_make_intrange_3]

(* ****** ****** *)
//
implement
{a}(*tmp*)
fprint_list
  (out, xs) = let
//
fun
loop
(
  xs: List(a), i: int
) : void =
(
//
case+ xs of
| list_nil () => ()
| list_cons (x, xs) =>
  (
    if i > 0
      then fprint_list$sep<> (out);
    // end of [if]
    fprint_val<a> (out, x); loop (xs, i+1)
  ) (* end of [list_cons] *)
//
) (* end of [loop] *)
//
in
  loop (xs, 0)
end // end of [fprint_list]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
fprint_list$sep
  (out) = fprint_string (out, ", ")
//
(* ****** ****** *)

implement
{a}(*tmp*)
fprint_list_sep
  (out, xs, sep) = let
//
implement
fprint_list$sep<> (out) = fprint_string (out, ", ")
//
in
  fprint_list<a> (out, xs)
end // end of [fprint_list_sep]

(* ****** ****** *)

implement
list_length
  {a}(xs) = let
//
fun
loop{i,j:int}
(
  xs: list(a, i), j: int(j)
) : int(i+j) =
(
case+ xs of
| list_nil () => j | list_cons (_, xs) => loop (xs, j+1)
)
//
in
  loop (xs, 0)
end // end of [list_length]

(* ****** ****** *)

implement
list_get_at
  {a}(xs, i) = (
//
if
(i = 0)
then let
  val+list_cons(x, xs) = xs in x
end // end of [then]
else let
  val+list_cons(_, xs) = xs in list_get_at(xs, i-1)
end // end of [else]
//
) (* end of [list_get_at] *)

(* ****** ****** *)
//
implement
list_snoc
  (xs, x0) =
  list_append(xs, list_sing(x0))
implement
list_extend
  (xs, x0) =
  list_append(xs, list_sing(x0))
//
(* ****** ****** *)

implement
list_append
  (xs, ys) = let
//
prval () = lemma_list_param (xs)
prval () = lemma_list_param (ys)
//
in
//
case+ xs of
| list_nil () =>  ys
| list_cons (x, xs) =>
    list_cons (x, list_append (xs, ys))
  // end of [list_cons]
//
end // end of [list_append]

(* ****** ****** *)

implement
list_reverse{a}(xs) =
(
  list_reverse_append{a}(xs, list_nil(*void*))
) (* end of [list_reverse] *)

(* ****** ****** *)

implement
list_reverse_append
  {a}(xs, ys) = let
//
prval () = lemma_list_param (xs)
prval () = lemma_list_param (ys)
//
fun
loop{i,j:nat}
(
  xs: list(a, i), ys: list(a, j)
) : list(a, i+j) =
(
case+ xs of
| list_nil () => ys
| list_cons (x, xs) => loop (xs, list_cons (x, ys))
) (* end of [loop] *)
//
in
  loop (xs, ys)
end // end of [list_reverse_append]

(* ****** ****** *)

implement
list_take(xs, i) =
(
//
if
i > 0
then let
  val+list_cons(x, xs) = xs
in
  list_cons(x, list_take(xs, i-1))
end // end of [then]
else list_nil() // end of [else]
//
) (* end of [list_take] *)

implement
list_drop(xs, i) =
(
//
if
i > 0
then let
  val+list_cons(_, xs) = xs in list_drop(xs, i-1)
end // end of [then]
else xs // end of [else]
//
) (* end of [list_drop] *)

(* ****** ****** *)

implement
list_split_at
  (xs, i) =
(
  $tup(list_take(xs, i), list_drop(xs, i))
) (* end of [list_split_at] *)

(* ****** ****** *)

implement
list_insert_at
  (xs, i, x0) = (
//
if
(i > 0)
then let
  val+list_cons (x, xs) = xs
in
  list_cons (x, list_insert_at (xs, i-1, x0))
end // end of [then]
else list_cons (x0, xs)
//
) (* end of [list_insert_at] *)
  
(* ****** ****** *)

implement
list_remove_at
  (xs, i) = let
//
val+list_cons(x, xs) = xs
//
in
//
if
(i > 0)
then
list_cons
  (x, list_remove_at(xs, i-1))
// end of [then]
else xs // end of [else]
//
end (* end of [list_remove_at] *)

(* ****** ****** *)

implement
list_takeout_at
  (xs, i) = let
//
val+list_cons (x, xs) = xs
//
in
//
if
(i > 0)
then let
//
val $tup(x_rem, xs) =
  list_takeout_at (xs, i-1)
//
in
  $tup(x_rem, list_cons(x, xs))
end // end of [then]
else $tup(x, xs) // end of [else]
//
end (* end of [list_takeout_at] *)

(* ****** ****** *)
//
implement
list_app(xs, f) = list_foreach(xs, f)
//
implement
list_foreach
  (xs, f) = (
//
case+ xs of
| list_nil() => ()
| list_cons(x, xs) => (f(x); list_foreach(xs, f))
//
) (* end of [list_foreach] *)
//
(* ****** ****** *)

implement
list_filter
  {a}(xs, p) = aux(xs) where
{
//
fun
aux{n:int}
(
  xs: list(a, n)
) : listLte(a, n) =
  case+ xs of
  | list_nil() => list_nil()
  | list_cons(x, xs) =>
      if p(x) then list_cons(x, aux(xs)) else aux(xs)
    // end of [list_cons]
//
} (* end of [list_filter] *)

(* ****** ****** *)

implement
list_map(xs, f) =
(
case+ xs of
| list_nil() => list_nil ()
| list_cons(x, xs) => list_cons (f(x), list_map(xs, f))
) (* end of [list_map] *)

(* ****** ****** *)

(* end of [list.dats] *)
