(* ****** ****** *)
//
// HX-2015-06:
// [gflist]:
// fully indexed generic lists
//
(* ****** ****** *)

staload "./../SATS/ilist.sats"
staload "./../SATS/gflist.sats"

(* ****** ****** *)
//
prval () = $solver_assert(lemma_length_0)
(*
prval () = $solver_assert(lemma_length_1)
*)
prval () = $solver_assert(lemma_length_isnat)
//
(* ****** ****** *)

implement
{a}(*tmp*)
gflist_head
  {xs}(xs) = x where
{
//
val+
gflist_cons{a}{x}{xs}(x, xs) = xs
//
prval unit_p() = lemma_head{x}{xs}((*void*))
//
} (* end of [gflist_head] *)
//
implement
{a}(*tmp*)
gflist_tail
  {xs}(xs) = xs where
{
//
val+
gflist_cons{a}{x}{xs}(x, xs) = xs
//
prval ILISTEQ() = lemma_tail{x}{xs}((*void*))
//
} (* end of [gflist_tail] *)

(* ****** ****** *)

implement
{a}(*tmp*)
gflist_length
{xs}(xs) = let
//
fun
loop
{xs:ilist}
{j:int} .<length(xs)>.
(
  xs: gflist(a, xs), j:int(j)
) : int(length(xs)+j) =
(
case+ xs of
| gflist_nil() => j
| gflist_cons{a}{x}{xs}(x, xs) =>
    let prval unit_p() = lemma_length_1{x}{xs}() in loop(xs, j+1) end
  // end of [gflist]
)
in
  loop(xs, 0)
end // end of [gflist_length]

(* ****** ****** *)
//
implement
{a}(*tmp*)
gflist_get_at
{xs}{i}(xs, i) = let
//
fun
loop
{xs:ilist}
{i:nat | i < length(xs)} .<i>.
(
  xs: gflist(a, xs), i: int(i)
) : stamped_t(a, get_at(xs, i)) = let
//
val+
gflist_cons{a}{x}{xs}(x, xs) = xs
//
in
//
if
i = 0
then let
//
prval
unit_p() = lemma_get_at_0{x}{xs}()
//
in
  x
end // end of [then]
else let
//
prval
unit_p() = lemma_length_1{x}{xs}()
prval
unit_p() = lemma_get_at_1{x}{xs}{i}()
//
in
  loop(xs, i-1)
end // end of [else]
//
end // end of [loop]
//
in
  loop(xs, i)
end // end of [gflist_get_at]

(* ****** ****** *)

(* end of [gflist.dats] *)
