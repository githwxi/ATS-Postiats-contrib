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
(* Start time: January, 2013 *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/integer_fixed.atxt
** Time of generation: Sun Nov 20 21:18:17 2016
*)

(* ****** ****** *)
//
// HX: for unindexed integer types
//
(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)
//
stadef int8knd = int8_kind
stadef int16knd = int16_kind
stadef int32knd = int32_kind
stadef int64knd = int64_kind
//
stadef uint8knd = uint8_kind
stadef uint16knd = uint16_kind
stadef uint32knd = uint32_kind
stadef uint64knd = uint64_kind
//
(* ****** ****** *)
//
fun g0int2int_int8_int (x: int8):<> int = "mac#%"
fun g0int2int_int16_int (x: int16):<> int = "mac#%"
fun g0int2int_int32_int (x: int32):<> int = "mac#%"
fun g0int2int_int64_int (x: int64):<> int = "mac#%"
//
(* ****** ****** *)
//
fun g0int_neg_int8 (x: int8):<> int8 = "mac#%"
fun g0int_abs_int8 (x: int8):<> int8 = "mac#%"
fun g0int_succ_int8 (x: int8):<> int8 = "mac#%"
fun g0int_pred_int8 (x: int8):<> int8 = "mac#%"
fun g0int_half_int8 (x: int8):<> int8 = "mac#%"
fun g0int_asl_int8 (x: int8, n: intGte(0)):<> int8 = "mac#%"
fun g0int_asr_int8 (x: int8, n: intGte(0)):<> int8 = "mac#%"
fun g0int_add_int8 (x: int8, y: int8):<> int8 = "mac#%"
fun g0int_sub_int8 (x: int8, y: int8):<> int8 = "mac#%"
fun g0int_mul_int8 (x: int8, y: int8):<> int8 = "mac#%"
fun g0int_div_int8 (x: int8, y: int8):<> int8 = "mac#%"
fun g0int_mod_int8 (x: int8, y: int8):<> int8 = "mac#%"
fun g0int_lt_int8 (x: int8, y: int8):<> bool = "mac#%"
fun g0int_lte_int8 (x: int8, y: int8):<> bool = "mac#%"
fun g0int_gt_int8 (x: int8, y: int8):<> bool = "mac#%"
fun g0int_gte_int8 (x: int8, y: int8):<> bool = "mac#%"
fun g0int_eq_int8 (x: int8, y: int8):<> bool = "mac#%"
fun g0int_neq_int8 (x: int8, y: int8):<> bool = "mac#%"
fun g0int_compare_int8 (x: int8, y: int8):<> int = "mac#%"
fun g0int_max_int8 (x: int8, y: int8):<> int8 = "mac#%"
fun g0int_min_int8 (x: int8, y: int8):<> int8 = "mac#%"
fun g0int_isltz_int8 (x: int8):<> bool = "mac#%"
fun g0int_isltez_int8 (x: int8):<> bool = "mac#%"
fun g0int_isgtz_int8 (x: int8):<> bool = "mac#%"
fun g0int_isgtez_int8 (x: int8):<> bool = "mac#%"
fun g0int_iseqz_int8 (x: int8):<> bool = "mac#%"
fun g0int_isneqz_int8 (x: int8):<> bool = "mac#%"
//
fun g0int_neg_int16 (x: int16):<> int16 = "mac#%"
fun g0int_abs_int16 (x: int16):<> int16 = "mac#%"
fun g0int_succ_int16 (x: int16):<> int16 = "mac#%"
fun g0int_pred_int16 (x: int16):<> int16 = "mac#%"
fun g0int_half_int16 (x: int16):<> int16 = "mac#%"
fun g0int_asl_int16 (x: int16, n: intGte(0)):<> int16 = "mac#%"
fun g0int_asr_int16 (x: int16, n: intGte(0)):<> int16 = "mac#%"
fun g0int_add_int16 (x: int16, y: int16):<> int16 = "mac#%"
fun g0int_sub_int16 (x: int16, y: int16):<> int16 = "mac#%"
fun g0int_mul_int16 (x: int16, y: int16):<> int16 = "mac#%"
fun g0int_div_int16 (x: int16, y: int16):<> int16 = "mac#%"
fun g0int_mod_int16 (x: int16, y: int16):<> int16 = "mac#%"
fun g0int_lt_int16 (x: int16, y: int16):<> bool = "mac#%"
fun g0int_lte_int16 (x: int16, y: int16):<> bool = "mac#%"
fun g0int_gt_int16 (x: int16, y: int16):<> bool = "mac#%"
fun g0int_gte_int16 (x: int16, y: int16):<> bool = "mac#%"
fun g0int_eq_int16 (x: int16, y: int16):<> bool = "mac#%"
fun g0int_neq_int16 (x: int16, y: int16):<> bool = "mac#%"
fun g0int_compare_int16 (x: int16, y: int16):<> int = "mac#%"
fun g0int_max_int16 (x: int16, y: int16):<> int16 = "mac#%"
fun g0int_min_int16 (x: int16, y: int16):<> int16 = "mac#%"
fun g0int_isltz_int16 (x: int16):<> bool = "mac#%"
fun g0int_isltez_int16 (x: int16):<> bool = "mac#%"
fun g0int_isgtz_int16 (x: int16):<> bool = "mac#%"
fun g0int_isgtez_int16 (x: int16):<> bool = "mac#%"
fun g0int_iseqz_int16 (x: int16):<> bool = "mac#%"
fun g0int_isneqz_int16 (x: int16):<> bool = "mac#%"
//
fun g0int_neg_int32 (x: int32):<> int32 = "mac#%"
fun g0int_abs_int32 (x: int32):<> int32 = "mac#%"
fun g0int_succ_int32 (x: int32):<> int32 = "mac#%"
fun g0int_pred_int32 (x: int32):<> int32 = "mac#%"
fun g0int_half_int32 (x: int32):<> int32 = "mac#%"
fun g0int_asl_int32 (x: int32, n: intGte(0)):<> int32 = "mac#%"
fun g0int_asr_int32 (x: int32, n: intGte(0)):<> int32 = "mac#%"
fun g0int_add_int32 (x: int32, y: int32):<> int32 = "mac#%"
fun g0int_sub_int32 (x: int32, y: int32):<> int32 = "mac#%"
fun g0int_mul_int32 (x: int32, y: int32):<> int32 = "mac#%"
fun g0int_div_int32 (x: int32, y: int32):<> int32 = "mac#%"
fun g0int_mod_int32 (x: int32, y: int32):<> int32 = "mac#%"
fun g0int_lt_int32 (x: int32, y: int32):<> bool = "mac#%"
fun g0int_lte_int32 (x: int32, y: int32):<> bool = "mac#%"
fun g0int_gt_int32 (x: int32, y: int32):<> bool = "mac#%"
fun g0int_gte_int32 (x: int32, y: int32):<> bool = "mac#%"
fun g0int_eq_int32 (x: int32, y: int32):<> bool = "mac#%"
fun g0int_neq_int32 (x: int32, y: int32):<> bool = "mac#%"
fun g0int_compare_int32 (x: int32, y: int32):<> int = "mac#%"
fun g0int_max_int32 (x: int32, y: int32):<> int32 = "mac#%"
fun g0int_min_int32 (x: int32, y: int32):<> int32 = "mac#%"
fun g0int_isltz_int32 (x: int32):<> bool = "mac#%"
fun g0int_isltez_int32 (x: int32):<> bool = "mac#%"
fun g0int_isgtz_int32 (x: int32):<> bool = "mac#%"
fun g0int_isgtez_int32 (x: int32):<> bool = "mac#%"
fun g0int_iseqz_int32 (x: int32):<> bool = "mac#%"
fun g0int_isneqz_int32 (x: int32):<> bool = "mac#%"
//
fun g0int_neg_int64 (x: int64):<> int64 = "mac#%"
fun g0int_abs_int64 (x: int64):<> int64 = "mac#%"
fun g0int_succ_int64 (x: int64):<> int64 = "mac#%"
fun g0int_pred_int64 (x: int64):<> int64 = "mac#%"
fun g0int_half_int64 (x: int64):<> int64 = "mac#%"
fun g0int_asl_int64 (x: int64, n: intGte(0)):<> int64 = "mac#%"
fun g0int_asr_int64 (x: int64, n: intGte(0)):<> int64 = "mac#%"
fun g0int_add_int64 (x: int64, y: int64):<> int64 = "mac#%"
fun g0int_sub_int64 (x: int64, y: int64):<> int64 = "mac#%"
fun g0int_mul_int64 (x: int64, y: int64):<> int64 = "mac#%"
fun g0int_div_int64 (x: int64, y: int64):<> int64 = "mac#%"
fun g0int_mod_int64 (x: int64, y: int64):<> int64 = "mac#%"
fun g0int_lt_int64 (x: int64, y: int64):<> bool = "mac#%"
fun g0int_lte_int64 (x: int64, y: int64):<> bool = "mac#%"
fun g0int_gt_int64 (x: int64, y: int64):<> bool = "mac#%"
fun g0int_gte_int64 (x: int64, y: int64):<> bool = "mac#%"
fun g0int_eq_int64 (x: int64, y: int64):<> bool = "mac#%"
fun g0int_neq_int64 (x: int64, y: int64):<> bool = "mac#%"
fun g0int_compare_int64 (x: int64, y: int64):<> int = "mac#%"
fun g0int_max_int64 (x: int64, y: int64):<> int64 = "mac#%"
fun g0int_min_int64 (x: int64, y: int64):<> int64 = "mac#%"
fun g0int_isltz_int64 (x: int64):<> bool = "mac#%"
fun g0int_isltez_int64 (x: int64):<> bool = "mac#%"
fun g0int_isgtz_int64 (x: int64):<> bool = "mac#%"
fun g0int_isgtez_int64 (x: int64):<> bool = "mac#%"
fun g0int_iseqz_int64 (x: int64):<> bool = "mac#%"
fun g0int_isneqz_int64 (x: int64):<> bool = "mac#%"
//
(* ****** ****** *)

