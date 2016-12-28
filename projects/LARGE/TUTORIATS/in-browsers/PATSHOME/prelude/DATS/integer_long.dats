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

(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: February, 2014 *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/integer_long.atxt
** Time of generation: Sun Nov 20 21:18:23 2016
*)

(* ****** ****** *)

#define
ATS_DYNLOADFLAG 0 // no dynloading

(* ****** ****** *)
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
implement
g0int2int<intknd,lintknd> = g0int2int_int_lint
implement
g1int2int<intknd,lintknd> = g1int2int_int_lint
//
implement
g0uint2int<uintknd,lintknd> = g0uint2int_uint_lint
implement
g1uint2int<uintknd,lintknd> = g1uint2int_uint_lint
//
(* ****** ****** *)
//
implement
g0int2uint<intknd,ulintknd> = g0int2uint_int_ulint
implement
g1int2uint<intknd,ulintknd> = g1int2uint_int_ulint
//
implement
g0uint2uint<uintknd,ulintknd> = g0uint2uint_uint_ulint
implement
g1uint2uint<uintknd,ulintknd> = g1uint2uint_uint_ulint
//
(* ****** ****** *)
//
implement
g0int2int<intknd,llintknd> = g0int2int_int_llint
implement
g1int2int<intknd,llintknd> = g1int2int_int_llint
//
implement
g0uint2int<uintknd,llintknd> = g0uint2int_uint_llint
implement
g1uint2int<uintknd,llintknd> = g1uint2int_uint_llint
//
(* ****** ****** *)
//
implement
g0int2uint<intknd,ullintknd> = g0int2uint_int_ullint
implement
g1int2uint<intknd,ullintknd> = g1int2uint_int_ullint
//
implement
g0uint2uint<uintknd,ullintknd> = g0uint2uint_uint_ullint
implement
g1uint2uint<uintknd,ullintknd> = g1uint2uint_uint_ullint
//
(* ****** ****** *)
//
implement
g0int2int<lintknd,lintknd> = g0int2int_lint_lint
implement
g0int2int<lintknd,llintknd> = g0int2int_lint_llint
//
implement
g0int2uint<lintknd,ulintknd> = g0int2uint_lint_ulint
implement
g0int2uint<lintknd,ullintknd> = g0int2uint_lint_ullint
//
(* ****** ****** *)
//
implement
g0uint2int<ulintknd,lintknd> = g0uint2int_ulint_lint
implement
g0uint2int<ulintknd,llintknd> = g0uint2int_ulint_llint
//
implement
g0uint2uint<ulintknd,ulintknd> = g0uint2uint_ulint_ulint
implement
g0uint2uint<ulintknd,ullintknd> = g0uint2uint_ulint_ullint
//
(* ****** ****** *)
//
implement
g0int2int<llintknd,llintknd> = g0int2int_llint_llint
//
implement
g0int2uint<llintknd,ullintknd> = g0int2uint_llint_ullint
//
(* ****** ****** *)
//
implement
g0uint2int<ullintknd,llintknd> = g0uint2int_ullint_llint
//
implement
g0uint2uint<ullintknd,ullintknd> = g0uint2uint_ullint_ullint
//
(* ****** ****** *)
//
implement g0int2string<lintknd> = g0int2string_lint
implement g0int2string<llintknd> = g0int2string_llint
//
implement g0string2int<lintknd> = g0string2int_lint
implement g0string2int<llintknd> = g0string2int_llint
implement g0string2uint<ulintknd> = g0string2uint_ulint
implement g0string2uint<ullintknd> = g0string2uint_ullint
//
(* ****** ****** *)
//
implement
g0int_neg<lintknd> = g0int_neg_lint
implement
g0int_abs<lintknd> = g0int_abs_lint
implement
g0int_succ<lintknd> = g0int_succ_lint
implement
g0int_pred<lintknd> = g0int_pred_lint
implement
g0int_half<lintknd> = g0int_half_lint
implement
g0int_add<lintknd> = g0int_add_lint
implement
g0int_sub<lintknd> = g0int_sub_lint
implement
g0int_mul<lintknd> = g0int_mul_lint
implement
g0int_div<lintknd> = g0int_div_lint
implement
g0int_mod<lintknd> = g0int_mod_lint
implement
g0int_asl<lintknd> = g0int_asl_lint
implement
g0int_asr<lintknd> = g0int_asr_lint
implement
g0int_isltz<lintknd> = g0int_isltz_lint
implement
g0int_isltez<lintknd> = g0int_isltez_lint
implement
g0int_isgtz<lintknd> = g0int_isgtz_lint
implement
g0int_isgtez<lintknd> = g0int_isgtez_lint
implement
g0int_iseqz<lintknd> = g0int_iseqz_lint
implement
g0int_isneqz<lintknd> = g0int_isneqz_lint
implement
g0int_lt<lintknd> = g0int_lt_lint
implement
g0int_lte<lintknd> = g0int_lte_lint
implement
g0int_gt<lintknd> = g0int_gt_lint
implement
g0int_gte<lintknd> = g0int_gte_lint
implement
g0int_eq<lintknd> = g0int_eq_lint
implement
g0int_neq<lintknd> = g0int_neq_lint
implement
g0int_compare<lintknd> = g0int_compare_lint
implement
g0int_max<lintknd> = g0int_max_lint
implement
g0int_min<lintknd> = g0int_min_lint
//
implement
fprint_val<lint> (out, x) = fprint_lint (out, x)//
implement
g1int_neg<lintknd> = g1int_neg_lint
implement
g1int_abs<lintknd> = g1int_abs_lint
implement
g1int_succ<lintknd> = g1int_succ_lint
implement
g1int_pred<lintknd> = g1int_pred_lint
implement
g1int_half<lintknd> = g1int_half_lint
implement
g1int_add<lintknd> = g1int_add_lint
implement
g1int_sub<lintknd> = g1int_sub_lint
implement
g1int_mul<lintknd> = g1int_mul_lint
implement
g1int_div<lintknd> = g1int_div_lint
implement
g1int_nmod<lintknd> = g1int_nmod_lint
implement
g1int_isltz<lintknd> = g1int_isltz_lint
implement
g1int_isltez<lintknd> = g1int_isltez_lint
implement
g1int_isgtz<lintknd> = g1int_isgtz_lint
implement
g1int_isgtez<lintknd> = g1int_isgtez_lint
implement
g1int_iseqz<lintknd> = g1int_iseqz_lint
implement
g1int_isneqz<lintknd> = g1int_isneqz_lint
implement
g1int_lt<lintknd> = g1int_lt_lint
implement
g1int_lte<lintknd> = g1int_lte_lint
implement
g1int_gt<lintknd> = g1int_gt_lint
implement
g1int_gte<lintknd> = g1int_gte_lint
implement
g1int_eq<lintknd> = g1int_eq_lint
implement
g1int_neq<lintknd> = g1int_neq_lint
implement
g1int_compare<lintknd> = g1int_compare_lint
implement
g1int_max<lintknd> = g1int_max_lint
implement
g1int_min<lintknd> = g1int_min_lint
//
(* ****** ****** *)
//
implement
g0int_neg<llintknd> = g0int_neg_llint
implement
g0int_abs<llintknd> = g0int_abs_llint
implement
g0int_succ<llintknd> = g0int_succ_llint
implement
g0int_pred<llintknd> = g0int_pred_llint
implement
g0int_half<llintknd> = g0int_half_llint
implement
g0int_add<llintknd> = g0int_add_llint
implement
g0int_sub<llintknd> = g0int_sub_llint
implement
g0int_mul<llintknd> = g0int_mul_llint
implement
g0int_div<llintknd> = g0int_div_llint
implement
g0int_mod<llintknd> = g0int_mod_llint
implement
g0int_asl<llintknd> = g0int_asl_llint
implement
g0int_asr<llintknd> = g0int_asr_llint
implement
g0int_isltz<llintknd> = g0int_isltz_llint
implement
g0int_isltez<llintknd> = g0int_isltez_llint
implement
g0int_isgtz<llintknd> = g0int_isgtz_llint
implement
g0int_isgtez<llintknd> = g0int_isgtez_llint
implement
g0int_iseqz<llintknd> = g0int_iseqz_llint
implement
g0int_isneqz<llintknd> = g0int_isneqz_llint
implement
g0int_lt<llintknd> = g0int_lt_llint
implement
g0int_lte<llintknd> = g0int_lte_llint
implement
g0int_gt<llintknd> = g0int_gt_llint
implement
g0int_gte<llintknd> = g0int_gte_llint
implement
g0int_eq<llintknd> = g0int_eq_llint
implement
g0int_neq<llintknd> = g0int_neq_llint
implement
g0int_compare<llintknd> = g0int_compare_llint
implement
g0int_max<llintknd> = g0int_max_llint
implement
g0int_min<llintknd> = g0int_min_llint
//
implement
fprint_val<llint> (out, x) = fprint_llint (out, x)//
implement
g1int_neg<llintknd> = g1int_neg_llint
implement
g1int_abs<llintknd> = g1int_abs_llint
implement
g1int_succ<llintknd> = g1int_succ_llint
implement
g1int_pred<llintknd> = g1int_pred_llint
implement
g1int_half<llintknd> = g1int_half_llint
implement
g1int_add<llintknd> = g1int_add_llint
implement
g1int_sub<llintknd> = g1int_sub_llint
implement
g1int_mul<llintknd> = g1int_mul_llint
implement
g1int_div<llintknd> = g1int_div_llint
implement
g1int_nmod<llintknd> = g1int_nmod_llint
implement
g1int_isltz<llintknd> = g1int_isltz_llint
implement
g1int_isltez<llintknd> = g1int_isltez_llint
implement
g1int_isgtz<llintknd> = g1int_isgtz_llint
implement
g1int_isgtez<llintknd> = g1int_isgtez_llint
implement
g1int_iseqz<llintknd> = g1int_iseqz_llint
implement
g1int_isneqz<llintknd> = g1int_isneqz_llint
implement
g1int_lt<llintknd> = g1int_lt_llint
implement
g1int_lte<llintknd> = g1int_lte_llint
implement
g1int_gt<llintknd> = g1int_gt_llint
implement
g1int_gte<llintknd> = g1int_gte_llint
implement
g1int_eq<llintknd> = g1int_eq_llint
implement
g1int_neq<llintknd> = g1int_neq_llint
implement
g1int_compare<llintknd> = g1int_compare_llint
implement
g1int_max<llintknd> = g1int_max_llint
implement
g1int_min<llintknd> = g1int_min_llint
//
(* ****** ****** *)
//
implement
g0uint_succ<ulintknd> = g0uint_succ_ulint
implement
g0uint_pred<ulintknd> = g0uint_pred_ulint
implement
g0uint_half<ulintknd> = g0uint_half_ulint
implement
g0uint_add<ulintknd> = g0uint_add_ulint
implement
g0uint_sub<ulintknd> = g0uint_sub_ulint
implement
g0uint_mul<ulintknd> = g0uint_mul_ulint
implement
g0uint_div<ulintknd> = g0uint_div_ulint
implement
g0uint_mod<ulintknd> = g0uint_mod_ulint
implement
g0uint_lsl<ulintknd> = g0uint_lsl_ulint
implement
g0uint_lsr<ulintknd> = g0uint_lsr_ulint
implement
g0uint_lnot<ulintknd> = g0uint_lnot_ulint
implement
g0uint_lor<ulintknd> = g0uint_lor_ulint
implement
g0uint_lxor<ulintknd> = g0uint_lxor_ulint
implement
g0uint_land<ulintknd> = g0uint_land_ulint
implement
g0uint_isgtz<ulintknd> = g0uint_isgtz_ulint
implement
g0uint_iseqz<ulintknd> = g0uint_iseqz_ulint
implement
g0uint_isneqz<ulintknd> = g0uint_isneqz_ulint
implement
g0uint_lt<ulintknd> = g0uint_lt_ulint
implement
g0uint_lte<ulintknd> = g0uint_lte_ulint
implement
g0uint_gt<ulintknd> = g0uint_gt_ulint
implement
g0uint_gte<ulintknd> = g0uint_gte_ulint
implement
g0uint_eq<ulintknd> = g0uint_eq_ulint
implement
g0uint_neq<ulintknd> = g0uint_neq_ulint
implement
g0uint_compare<ulintknd> = g0uint_compare_ulint
implement
g0uint_max<ulintknd> = g0uint_max_ulint
implement
g0uint_min<ulintknd> = g0uint_min_ulint
//
implement
fprint_val<ulint> (out, x) = fprint_ulint (out, x)//
implement
g1uint_succ<ulintknd> = g1uint_succ_ulint
implement
g1uint_pred<ulintknd> = g1uint_pred_ulint
implement
g1uint_half<ulintknd> = g1uint_half_ulint
implement
g1uint_add<ulintknd> = g1uint_add_ulint
implement
g1uint_sub<ulintknd> = g1uint_sub_ulint
implement
g1uint_mul<ulintknd> = g1uint_mul_ulint
implement
g1uint_div<ulintknd> = g1uint_div_ulint
implement
g1uint_mod<ulintknd> = g1uint_mod_ulint
implement
g1uint_isgtz<ulintknd> = g1uint_isgtz_ulint
implement
g1uint_iseqz<ulintknd> = g1uint_iseqz_ulint
implement
g1uint_isneqz<ulintknd> = g1uint_isneqz_ulint
implement
g1uint_lt<ulintknd> = g1uint_lt_ulint
implement
g1uint_lte<ulintknd> = g1uint_lte_ulint
implement
g1uint_gt<ulintknd> = g1uint_gt_ulint
implement
g1uint_gte<ulintknd> = g1uint_gte_ulint
implement
g1uint_eq<ulintknd> = g1uint_eq_ulint
implement
g1uint_neq<ulintknd> = g1uint_neq_ulint
implement
g1uint_compare<ulintknd> = g1uint_compare_ulint
implement
g1uint_max<ulintknd> = g1uint_max_ulint
implement
g1uint_min<ulintknd> = g1uint_min_ulint
//
(* ****** ****** *)
//
implement
g0uint_succ<ullintknd> = g0uint_succ_ullint
implement
g0uint_pred<ullintknd> = g0uint_pred_ullint
implement
g0uint_half<ullintknd> = g0uint_half_ullint
implement
g0uint_add<ullintknd> = g0uint_add_ullint
implement
g0uint_sub<ullintknd> = g0uint_sub_ullint
implement
g0uint_mul<ullintknd> = g0uint_mul_ullint
implement
g0uint_div<ullintknd> = g0uint_div_ullint
implement
g0uint_mod<ullintknd> = g0uint_mod_ullint
implement
g0uint_lsl<ullintknd> = g0uint_lsl_ullint
implement
g0uint_lsr<ullintknd> = g0uint_lsr_ullint
implement
g0uint_lnot<ullintknd> = g0uint_lnot_ullint
implement
g0uint_lor<ullintknd> = g0uint_lor_ullint
implement
g0uint_lxor<ullintknd> = g0uint_lxor_ullint
implement
g0uint_land<ullintknd> = g0uint_land_ullint
implement
g0uint_isgtz<ullintknd> = g0uint_isgtz_ullint
implement
g0uint_iseqz<ullintknd> = g0uint_iseqz_ullint
implement
g0uint_isneqz<ullintknd> = g0uint_isneqz_ullint
implement
g0uint_lt<ullintknd> = g0uint_lt_ullint
implement
g0uint_lte<ullintknd> = g0uint_lte_ullint
implement
g0uint_gt<ullintknd> = g0uint_gt_ullint
implement
g0uint_gte<ullintknd> = g0uint_gte_ullint
implement
g0uint_eq<ullintknd> = g0uint_eq_ullint
implement
g0uint_neq<ullintknd> = g0uint_neq_ullint
implement
g0uint_compare<ullintknd> = g0uint_compare_ullint
implement
g0uint_max<ullintknd> = g0uint_max_ullint
implement
g0uint_min<ullintknd> = g0uint_min_ullint
//
implement
fprint_val<ullint> (out, x) = fprint_ullint (out, x)//
implement
g1uint_succ<ullintknd> = g1uint_succ_ullint
implement
g1uint_pred<ullintknd> = g1uint_pred_ullint
implement
g1uint_half<ullintknd> = g1uint_half_ullint
implement
g1uint_add<ullintknd> = g1uint_add_ullint
implement
g1uint_sub<ullintknd> = g1uint_sub_ullint
implement
g1uint_mul<ullintknd> = g1uint_mul_ullint
implement
g1uint_div<ullintknd> = g1uint_div_ullint
implement
g1uint_mod<ullintknd> = g1uint_mod_ullint
implement
g1uint_isgtz<ullintknd> = g1uint_isgtz_ullint
implement
g1uint_iseqz<ullintknd> = g1uint_iseqz_ullint
implement
g1uint_isneqz<ullintknd> = g1uint_isneqz_ullint
implement
g1uint_lt<ullintknd> = g1uint_lt_ullint
implement
g1uint_lte<ullintknd> = g1uint_lte_ullint
implement
g1uint_gt<ullintknd> = g1uint_gt_ullint
implement
g1uint_gte<ullintknd> = g1uint_gte_ullint
implement
g1uint_eq<ullintknd> = g1uint_eq_ullint
implement
g1uint_neq<ullintknd> = g1uint_neq_ullint
implement
g1uint_compare<ullintknd> = g1uint_compare_ullint
implement
g1uint_max<ullintknd> = g1uint_max_ullint
implement
g1uint_min<ullintknd> = g1uint_min_ullint
//
(* ****** ****** *)
//
implement
nmod_g1int_int1<lintknd>
  (x, y) = g1i2i(g1int_nmod<lintknd>(x, g1i2i(y)))
implement
nmod_g1int_int1<llintknd>
  (x, y) = g1i2i(g1int_nmod<llintknd>(x, g1i2i(y)))
//
(* ****** ****** *)

(* end of [integer_long.dats] *)
