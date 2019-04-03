(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2015 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/stream_vt.atxt
** Time of generation: Sun Dec 18 22:03:01 2016
*)

(* ****** ****** *)
(*
sortdef
t0p = t@ype and vt0p = vt@ype
*)
(* ****** ****** *)
//
#if(0)
//
// HX: linear lazy streams
// It is declared in [basics_dyn]
//
datavtype
stream_vt_con
  (a:vt@ype+) =
//
// vt@ype+: covariant
//
  | stream_vt_nil of ((*void*))
  | stream_vt_cons of (a, stream_vt(a))
//
where
stream_vt
  (a:vt@ype) = lazy_vt(stream_vt_con(a))
//
#endif // [#if(0)]
//
vtypedef
streamopt_vt(a:vt0p) = Option_vt(stream_vt(a))
//
(* ****** ****** *)
//
fun
{a:t0p}
stream_vt_is_nil(stream_vt(a)): bool
fun
{a:t0p}
stream_vt_is_cons(stream_vt(a)): bool
//
(* ****** ****** *)
//
fun
{a:vt0p}
stream_vt_make_nil():<> stream_vt(a)
fun{a:t0p}
stream_vt_make_cons
  (a, stream_vt(INV(a))):<> stream_vt(a)
//
(* ****** ****** *)
//
fun{a:t0p}
stream_vt_sing(a):<> stream_vt_con(a)
fun{a:t0p}
stream_vt_make_sing(x: a):<> stream_vt(a)
//
(* ****** ****** *)
//
fun{a:t0p}
stream_vt_make_con
  (xs_con: stream_vt_con(INV(a))):<> stream_vt(a)
//
(* ****** ****** *)
//
// HX-2014-04-07:
// this is a regular function
// instead of a cast function
//
fun{a:t0p}
stream_vt2t
  (xs: stream_vt(INV(a))): stream(a)
//
(* ****** ****** *)

fun{a:vt0p}
stream2list_vt
  (xs: stream_vt(INV(a))): List0_vt(a)
// end of [stream2list_vt]

(* ****** ****** *)
//
fun
{a:vt0p}
stream_vt_free(xs: stream_vt(a)):<!wrt> void
//
fun{a:t0p}
stream_vt_con_free(xs: stream_vt_con(a)):<!wrt> void
//
(* ****** ****** *)

fun{a:vt0p}
stream_vt_takeLte
  (xs: stream_vt(INV(a)), n: intGte(0)): stream_vt(a)
// end of [stream_vt_takeLte]

(* ****** ****** *)
//
fun{a:t0p}
stream_vt_drop_exn
  (xs: stream_vt(INV(a)), n: intGte(0)): stream_vt(a)
// end of [stream_vt_drop_exn]
//
fun{a:t0p}
stream_vt_drop_opt
  (xs: stream_vt(INV(a)), n: intGte(0)): streamopt_vt(a)
// end of [stream_vt_drop_opt]
//
(* ****** ****** *)
//
fun{a:t0p}
stream_vt_length
  (xs: stream_vt(INV(a))):<!wrt> intGte(0)
//
(* ****** ****** *)
//
fun{a:t0p}
stream_vt_head_exn
  (stream_vt(INV(a))):<!exnwrt> (a)
fun{a:t0p}
stream_vt_tail_exn
  (stream_vt(INV(a))):<!exnwrt> stream_vt(a)
//
fun{a:vt0p}
stream_vt_uncons_exn
  (xs: &stream_vt(INV(a)) >> _):<!exnwrt> (a)
fun{a:vt0p}
stream_vt_uncons_opt
  (xs: &stream_vt(INV(a)) >> _):<!exnwrt> Option_vt(a)
//
(* ****** ****** *)
//
fun{a:t0p}
stream_vt_nth_exn
  (xs: stream_vt(INV(a)), n: intGte(0)):<!exnwrt> (a)
fun{a:t0p}
stream_vt_nth_opt
  (xs: stream_vt(INV(a)), n: intGte(0)):<!wrt> Option_vt(a)
//
(* ****** ****** *)
//
fun{a:vt0p}
stream_vt_append
  (stream_vt(INV(a)), stream_vt(a)): stream_vt(a)
