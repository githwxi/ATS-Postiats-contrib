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
** $PATSHOME/prelude/DATS/CODEGEN/float.atxt
** Time of generation: Sun Nov 20 21:18:24 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0 // no dynloading at run-time

(* ****** ****** *)
//
(* ****** ****** *)
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)


(* ****** ****** *)

implement
g0int2float<intknd,fltknd> = g0int2float_int_float
implement
g0int2float<intknd,dblknd> = g0int2float_int_double
implement
g0int2float<lintknd,dblknd> = g0int2float_lint_double

(* ****** ****** *)

implement
g0float2int<fltknd, intknd> = g0float2int_float_int
implement
g0float2int<fltknd, lintknd> = g0float2int_float_lint
implement
g0float2int<dblknd, intknd> = g0float2int_double_int
implement
g0float2int<dblknd, lintknd> = g0float2int_double_lint
implement
g0float2int<dblknd, llintknd> = g0float2int_double_llint

(* ****** ****** *)

implement
g0float2float<fltknd,fltknd> = g0float2float_float_float
implement
g0float2float<fltknd,dblknd> = g0float2float_float_double
implement
g0float2float<dblknd,fltknd> = g0float2float_double_float
implement
g0float2float<dblknd,dblknd> = g0float2float_double_double

(* ****** ****** *)

implement g0string2float<dblknd> = g0string2float_double

(* ****** ****** *)

implement g0float_neg<fltknd> = g0float_neg_float
implement g0float_abs<fltknd> = g0float_abs_float
implement g0float_succ<fltknd> = g0float_succ_float
implement g0float_pred<fltknd> = g0float_pred_float

implement g0float_add<fltknd> = g0float_add_float
implement g0float_sub<fltknd> = g0float_sub_float
implement g0float_mul<fltknd> = g0float_mul_float
implement g0float_div<fltknd> = g0float_div_float
implement g0float_mod<fltknd> = g0float_mod_float

implement g0float_lt<fltknd> = g0float_lt_float
implement g0float_lte<fltknd> = g0float_lte_float
implement g0float_gt<fltknd> = g0float_gt_float
implement g0float_gte<fltknd> = g0float_gte_float
implement g0float_eq<fltknd> = g0float_eq_float
implement g0float_neq<fltknd> = g0float_neq_float
implement g0float_compare<fltknd> = g0float_compare_float

implement g0float_max<fltknd> = g0float_max_float
implement g0float_min<fltknd> = g0float_min_float

(* ****** ****** *)

implement g0float_neg<dblknd> = g0float_neg_double
implement g0float_abs<dblknd> = g0float_abs_double
implement g0float_succ<dblknd> = g0float_succ_double
implement g0float_pred<dblknd> = g0float_pred_double

implement g0float_add<dblknd> = g0float_add_double
implement g0float_sub<dblknd> = g0float_sub_double
implement g0float_mul<dblknd> = g0float_mul_double
implement g0float_div<dblknd> = g0float_div_double
implement g0float_mod<dblknd> = g0float_mod_double

implement g0float_lt<dblknd> = g0float_lt_double
implement g0float_lte<dblknd> = g0float_lte_double
implement g0float_gt<dblknd> = g0float_gt_double
implement g0float_gte<dblknd> = g0float_gte_double
implement g0float_eq<dblknd> = g0float_eq_double
implement g0float_neq<dblknd> = g0float_neq_double
implement g0float_compare<dblknd> = g0float_compare_double

implement g0float_max<dblknd> = g0float_max_double
implement g0float_min<dblknd> = g0float_min_double

(* ****** ****** *)

implement g0float_neg<ldblknd> = g0float_neg_ldouble
implement g0float_abs<ldblknd> = g0float_abs_ldouble
implement g0float_succ<ldblknd> = g0float_succ_ldouble
implement g0float_pred<ldblknd> = g0float_pred_ldouble

implement g0float_add<ldblknd> = g0float_add_ldouble
implement g0float_sub<ldblknd> = g0float_sub_ldouble
implement g0float_mul<ldblknd> = g0float_mul_ldouble
implement g0float_div<ldblknd> = g0float_div_ldouble
implement g0float_mod<ldblknd> = g0float_mod_ldouble

implement g0float_lt<ldblknd> = g0float_lt_ldouble
implement g0float_lte<ldblknd> = g0float_lte_ldouble
implement g0float_gt<ldblknd> = g0float_gt_ldouble
implement g0float_gte<ldblknd> = g0float_gte_ldouble
implement g0float_eq<ldblknd> = g0float_eq_ldouble
implement g0float_neq<ldblknd> = g0float_neq_ldouble
implement g0float_compare<ldblknd> = g0float_compare_ldouble

implement g0float_max<ldblknd> = g0float_max_ldouble
implement g0float_min<ldblknd> = g0float_min_ldouble

(* ****** ****** *)
//
implement fprint_val<float> = fprint_float
implement fprint_val<double> = fprint_double
implement fprint_val<ldouble> = fprint_ldouble
//
(* ****** ****** *)

implement
{tk}(*tk*)
g0float_npow
  (x, n) = let
//
typedef gfloat = g0float(tk)
//
fun
loop
(
  x: gfloat, res: gfloat, n: int
) : gfloat = (
//
if
(n > 1)
then let
  val n2 = n >> 1
  val b0 = n - (n2 << 1)
  val xx = x * x
in
  if b0 = 0
    then loop(xx, res, n2) else loop(xx, x * res, n2)
  // end of [if]
end // end of [then]
else (
  if n > 0 then x * res else res
) (* end of [else] *)
//
) (* end of [loop] *)
//
val res = $UN.cast{gfloat}(1.0)
//
in
  $effmask_all(loop(x, res, n))
end // end of [g0float_npow]

(* ****** ****** *)

(* end of [float.dats] *)
