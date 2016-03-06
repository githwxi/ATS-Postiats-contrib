(*
** For integer sets
*)

(* ****** ****** *)
//
staload
"libats/SATS/ilist_prf.sats"
//
(* ****** ****** *)

datasort iset = // abstract sort

(* ****** ****** *)
//
dataprop
ISETEQ(s1:iset, s2:iset) = ISETEQ(s1, s2) of ()
//
(* ****** ****** *)

stacst iset_nil : () -> iset
stacst iset_int : (int) -> iset
stacst iset_int_int : (int, int) -> iset
stacst iset_int_int_int : (int, int, int) -> iset

(* ****** ****** *)

stacst iset_list : (ilist) -> iset

(* ****** ****** *)
//
stadef iset = iset_nil
//
stadef iset = iset_int
stadef iset = iset_int_int
stadef iset = iset_int_int_int
//
stadef iset = iset_list
//
(* ****** ****** *)
//
stacst
iset_size: (iset) -> int
//
stadef size = iset_size
//
(* ****** ****** *)

stacst
iset_is_empty: iset -> bool

stadef isnil = iset_is_empty

(* ****** ****** *)
//
stacst
eq_iset_iset
  : (iset, iset) -> bool
//
stadef == = eq_iset_iset
//
praxi
lemma_iset_equal_p2b
  {s1,s2:iset}
  (pf: ISETEQ(s1,s2)): [s1==s2] unit_p
//
praxi
lemma_iset_equal_b2p
  {s1,s2:iset| s1 == s2}(): ISETEQ(s1,s2)
//
(* ****** ****** *)
//
stacst
iset_member
  : (iset, int) -> bool
//
stadef ismbr = iset_member
//
(* ****** ****** *)
//
stacst
iset_union
  : (iset, iset) -> iset
stacst
iset_intersect
  : (iset, iset) -> iset
//
stadef + = iset_union
stadef * = iset_intersect
//
(* ****** ****** *)
//
stacst
iset_ncomplement
  : (iset, int) -> iset
//
stadef ncomp = iset_ncomplement
//
(* ****** ****** *)

(* end of [intset.sats] *)



