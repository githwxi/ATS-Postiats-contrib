(*
** Session-typed channels
*)

(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
"./../SATS/basis.sats"
//
staload "./basis_chan2.dats"
//
(* ****** ****** *)
//
datavtype
boxed (a:vt@ype) = BOX of (a)
//
(* ****** ****** *)

implement
{a}(*tmp*)
chanpos_send
  (chpos, x) = let
  vtypedef bxa = boxed(a)
  val chan2 =
    $UN.castvwtp1{channel2(bxa)}(chpos)
  val ((*void*)) = channel2_send (chan2, BOX(x))
  prval ((*void*)) = $UN.cast2void(chan2)
  prval ((*void*)) = $UN.castview2void(chpos)
in
  // nothing
end // end of [chanpos_send]

(* ****** ****** *)

implement
{a}(*tmp*)
channeg_recv
  (chneg, x) = let
  vtypedef bxa = boxed(a)
  val chan2 =
    $UN.castvwtp1{channel2(bxa)}(chneg)
  val ((*void*)) = channel2_send (chan2, BOX(x))
  prval ((*void*)) = $UN.cast2void(chan2)
  prval ((*void*)) = $UN.castview2void(chneg)
in
  // nothing
end // end of [channeg_recv]

(* ****** ****** *)

implement
{a}(*tmp*)
chanpos_recv
  (chpos, x0) =
(
x0 := chanpos_recv_val(chpos)
) (* end of [chanpos_recv] *)

implement
{a}(*tmp*)
chanpos_recv_val
  (chpos) = (x) where
{
//
  vtypedef bxa = boxed(a)
//
  val chan2 =
    $UN.castvwtp1{channel2(bxa)}(chpos)
  // end of [val]
//
  val~BOX(x) = channel2_recv_val(chan2)
//
  prval ((*void*)) = $UN.cast2void(chan2)
  prval ((*void*)) = $UN.castview2void(chpos)
//
} (* end of [chanpos_recv_val] *)

(* ****** ****** *)

implement
{a}(*tmp*)
channeg_send
  (chneg, x0) =
(
x0 := channeg_send_val(chneg)
) (* end of [channeg_send] *)

implement
{a}(*tmp*)
channeg_send_val
  (chneg) = (x) where
{
//
  vtypedef bxa = boxed(a)
//
  val chan2 =
    $UN.castvwtp1{channel2(bxa)}(chneg)
  // end of [val]
//
  val~BOX(x) = channel2_recv_val(chan2)
//
  prval ((*void*)) = $UN.cast2void(chan2)
  prval ((*void*)) = $UN.castview2void(chneg)
//
} (* end of [channeg_send_val] *)

(* ****** ****** *)

(*
fun{}
chanpos_nil_wait(chanpos(nil)): void
*)

implement
{}(*tmp*)
chanpos_nil_wait
  (chpos) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp0{chan2}(chpos)
//
val tag = channel2_recv_val (chan2)
//
val ((*void*)) = assertloc (iseqz(tag))
//
val ((*freed*)) = channel2_free (chan2)
//
} (* end of [chanpos_nil_wait] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_nil_close
  (chneg) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp0{chan2}(chneg)
//
val ((*void*)) =
  channel2_send (chan2, the_null_ptr)
//
val ((*freed*)) = channel2_free (chan2)
//
} (* end of [channeg_nil_close] *)

(* ****** ****** *)
//
implement
{}(*tmp*)
chanposneg_link
  {ss}(chpos, chneg) = let
//
val
chan2x =
$UN.castvwtp0{channel2(ptr)}(chpos)
val
chan2y =
$UN.castvwtp0{channel2(ptr)}(chneg)
//
in
  channel2_link<ptr> (chan2x, chan2y)
end // end of [chanposneg_link]
//
(* ****** ****** *)

staload "libats/SATS/athread.sats"

(* ****** ****** *)

(*
fun{}
channeg_create{ss:type}
  (fserv: chanpos(ss) -<lincloptr1> void): channeg(ss)
*)
implement
{}(*tmp*)
channeg_create_exn
  {ss}(fserv) = let
//
#define CAP 1
//
val
(chx, chy) =
  channel2_make_pair<ptr>(CAP)
//
val chpos =
  $UN.castvwtp0{chanpos(ss)}(chx)
//
val tid =
athread_create_cloptr_exn
(
//
llam (
) => let
  val () = fserv(chpos)
in
  cloptr_free($UN.castvwtp0{cloptr(void)}(fserv))
end // end of [let]
//
) (* end of [val] *)
//
in
  $UN.castvwtp0{channeg(ss)}(chy)
end // end of [channeg_create]

(* ****** ****** *)

(* end of [basis_ssntyp.dats] *)