//
fun{a:vt0p}
stream_vt_concat
  (xss: stream_vt(stream_vt(INV(a)))): stream_vt(a)
//
(* ****** ****** *)
//
fun{a:t0p}
stream_vt_filter
  (xs: stream_vt(INV(a))): stream_vt(a)
//
fun{a:t0p}
stream_vt_filter_fun
(
  xs: stream_vt(INV(a)), pred: (&a) -<fun> bool
) : stream_vt (a) // end of [stream_vt_filter_fun]
//
fun{a:t0p}
stream_vt_filter_cloptr
(
  xs: stream_vt(INV(a)), pred: (&a) -<cloptr1> bool
) : stream_vt (a) // end of [stream_vt_filter_cloptr]
fun{a:t0p}
stream_vt_ifilter_cloptr
(
  xs: stream_vt(INV(a)), pred: (intGte(0), &a) -<cloptr1> bool
) : stream_vt (a) // end of [stream_vt_ifilter_cloptr]
//
fun{a:vt0p}
stream_vt_filterlin
  (xs: stream_vt(INV(a))): stream_vt(a)
//
fun{a:t0p}
stream_vt_filter$pred(x: &a):<> bool
fun{a:vt0p}
stream_vt_filterlin$pred(x: &a):<> bool
fun{a:vt0p}
stream_vt_filterlin$clear(x: &a >> a?):<!wrt> void
//
(* ****** ****** *)
//
fun{
a:vt0p}{b:vt0p
} stream_vt_map
  (xs: stream_vt(INV(a))): stream_vt(b)
fun{
a:vt0p}{b:vt0p
} stream_vt_map$fopr (x: &a >> a?!): b // lin-cleared
//
fun{
a:vt0p}{b:vt0p
} stream_vt_map_fun
(
  xs: stream_vt(INV(a)), fopr: (&a >> a?!) -<fun1> b
) : stream_vt(b) // end-of-function
fun{
a:vt0p}{b:vt0p
} stream_vt_map_cloptr
(
  xs: stream_vt(INV(a)), fopr: (&a >> a?!) -<cloptr1> b
) : stream_vt(b) // end-of-function
//
(* ****** ****** *)
//
fun{
a1,a2:t0p}{b:vt0p
} stream_vt_map2$fopr
  (x1: &a1 >> _, x2: &a2 >> _): b
fun{
a1,a2:t0p}{b:vt0p
} stream_vt_map2
(
  xs1: stream_vt(INV(a1))
, xs2: stream_vt(INV(a2))
) : stream_vt(b) // end of [stream_vt_map2]
//
fun{
a1,a2:t0p}{b:vt0p
} stream_vt_map2_fun
(
  xs1: stream_vt(INV(a1))
, xs2: stream_vt(INV(a2))
, fopr: (&a1 >> _, &a2 >> _) -<fun> b
) : stream_vt(b) // end of [stream_vt_map2_fun]
fun{
a1,a2:t0p}{b:vt0p
} stream_vt_map2_cloptr
(
  xs1: stream_vt(INV(a1))
, xs2: stream_vt(INV(a2))
, fopr: (&a1 >> _, &a2 >> _) -<cloptr1> b
) : stream_vt(b) // end of [stream_vt_map2_cloptr]
//
(* ****** ****** *)
//
fun{
res:t0p
}{a:vt0p}
stream_vt_scan_cloptr
(
  xs: stream_vt(INV(a))
, ini: res, fopr: (res, &a >> a?!) -<cloptr1> res
) : stream_vt(res) // end of [stream_vt_scan_cloptr]
//
(* ****** ****** *)

fun
{a:vt0p}
stream_vt_tabulate((*void*)): stream_vt(a)
fun
{a:vt0p}
stream_vt_tabulate$fopr(idx: intGte(0)): (a)

(* ****** ****** *)
//
fun
{a:vt0p}
stream_vt_labelize
  (stream_vt(INV(a))): stream_vt(@(intGte(0), a))
//
(* ****** ****** *)
//
fun{a:vt0p}
stream_vt_foreach
  (stream_vt(INV(a))): stream_vt_con(a)
