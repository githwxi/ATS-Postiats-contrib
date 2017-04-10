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
, fserv : (!chanpos(ss1) >> chanpos_nil) -<lincloptr1> void
) : void // end of [chanpos_append]
//
fun{}
channeg_append
  {ss1,ss2:type}
(
  chp: !channeg(ssappend(ss1, ss2)) >> channeg(ss2)
, fserv : (!channeg(ss1) >> channeg_nil) -<lincloptr1> void
) : void // end of [channeg_append]
//
(* ****** ****** *)
//
abstype ssoption(ss:type)
abstype ssrepeat(ss:type)
//
(* ****** ****** *)
//
fun{}
chanpos_repeat_conj
  {ss:type}
(
  chp: !chanpos(ssconj(ssrepeat(ss))) >> chanpos_nil
, fserv: (!chanpos(ss) >> chanpos_nil) -<cloptr1> void
) : void // end of [chanpos_repeat_conj]
//
fun{}
channeg_repeat_conj
  {ss:type}
(
  chp: !channeg(ssconj(ssrepeat(ss))) >> channeg_nil
, fserv: (!channeg(ss) >> channeg_nil) -<cloptr1> void
) : void // end of [channeg_repeat_conj]
//
fun{}
channeg_repeat_conj$choose((*void*)): natLt(2)
//
fun{}
chanpos_repeat_conj$fwork_tag(tag: int): void
fun{}
channeg_repeat_conj$fwork_tag(tag: int): void
//
(* ****** ****** *)
//
fun{}
chanpos_repeat_disj{ss:type}
(
  chp: !chanpos(ssdisj(ssrepeat(ss))) >> chanpos_nil
, fserv: (!chanpos(ss) >> chanpos_nil) -<cloptr1> void
) : void // end of [chanpos_repeat_disj]
//
fun{}
channeg_repeat_disj{ss:type}
(
  chp: !channeg(ssdisj(ssrepeat(ss))) >> channeg_nil
, fserv: (!channeg(ss) >> channeg_nil) -<cloptr1> void
) : void // end of [channeg_repeat_disj]
//
fun{}
chanpos_repeat_disj$choose(): natLt(2)
//
fun{}
chanpos_repeat_disj$fwork_tag(tag: int): void
fun{}
channeg_repeat_disj$fwork_tag(tag: int): void
//
(* ****** ****** *)

(* end of [sscmbntr.sats] *)
