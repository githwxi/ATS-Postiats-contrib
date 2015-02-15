(*
** Lists
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
staload "./../SATS/list.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_list_nil
  (chpos) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp1{chan2}(chpos)
//
val ((*void*)) =
  channel2_send (chan2, the_null_ptr)
//
prval () = $UN.cast2void(chan2)
//
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_nil] *)

(* ****** ****** *)

implement
{}(*tmp*)
chanpos_list_cons
  (chpos) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp1{chan2}(chpos)
//
val ((*void*)) =
  channel2_send (chan2, $UN.int2ptr(1))
//
prval () = $UN.cast2void(chan2)
//
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_list_cons] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_list
  (chneg) = let
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp0{chan2}(chneg)
//
val tag = channel2_recv_val (chan2)
//
in
//
if
iseqz(tag)
then let
//
prval () =
  $UN.castview2void(chan2) in channeg_list_nil(chan2)
// end of [prval]
end // end of [then]
else let
prval () =
  $UN.castview2void(chan2) in channeg_list_cons(chan2)
// end of [prval]
end // end of [else]
//
end // end of [channeg_list]

(* ****** ****** *)

(* end of [list.dats] *)
