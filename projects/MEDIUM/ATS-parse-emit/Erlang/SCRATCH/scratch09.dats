(* ****** ****** *)
//
// HX-2015-01-22:
// For the purpose of
// studying session types
//
(* ****** ****** *)
//
abstype snd (a:vt@ype)
abstype rcv (a:vt@ype)
//
(* ****** ****** *)

abstype
chseq (a:type, b:type)

(* ****** ****** *)

stadef nil = unit
stadef :: (a:type, b:type) = chseq (a, b)

(* ****** ****** *)
//
absvtype chpos(type)
absvtype chneg(type)
//
(* ****** ****** *)
//
extern
fun chpos_nil (ch: chpos(nil)): void // chpos_recv_close
extern
fun chneg_nil (ch: chneg(nil)): void // chneg_recv_close
//
(* ****** ****** *)
//
extern
fun{a:vt0p}
chpos_send{ss:type}
  (ch: !chpos(snd(a) :: ss) >> chpos(ss), x: a): void
extern
fun{a:vt0p}
chpos_recv{ss:type}
  (ch: !chpos(rcv(a) :: ss) >> chpos(ss), x: &a? >> _): void
extern
fun{a:vt0p}
chpos_recv_val{ss:type}(ch: !chpos(rcv(a) :: ss) >> chpos(ss)): a
//
(* ****** ****** *)
//
extern
fun{a:vt0p}
chneg_recv{ss:type}
  (ch: !chneg(rcv(a) :: ss) >> chneg(ss), x: a): void
extern
fun{a:vt0p}
chneg_send{ss:type}
  (ch: !chneg(snd(a) :: ss) >> chneg(ss), x: &a? >> _): void
extern
fun{a:vt0p}
chneg_send_val{ss:type}(ch: !chneg(snd(a) :: ss) >> chneg(ss)): a
//
(* ****** ****** *)
//
extern
fun
chneg_create{ss:type}
  (f: chpos(ss) -<lincloptr1> void): chneg(ss)
//
(* ****** ****** *)
//
extern
fun
chpos_chneg_connect
  {ss:type}(ch1: chpos(ss), ch2: chneg(ss)): void
//
(* ****** ****** *)
//
datatype
ssqueue(a:t@ype) =
  | ssqueue_deq of (ssqueopt(a))
  | ssqueue_enq of (rcv(a) :: ssqueue(a))
and ssqueopt(a:t@ype) =
  | ssqueopt_none of ()
  | ssqueopt_some of (snd(a), ssqueue(a))
//
(* ****** ****** *)
//
datavtype
chpos_ssqueue (a:t@ype) =
  | chpos_ssqueue_deq of (chpos(ssqueopt(a)))
  | chpos_ssqueue_enq of (chpos(rcv(a) :: ssqueue(a)))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
chpos_ssqueue (chpos(ssqueue(a))): chpos_ssqueue(a)
//
extern
fun{a:t@ype}
chneg_ssqueue_deq
  (chneg(ssqueue(a))): chneg(ssqueopt(a))
//
extern
fun{a:t@ype}
chneg_ssqueue_enq(chneg(ssqueue(a))): chneg(rcv(a) :: ssqueue(a))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
chpos_ssqueopt_none
  (chpos(ssqueopt(a))): chpos(nil)
extern
fun{a:t@ype}
chpos_ssqueopt_some
  (chpos(ssqueopt(a))): chpos(snd(a) :: ssqueue(a))
//
datavtype
chneg_ssqueopt(a:t@ype) =
  | chneg_ssqueopt_none of (chneg(nil))
  | chneg_ssqueopt_some of (chneg(snd(a) :: ssqueue(a)))
//
extern
fun{a:t@ype}
chneg_ssqueopt(chneg(ssqueopt(a))): chneg_ssqueopt(a)
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
myqueue_nil (): chneg(ssqueue(a))
//
extern
fun{a:t@ype}
myqueue_deq
(
  que: chneg(ssqueue(a))
) : Option_vt(@(a, chneg(ssqueue(a))))
//
extern
fun{a:t@ype}
myqueue_enq
  (que: chneg(ssqueue(a)), x0: a): chneg(ssqueue(a))
//
(* ****** ****** *)

implement
{a}(*tmp*)
myqueue_nil
  ((*void*)) = let
//
fun
fserv
(
  chp: chpos(ssqueue(a))
) : void = let
//
val opt = chpos_ssqueue(chp)
//
in
//
case+ opt of
| ~chpos_ssqueue_enq
    (chp) => let
    val x =
      chpos_recv_val(chp)
    // end of [val]
    val chn = myqueue_nil()
  in
    fserv2 (x, chn, chp)
  end // end of [chpos_ssqueue_enq]
| ~chpos_ssqueue_deq
    (chp) => let
    val chp =
      chpos_ssqueopt_none(chp) in chpos_nil(chp)
    // end of [chp]
  end // end of [chpos_ssqueue_deq]
//
end // end of [fserv]
//
and
fserv2
(
  x: a
, chn: chneg(ssqueue(a))
, chp: chpos(ssqueue(a))
) : void = let
//
val opt = chpos_ssqueue(chp)
//
in
//
case+ opt of
| ~chpos_ssqueue_deq
    (chp) => let
    val chp =
      chpos_ssqueopt_some(chp)
    // end of [val]
    val () = chpos_send (chp, x)
  in
    chpos_chneg_connect (chp, chn)
  end // end of [chpos_ssqueue_deq]
| ~chpos_ssqueue_enq
    (chp) => let
    val y = chpos_recv_val (chp)
    val chn = chneg_ssqueue_enq(chn)
    val () = chneg_recv (chn, y)
  in
    fserv2 (x, chn, chp)
  end // end of [chpos_ssqueue_enq]
//
end // end of [fserv2]
//
in
  chneg_create (llam (chp) => fserv (chp))
end // end of [chneg_ssqueue_nil]

(* ****** ****** *)

implement
{a}(*tmp*)
myqueue_deq(chn) = let
//
val chn =
  chneg_ssqueue_deq(chn)
//
val opt = chneg_ssqueopt(chn)
//
in
//
case+ opt of
| ~chneg_ssqueopt_none(chn) =>
    let val () = chneg_nil(chn) in None_vt() end
| ~chneg_ssqueopt_some(chn) =>
    let val x0 = chneg_send_val(chn) in Some_vt(@(x0, chn)) end
//
end // end of [myqueue_deq]

(* ****** ****** *)

implement
{a}(*tmp*)
myqueue_enq
  (chn, x) = chn where
{
//
val chn =
  chneg_ssqueue_enq(chn)
val ((*void*)) = chneg_recv (chn, x)
//
} (* end of [myqueue_enq] *)

(* ****** ****** *)

(* end of [scratch09.dats] *)
