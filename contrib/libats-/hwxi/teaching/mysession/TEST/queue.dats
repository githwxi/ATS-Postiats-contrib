(*
** A queue of channels
*)

(* ****** ****** *)

%{^
//
#include <pthread.h>
//
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./../SATS/basis.sats"
//
(* ****** ****** *)

staload
_ = "libats/DATS/deqarray.dats"

(* ****** ****** *)
//
staload
_ = "libats/DATS/athread.dats"
staload
_ = "libats/DATS/athread_posix.dats"
//
(* ****** ****** *)
//
staload "./../DATS/basis_uchan.dats"
staload "./../DATS/basis_chan0.dats"
//
staload "./../DATS/basis_ssntyp.dats"
//
(* ****** ****** *)
//
(*
//
datatype
ssque(a:t@ype, int) =
  | ssque_deq(a, 0) of ()
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
  | chanpos_ssque_nil(a,0) of (chanpos(nil))
  | {n:pos}
    chanpos_ssque_deq(a,n) of (chanpos(chsnd(a)::ssque(a,n-1)))
  | {n:nat}
    chanpos_ssque_enq(a,n) of (chanpos(chrcv(a)::ssque(a,n+1)))
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
channeg_ssque_nil
  {a:vt@ype}
  (!channeg(ssque(a,0)) >> channeg(nil)): void
extern
fun{}
channeg_ssque_deq
  {a:vt@ype}{n:pos}
  (!channeg(ssque(a,n)) >> channeg(chsnd(a)::ssque(a,n-1))): void
and
channeg_ssque_enq
  {a:vt@ype}{n:nat}
  (!channeg(ssque(a,n)) >> channeg(chrcv(a)::ssque(a,n+1))): void
//
(* ****** ****** *)
  
implement
{}(*tmp*)
chanpos_ssque
  {a}{n}(chpos) = let
//
vtypedef
chan0 = channel0(ptr)
//
val chan0 =
  $UN.castvwtp0{chan0}(chpos)
//
val tag = channel0_recv_val(chan0)
val tag = $UN.cast{natLt(3)}($UN.ptr2int(tag))
//
in
//
case+ tag of
| 0 => let
    prval () = $UN.prop_assert{n==0}()
    prval () =
    $UN.castview2void(chan0) in chanpos_ssque_nil(chan0)
  end // end of [prval]
| 1 => let
    prval () = $UN.prop_assert{n > 0}()
    prval () =
    $UN.castview2void(chan0) in chanpos_ssque_deq(chan0)
  end // end of [prval]
| 2 => let
    prval () =
    $UN.castview2void(chan0) in chanpos_ssque_enq(chan0)
  end // end of [prval]
//
end // end of [chanpos_ssque]

(* ****** ****** *)

implement
{}(*tmp*)
channeg_ssque_nil
  (chneg) = () where
{
//
vtypedef
chan0 = channel0(ptr)
//
val
chan0 = $UN.castvwtp1{chan0}(chneg)
//
val () =
channel0_send (chan0, $UN.int2ptr(0))
//
prval () = $UN.cast2void(chan0)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_ssque_nil] *)

implement
{}(*tmp*)
channeg_ssque_deq
  (chneg) = () where
{
//
vtypedef
chan0 = channel0(ptr)
//
val
chan0 = $UN.castvwtp1{chan0}(chneg)
//
val () =
channel0_send (chan0, $UN.int2ptr(1))
//
prval () = $UN.cast2void(chan0)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_ssque_deq] *)

implement
{}(*tmp*)
channeg_ssque_enq
  (chneg) = () where
{
//
vtypedef
chan0 = channel0(ptr)
//
val
chan0 = $UN.castvwtp1{chan0}(chneg)
//
val () =
channel0_send (chan0, $UN.int2ptr(2))
//
prval () = $UN.cast2void(chan0)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_ssque_enq] *)

(* ****** ****** *)
//
extern
fun{a:vt0p}
queue_nil((*void*)): channeg(ssque(a, 0))
//
extern
fun{a:vt0p}
queue_free_nil(channeg(ssque(a, 0))): void
//
extern
fun{a:vt0p}
queue_deq{n:pos}
  (que: !channeg(ssque(a,n)) >> channeg(ssque(a,n-1))): a
//
extern
fun{a:vt0p}
queue_enq{n:nat}
  (que: !channeg(ssque(a,n)) >> channeg(ssque(a,n+1)), x0: a): void
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
val opt = chanpos_ssque(chp)
//
in
//
case+ opt of
| ~chanpos_ssque_nil (chp) =>
    chanpos_nil_wait (chp)
| ~chanpos_ssque_enq (chp) => let
    val x_first =
      chanpos_recv_val(chp)
    // end of [val]
  in
    fserv2 (x_first, queue_nil(), chp)
  end // end of [chanpos_ssque_enq]
//
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
    val () = channeg_ssque_enq (chn)
    val () = channeg_recv (chn, y)
  in
    fserv2 (x, chn, chp)
  end // end of [chanpos_ssque_enq]
//
end // end of [fserv2]
//
in
  channeg_create_exn(llam (chp) => fserv (chp))
end // end of [queue_nil]

(* ****** ****** *)

implement
{a}(*tmp*)
queue_free_nil
  (chn) = () where
{
//
val () =
  channeg_ssque_nil(chn)
//
val () = channeg_nil_close (chn)
//
} (* end of [queue_free_nil] *)

(* ****** ****** *)

implement
{a}(*tmp*)
queue_deq
  (chn) = x0 where
{
//
val () =
  channeg_ssque_deq(chn)
//
val x0 = channeg_send_val(chn)
//
} (* end of [queue_deq] *)

(* ****** ****** *)

implement
{a}(*tmp*)
queue_enq
  (chn, x0) =
{
//
val () =
  channeg_ssque_enq(chn)
//
val () = channeg_recv (chn, x0)
//
} (* end of [queue_enq] *)

(* ****** ****** *)

implement
main0((*void*)) =
{
//
#define N 100
//
val
out = stdout_ref
//
val Q0 = queue_nil<int> ()
//
val () = queue_enq (Q0, 0)
val () = queue_enq (Q0, 1)
val () = queue_enq (Q0, 2)
//
val x0 = queue_deq (Q0)
val () = fprintln! (out, "x0 = ", x0)
val x1 = queue_deq (Q0)
val () = fprintln! (out, "x1 = ", x1)
//
val () = queue_enq (Q0, 3)
val () = queue_enq (Q0, 4)
//
val x2 = queue_deq (Q0)
val () = fprintln! (out, "x2 = ", x2)
val x3 = queue_deq (Q0)
val () = fprintln! (out, "x3 = ", x3)
//
val () = queue_enq (Q0, 5)
//
val x4 = queue_deq (Q0)
val () = fprintln! (out, "x4 = ", x4)
val x5 = queue_deq (Q0)
val () = fprintln! (out, "x5 = ", x5)
//
val ((*freed*)) = queue_free_nil<int> (Q0)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [queue.dats] *)