fun print_int8 (int8): void = "mac#%"
fun prerr_int8 (int8): void = "mac#%"
fun fprint_int8 : fprint_type (int8) = "mac#%"
overload print with print_int8
overload prerr with prerr_int8
overload fprint with fprint_int8

fun print_int16 (int16): void = "mac#%"
fun prerr_int16 (int16): void = "mac#%"
fun fprint_int16 : fprint_type (int16) = "mac#%"
overload print with print_int16
overload prerr with prerr_int16
overload fprint with fprint_int16

fun print_int32 (int32): void = "mac#%"
fun prerr_int32 (int32): void = "mac#%"
fun fprint_int32 : fprint_type (int32) = "mac#%"
overload print with print_int32
overload prerr with prerr_int32
overload fprint with fprint_int32

fun print_int64 (int64): void = "mac#%"
fun prerr_int64 (int64): void = "mac#%"
fun fprint_int64 : fprint_type (int64) = "mac#%"
overload print with print_int64
overload prerr with prerr_int64
overload fprint with fprint_int64


(* ****** ****** *)
//
fun g0int2uint_int8_uint (x: int8):<> uint = "mac#%"
fun g0int2uint_int16_uint (x: int16):<> uint = "mac#%"
fun g0int2uint_int32_uint (x: int32):<> uint = "mac#%"
fun g0int2uint_int64_uint (x: int64):<> uint = "mac#%"
//
fun g0uint2int_uint8_int (x: uint8):<> int = "mac#%"
fun g0uint2int_uint16_int (x: uint16):<> int = "mac#%"
fun g0uint2int_uint32_int (x: uint32):<> int = "mac#%"
fun g0uint2int_uint64_int (x: uint64):<> int = "mac#%"
//
fun g0uint2uint_uint8_uint (x: uint8):<> uint = "mac#%"
fun g0uint2uint_uint16_uint (x: uint16):<> uint = "mac#%"
fun g0uint2uint_uint32_uint (x: uint32):<> uint = "mac#%"
fun g0uint2uint_uint64_uint (x: uint64):<> uint = "mac#%"
//
(* ****** ****** *)
//
fun g0uint_succ_uint8 (x: uint8):<> uint8 = "mac#%"
fun g0uint_pred_uint8 (x: uint8):<> uint8 = "mac#%"
fun g0uint_half_uint8 (x: uint8):<> uint8 = "mac#%"
fun g0uint_add_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_sub_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_mul_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_div_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_mod_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_lsl_uint8 (x: uint8, n: intGte(0)):<> uint8 = "mac#%"
fun g0uint_lsr_uint8 (x: uint8, n: intGte(0)):<> uint8 = "mac#%"
fun g0uint_lnot_uint8 (x: uint8):<> uint8 = "mac#%"
fun g0uint_lor_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_lxor_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_land_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_lt_uint8 (x: uint8, y: uint8):<> bool = "mac#%"
fun g0uint_lte_uint8 (x: uint8, y: uint8):<> bool = "mac#%"
fun g0uint_gt_uint8 (x: uint8, y: uint8):<> bool = "mac#%"
fun g0uint_gte_uint8 (x: uint8, y: uint8):<> bool = "mac#%"
fun g0uint_eq_uint8 (x: uint8, y: uint8):<> bool = "mac#%"
fun g0uint_neq_uint8 (x: uint8, y: uint8):<> bool = "mac#%"
fun g0uint_compare_uint8 (x: uint8, y: uint8):<> int = "mac#%"
fun g0uint_max_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_min_uint8 (x: uint8, y: uint8):<> uint8 = "mac#%"
fun g0uint_isgtz_uint8 (x: uint8):<> bool = "mac#%"
fun g0uint_iseqz_uint8 (x: uint8):<> bool = "mac#%"
fun g0uint_isneqz_uint8 (x: uint8):<> bool = "mac#%"
//
fun g0uint_succ_uint16 (x: uint16):<> uint16 = "mac#%"
fun g0uint_pred_uint16 (x: uint16):<> uint16 = "mac#%"
fun g0uint_half_uint16 (x: uint16):<> uint16 = "mac#%"
fun g0uint_add_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_sub_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_mul_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_div_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_mod_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_lsl_uint16 (x: uint16, n: intGte(0)):<> uint16 = "mac#%"
fun g0uint_lsr_uint16 (x: uint16, n: intGte(0)):<> uint16 = "mac#%"
fun g0uint_lnot_uint16 (x: uint16):<> uint16 = "mac#%"
fun g0uint_lor_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_lxor_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_land_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_lt_uint16 (x: uint16, y: uint16):<> bool = "mac#%"
fun g0uint_lte_uint16 (x: uint16, y: uint16):<> bool = "mac#%"
fun g0uint_gt_uint16 (x: uint16, y: uint16):<> bool = "mac#%"
fun g0uint_gte_uint16 (x: uint16, y: uint16):<> bool = "mac#%"
fun g0uint_eq_uint16 (x: uint16, y: uint16):<> bool = "mac#%"
fun g0uint_neq_uint16 (x: uint16, y: uint16):<> bool = "mac#%"
fun g0uint_compare_uint16 (x: uint16, y: uint16):<> int = "mac#%"
fun g0uint_max_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_min_uint16 (x: uint16, y: uint16):<> uint16 = "mac#%"
fun g0uint_isgtz_uint16 (x: uint16):<> bool = "mac#%"
fun g0uint_iseqz_uint16 (x: uint16):<> bool = "mac#%"
fun g0uint_isneqz_uint16 (x: uint16):<> bool = "mac#%"
//
fun g0uint_succ_uint32 (x: uint32):<> uint32 = "mac#%"
fun g0uint_pred_uint32 (x: uint32):<> uint32 = "mac#%"
fun g0uint_half_uint32 (x: uint32):<> uint32 = "mac#%"
fun g0uint_add_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_sub_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_mul_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_div_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_mod_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_lsl_uint32 (x: uint32, n: intGte(0)):<> uint32 = "mac#%"
fun g0uint_lsr_uint32 (x: uint32, n: intGte(0)):<> uint32 = "mac#%"
fun g0uint_lnot_uint32 (x: uint32):<> uint32 = "mac#%"
fun g0uint_lor_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_lxor_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_land_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_lt_uint32 (x: uint32, y: uint32):<> bool = "mac#%"
fun g0uint_lte_uint32 (x: uint32, y: uint32):<> bool = "mac#%"
fun g0uint_gt_uint32 (x: uint32, y: uint32):<> bool = "mac#%"
fun g0uint_gte_uint32 (x: uint32, y: uint32):<> bool = "mac#%"
fun g0uint_eq_uint32 (x: uint32, y: uint32):<> bool = "mac#%"
fun g0uint_neq_uint32 (x: uint32, y: uint32):<> bool = "mac#%"
fun g0uint_compare_uint32 (x: uint32, y: uint32):<> int = "mac#%"
fun g0uint_max_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_min_uint32 (x: uint32, y: uint32):<> uint32 = "mac#%"
fun g0uint_isgtz_uint32 (x: uint32):<> bool = "mac#%"
fun g0uint_iseqz_uint32 (x: uint32):<> bool = "mac#%"
fun g0uint_isneqz_uint32 (x: uint32):<> bool = "mac#%"
//
fun g0uint_succ_uint64 (x: uint64):<> uint64 = "mac#%"
fun g0uint_pred_uint64 (x: uint64):<> uint64 = "mac#%"
fun g0uint_half_uint64 (x: uint64):<> uint64 = "mac#%"
fun g0uint_add_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_sub_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_mul_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_div_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_mod_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_lsl_uint64 (x: uint64, n: intGte(0)):<> uint64 = "mac#%"
fun g0uint_lsr_uint64 (x: uint64, n: intGte(0)):<> uint64 = "mac#%"
fun g0uint_lnot_uint64 (x: uint64):<> uint64 = "mac#%"
fun g0uint_lor_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_lxor_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_land_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_lt_uint64 (x: uint64, y: uint64):<> bool = "mac#%"
fun g0uint_lte_uint64 (x: uint64, y: uint64):<> bool = "mac#%"
fun g0uint_gt_uint64 (x: uint64, y: uint64):<> bool = "mac#%"
fun g0uint_gte_uint64 (x: uint64, y: uint64):<> bool = "mac#%"
fun g0uint_eq_uint64 (x: uint64, y: uint64):<> bool = "mac#%"
fun g0uint_neq_uint64 (x: uint64, y: uint64):<> bool = "mac#%"
fun g0uint_compare_uint64 (x: uint64, y: uint64):<> int = "mac#%"
fun g0uint_max_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_min_uint64 (x: uint64, y: uint64):<> uint64 = "mac#%"
fun g0uint_isgtz_uint64 (x: uint64):<> bool = "mac#%"
fun g0uint_iseqz_uint64 (x: uint64):<> bool = "mac#%"
fun g0uint_isneqz_uint64 (x: uint64):<> bool = "mac#%"
//
(* ****** ****** *)

