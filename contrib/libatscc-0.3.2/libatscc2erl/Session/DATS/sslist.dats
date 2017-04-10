(*
** Session List
*)

(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#define
ATS_EXTERN_PREFIX "libats2erl_session_"
#define
ATS_STATIC_PREFIX "_libats2erl_session_sslist_"
//
(* ****** ****** *)
//
#include "share/atspre_define.hats"
#include "{$LIBATSCC2ERL}/staloadall.hats"
//
(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../SATS/basis.sats"
staload "./../SATS/sslist.sats"
//
(* ****** ****** *)
//
staload CHAN0 = "./basis_chan0.dats"
//
macdef
chanpos0_send = $CHAN0.chanpos0_send
macdef
chanpos0_recv = $CHAN0.chanpos0_recv
macdef
channeg0_recv = $CHAN0.channeg0_recv
macdef
channeg0_send = $CHAN0.channeg0_send
//
vtypedef chanpos0 = $CHAN0.chanpos()
vtypedef channeg0 = $CHAN0.channeg()
//
(* ****** ****** *)

implement
chanpos_sslist_nil
  (chpos) = () where
{
//
val
chpos0 =
$UN.castvwtp1{chanpos0}(chpos)
//
val () = chanpos0_send{int}(chpos0, 0(*nil*))
//
prval () = $UN.cast2void(chpos0)
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_sslist_nil] *)

(* ****** ****** *)

implement
chanpos_sslist_cons
  (chpos) = () where
{
//
val
chpos0 =
$UN.castvwtp1{chanpos0}(chpos)
//
val () = chanpos0_send{int}(chpos0, 1(*cons*))
//
prval () = $UN.cast2void(chpos0)
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_sslist_cons] *)

(* ****** ****** *)

implement
chanpos_sslist_nil_wait
  (chp) = let
//
val () = chanpos_sslist_nil(chp) in chanpos_nil_wait(chp)
//
end // end of [chanpos_sslist_nil_wait]

(* ****** ****** *)

implement
channeg_sslist
  (chneg) = let
//
val
chneg0 =
$UN.castvwtp1{channeg0}(chneg)
//
val tag = channeg0_send{int}(chneg0)
//
prval () = $UN.cast2void(chneg0)
//
in
//
if
(tag=0)
then let
  prval () = $UN.castview2void(chneg) in channeg_sslist_nil()
end // end of [then]
else let
  prval () = $UN.castview2void(chneg) in channeg_sslist_cons()
end // end of [else]
//
end // end of [channeg_sslist]

(* ****** ****** *)

implement
list2sslist{a}(xs) = let
//
fun
fserv
(
  chp: chanpos(ssdisj(sslist(a))), xs: List(a)
) : void =
(
case+ xs of
| list_nil() => let
    val () =
    chanpos_sslist_nil(chp) in chanpos_nil_wait(chp)
  end // end of [sslist_nil]
| list_cons(x, xs) => let
    val () =
    chanpos_sslist_cons(chp)
    val () = chanpos_send{a}(chp, x) in fserv(chp, xs)
  end // end of [sslist_cons]
)
//
in
  channeg_create(llam(chp) => fserv(chp, xs))
end // end of [list2sslist]

(* ****** ****** *)

implement
sslist2list
  {a}(chn) = let
//
fun
loop
(
  chn: channeg(ssdisj(sslist(a))), xs: List0(a)
) : List0(a) = let
//
val opt = channeg_sslist(chn)
//
in
//
case+ opt of
| channeg_sslist_nil() =>
    (channeg_nil_close(chn); xs)
| channeg_sslist_cons() => let
    val x = channeg_send(chn) in loop(chn, list_cons(x, xs))
  end // end of [channeg_sslist_cons]
//
end // end of [loop]
//
in
  list_reverse(loop(chn, list_nil(*void*)))
end // end of [sslist2list]

(* ****** ****** *)

(* end of [sslist.dats] *)
