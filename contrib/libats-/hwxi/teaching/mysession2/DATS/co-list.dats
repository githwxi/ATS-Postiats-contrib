(*
** Co-lists
*)

(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./basis_chan2.dats"
//
staload "./../SATS/co-list.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_list
  (chpos) = let
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp1{chan2}(chpos)
//
val tag = channel2_recv_val (chan2)
//
prval () = $UN.cast2void(chan2)
//
in
//
if
iseqz(tag)
then let
  prval () = $UN.castview2void(chpos) in chanpos_list_nil()
end // end of [then]
else let
  prval () = $UN.castview2void(chpos) in chanpos_list_cons()
end // end of [else]
//
end // end of [chanpos_list]

(* ****** ****** *)

implement
{}(*tmp*)
channeg_list_nil
  (chneg) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val
chan2 =
$UN.castvwtp1{chan2}(chneg)
//
val () = 
channel2_send (chan2, $UN.int2ptr(0))
//
prval () = $UN.cast2void(chan2)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_list_nil] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_list_cons
  (chneg) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp1{chan2}(chneg)
//
val ((*void*)) =
  channel2_send (chan2, $UN.int2ptr(1))
//
prval () = $UN.cast2void(chan2)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_list_cons] *)

(* ****** ****** *)

(* end of [co-list.dats] *)
