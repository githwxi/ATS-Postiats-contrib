(*
** Co-options
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
staload "./../SATS/co-option.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_opt
  (chpos) = let
//
vtypedef
chan0 = channel0(ptr)
//
val chan0 =
  $UN.castvwtp0{chan0}(chpos)
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
  $UN.castview2void(chan0) in chanpos_opt_none(chan0)
// end of [prval]
end // end of [then]
else let
prval () =
  $UN.castview2void(chan0) in chanpos_opt_some(chan0)
// end of [prval]
end // end of [else]
//
end // end of [chanpos_option]

(* ****** ****** *)

implement
{}(*tmp*)
channeg_opt_none
  (chneg) = () where
{
//
vtypedef
chan0 = channel0(ptr)
//
val
chan0 =
$UN.castvwtp1{chan0}(chneg)
//
val () = 
channel0_send (chan0, $UN.int2ptr(0))
//
prval () = $UN.cast2void(chan0)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_opt_none] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_opt_some
  (chneg) = () where
{
//
vtypedef
chan0 = channel0(ptr)
//
val chan0 =
  $UN.castvwtp1{chan0}(chneg)
//
val ((*void*)) =
  channel0_send(chan0, $UN.int2ptr(1))
//
prval () = $UN.cast2void(chan0)
//
prval () = $UN.castview2void(chneg)
//
} (* end of [channeg_opt_some] *)

(* ****** ****** *)

(* end of [co-option.dats] *)
