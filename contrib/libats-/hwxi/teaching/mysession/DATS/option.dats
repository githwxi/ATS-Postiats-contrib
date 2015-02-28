(*
** Options
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
staload "./../SATS/option.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_opt_none
  (chpos) = () where
{
//
vtypedef
chan2 = channel2(ptr)
//
val
chan2 =
$UN.castvwtp1{chan2}(chpos)
//
val () =
channel2_send (chan2, $UN.int2ptr(0))
//
prval () = $UN.cast2void(chan2)
//
prval () = $UN.castview2void(chpos)
//
} (* end of [chanpos_opt_none] *)

(* ****** ****** *)

implement
{}(*tmp*)
chanpos_opt_some
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
} (* end of [chanpos_opt_some] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_opt
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
  $UN.castview2void(chan2) in channeg_opt_none(chan2)
// end of [prval]
end // end of [then]
else let
prval () =
  $UN.castview2void(chan2) in channeg_opt_some(chan2)
// end of [prval]
end // end of [else]
//
end // end of [channeg_opt]

(* ****** ****** *)

(* end of [option.dats] *)
