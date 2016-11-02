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
stream_vt2t
  {a:t0p}
  (stream_vt(INV(a))): stream(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_vt_takeLte
  {a:vt0p}
(
xs: stream_vt(INV(a)), n0: intGte(0)
) : stream_vt(a) = "mac#%" // end-of-fun
//
overload .takeLte with stream_vt_takeLte
//
(* ****** ****** *)
//
fun
stream_vt_append
  {a:vt0p}
(
  xs: stream_vt(INV(a)), ys: stream_vt(a)
) : stream_vt(a) = "mac#%" // end-of-function
//
(* ****** ****** *)
//
fun
stream_vt_map_cloref
  {a:vt0p}{b:vt0p}
(
  xs: stream_vt(INV(a)), fopr: (a) -<cloref1> b
) : stream_vt(b) = "mac#%" // end-of-function
fun
stream_vt_map_method
  {a:vt0p}{b:vt0p}
(
  xs: stream_vt(INV(a))
) :
(
 (a) -<cloref1> b
) -<lincloptr1> stream_vt(b) = "mac#%" // endfun
//
(* ****** ****** *)
//
fun
stream_vt_filter_cloref
  {a:t0ype}
(
  xs: stream_vt(INV(a)), pred: (a) -<cloref1> bool
) : stream_vt(a) = "mac#%" // end-of-function
fun
stream_vt_filter_method
  {a:t0ype}
(
  xs: stream_vt(INV(a))
) :
(
  (a) -<cloref1> bool
) -<lincloptr1> stream_vt(a) = "mac#%" // endfun
//
(* ****** ****** *)
//
fun
stream_vt_foreach_cloref
  {a:vt0ype}
(
  xs: stream_vt(INV(a))
, fwork: (a) -<cloref1> void
) : void = "mac#%" // end-of-function
fun
stream_vt_foreach_method
  {a:vt0ype}
(
  xs: stream_vt(INV(a))
) :<> ((a) -<cloref1> void) -<lincloptr1> void = "mac#%"
//
(* ****** ****** *)
//
fun
stream_vt_iforeach_cloref
  {a:vt0ype}
(
  xs: stream_vt(INV(a))
, fwork: (Nat, a) -<cloref1> void
) : void = "mac#%" // end-of-function
fun
stream_vt_iforeach_method
  {a:vt0ype}
(
  xs: stream_vt(INV(a))
) :<> ((Nat, a) -<cloref1> void) -<lincloptr1> void = "mac#%"
//
(* ****** ****** *)
//
overload .map with stream_vt_map_method
overload .filter with stream_vt_filter_method
overload .foreach with stream_vt_foreach_method
overload .iforeach with stream_vt_iforeach_method
//
(* ****** ****** *)
//
fun
stream_vt_tabulate_cloref
  {a:t0p}
  (fopr: intGte(0) -<cloref1> a): stream_vt(a) = "mac#%"
//
(* ****** ****** *)

(* end of [stream_vt.sats] *)
