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

implement
{a}(*tmp*)
print_list(xs) = let
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
      then print_list$sep<> ();
    // end of [if]
    print_val<a> (x); loop (xs, i+1)
  ) (* end of [list_cons] *)
//
) (* end of [loop] *)
//
in
  loop (xs, 0)
end // end of [print_list]

(* ****** ****** *)

implement
{}(*tmp*)
print_list$sep () = print_string (", ")

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
//
implement
list_app (xs, f) = list_foreach (xs, f)
//
implement
list_foreach (xs, f) =
(
case+ xs of
| list_nil () => ()
| list_cons (x, xs) => (f(x); list_foreach (xs, f))
) (* end of [list_foreach] *)
//
(* ****** ****** *)

implement
list_map (xs, f) =
(
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => list_cons (f(x), list_map (xs, f))
) (* end of [list_map] *)

(* ****** ****** *)

(* end of [list.dats] *)
