(*
** libatscc-common
*)

(* ****** ****** *)

(*
staload "./../basics.sats"
*)

(* ****** ****** *)
//
fun{}
stream_vt_make_nil
  {a:vt0p}(): stream_vt(a) = "mac#%"
fun{}
stream_vt_make_sing
  {a:t0p}(x0: a): stream_vt(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_vt_filter_cloref
  {a:t0p}
(
  xs: stream_vt(INV(a)), pred: (a) -<cloref1> bool
) : stream_vt(a) = "mac#%" // end-of-function
//
(* ****** ****** *)

(* end of [stream_vt.sats] *)
