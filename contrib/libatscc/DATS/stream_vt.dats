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

implement
stream_vt_filter_cloref
  {a}(xs, p0) =
  auxmain(xs) where
{
//
fun
auxmain
(
xs: stream_vt(a)
) : stream_vt(a) = $ldelay
(
//
let
  val xs_con = !xs
in
//
case+ xs_con of
| ~stream_vt_nil
    ((*_*)) => stream_vt_nil()
  // end of [stream_vt_nil]
| ~stream_vt_cons
    (x, xs1) =>
  (
    if p0(x)
      then (
        stream_vt_cons(x, auxmain(xs1))
      ) (* end of [then] *)
      else (
        !(auxmain(xs1))
      ) (* end of [else] *)
    // end of [if]
  ) (* end of [stream_vt_cons] *)
//
end : stream_vt_con(a) // end of [let]
//
,
//
~(xs) // called when the stream is freed
//
) (* end of auxmain *)
//
} (* end of [stream_vt_filter_cloref] *)

(* ****** ****** *)

(* end of [stream_vt.dats] *)