fun print_uint8 (uint8): void = "mac#%"
fun prerr_uint8 (uint8): void = "mac#%"
fun fprint_uint8 : fprint_type (uint8) = "mac#%"
overload print with print_uint8
overload prerr with prerr_uint8
overload fprint with fprint_uint8

fun print_uint16 (uint16): void = "mac#%"
fun prerr_uint16 (uint16): void = "mac#%"
fun fprint_uint16 : fprint_type (uint16) = "mac#%"
overload print with print_uint16
overload prerr with prerr_uint16
overload fprint with fprint_uint16

fun print_uint32 (uint32): void = "mac#%"
fun prerr_uint32 (uint32): void = "mac#%"
fun fprint_uint32 : fprint_type (uint32) = "mac#%"
overload print with print_uint32
overload prerr with prerr_uint32
overload fprint with fprint_uint32

fun print_uint64 (uint64): void = "mac#%"
fun prerr_uint64 (uint64): void = "mac#%"
fun fprint_uint64 : fprint_type (uint64) = "mac#%"
overload print with print_uint64
overload prerr with prerr_uint64
overload fprint with fprint_uint64


(* ****** ****** *)
//
fun g1int_neg_int8 : g1int_neg_type (int8knd) = "mac#%"
fun g1int_abs_int8 : g1int_abs_type (int8knd) = "mac#%"
fun g1int_succ_int8 : g1int_succ_type (int8knd) = "mac#%"
fun g1int_pred_int8 : g1int_pred_type (int8knd) = "mac#%"
fun g1int_half_int8 : g1int_half_type (int8knd) = "mac#%"
fun g1int_add_int8 : g1int_add_type (int8knd) = "mac#%"
fun g1int_sub_int8 : g1int_sub_type (int8knd) = "mac#%"
fun g1int_mul_int8 : g1int_mul_type (int8knd) = "mac#%"
fun g1int_div_int8 : g1int_div_type (int8knd) = "mac#%"
fun g1int_nmod_int8 : g1int_nmod_type (int8knd) = "mac#%"
fun g1int_lt_int8 : g1int_lt_type (int8knd) = "mac#%"
fun g1int_lte_int8 : g1int_lte_type (int8knd) = "mac#%"
fun g1int_gt_int8 : g1int_gt_type (int8knd) = "mac#%"
fun g1int_gte_int8 : g1int_gte_type (int8knd) = "mac#%"
fun g1int_eq_int8 : g1int_eq_type (int8knd) = "mac#%"
fun g1int_neq_int8 : g1int_neq_type (int8knd) = "mac#%"
fun g1int_compare_int8 : g1int_compare_type (int8knd) = "mac#%"
fun g1int_max_int8 : g1int_max_type (int8knd) = "mac#%"
fun g1int_min_int8 : g1int_min_type (int8knd) = "mac#%"
fun g1int_isltz_int8 : g1int_isltz_type (int8knd) = "mac#%"
fun g1int_isltez_int8 : g1int_isltez_type (int8knd) = "mac#%"
fun g1int_isgtz_int8 : g1int_isgtz_type (int8knd) = "mac#%"
fun g1int_isgtez_int8 : g1int_isgtez_type (int8knd) = "mac#%"
fun g1int_iseqz_int8 : g1int_iseqz_type (int8knd) = "mac#%"
fun g1int_isneqz_int8 : g1int_isneqz_type (int8knd) = "mac#%"
//
fun g1int_neg_int16 : g1int_neg_type (int16knd) = "mac#%"
fun g1int_abs_int16 : g1int_abs_type (int16knd) = "mac#%"
fun g1int_succ_int16 : g1int_succ_type (int16knd) = "mac#%"
fun g1int_pred_int16 : g1int_pred_type (int16knd) = "mac#%"
fun g1int_half_int16 : g1int_half_type (int16knd) = "mac#%"
fun g1int_add_int16 : g1int_add_type (int16knd) = "mac#%"
fun g1int_sub_int16 : g1int_sub_type (int16knd) = "mac#%"
fun g1int_mul_int16 : g1int_mul_type (int16knd) = "mac#%"
fun g1int_div_int16 : g1int_div_type (int16knd) = "mac#%"
fun g1int_nmod_int16 : g1int_nmod_type (int16knd) = "mac#%"
fun g1int_lt_int16 : g1int_lt_type (int16knd) = "mac#%"
fun g1int_lte_int16 : g1int_lte_type (int16knd) = "mac#%"
fun g1int_gt_int16 : g1int_gt_type (int16knd) = "mac#%"
fun g1int_gte_int16 : g1int_gte_type (int16knd) = "mac#%"
fun g1int_eq_int16 : g1int_eq_type (int16knd) = "mac#%"
fun g1int_neq_int16 : g1int_neq_type (int16knd) = "mac#%"
fun g1int_compare_int16 : g1int_compare_type (int16knd) = "mac#%"
fun g1int_max_int16 : g1int_max_type (int16knd) = "mac#%"
fun g1int_min_int16 : g1int_min_type (int16knd) = "mac#%"
fun g1int_isltz_int16 : g1int_isltz_type (int16knd) = "mac#%"
fun g1int_isltez_int16 : g1int_isltez_type (int16knd) = "mac#%"
fun g1int_isgtz_int16 : g1int_isgtz_type (int16knd) = "mac#%"
fun g1int_isgtez_int16 : g1int_isgtez_type (int16knd) = "mac#%"
fun g1int_iseqz_int16 : g1int_iseqz_type (int16knd) = "mac#%"
fun g1int_isneqz_int16 : g1int_isneqz_type (int16knd) = "mac#%"
//
fun g1int_neg_int32 : g1int_neg_type (int32knd) = "mac#%"
fun g1int_abs_int32 : g1int_abs_type (int32knd) = "mac#%"
fun g1int_succ_int32 : g1int_succ_type (int32knd) = "mac#%"
fun g1int_pred_int32 : g1int_pred_type (int32knd) = "mac#%"
fun g1int_half_int32 : g1int_half_type (int32knd) = "mac#%"
fun g1int_add_int32 : g1int_add_type (int32knd) = "mac#%"
fun g1int_sub_int32 : g1int_sub_type (int32knd) = "mac#%"
fun g1int_mul_int32 : g1int_mul_type (int32knd) = "mac#%"
fun g1int_div_int32 : g1int_div_type (int32knd) = "mac#%"
fun g1int_nmod_int32 : g1int_nmod_type (int32knd) = "mac#%"
fun g1int_lt_int32 : g1int_lt_type (int32knd) = "mac#%"
fun g1int_lte_int32 : g1int_lte_type (int32knd) = "mac#%"
fun g1int_gt_int32 : g1int_gt_type (int32knd) = "mac#%"
fun g1int_gte_int32 : g1int_gte_type (int32knd) = "mac#%"
fun g1int_eq_int32 : g1int_eq_type (int32knd) = "mac#%"
fun g1int_neq_int32 : g1int_neq_type (int32knd) = "mac#%"
fun g1int_compare_int32 : g1int_compare_type (int32knd) = "mac#%"
fun g1int_max_int32 : g1int_max_type (int32knd) = "mac#%"
fun g1int_min_int32 : g1int_min_type (int32knd) = "mac#%"
fun g1int_isltz_int32 : g1int_isltz_type (int32knd) = "mac#%"
fun g1int_isltez_int32 : g1int_isltez_type (int32knd) = "mac#%"
fun g1int_isgtz_int32 : g1int_isgtz_type (int32knd) = "mac#%"
fun g1int_isgtez_int32 : g1int_isgtez_type (int32knd) = "mac#%"
fun g1int_iseqz_int32 : g1int_iseqz_type (int32knd) = "mac#%"
fun g1int_isneqz_int32 : g1int_isneqz_type (int32knd) = "mac#%"
//
fun g1int_neg_int64 : g1int_neg_type (int64knd) = "mac#%"
fun g1int_abs_int64 : g1int_abs_type (int64knd) = "mac#%"
fun g1int_succ_int64 : g1int_succ_type (int64knd) = "mac#%"
fun g1int_pred_int64 : g1int_pred_type (int64knd) = "mac#%"
fun g1int_half_int64 : g1int_half_type (int64knd) = "mac#%"
fun g1int_add_int64 : g1int_add_type (int64knd) = "mac#%"
fun g1int_sub_int64 : g1int_sub_type (int64knd) = "mac#%"
fun g1int_mul_int64 : g1int_mul_type (int64knd) = "mac#%"
fun g1int_div_int64 : g1int_div_type (int64knd) = "mac#%"
fun g1int_nmod_int64 : g1int_nmod_type (int64knd) = "mac#%"
fun g1int_lt_int64 : g1int_lt_type (int64knd) = "mac#%"
fun g1int_lte_int64 : g1int_lte_type (int64knd) = "mac#%"
fun g1int_gt_int64 : g1int_gt_type (int64knd) = "mac#%"
fun g1int_gte_int64 : g1int_gte_type (int64knd) = "mac#%"
fun g1int_eq_int64 : g1int_eq_type (int64knd) = "mac#%"
fun g1int_neq_int64 : g1int_neq_type (int64knd) = "mac#%"
fun g1int_compare_int64 : g1int_compare_type (int64knd) = "mac#%"
fun g1int_max_int64 : g1int_max_type (int64knd) = "mac#%"
fun g1int_min_int64 : g1int_min_type (int64knd) = "mac#%"
fun g1int_isltz_int64 : g1int_isltz_type (int64knd) = "mac#%"
fun g1int_isltez_int64 : g1int_isltez_type (int64knd) = "mac#%"
fun g1int_isgtz_int64 : g1int_isgtz_type (int64knd) = "mac#%"
fun g1int_isgtez_int64 : g1int_isgtez_type (int64knd) = "mac#%"
fun g1int_iseqz_int64 : g1int_iseqz_type (int64knd) = "mac#%"
fun g1int_isneqz_int64 : g1int_isneqz_type (int64knd) = "mac#%"
//
(* ****** ****** *)
//
fun g1uint_succ_uint8 : g1uint_succ_type (uint8knd) = "mac#%"
fun g1uint_pred_uint8 : g1uint_pred_type (uint8knd) = "mac#%"
fun g1uint_half_uint8 : g1uint_half_type (uint8knd) = "mac#%"
fun g1uint_add_uint8 : g1uint_add_type (uint8knd) = "mac#%"
fun g1uint_sub_uint8 : g1uint_sub_type (uint8knd) = "mac#%"
fun g1uint_mul_uint8 : g1uint_mul_type (uint8knd) = "mac#%"
fun g1uint_div_uint8 : g1uint_div_type (uint8knd) = "mac#%"
fun g1uint_mod_uint8 : g1uint_mod_type (uint8knd) = "mac#%"
fun g1uint_lt_uint8 : g1uint_lt_type (uint8knd) = "mac#%"
fun g1uint_lte_uint8 : g1uint_lte_type (uint8knd) = "mac#%"
fun g1uint_gt_uint8 : g1uint_gt_type (uint8knd) = "mac#%"
fun g1uint_gte_uint8 : g1uint_gte_type (uint8knd) = "mac#%"
fun g1uint_eq_uint8 : g1uint_eq_type (uint8knd) = "mac#%"
fun g1uint_neq_uint8 : g1uint_neq_type (uint8knd) = "mac#%"
fun g1uint_compare_uint8 : g1uint_compare_type (uint8knd) = "mac#%"
fun g1uint_max_uint8 : g1uint_max_type (uint8knd) = "mac#%"
fun g1uint_min_uint8 : g1uint_min_type (uint8knd) = "mac#%"
fun g1uint_isgtz_uint8 : g1uint_isgtz_type (uint8knd) = "mac#%"
fun g1uint_iseqz_uint8 : g1uint_iseqz_type (uint8knd) = "mac#%"
fun g1uint_isneqz_uint8 : g1uint_isneqz_type (uint8knd) = "mac#%"
//
fun g1uint_succ_uint16 : g1uint_succ_type (uint16knd) = "mac#%"
fun g1uint_pred_uint16 : g1uint_pred_type (uint16knd) = "mac#%"
fun g1uint_half_uint16 : g1uint_half_type (uint16knd) = "mac#%"
fun g1uint_add_uint16 : g1uint_add_type (uint16knd) = "mac#%"
fun g1uint_sub_uint16 : g1uint_sub_type (uint16knd) = "mac#%"
fun g1uint_mul_uint16 : g1uint_mul_type (uint16knd) = "mac#%"
fun g1uint_div_uint16 : g1uint_div_type (uint16knd) = "mac#%"
fun g1uint_mod_uint16 : g1uint_mod_type (uint16knd) = "mac#%"
fun g1uint_lt_uint16 : g1uint_lt_type (uint16knd) = "mac#%"
fun g1uint_lte_uint16 : g1uint_lte_type (uint16knd) = "mac#%"
fun g1uint_gt_uint16 : g1uint_gt_type (uint16knd) = "mac#%"
fun g1uint_gte_uint16 : g1uint_gte_type (uint16knd) = "mac#%"
fun g1uint_eq_uint16 : g1uint_eq_type (uint16knd) = "mac#%"
fun g1uint_neq_uint16 : g1uint_neq_type (uint16knd) = "mac#%"
fun g1uint_compare_uint16 : g1uint_compare_type (uint16knd) = "mac#%"
fun g1uint_max_uint16 : g1uint_max_type (uint16knd) = "mac#%"
fun g1uint_min_uint16 : g1uint_min_type (uint16knd) = "mac#%"
fun g1uint_isgtz_uint16 : g1uint_isgtz_type (uint16knd) = "mac#%"
fun g1uint_iseqz_uint16 : g1uint_iseqz_type (uint16knd) = "mac#%"
fun g1uint_isneqz_uint16 : g1uint_isneqz_type (uint16knd) = "mac#%"
//
fun g1uint_succ_uint32 : g1uint_succ_type (uint32knd) = "mac#%"
fun g1uint_pred_uint32 : g1uint_pred_type (uint32knd) = "mac#%"
fun g1uint_half_uint32 : g1uint_half_type (uint32knd) = "mac#%"
fun g1uint_add_uint32 : g1uint_add_type (uint32knd) = "mac#%"
fun g1uint_sub_uint32 : g1uint_sub_type (uint32knd) = "mac#%"
fun g1uint_mul_uint32 : g1uint_mul_type (uint32knd) = "mac#%"
fun g1uint_div_uint32 : g1uint_div_type (uint32knd) = "mac#%"
fun g1uint_mod_uint32 : g1uint_mod_type (uint32knd) = "mac#%"
fun g1uint_lt_uint32 : g1uint_lt_type (uint32knd) = "mac#%"
fun g1uint_lte_uint32 : g1uint_lte_type (uint32knd) = "mac#%"
fun g1uint_gt_uint32 : g1uint_gt_type (uint32knd) = "mac#%"
fun g1uint_gte_uint32 : g1uint_gte_type (uint32knd) = "mac#%"
fun g1uint_eq_uint32 : g1uint_eq_type (uint32knd) = "mac#%"
fun g1uint_neq_uint32 : g1uint_neq_type (uint32knd) = "mac#%"
fun g1uint_compare_uint32 : g1uint_compare_type (uint32knd) = "mac#%"
fun g1uint_max_uint32 : g1uint_max_type (uint32knd) = "mac#%"
fun g1uint_min_uint32 : g1uint_min_type (uint32knd) = "mac#%"
fun g1uint_isgtz_uint32 : g1uint_isgtz_type (uint32knd) = "mac#%"
fun g1uint_iseqz_uint32 : g1uint_iseqz_type (uint32knd) = "mac#%"
fun g1uint_isneqz_uint32 : g1uint_isneqz_type (uint32knd) = "mac#%"
//
fun g1uint_succ_uint64 : g1uint_succ_type (uint64knd) = "mac#%"
fun g1uint_pred_uint64 : g1uint_pred_type (uint64knd) = "mac#%"
fun g1uint_half_uint64 : g1uint_half_type (uint64knd) = "mac#%"
fun g1uint_add_uint64 : g1uint_add_type (uint64knd) = "mac#%"
fun g1uint_sub_uint64 : g1uint_sub_type (uint64knd) = "mac#%"
fun g1uint_mul_uint64 : g1uint_mul_type (uint64knd) = "mac#%"
fun g1uint_div_uint64 : g1uint_div_type (uint64knd) = "mac#%"
fun g1uint_mod_uint64 : g1uint_mod_type (uint64knd) = "mac#%"
fun g1uint_lt_uint64 : g1uint_lt_type (uint64knd) = "mac#%"
fun g1uint_lte_uint64 : g1uint_lte_type (uint64knd) = "mac#%"
fun g1uint_gt_uint64 : g1uint_gt_type (uint64knd) = "mac#%"
fun g1uint_gte_uint64 : g1uint_gte_type (uint64knd) = "mac#%"
fun g1uint_eq_uint64 : g1uint_eq_type (uint64knd) = "mac#%"
fun g1uint_neq_uint64 : g1uint_neq_type (uint64knd) = "mac#%"
fun g1uint_compare_uint64 : g1uint_compare_type (uint64knd) = "mac#%"
fun g1uint_max_uint64 : g1uint_max_type (uint64knd) = "mac#%"
fun g1uint_min_uint64 : g1uint_min_type (uint64knd) = "mac#%"
fun g1uint_isgtz_uint64 : g1uint_isgtz_type (uint64knd) = "mac#%"
fun g1uint_iseqz_uint64 : g1uint_iseqz_type (uint64knd) = "mac#%"
fun g1uint_isneqz_uint64 : g1uint_isneqz_type (uint64knd) = "mac#%"
//
(* ****** ****** *)

(* end of [integer_fixed.sats] *)
