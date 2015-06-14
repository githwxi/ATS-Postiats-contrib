(* ****** ****** *)
//
staload
"libats/SATS/ilist_prf.sats"
//
staload "libats/SATS/gflist.sats"
//
(* ****** ****** *)

stadef nil = ilist_nil
stadef cons = ilist_cons

(* ****** ****** *)

sortdef elt = int

(* ****** ****** *)

stacst ilist_head : ilist -> int
stacst ilist_tail : ilist -> ilist

(* ****** ****** *)

stadef head = ilist_head
stadef tail = ilist_tail

(* ****** ****** *)
//
extern
praxi
lemma_head
  {x:elt}{xs:ilist}(): [head(cons(x, xs))==x] unit_p
extern
praxi
lemma_tail
  {x:elt}{xs:ilist}(): ILISTEQ(tail(cons(x, xs)), xs)
//
(* ****** ****** *)

stacst ilist_length : ilist -> int

(* ****** ****** *)

stadef length = ilist_length

(* ****** ****** *)
//
extern
praxi
lemma_length_0(): [length(nil)==0] unit_p
extern
praxi
lemma_length_1
{x:elt}{xs:ilist}
(
// argumentless
) : [length(cons(x,xs))==length(xs)+1] unit_p
//
extern
praxi
lemma_length_isnat
  {xs:ilist}(): [length(xs) >= 0] unit_p
//
(* ****** ****** *)

stacst ilist_get_at : (ilist, int) -> elt
stacst ilist_set_at : (ilist, int, elt) -> ilist

(* ****** ****** *)

stadef get_at = ilist_get_at
stadef set_at = ilist_set_at

(* ****** ****** *)

extern
praxi
lemma_get_at_0
{x:elt}{xs:ilist}
(
// argumentless
) : [get_at(cons(x, xs),0)==x] unit_p
extern
praxi
lemma_get_at_1
{x:elt}{xs:ilist}{i:pos}
(
// argumentless
) : [get_at(cons(x, xs),i)==get_at(xs, i-1)] unit_p

(* ****** ****** *)

extern
praxi
lemma_set_at_0
{x:elt}
{xs:ilist}
{i:nat | i < length(xs)}
(
// argumentless
) : [get_at(set_at(xs, i, x), i)==x] unit_p
extern
praxi
lemma_set_at_1
{x:elt}
{xs:ilist}
{i,j:int | i != j}
(
// argumentless
) : [get_at(set_at(xs, i, x), j)==get_at(xs, j)] unit_p

(* ****** ****** *)

extern
fun
{a:t@ype}
gflist_length{xs:ilist}(xs: gflist(a, xs)): int(length(xs))

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
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
gflist_get_at
{xs:ilist}
{i:nat | i < length(xs)}
  (xs: gflist(a, xs), int(i)): stamped_t(a, get_at(xs, i))
//
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
