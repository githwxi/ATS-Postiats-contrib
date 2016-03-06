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
staload "./basis_chan0.dats"
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
chan0 = channel0(ptr)
//
val
chan0 =
$UN.castvwtp1{chan0}(chpos)
//
val () =
channel0_send (chan0, $UN.int2ptr(0))
//
prval () = $UN.cast2void(chan0)
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
chan0 = channel0(ptr)
//
val chan0 =
  $UN.castvwtp1{chan0}(chpos)
//
val ((*void*)) =
  channel0_send (chan0, $UN.int2ptr(1))
//
prval () = $UN.cast2void(chan0)
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
chan0 = channel0(ptr)
//
val chan0 =
  $UN.castvwtp0{chan0}(chneg)
//
val tag = channel0_recv_val (chan0)
//
in
//
if
iseqz(tag)
then let
//
prval () =
  $UN.castview2void(chan0) in channeg_opt_none(chan0)
// end of [prval]
end // end of [then]
else let
prval () =
  $UN.castview2void(chan0) in channeg_opt_some(chan0)
// end of [prval]
end // end of [else]
//
end // end of [channeg_opt]

(* ****** ****** *)

(* end of [option.dats] *)
