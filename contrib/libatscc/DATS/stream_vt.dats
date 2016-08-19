(* ****** ****** *)

(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./../SATS/stream.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
{}(*tmp*)
stream_vt_make_nil() =
  $ldelay(stream_vt_nil())
//
implement
{}(*tmp*)
stream_vt_make_sing(x0) =
  $ldelay(stream_vt_cons(x0, stream_vt_make_nil()))
//
(* ****** ****** *)

(* end of [stream_vt.dats] *)
