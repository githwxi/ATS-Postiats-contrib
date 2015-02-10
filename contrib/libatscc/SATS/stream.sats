(*
** libatscc-common
*)

(* ****** ****** *)

staload "./../basics.sats"

(* ****** ****** *)
//
fun
stream_nth_exn
  {a:t0p}
(
  xs: stream(INV(a)), n: intGte(0)
) : a = "mac#%" // end-of-function
//
(* ****** ****** *)

overload [] with stream_nth_exn of 100

(* ****** ****** *)

fun
stream_map_cloref
  {a:t0p}{b:t0p}
(
  xs: stream(INV(a)), f: (a) -<cloref1> b
) : stream(b) = "mac#%" // end-of-function

(* ****** ****** *)

fun
stream_filter_cloref
  {a:t0p}
(
  xs: stream(INV(a)), pred: (a) -<cloref1> bool
) : stream(a) = "mac#%" // end-of-function

(* ****** ****** *)
//
fun
stream_tabulate_cloref
  {a:t0p}(f: intGte(0) -<cloref1> a): stream(a) = "mac#%"
//
(* ****** ****** *)

(* end of [stream.sats] *)
