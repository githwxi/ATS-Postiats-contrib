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
staload "./basis_chan2.dats"
//
staload "./../SATS/co-option.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
chanpos_option
  (chpos) = let
//
vtypedef
chan2 = channel2(ptr)
//
val chan2 =
  $UN.castvwtp0{chan2}(chpos)
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
  $UN.castview2void(chan2) in chanpos_option_none(chan2)
// end of [prval]
end // end of [then]
else let
prval () =
  $UN.castview2void(chan2) in chanpos_option_some(chan2)
// end of [prval]
end // end of [else]
//
end // end of [chanpos_option]

(* ****** ****** *)

implement
{}(*tmp*)
channeg_option_none
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
} (* end of [channeg_option_none] *)

(* ****** ****** *)

implement
{}(*tmp*)
channeg_option_some
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
} (* end of [channeg_option_some] *)

(* ****** ****** *)

(* end of [co-option.dats] *)
