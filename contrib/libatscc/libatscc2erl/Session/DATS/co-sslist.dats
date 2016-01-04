(*
** Session Co-List
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#define
ATS_EXTERN_PREFIX "libats2erl_session_"
#define
ATS_STATIC_PREFIX "_libats2erl_session_list_"
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
staload "./../SATS/co-sslist.sats"
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
chanpos_sslist
  (chpos) = let
//
val
chpos0 =
$UN.castvwtp1{chanpos0}(chpos)
//
val tag = chanpos0_recv{int}(chpos0)
//
prval () = $UN.cast2void(chpos0)
//
in
//
if
(tag=0)
then let
  prval () = $UN.castview2void(chpos) in chanpos_sslist_nil()
end // end of [then]
else let
  prval () = $UN.castview2void(chpos) in chanpos_sslist_cons()
end // end of [else]
//
end // end of [chanpos_list]

(* ****** ****** *)

implement
channeg_sslist_nil
  (chneg) = () where
{
//
val
chneg0 =
$UN.castvwtp1{channeg0}(chneg)
//
val () =
  channeg0_recv{int}(chneg0, 0)
//
prval () = $UN.cast2void(chneg0)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_list_nil] *)

(* ****** ****** *)

implement
channeg_sslist_cons
  (chneg) = () where
{
//
val
chneg0 =
$UN.castvwtp1{channeg0}(chneg)
//
val () =
  channeg0_recv{int}(chneg0, 1)
//
prval () = $UN.cast2void(chneg0)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_list_cons] *)

(* ****** ****** *)

implement
channeg_sslist_nil_close
  (chn) = let
//
val () = channeg_sslist_nil(chn) in channeg_nil_close(chn)
//
end // end of [channeg_sslist_nil_close]

(* ****** ****** *)

(* end of [co-sslist.dats] *)
