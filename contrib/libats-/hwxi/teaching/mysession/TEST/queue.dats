(*
** A queue of channels
*)

(* ****** ****** *)

staload "./../SATS/basis.sats"

(* ****** ****** *)
//
(*
//
datatype
ssque(a:t@ype, int) =
  | {n:pos}
    ssque_deq(a, n) of (snd(a), ssque(a,n-1))
  | {n:nat}
    ssque_enq(a, n) of (rcv(a), ssque(a,n+1))
//
*)
abstype ssque(a:vt@ype, n:int)
//
(* ****** ****** *)
//
datavtype
chanpos_ssque
  (a:vt@ype, int) =
  | {n:pos}
    chanpos_ssque_deq(a, n) of (chanpos(chsnd(a) :: ssque(a, n-1)))
  | {n:nat}
    chanpos_ssque_enq(a, n) of (chanpos(chrcv(a) :: ssque(a, n+1)))
//
(* ****** ****** *)
//
extern
fun{}
chanpos_ssque
  {a:vt@ype}{n:nat}(chanpos(ssque(a,n))): chanpos_ssque(a,n)
//
extern
fun{}
channeg_ssque_deq
  {a:vt@ype}{n:pos}
  (channeg(ssque(a, n))): channeg(chsnd(a) :: ssque(a, n-1))
and
channeg_ssque_enq
  {a:vt@ype}{n:nat}(channeg(ssque(a,n))): channeg(chrcv(a) :: ssque(a,n+1))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
queue_nil (): channeg(ssque(a, 0))
//
extern
fun{a:vt@ype}
queue_deq{n:pos}
  (que: &channeg(ssque(a, n)) >> channeg(ssque(a,n-1))): a
//
extern
fun{a:vt@ype}
queue_enq{n:nat}
  (que: &channeg(ssque(a,n)) >> channeg(ssque(a,n+1)), x0: a): void
//
(* ****** ****** *)

implement
{a}(*tmp*)
queue_nil
  ((*void*)) = let
//
fun
fserv
(
  chp: chanpos(ssque(a,0))
) : void = let
//
val~chanpos_ssque_enq
  (chp) = chanpos_ssque(chp)
//
val x =
  chanpos_recv_val(chp)
//
val chn = queue_nil()
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
, chn: channeg(ssque(a,n))
, chp: chanpos(ssque(a,n+1))
) : void = let
//
val opt = chanpos_ssque(chp)
//
in
//
case+ opt of
| ~chanpos_ssque_deq
    (chp) => let
    val () =
      chanpos_send (chp, x)
    // end of [val]
  in
    chanposneg_link (chp, chn)
  end // end of [chanpos_ssque_deq]
| ~chanpos_ssque_enq
    (chp) => let
    val y = chanpos_recv_val (chp)
    val chn = channeg_ssque_enq(chn)
    val () = channeg_recv (chn, y)
  in
    fserv2 (x, chn, chp)
  end // end of [chanpos_ssque_enq]
//
end // end of [fserv2]
//
in
  channeg_create (llam (chp) => fserv (chp))
end // end of [queue_nil]

(* ****** ****** *)

implement
{a}(*tmp*)
queue_deq
  (chn0) = x0 where
{
//
val chn =
  channeg_ssque_deq(chn0)
//
val x0 = channeg_send_val(chn)
val ((*void*)) = chn0 := chn
//
} (* end of [queue_deq] *)

(* ****** ****** *)

implement
{a}(*tmp*)
queue_enq
  (chn0, x0) =
{
//
val chn =
  channeg_ssque_enq(chn0)
//
val () = channeg_recv (chn, x0)
val ((*void*)) = chn0 := chn
//
} (* end of [queue_enq] *)

(* ****** ****** *)

(* end of [queue.dats] *)
