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
** $PATSHOME/prelude/DATS/CODEGEN/integer_fixed.atxt
** Time of generation: Sun Nov 20 21:18:25 2016
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
g0int2int<int8knd,intknd> = g0int2int_int8_int
implement
g0int2int<int16knd,intknd> = g0int2int_int16_int
implement
g0int2int<int32knd,intknd> = g0int2int_int32_int
implement
g0int2int<int64knd,intknd> = g0int2int_int64_int
//
(* ****** ****** *)
//
implement
g0int2uint<int8knd,uintknd> = g0int2uint_int8_uint
implement
g0int2uint<int16knd,uintknd> = g0int2uint_int16_uint
implement
g0int2uint<int32knd,uintknd> = g0int2uint_int32_uint
implement
g0int2uint<int64knd,uintknd> = g0int2uint_int64_uint
//
implement
g0uint2int<uint8knd,intknd> = g0uint2int_uint8_int
implement
g0uint2int<uint16knd,intknd> = g0uint2int_uint16_int
implement
g0uint2int<uint32knd,intknd> = g0uint2int_uint32_int
implement
g0uint2int<uint64knd,intknd> = g0uint2int_uint64_int
//
implement
g0uint2uint<uint8knd,uintknd> = g0uint2uint_uint8_uint
implement
g0uint2uint<uint16knd,uintknd> = g0uint2uint_uint16_uint
implement
g0uint2uint<uint32knd,uintknd> = g0uint2uint_uint32_uint
implement
g0uint2uint<uint64knd,uintknd> = g0uint2uint_uint64_uint
//
(* ****** ****** *)
//
implement
g0int_neg<int8knd> = g0int_neg_int8
implement
g0int_abs<int8knd> = g0int_abs_int8
implement
g0int_succ<int8knd> = g0int_succ_int8
implement
g0int_pred<int8knd> = g0int_pred_int8
implement
g0int_half<int8knd> = g0int_half_int8
implement
g0int_add<int8knd> = g0int_add_int8
implement
g0int_sub<int8knd> = g0int_sub_int8
implement
g0int_mul<int8knd> = g0int_mul_int8
implement
g0int_div<int8knd> = g0int_div_int8
implement
g0int_mod<int8knd> = g0int_mod_int8
implement
g0int_asl<int8knd> = g0int_asl_int8
implement
g0int_asr<int8knd> = g0int_asr_int8
implement
g0int_isltz<int8knd> = g0int_isltz_int8
implement
g0int_isltez<int8knd> = g0int_isltez_int8
implement
g0int_isgtz<int8knd> = g0int_isgtz_int8
implement
g0int_isgtez<int8knd> = g0int_isgtez_int8
implement
g0int_iseqz<int8knd> = g0int_iseqz_int8
implement
g0int_isneqz<int8knd> = g0int_isneqz_int8
implement
g0int_lt<int8knd> = g0int_lt_int8
implement
g0int_lte<int8knd> = g0int_lte_int8
implement
g0int_gt<int8knd> = g0int_gt_int8
implement
g0int_gte<int8knd> = g0int_gte_int8
implement
g0int_eq<int8knd> = g0int_eq_int8
implement
g0int_neq<int8knd> = g0int_neq_int8
implement
g0int_compare<int8knd> = g0int_compare_int8
implement
g0int_max<int8knd> = g0int_max_int8
implement
g0int_min<int8knd> = g0int_min_int8
//
implement
fprint_val<int8> (out, x) = fprint_int8 (out, x)
//
implement
g0int_neg<int16knd> = g0int_neg_int16
implement
g0int_abs<int16knd> = g0int_abs_int16
implement
g0int_succ<int16knd> = g0int_succ_int16
implement
g0int_pred<int16knd> = g0int_pred_int16
implement
g0int_half<int16knd> = g0int_half_int16
implement
g0int_add<int16knd> = g0int_add_int16
implement
g0int_sub<int16knd> = g0int_sub_int16
implement
g0int_mul<int16knd> = g0int_mul_int16
implement
g0int_div<int16knd> = g0int_div_int16
implement
g0int_mod<int16knd> = g0int_mod_int16
implement
g0int_asl<int16knd> = g0int_asl_int16
implement
g0int_asr<int16knd> = g0int_asr_int16
implement
g0int_isltz<int16knd> = g0int_isltz_int16
implement
g0int_isltez<int16knd> = g0int_isltez_int16
implement
g0int_isgtz<int16knd> = g0int_isgtz_int16
implement
g0int_isgtez<int16knd> = g0int_isgtez_int16
implement
g0int_iseqz<int16knd> = g0int_iseqz_int16
implement
g0int_isneqz<int16knd> = g0int_isneqz_int16
implement
g0int_lt<int16knd> = g0int_lt_int16
implement
g0int_lte<int16knd> = g0int_lte_int16
implement
g0int_gt<int16knd> = g0int_gt_int16
implement
g0int_gte<int16knd> = g0int_gte_int16
implement
g0int_eq<int16knd> = g0int_eq_int16
implement
g0int_neq<int16knd> = g0int_neq_int16
implement
g0int_compare<int16knd> = g0int_compare_int16
implement
g0int_max<int16knd> = g0int_max_int16
implement
g0int_min<int16knd> = g0int_min_int16
//
implement
fprint_val<int16> (out, x) = fprint_int16 (out, x)
//
implement
g0int_neg<int32knd> = g0int_neg_int32
implement
g0int_abs<int32knd> = g0int_abs_int32
implement
g0int_succ<int32knd> = g0int_succ_int32
implement
g0int_pred<int32knd> = g0int_pred_int32
implement
g0int_half<int32knd> = g0int_half_int32
implement
g0int_add<int32knd> = g0int_add_int32
implement
g0int_sub<int32knd> = g0int_sub_int32
implement
g0int_mul<int32knd> = g0int_mul_int32
implement
g0int_div<int32knd> = g0int_div_int32
implement
g0int_mod<int32knd> = g0int_mod_int32
implement
g0int_asl<int32knd> = g0int_asl_int32
implement
g0int_asr<int32knd> = g0int_asr_int32
implement
g0int_isltz<int32knd> = g0int_isltz_int32
implement
g0int_isltez<int32knd> = g0int_isltez_int32
implement
g0int_isgtz<int32knd> = g0int_isgtz_int32
implement
g0int_isgtez<int32knd> = g0int_isgtez_int32
implement
g0int_iseqz<int32knd> = g0int_iseqz_int32
implement
g0int_isneqz<int32knd> = g0int_isneqz_int32
implement
g0int_lt<int32knd> = g0int_lt_int32
implement
g0int_lte<int32knd> = g0int_lte_int32
implement
g0int_gt<int32knd> = g0int_gt_int32
implement
g0int_gte<int32knd> = g0int_gte_int32
implement
g0int_eq<int32knd> = g0int_eq_int32
implement
g0int_neq<int32knd> = g0int_neq_int32
implement
g0int_compare<int32knd> = g0int_compare_int32
implement
g0int_max<int32knd> = g0int_max_int32
implement
g0int_min<int32knd> = g0int_min_int32
//
implement
fprint_val<int32> (out, x) = fprint_int32 (out, x)
//
implement
g0int_neg<int64knd> = g0int_neg_int64
implement
g0int_abs<int64knd> = g0int_abs_int64
implement
g0int_succ<int64knd> = g0int_succ_int64
implement
g0int_pred<int64knd> = g0int_pred_int64
implement
g0int_half<int64knd> = g0int_half_int64
implement
g0int_add<int64knd> = g0int_add_int64
implement
g0int_sub<int64knd> = g0int_sub_int64
implement
g0int_mul<int64knd> = g0int_mul_int64
implement
g0int_div<int64knd> = g0int_div_int64
implement
g0int_mod<int64knd> = g0int_mod_int64
implement
g0int_asl<int64knd> = g0int_asl_int64
implement
g0int_asr<int64knd> = g0int_asr_int64
implement
g0int_isltz<int64knd> = g0int_isltz_int64
implement
g0int_isltez<int64knd> = g0int_isltez_int64
implement
g0int_isgtz<int64knd> = g0int_isgtz_int64
implement
g0int_isgtez<int64knd> = g0int_isgtez_int64
implement
g0int_iseqz<int64knd> = g0int_iseqz_int64
implement
g0int_isneqz<int64knd> = g0int_isneqz_int64
implement
g0int_lt<int64knd> = g0int_lt_int64
implement
g0int_lte<int64knd> = g0int_lte_int64
implement
g0int_gt<int64knd> = g0int_gt_int64
implement
g0int_gte<int64knd> = g0int_gte_int64
implement
g0int_eq<int64knd> = g0int_eq_int64
implement
g0int_neq<int64knd> = g0int_neq_int64
implement
g0int_compare<int64knd> = g0int_compare_int64
implement
g0int_max<int64knd> = g0int_max_int64
implement
g0int_min<int64knd> = g0int_min_int64
//
implement
fprint_val<int64> (out, x) = fprint_int64 (out, x)
//
(* ****** ****** *)
//
implement
g0uint_succ<uint8knd> = g0uint_succ_uint8
implement
g0uint_pred<uint8knd> = g0uint_pred_uint8
implement
g0uint_half<uint8knd> = g0uint_half_uint8
implement
g0uint_add<uint8knd> = g0uint_add_uint8
implement
g0uint_sub<uint8knd> = g0uint_sub_uint8
implement
g0uint_mul<uint8knd> = g0uint_mul_uint8
implement
g0uint_div<uint8knd> = g0uint_div_uint8
implement
g0uint_mod<uint8knd> = g0uint_mod_uint8
implement
g0uint_lsl<uint8knd> = g0uint_lsl_uint8
implement
g0uint_lsr<uint8knd> = g0uint_lsr_uint8
implement
g0uint_lnot<uint8knd> = g0uint_lnot_uint8
implement
g0uint_lor<uint8knd> = g0uint_lor_uint8
implement
g0uint_lxor<uint8knd> = g0uint_lxor_uint8
implement
g0uint_land<uint8knd> = g0uint_land_uint8
implement
g0uint_isgtz<uint8knd> = g0uint_isgtz_uint8
implement
g0uint_iseqz<uint8knd> = g0uint_iseqz_uint8
implement
g0uint_isneqz<uint8knd> = g0uint_isneqz_uint8
implement
g0uint_lt<uint8knd> = g0uint_lt_uint8
implement
g0uint_lte<uint8knd> = g0uint_lte_uint8
implement
g0uint_gt<uint8knd> = g0uint_gt_uint8
implement
g0uint_gte<uint8knd> = g0uint_gte_uint8
implement
g0uint_eq<uint8knd> = g0uint_eq_uint8
implement
g0uint_neq<uint8knd> = g0uint_neq_uint8
implement
g0uint_compare<uint8knd> = g0uint_compare_uint8
implement
g0uint_max<uint8knd> = g0uint_max_uint8
implement
g0uint_min<uint8knd> = g0uint_min_uint8
//
implement
fprint_val<uint8> (out, x) = fprint_uint8 (out, x)
//
implement
g0uint_succ<uint16knd> = g0uint_succ_uint16
implement
g0uint_pred<uint16knd> = g0uint_pred_uint16
implement
g0uint_half<uint16knd> = g0uint_half_uint16
implement
g0uint_add<uint16knd> = g0uint_add_uint16
implement
g0uint_sub<uint16knd> = g0uint_sub_uint16
implement
g0uint_mul<uint16knd> = g0uint_mul_uint16
implement
g0uint_div<uint16knd> = g0uint_div_uint16
implement
g0uint_mod<uint16knd> = g0uint_mod_uint16
implement
g0uint_lsl<uint16knd> = g0uint_lsl_uint16
implement
g0uint_lsr<uint16knd> = g0uint_lsr_uint16
implement
g0uint_lnot<uint16knd> = g0uint_lnot_uint16
implement
g0uint_lor<uint16knd> = g0uint_lor_uint16
implement
g0uint_lxor<uint16knd> = g0uint_lxor_uint16
implement
g0uint_land<uint16knd> = g0uint_land_uint16
implement
g0uint_isgtz<uint16knd> = g0uint_isgtz_uint16
implement
g0uint_iseqz<uint16knd> = g0uint_iseqz_uint16
implement
g0uint_isneqz<uint16knd> = g0uint_isneqz_uint16
implement
g0uint_lt<uint16knd> = g0uint_lt_uint16
implement
g0uint_lte<uint16knd> = g0uint_lte_uint16
implement
g0uint_gt<uint16knd> = g0uint_gt_uint16
implement
g0uint_gte<uint16knd> = g0uint_gte_uint16
implement
g0uint_eq<uint16knd> = g0uint_eq_uint16
implement
g0uint_neq<uint16knd> = g0uint_neq_uint16
implement
g0uint_compare<uint16knd> = g0uint_compare_uint16
implement
g0uint_max<uint16knd> = g0uint_max_uint16
implement
g0uint_min<uint16knd> = g0uint_min_uint16
//
implement
fprint_val<uint16> (out, x) = fprint_uint16 (out, x)
//
implement
g0uint_succ<uint32knd> = g0uint_succ_uint32
implement
g0uint_pred<uint32knd> = g0uint_pred_uint32
implement
g0uint_half<uint32knd> = g0uint_half_uint32
implement
g0uint_add<uint32knd> = g0uint_add_uint32
implement
g0uint_sub<uint32knd> = g0uint_sub_uint32
implement
g0uint_mul<uint32knd> = g0uint_mul_uint32
implement
g0uint_div<uint32knd> = g0uint_div_uint32
implement
g0uint_mod<uint32knd> = g0uint_mod_uint32
implement
g0uint_lsl<uint32knd> = g0uint_lsl_uint32
implement
g0uint_lsr<uint32knd> = g0uint_lsr_uint32
implement
g0uint_lnot<uint32knd> = g0uint_lnot_uint32
implement
g0uint_lor<uint32knd> = g0uint_lor_uint32
implement
g0uint_lxor<uint32knd> = g0uint_lxor_uint32
implement
g0uint_land<uint32knd> = g0uint_land_uint32
implement
g0uint_isgtz<uint32knd> = g0uint_isgtz_uint32
implement
g0uint_iseqz<uint32knd> = g0uint_iseqz_uint32
implement
g0uint_isneqz<uint32knd> = g0uint_isneqz_uint32
implement
g0uint_lt<uint32knd> = g0uint_lt_uint32
implement
g0uint_lte<uint32knd> = g0uint_lte_uint32
implement
g0uint_gt<uint32knd> = g0uint_gt_uint32
implement
g0uint_gte<uint32knd> = g0uint_gte_uint32
implement
g0uint_eq<uint32knd> = g0uint_eq_uint32
implement
g0uint_neq<uint32knd> = g0uint_neq_uint32
implement
g0uint_compare<uint32knd> = g0uint_compare_uint32
implement
g0uint_max<uint32knd> = g0uint_max_uint32
implement
g0uint_min<uint32knd> = g0uint_min_uint32
//
implement
fprint_val<uint32> (out, x) = fprint_uint32 (out, x)
//
implement
g0uint_succ<uint64knd> = g0uint_succ_uint64
implement
g0uint_pred<uint64knd> = g0uint_pred_uint64
implement
g0uint_half<uint64knd> = g0uint_half_uint64
implement
g0uint_add<uint64knd> = g0uint_add_uint64
implement
g0uint_sub<uint64knd> = g0uint_sub_uint64
implement
g0uint_mul<uint64knd> = g0uint_mul_uint64
implement
g0uint_div<uint64knd> = g0uint_div_uint64
implement
g0uint_mod<uint64knd> = g0uint_mod_uint64
implement
g0uint_lsl<uint64knd> = g0uint_lsl_uint64
implement
g0uint_lsr<uint64knd> = g0uint_lsr_uint64
implement
g0uint_lnot<uint64knd> = g0uint_lnot_uint64
implement
g0uint_lor<uint64knd> = g0uint_lor_uint64
implement
g0uint_lxor<uint64knd> = g0uint_lxor_uint64
implement
g0uint_land<uint64knd> = g0uint_land_uint64
implement
g0uint_isgtz<uint64knd> = g0uint_isgtz_uint64
implement
g0uint_iseqz<uint64knd> = g0uint_iseqz_uint64
implement
g0uint_isneqz<uint64knd> = g0uint_isneqz_uint64
implement
g0uint_lt<uint64knd> = g0uint_lt_uint64
implement
g0uint_lte<uint64knd> = g0uint_lte_uint64
implement
g0uint_gt<uint64knd> = g0uint_gt_uint64
implement
g0uint_gte<uint64knd> = g0uint_gte_uint64
implement
g0uint_eq<uint64knd> = g0uint_eq_uint64
implement
g0uint_neq<uint64knd> = g0uint_neq_uint64
implement
g0uint_compare<uint64knd> = g0uint_compare_uint64
implement
g0uint_max<uint64knd> = g0uint_max_uint64
implement
g0uint_min<uint64knd> = g0uint_min_uint64
//
implement
fprint_val<uint64> (out, x) = fprint_uint64 (out, x)
//
(* ****** ****** *)

(* end of [integer_fixed.dats] *)
