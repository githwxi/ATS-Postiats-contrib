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
ssqueue(a:t@ype, int) =
  | {n:pos}
    ssqueue_deq(a, n) of (snd(a), ssqueue(a,n-1))
  | {n:nat}
    ssqueue_enq(a, n) of (rcv(a), ssqueue(a,n+1))
//
(* ****** ****** *)
//
datavtype
chpos_ssqueue
  (a:t@ype, int) =
  | {n:pos}
    chpos_ssqueue_deq(a, n) of (chpos(snd(a) :: ssqueue(a, n-1)))
  | {n:nat}
    chpos_ssqueue_enq(a, n) of (chpos(rcv(a) :: ssqueue(a, n+1)))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
chpos_ssqueue{n:nat}(chpos(ssqueue(a,n))): chpos_ssqueue(a,n)
//
extern
fun{a:t@ype}
chneg_ssqueue_deq
  {n:pos}(chneg(ssqueue(a, n))): chneg(snd(a) :: ssqueue(a, n-1))
//
extern
fun{a:t@ype}
chneg_ssqueue_enq{n:nat}(chneg(ssqueue(a,n))): chneg(rcv(a) :: ssqueue(a,n+1))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
myqueue_nil (): chneg(ssqueue(a, 0))
//
extern
fun{a:t@ype}
myqueue_deq{n:pos}
  (que: chneg(ssqueue(a, n))): (a, chneg(ssqueue(a, n-1)))
//
extern
fun{a:t@ype}
myqueue_enq{n:nat}
  (que: chneg(ssqueue(a,n)), x0: a): chneg(ssqueue(a,n+1))
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
  chp: chpos(ssqueue(a,0))
) : void = let
//
val~chpos_ssqueue_enq
  (chp) = chpos_ssqueue(chp)
//
val x =
  chpos_recv_val(chp)
//
val chn = myqueue_nil()
//
in
  fserv2 (x, chn, chp)
end // end of [fserv]
//
and
fserv2
{n:nat}
(
  x: a
, chn: chneg(ssqueue(a,n))
, chp: chpos(ssqueue(a,n+1))
) : void = let
//
val opt = chpos_ssqueue(chp)
//
in
//
case+ opt of
| ~chpos_ssqueue_deq
    (chp) => let
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
end // end of [myqueue_nil]

(* ****** ****** *)

implement
{a}(*tmp*)
myqueue_deq(chn) = let
//
val chn =
  chneg_ssqueue_deq(chn)
//
val x0 = chneg_send_val(chn)
//
in
  (x0, chn)
end // end of [myqueue_deq]

(* ****** ****** *)

implement
{a}(*tmp*)
myqueue_enq
  (chn, x0) = chn where
{
//
val chn =
  chneg_ssqueue_enq(chn)
//
val ((*void*)) = chneg_recv (chn, x0)
//
} (* end of [myqueue_enq] *)

(* ****** ****** *)

(* end of [scratch09-2.dats] *)
