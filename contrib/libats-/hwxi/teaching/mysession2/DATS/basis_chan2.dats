(*
** Channel pairs
*)

(* ****** ****** *)

staload "./basis_chan.dats"

(* ****** ****** *)

absvtype
channel2_vtype(a:vt@ype) = ptr
vtypedef
channel2(a:vt@ype) = channel2_vtype(a)

(* ****** ****** *)
//
extern
fun
{a:vt0p}
channel2_make_pair
(
  capacity: intGt(0)
) : (channel2(a), channel2(a))
//
(* ****** ****** *)
//
extern
fun
{a:vt0p}
channel2_free (chan2: channel2(a)): void
//
(* ****** ****** *)

extern
fun{a:vt0p}
channel2_send (!channel2(a), a): void
extern
fun{a:vt0p}
channel2_recv (!channel2(a), &a? >> a): void
extern
fun{a:vt0p}
channel2_recv_val (!channel2(a)): (a)

(* ****** ****** *)
//
extern
fun
{a:vt0p}
channel2_link(channel2(a), channel2(a)): void
//
(* ****** ****** *)
//
datavtype
channel2_(a:vt@ype) =
  CHAN2 of (channel(a), channel(a))
//
(* ****** ****** *)

assume channel2_vtype(a:vt0p) = channel2_(a)

(* ****** ****** *)

implement
{a}(*tmp*)
channel2_make_pair
  (cap) = let
//
  val chx =
    channel_make<a> (cap)
  val chy =
    channel_make<a> (cap)
//
  val chx_2 = channel_ref (chx)
  val chy_2 = channel_ref (chy)
//
in
  (CHAN2(chx, chy_2), CHAN2(chy, chx_2))
end // end of [channel2_make_pair]

(* ****** ****** *)

implement
{a}(*tmp*)
channel2_free
  (chan2) = let
//
val~CHAN2(ch0, ch1) = chan2
//
in
  channel_unref(ch0); channel_unref(ch1)
end // end of [channel2_free]

(* ****** ****** *)

implement
{a}(*tmp*)
channel2_send
  (chan2, x) = let
//
val+CHAN2(ch0, ch1) = chan2
//
in
  channel_insert<a> (ch0, x)
end // end of [channel2_send]

(* ****** ****** *)

implement
{a}(*tmp*)
channel2_recv
  (chan2, x0) = let
//
val+@CHAN2(ch0, ch1) = chan2
//
val () =
x0 := channel_remove<a> (ch1)
//
prval ((*fold*)) = fold@chan2
//
in
  // nothing
end // end of [channel2_recv]

(* ****** ****** *)

implement
{a}(*tmp*)
channel2_recv_val
  (chan2) = x0 where
{
//
val+@CHAN2(ch0, ch1) = chan2
val x0 = channel_remove<a> (ch1)
prval ((*fold*)) = fold@chan2
//
} (* end of [channel2_recv_val] *)

(* ****** ****** *)

implement
{a}(*tmp*)
channel2_link
  (chan2x, chan2y) = let
//
val~CHAN2(chx0, chx1) = chan2x
val~CHAN2(chy0, chy1) = chan2y
//
val () = channel_qinsert (chx0, chy1)
val () = channel_qinsert (chy0, chx1)
//
val ((*void*)) = channel_unref (chx0)
val ((*void*)) = channel_unref (chy0)
//
(*
val () =
fprintln! (stdout_ref, "channel2_link: leave")
*)
//
in
  // nothing
end // end of [channel2_link]

(* ****** ****** *)

(* end of [basic_chan2.dats] *)
