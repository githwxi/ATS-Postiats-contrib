(*
** Session combinators
*)

(* ****** ****** *)

staload "./basis.sats"

(* ****** ****** *)
//
abstype ssrepeat0(ss:type)
abstype ssrepeat1(ss:type)
//
(* ****** ****** *)
//
fun{}
chanpos_repeat0_conj
  {ss:type}
(
  f: (!chanpos(ss) >> chanpos(chnil)) -<cloptr1> void
, chp: !chanpos(ssconj(ssrepeat0(ss))) >> chanpos(chnil)
) : void // end of [chanpos_repeat0_conj]
//
(* ****** ****** *)
//
fun{}
chanpos_repeat0_disj{ss:type}
(
  f: (!chanpos(ss) >> chanpos(chnil)) -<cloptr1> void
, chp: !chanpos(ssdisj(ssrepeat0(ss))) >> chanpos(chnil)
) : void // end of [chanpos_repeat0_disj]
//
fun{}
chanpos_repeat0_disj$choose((*void*)): natLt(2)
//
(* ****** ****** *)

(* end of [sscmbntr.sats] *)