fun{
a:vt0p}{env:vt0p
} stream_vt_foreach_env
  (stream_vt(INV(a)), env: &env >> _): stream_vt_con(a)
//
fun{
a:vt0p}{env:vt0p
} stream_vt_foreach$cont
  (x: &a, env: &env >> _): bool
fun{
a:vt0p}{env:vt0p
} stream_vt_foreach$fwork
  (x: &a >> a?!, env: &env >> _): void // lin-cleared
//
fun{a:vt0p}
stream_vt_foreach_cloptr
(
  stream_vt(INV(a)), fwork: (&a >> a?!) -<cloptr1> void
) : void // end of [stream_vt_foreach_cloptr]
//
fun{a:vt0p}
stream_vt_rforeach_cloptr
(
  stream_vt(INV(a)), fwork: (&a >> a?!) -<cloptr1> void
) : void // end of [stream_vt_rforeach_cloptr]
//
fun{a:vt0p}
stream_vt_iforeach_cloptr
(
  stream_vt(INV(a)), fwork: (intGte(0), &a >> a?!) -<cloptr1> void
) : void // end of [stream_vt_iforeach_cloptr]
//
(* ****** ****** *)
//
fun{
res:vt0p
}{a:vt0p}
stream_vt_foldleft_cloptr
(
  xs: stream_vt(INV(a)), init: res, fopr: (res, &a >> a?!) -<cloptr1> res
) : res // end of [stream_vt_foldleft_cloptr]
//
fun{
res:vt0p
}{a:vt0p}
stream_vt_ifoldleft_cloptr
(
  xs: stream_vt(INV(a)), init: res, fopr: (Nat, res, &a >> a?!) -<cloptr1> res
) : res // end of [stream_vt_ifoldleft_cloptr]
//
(* ****** ****** *)

fun
{env:t0p}{a:t0p}
stream_vt_unfold
(
  st0: env, fopr: (&env >> _) -<cloref1> a
) : stream_vt(a) // end of [stream_vt_unfold]

fun
{env:t0p}{a:t0p}
stream_vt_unfold_opt
(
  st0: env, fopr: (&env >> _) -<cloref1> Option_vt(a)
) : stream_vt(a) // end of [stream_vt_unfold_opt]

(* ****** ****** *)
//
fun
{x,y:t0p}
cross_stream_vt_list
  (xs: stream_vt(INV(x)), ys: List(INV(y))): stream_vt(@(x, y))
fun
{x,y:t0p}
cross_stream_vt_list_vt
  (xs: stream_vt(INV(x)), ys: List_vt(INV(y))): stream_vt(@(x, y))
//
(* ****** ****** *)
//
// HX-2016-07-01:
// [stream_vt_fprint] calls [fprint_val]
//
// HX-2016-09-12:
// Note that (n < 0) means to print all the values
//
fun{}
stream_vt_fprint$beg(out: FILEref): void
fun{}
stream_vt_fprint$end(out: FILEref): void
fun{}
stream_vt_fprint$sep(out: FILEref): void
fun{a:t0p}
stream_vt_fprint(stream_vt(INV(a)), out: FILEref, n: int): void
//
(* ****** ****** *)
//
absvtype
streamer_vtype(a:vt@ype+) = ptr
//
vtypedef
streamer_vt(a:vt0p) = streamer_vtype(a)
//
(* ****** ****** *)
//
fun{}
streamer_vt_make
  {a:vt0p}(stream_vt(INV(a))): streamer_vt(a)
//
fun{}
streamer_vt_free{a:vt0p}(streamer_vt(INV(a))): void
//
fun{
a:vt@ype
} streamer_vt_eval_exn(xser: !streamer_vt(INV(a))): (a)
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)

(* ****** ****** *)

overload ~ with streamer_vt_free

(* ****** ****** *)

overload [] with streamer_vt_eval_exn

(* ****** ****** *)

overload iseqz with stream_vt_is_nil
overload isneqz with stream_vt_is_cons

(* ****** ****** *)
//
overload length with stream_vt_length
//
(* ****** ****** *)

overload .head with stream_vt_head_exn
overload .tail with stream_vt_tail_exn

(* ****** ****** *)

(* end of [stream_vt.sats] *)
