(* ****** ****** *)
//
// HX-2015-06:
// [imset]: finite int multisets
//
(* ****** ****** *)

sortdef elt = int

(* ****** ****** *)

staload "./ilist.sats"

(* ****** ****** *)

datasort imset = (* abstract *)

(* ****** ****** *)
//
stacst imset_nil : imset
//
stacst imset_cons : (int, imset) -> imset
stacst imset_snoc : (imset, int) -> imset
stacst imset_union : (imset, imset) -> imset
//
stadef + = imset_cons
stadef + = imset_snoc
stadef + = imset_union
//
(* ****** ****** *)

stadef nil = imset_nil
stadef cons = imset_cons
stadef snoc = imset_snoc
stadef union = imset_union

(* ****** ****** *)
//
stacst ilist2imset : ilist -> imset
//
(* ****** ****** *)

dataprop
IMSETEQ(imset, imset) = {x:imset} IMSETEQ(x, x)

(* ****** ****** *)
//
praxi
eq_imset_ilist_nil
(
) : IMSETEQ(nil, ilist2imset(ilist_nil))
//
praxi
eq_imset_ilist_cons
  {x:elt}{xs1:imset}{xs2:ilist}
(
pf: IMSETEQ(xs1, ilist2imset(xs2))
) : IMSETEQ(cons(x, xs1), ilist2imset(ilist_cons(x, xs2)))
//
praxi
eq_imset_ilist_snoc
  {xs1:imset}{xs2:ilist}{x:elt}
(
pf: IMSETEQ(xs1, ilist2imset(xs2))
) : IMSETEQ(snoc(xs1, x), ilist2imset(ilist_snoc(xs2, x)))
//
(* ****** ****** *)
//
praxi
eq_imset_ilist_append
  {xs1,ys1:imset}{xs2,ys2:ilist}
(
  IMSETEQ(xs1, ilist2imset(xs2))
, IMSETEQ(ys1, ilist2imset(ys2))
) : IMSETEQ(union(xs1, ys1), ilist2imset(ilist_append(xs2, ys2)))
//
(* ****** ****** *)

(* end of [imset.sats] *)
