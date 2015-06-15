(* ****** ****** *)
//
staload
"libats/SATS/ilist_prf.sats"
//
staload "libats/SATS/gflist.sats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

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

sortdef ilist1 = {xs: ilist | length(xs) >= 1}

(* ****** ****** *)
//
prval () = $solver_assert(lemma_length_0)
(*
prval () = $solver_assert(lemma_length_1)
*)
prval () = $solver_assert(lemma_length_isnat)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
gflist_head
{xs:ilist1}
  (xs: gflist(a, xs)): stamped_t(a, head(xs))
//
extern
fun
{a:t@ype}
gflist_tail
{xs:ilist1}(xs: gflist(a, xs)): gflist(a, tail(xs))
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)

extern
fun
{a:t@ype}
gflist_length{xs:ilist}(xs: gflist(a, xs)): int(length(xs))

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
//
stacst isord : (ilist) -> bool
//
stacst sort2 : (ilist, ilist) -> bool
//
(* ****** ****** *)
//
extern
praxi
lemma_sort2_isord
  {xs,ys:ilist|sort2(xs,ys)}(): [isord(ys)] unit_p
//
(* ****** ****** *)
//
absprop
SORT2_prop(ilist, ilist)
//
stadef SORT2 = SORT2_prop
//
extern
praxi
lemma_sort2_intr
  {xs,ys:ilist | sort2(xs, ys)}(): SORT2(xs, ys)
extern
praxi
lemma_sort2_elim
  {xs,ys:ilist}(SORT2(xs, ys)): [sort2(xs, ys)] unit_p
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
gflist_insort{xs:ilist}
  (gflist(a, xs)): [ys:ilist | sort2(xs, ys)] gflist(a, ys)
//
(* ****** ****** *)

extern
fun{a:t@ype}
gflist_insort$cmp
  {x1,x2:int}
  (x1: stamped_t (a, x1), x2: stamped_t (a, x2)): int(sgn(x1-x2))
//
(* ****** ****** *)

prval () = $solver_assert(lemma_sort2_isord)

implement
{a}(*tmp*)
gflist_insort
  (xs) = let
//
fun
insord
{xs:ilist|isord(xs)}{x0:elt}
(
  xs: gflist(a, xs)
, x0: stamped_t(a, x0)
) :
[ ys:ilist
| sort2(cons(x0, xs), ys)
] gflist(a, ys) = let
//
prval () =
$UN.prop_assert
  {sort2(cons(x0,nil), cons(x0,nil))}()
//
in
//
case+ xs of
| gflist_nil() =>
    gflist_cons(x0, gflist_nil())
| gflist_cons
    {a}{x1}{xs2}(x1, xs2) => let
    val sgn = gflist_insort$cmp(x0, x1)
    prval () = $UN.prop_assert{isord(xs2)}()
  in
    if sgn <= 0
      then let
        prval () =
        $UN.prop_assert{(x0 <= x1) <= sort2(cons(x0,xs),cons(x0,xs))}()
      in
        gflist_cons(x0, xs)
      end // end of [then]
      else let
        val [ys:ilist] ys = insord(xs2, x0)
        prval () =
        $UN.prop_assert{sort2(cons(x0,xs2),ys) <= ((x1 < x0 && isord(xs)) <= sort2(cons(x0,xs),cons(x1,ys)))}()
      in
        gflist_cons(x1, ys)
      end // end of [else]
    // end of [if]
  end // end of [gflist_cons]
//
end // end of [insord]
//
prval () = $UN.prop_assert{sort2(nil, nil)}()
//
fun
insort
{xs:ilist}
.<length(xs)>.
(
  xs: gflist(a, xs)
) : [ys:ilist | sort2(xs, ys)] gflist(a, ys) =
(
case+ xs of
| gflist_nil() => gflist_nil()
| gflist_cons
    {a}{x1}{xs2}(x1, xs2) => let
    prval
    unit_p() =
    lemma_length_1{x1}{xs2}()
    val [ys2:ilist] ys2 = insort{xs2}(xs2)
    val [ys_res:ilist] ys_res = insord(ys2, x1)
    prval () =
    $UN.prop_assert
      {sort2(cons(x1,ys2), ys_res) <= sort2(cons(x1,xs2), ys_res)}()
    // end of [prval]
  in
    ys_res
  end // end of [gflist_cons]
) (* end of [insort] *)
//
in
  insort(xs)
end // end of [gflist_insort]

(* ****** ****** *)

(* end of [gflist.dats] *)
