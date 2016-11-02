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
stream_make_nil
  {a:t0p}(): stream(a) = "mac#%"
//
(* ****** ****** *)
//
fun{}
stream_sing
  {a:t0p}(a): stream_con(a) = "mac#%"
fun{}
stream_make_sing
  {a:t0p}(x0: a): stream(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_make_list
  {a:t0p}
  (xs: List0(a)): stream(a) = "mac#%"
fun
stream_make_list0
  {a:t0p}
  (xs: list0(a)): stream(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_nth_opt
  {a:t0p}
(
  xs: stream(INV(a)), n: intGte(0)
) : Option_vt(a) = "mac#%" // end-of-fun
//
(* ****** ****** *)
//
fun
stream_length
  {a:t0p}
  (stream(INV(a))): intGte(0) = "mac#%"
//
(* ****** ****** *)
//
fun
stream2list
  {a:t0p}(stream(INV(a))): List0(a) = "mac#%"
fun
stream2list_rev
  {a:t0p}(stream(INV(a))): List0(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_takeLte
  {a:t0p}
(
  xs: stream(INV(a)), n0: intGte(0)
) : stream_vt(a) = "mac#%" // end-of-fun
//
overload .takeLte with stream_takeLte
//
(* ****** ****** *)
//
fun
stream_take_opt
  {a:t0p}{n:nat}
(
  xs: stream(INV(a)), n: int(n)
) : Option_vt(list(a,n)) = "mac#%" // end-of-fun
//
fun
stream_drop_opt
  {a:t0p}{n:nat}
(
  xs: stream(INV(a)), n: int(n)
) : Option_vt(stream(a)) = "mac#%" // end-of-fun
//
(* ****** ****** *)
//
fun
stream_append
  {a:t0p}
  (stream(INV(a)), stream(a)): stream(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_concat
  {a:t0p}
  (xss: stream(stream(INV(a)))): stream(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_map_cloref
  {a:t0p}{b:t0p}
(
  xs: stream(INV(a)), fopr: (a) -<cloref1> b
) : stream(b) = "mac#%" // end-of-function
//
fun
stream_map_method
  {a:t0p}{b:t0p}
(
  xs: stream(INV(a)), TYPE(b))(fopr: (a) -<cloref1> b
) : stream(b) = "mac#%" // end-of-function
//
overload .map with stream_map_method
//
(* ****** ****** *)
//
fun
stream_filter_cloref
  {a:t0p}
(
  xs: stream(INV(a)), pred: (a) -<cloref1> bool
) : stream(a) = "mac#%" // end-of-function
fun
stream_filter_method
  {a:t0p}
(
  xs: stream(INV(a)))(pred: (a) -<cloref1> bool
) : stream(a) = "mac#%" // end-of-function
//
overload .filter with stream_filter_method
//
(* ****** ****** *)
//
fun
stream_forall_cloref
  {a:t0p}
(
  xs: stream(INV(a)), pred: (a) -<cloref1> bool
) : bool = "mac#%" // end-of-function
fun
stream_forall_method
  {a:t0p}
(
  xs: stream(INV(a)))(pred: (a) -<cloref1> bool
) : bool = "mac#%" // end-of-function
//
overload .forall with stream_forall_method
//
(* ****** ****** *)
//
fun
stream_exists_cloref
  {a:t0p}
(
  xs: stream(INV(a)), pred: (a) -<cloref1> bool
) : bool = "mac#%" // end-of-function
fun
stream_exists_method
  {a:t0p}
(
  xs: stream(INV(a)))(pred: (a) -<cloref1> bool
) : bool = "mac#%" // end-of-function
//
overload .exists with stream_exists_method
//
(* ****** ****** *)
//
fun
stream_foreach_cloref
  {a:t0p}
(
  xs: stream(INV(a))
, fwork: (a) -<cloref1> void
) : void = "mac#%" // end-of-function
fun
stream_foreach_method
  {a:t0p}
(
  xs: stream(INV(a)))(fwork: (a) -<cloref1> void
) : void = "mac#%" // end-of-function
//
overload .foreach with stream_foreach_method
//
(* ****** ****** *)
//
fun
stream_iforeach_cloref
  {a:t0p}
(
  xs: stream(INV(a))
, fwork: (Nat, a) -<cloref1> void
) : void = "mac#%" // end-of-function
fun
stream_iforeach_method
  {a:t0p}
(
  xs: stream(INV(a)))(fwork: (Nat, a) -<cloref1> void
) : void = "mac#%" // end-of-function
//
overload .iforeach with stream_iforeach_method
//
(* ****** ****** *)
//
fun
stream_tabulate_cloref
  {a:t0p}
  (fopr: intGte(0) -<cloref1> a): stream(a) = "mac#%"
//
(* ****** ****** *)
//
fun
cross_stream_list
  {a,b:t0p}{res:t0p}
(
  xs: stream(INV(a)), ys: List0(INV(b))
) : stream($tup(a, b)) = "mac#%" // end-of-fun
fun
cross_stream_list0
  {a,b:t0p}{res:t0p}
(
  xs: stream(INV(a)), ys: list0(INV(b))
) : stream($tup(a, b)) = "mac#%" // end-of-fun
//
overload * with cross_stream_list
overload * with cross_stream_list0
//
(* ****** ****** *)
//
fun
stream2cloref_exn
  {a:t0p}
  (xs: stream(INV(a))): cfun(a) = "mac#%"
fun
stream2cloref_opt
  {a:t0p}
  (xs: stream(INV(a))): cfun(Option_vt(a)) = "mac#%"
fun
stream2cloref_last
  {a:t0p}(xs: stream(INV(a)), last: a): cfun(a) = "mac#%"
//
(* ****** ****** *)
//
fun
stream_take_while_cloref
  {a:t0p}
(
xs: stream(INV(a)), pred: (intGte(0), a) -<cloref1> bool
) : $tup(stream(a), List0(a)) = "mac#%" // end-of-fun
fun
stream_rtake_while_cloref
  {a:t0p}
(
xs: stream(INV(a)), pred: (intGte(0), a) -<cloref1> bool
) : $tup(stream(a), List0(a)) = "mac#%" // end-of-fun
//
fun
stream_take_until_cloref
  {a:t0p}
(
xs: stream(INV(a)), pred: (intGte(0), a) -<cloref1> bool
) : $tup(stream(a), List0(a)) = "mac#%" // end-of-fun
fun
stream_rtake_until_cloref
  {a:t0p}
(
xs: stream(INV(a)), pred: (intGte(0), a) -<cloref1> bool
) : $tup(stream(a), List0(a)) = "mac#%" // end-of-fun
//
(* ****** ****** *)
//
fun
stream_list_xprod2
  {a,b:t0p}
  (List0(INV(a)), List0(INV(b))): stream($tup(a, b)) = "mac#%"
//
(* ****** ****** *)

(* end of [stream.sats] *)
