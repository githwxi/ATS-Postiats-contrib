(*
** Session combinators
*)

(* ****** ****** *)

staload "./basis.sats"

(* ****** ****** *)
//
abstype
ssappend(type, type)
//
(* ****** ****** *)
//
fun{}
chanpos_append
  {ss1,ss2:type}
(
  chp: !chanpos(ssappend(ss1, ss2)) >> chanpos(ss2)
, fserv
: (!chanpos(ss1) >> chanpos(chnil)) -<lincloptr1> void
) : void // end of [chanpos_append]
//
fun{}
channeg_append
  {ss1,ss2:type}
(
  chp: !channeg(ssappend(ss1, ss2)) >> channeg(ss2)
, fserv
: (!channeg(ss1) >> channeg(chnil)) -<lincloptr1> void
) : void // end of [channeg_append]
//
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
  chp: !chanpos(ssconj(ssrepeat0(ss))) >> chanpos(chnil)
, fserv: (!chanpos(ss) >> chanpos(chnil)) -<cloptr1> void
) : void // end of [chanpos_repeat0_conj]
//
fun{}
channeg_repeat0_conj
  {ss:type}
(
  chp: !channeg(ssconj(ssrepeat0(ss))) >> channeg(chnil)
, fserv: (!channeg(ss) >> channeg(chnil)) -<cloptr1> void
) : void // end of [channeg_repeat0_conj]
//
fun{}
channeg_repeat0_conj$choose((*void*)): natLt(2)
//
(* ****** ****** *)
//
fun{}
chanpos_repeat0_disj{ss:type}
(
  chp: !chanpos(ssdisj(ssrepeat0(ss))) >> chanpos(chnil)
, fserv: (!chanpos(ss) >> chanpos(chnil)) -<cloptr1> void
) : void // end of [chanpos_repeat0_disj]
//
fun{}
chanpos_repeat0_disj$choose((*void*)): natLt(2)
//
fun{}
channeg_repeat0_disj{ss:type}
(
  chp: !channeg(ssdisj(ssrepeat0(ss))) >> channeg(chnil)
, fserv: (!channeg(ss) >> channeg(chnil)) -<cloptr1> void
) : void // end of [channeg_repeat0_disj]
//
(* ****** ****** *)

(* end of [sscmbntr.sats] *)
