(*
** Lists
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
ATS_STATIC_PREFIX "_libats2erl_session_list_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2ERL}/staloadall.hats"
//
(* ****** ****** *)
//
staload UN =
  "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../SATS/list.sats"
//
(* ****** ****** *)

staload "./basis_chan2.dats"

(* ****** ****** *)

implement
chanpos_list_nil
  (chpos) = () where
{
//
val
chpos2 =
$UN.castvwtp1{chanpos2}(chpos)
//
val () = chanpos2_send{int}(chpos2, 0)
//
prval () = $UN.cast2void(chpos2)
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_nil] *)

(* ****** ****** *)

implement
chanpos_list_cons
  (chpos) = () where
{
//
val
chpos2 =
$UN.castvwtp1{chanpos2}(chpos)
//
val () = chanpos2_send{int}(chpos2, 1)
//
prval () = $UN.cast2void(chpos2)
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_cons] *)

(* ****** ****** *)

implement
channeg_list
  (chneg) = let
//
val
chneg2 =
$UN.castvwtp1{channeg2}(chneg)
//
val tag = channeg2_send{int}(chneg2)
//
prval () = $UN.cast2void(chneg2)
//
in
//
if
(tag=0)
then let
  prval () = $UN.castview2void(chneg) in channeg_list_nil()
end // end of [then]
else let
  prval () = $UN.castview2void(chneg) in channeg_list_cons()
end // end of [else]
//
end // end of [channeg_list]

(* ****** ****** *)

(* end of [list.dats] *)
