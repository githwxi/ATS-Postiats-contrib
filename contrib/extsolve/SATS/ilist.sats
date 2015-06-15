(* ****** ****** *)
//
// HX-2015-06:
// [ilist]: finite int sequences
//
(* ****** ****** *)

sortdef elt = int

(* ****** ****** *)

datasort ilist =
  | ilist_nil of () | ilist_cons of (int, ilist)
// end of [ilist]

(* ****** ****** *)

stadef ilist_sing (x:int) = ilist_cons (x, ilist_nil)

(* ****** ****** *)

dataprop ILISTEQ
  (ilist, ilist) = {xs:ilist} ILISTEQ (xs, xs) of ()
// end of [ILISTEQ]

(* ****** ****** *)

stadef nil = ilist_nil
stadef cons = ilist_cons
stadef sing = ilist_sing

(* ****** ****** *)
//
stacst ilist_head : ilist -> int
stacst ilist_tail : ilist -> ilist
stacst ilist_length : ilist -> int
//
stadef head = ilist_head
stadef tail = ilist_tail
stadef length = ilist_length
//
(* ****** ****** *)

sortdef ilist1 = {xs: ilist | length(xs) >= 1}
sortdef ilist2 = {xs: ilist | length(xs) >= 2}

(* ****** ****** *)
//
praxi
lemma_head
  {x:elt}{xs:ilist}(): [head(cons(x, xs))==x] unit_p
praxi
lemma_tail
  {x:elt}{xs:ilist}(): ILISTEQ(tail(cons(x, xs)), xs)
//
(* ****** ****** *)
//
praxi
lemma_length_0(): [length(nil)==0] unit_p
praxi
lemma_length_1
  {x:elt}{xs:ilist}
(
) : [length(cons(x,xs))==length(xs)+1] unit_p
//
praxi
lemma_length_isnat{xs:ilist}(): [length(xs) >= 0] unit_p
//
(* ****** ****** *)
//
stacst
ilist_get_at : (ilist, int) -> elt
stacst
ilist_set_at : (ilist, int, elt) -> ilist
//
stadef get_at = ilist_get_at
stadef set_at = ilist_set_at
//
(* ****** ****** *)
//
praxi
lemma_get_at_0
  {x:elt}{xs:ilist}
(
) : [get_at(cons(x, xs),0)==x] unit_p
//
praxi
lemma_get_at_1
  {x:elt}{xs:ilist}{i:pos}
(
) : [get_at(cons(x, xs),i)==get_at(xs, i-1)] unit_p

(* ****** ****** *)
//
praxi
lemma_set_at_0
{x:elt}
{xs:ilist}
  {i:nat | i < length(xs)}
(
) : [get_at(set_at(xs, i, x), i)==x] unit_p
//
praxi
lemma_set_at_1
  {x:elt}{xs:ilist}{i,j:int | i != j}
(
) : [get_at(set_at(xs, i, x), j)==get_at(xs, j)] unit_p
//
(* ****** ****** *)
//
stacst
ilist_snoc : (ilist, elt) -> ilist
stacst
ilist_append : (ilist, ilist) -> ilist
//
stacst
ilist_reverse : (ilist) -> ilist
stacst
ilist_revappend : (ilist, ilist) -> ilist
//
stadef snoc = ilist_snoc
stadef append = ilist_append
//
stadef reverse = ilist_reverse
stadef revappend = ilist_revappend
//
(* ****** ****** *)

(* end of [ilist.sats] *)
