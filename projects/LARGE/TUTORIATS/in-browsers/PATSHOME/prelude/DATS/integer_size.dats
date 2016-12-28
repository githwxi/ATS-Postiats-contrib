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
(* Start time: May, 2012 *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/integer_size.atxt
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
g0int2uint<intknd,sizeknd> = g0int2uint_int_size
implement
g1int2uint<intknd,sizeknd> = g1int2uint_int_size
//
implement
g0uint2uint<uintknd,sizeknd> = g0uint2uint_uint_size
implement
g1uint2uint<uintknd,sizeknd> = g1uint2uint_uint_size
//
(* ****** ****** *)
//
implement
g0int2int<intknd,ssizeknd> = g0int2int_int_ssize
implement
g1int2int<intknd,ssizeknd> = g1int2int_int_ssize
//
implement
g0uint2int<uintknd,ssizeknd> = g0uint2int_uint_ssize
implement
g1uint2int<uintknd,ssizeknd> = g1uint2int_uint_ssize
//
(* ****** ****** *)
//
implement
g0uint2int<sizeknd,intknd> = g0uint2int_size_int
implement
g1uint2int<sizeknd,intknd> = g1uint2int_size_int
//
implement
g0uint2uint<sizeknd,uintknd> = g0uint2uint_size_uint
implement
g1uint2uint<sizeknd,uintknd> = g1uint2uint_size_uint
//
implement
g0uint2uint<sizeknd,sizeknd> = g0uint2uint_size_size
implement
g1uint2uint<sizeknd,sizeknd> = g1uint2uint_size_size
//
(* ****** ****** *)
//
implement
g0int2int<ssizeknd,intknd> = g0int2int_ssize_int
implement
g1int2int<ssizeknd,intknd> = g1int2int_ssize_int
//
implement
g0int2uint<ssizeknd,uintknd> = g0int2uint_ssize_uint
implement
g1int2uint<ssizeknd,uintknd> = g1int2uint_ssize_uint
//
implement
g0int2int<ssizeknd,ssizeknd> = g0int2int_ssize_ssize
implement
g1int2int<ssizeknd,ssizeknd> = g1int2int_ssize_ssize
//
(* ****** ****** *)
//
implement
g0uint2int<sizeknd,ssizeknd> = g0uint2int_size_ssize
implement
g1uint2int<sizeknd,ssizeknd> = g1uint2int_size_ssize
//
implement
g0int2uint<ssizeknd,sizeknd> = g0int2uint_ssize_size
implement
g1int2uint<ssizeknd,sizeknd> = g1int2uint_ssize_size
//
(* ****** ****** *)
//
implement
g0uint_succ<sizeknd> = g0uint_succ_size
implement
g0uint_pred<sizeknd> = g0uint_pred_size
implement
g0uint_half<sizeknd> = g0uint_half_size
implement
g0uint_add<sizeknd> = g0uint_add_size
implement
g0uint_sub<sizeknd> = g0uint_sub_size
implement
g0uint_mul<sizeknd> = g0uint_mul_size
implement
g0uint_div<sizeknd> = g0uint_div_size
implement
g0uint_mod<sizeknd> = g0uint_mod_size
implement
g0uint_lsl<sizeknd> = g0uint_lsl_size
implement
g0uint_lsr<sizeknd> = g0uint_lsr_size
implement
g0uint_lnot<sizeknd> = g0uint_lnot_size
implement
g0uint_lor<sizeknd> = g0uint_lor_size
implement
g0uint_lxor<sizeknd> = g0uint_lxor_size
implement
g0uint_land<sizeknd> = g0uint_land_size
implement
g0uint_isgtz<sizeknd> = g0uint_isgtz_size
implement
g0uint_iseqz<sizeknd> = g0uint_iseqz_size
implement
g0uint_isneqz<sizeknd> = g0uint_isneqz_size
implement
g0uint_lt<sizeknd> = g0uint_lt_size
implement
g0uint_lte<sizeknd> = g0uint_lte_size
implement
g0uint_gt<sizeknd> = g0uint_gt_size
implement
g0uint_gte<sizeknd> = g0uint_gte_size
implement
g0uint_eq<sizeknd> = g0uint_eq_size
implement
g0uint_neq<sizeknd> = g0uint_neq_size
implement
g0uint_compare<sizeknd> = g0uint_compare_size
implement
g0uint_max<sizeknd> = g0uint_max_size
implement
g0uint_min<sizeknd> = g0uint_min_size
//
implement
fprint_val<size_t> (out, x) = fprint_size (out, x)
//
implement
g1uint_succ<sizeknd> = g1uint_succ_size
implement
g1uint_pred<sizeknd> = g1uint_pred_size
implement
g1uint_half<sizeknd> = g1uint_half_size
implement
g1uint_add<sizeknd> = g1uint_add_size
implement
g1uint_sub<sizeknd> = g1uint_sub_size
implement
g1uint_mul<sizeknd> = g1uint_mul_size
implement
g1uint_div<sizeknd> = g1uint_div_size
implement
g1uint_mod<sizeknd> = g1uint_mod_size
implement
g1uint_isgtz<sizeknd> = g1uint_isgtz_size
implement
g1uint_iseqz<sizeknd> = g1uint_iseqz_size
implement
g1uint_isneqz<sizeknd> = g1uint_isneqz_size
implement
g1uint_lt<sizeknd> = g1uint_lt_size
implement
g1uint_lte<sizeknd> = g1uint_lte_size
implement
g1uint_gt<sizeknd> = g1uint_gt_size
implement
g1uint_gte<sizeknd> = g1uint_gte_size
implement
g1uint_eq<sizeknd> = g1uint_eq_size
implement
g1uint_neq<sizeknd> = g1uint_neq_size
implement
g1uint_compare<sizeknd> = g1uint_compare_size
implement
g1uint_max<sizeknd> = g1uint_max_size
implement
g1uint_min<sizeknd> = g1uint_min_size

//
(* ****** ****** *)
//
implement
g0int_neg<ssizeknd> = g0int_neg_ssize
implement
g0int_abs<ssizeknd> = g0int_abs_ssize
implement
g0int_succ<ssizeknd> = g0int_succ_ssize
implement
g0int_pred<ssizeknd> = g0int_pred_ssize
implement
g0int_half<ssizeknd> = g0int_half_ssize
implement
g0int_add<ssizeknd> = g0int_add_ssize
implement
g0int_sub<ssizeknd> = g0int_sub_ssize
implement
g0int_mul<ssizeknd> = g0int_mul_ssize
implement
g0int_div<ssizeknd> = g0int_div_ssize
implement
g0int_mod<ssizeknd> = g0int_mod_ssize
implement
g0int_asl<ssizeknd> = g0int_asl_ssize
implement
g0int_asr<ssizeknd> = g0int_asr_ssize
implement
g0int_isltz<ssizeknd> = g0int_isltz_ssize
implement
g0int_isltez<ssizeknd> = g0int_isltez_ssize
implement
g0int_isgtz<ssizeknd> = g0int_isgtz_ssize
implement
g0int_isgtez<ssizeknd> = g0int_isgtez_ssize
implement
g0int_iseqz<ssizeknd> = g0int_iseqz_ssize
implement
g0int_isneqz<ssizeknd> = g0int_isneqz_ssize
implement
g0int_lt<ssizeknd> = g0int_lt_ssize
implement
g0int_lte<ssizeknd> = g0int_lte_ssize
implement
g0int_gt<ssizeknd> = g0int_gt_ssize
implement
g0int_gte<ssizeknd> = g0int_gte_ssize
implement
g0int_eq<ssizeknd> = g0int_eq_ssize
implement
g0int_neq<ssizeknd> = g0int_neq_ssize
implement
g0int_compare<ssizeknd> = g0int_compare_ssize
implement
g0int_max<ssizeknd> = g0int_max_ssize
implement
g0int_min<ssizeknd> = g0int_min_ssize
//
implement
fprint_val<ssize_t> (out, x) = fprint_ssize (out, x)
//
implement
g1int_neg<ssizeknd> = g1int_neg_ssize
implement
g1int_abs<ssizeknd> = g1int_abs_ssize
implement
g1int_succ<ssizeknd> = g1int_succ_ssize
implement
g1int_pred<ssizeknd> = g1int_pred_ssize
implement
g1int_half<ssizeknd> = g1int_half_ssize
implement
g1int_add<ssizeknd> = g1int_add_ssize
implement
g1int_sub<ssizeknd> = g1int_sub_ssize
implement
g1int_mul<ssizeknd> = g1int_mul_ssize
implement
g1int_div<ssizeknd> = g1int_div_ssize
implement
g1int_nmod<ssizeknd> = g1int_nmod_ssize
implement
g1int_isltz<ssizeknd> = g1int_isltz_ssize
implement
g1int_isltez<ssizeknd> = g1int_isltez_ssize
implement
g1int_isgtz<ssizeknd> = g1int_isgtz_ssize
implement
g1int_isgtez<ssizeknd> = g1int_isgtez_ssize
implement
g1int_iseqz<ssizeknd> = g1int_iseqz_ssize
implement
g1int_isneqz<ssizeknd> = g1int_isneqz_ssize
implement
g1int_lt<ssizeknd> = g1int_lt_ssize
implement
g1int_lte<ssizeknd> = g1int_lte_ssize
implement
g1int_gt<ssizeknd> = g1int_gt_ssize
implement
g1int_gte<ssizeknd> = g1int_gte_ssize
implement
g1int_eq<ssizeknd> = g1int_eq_ssize
implement
g1int_neq<ssizeknd> = g1int_neq_ssize
implement
g1int_compare<ssizeknd> = g1int_compare_ssize
implement
g1int_max<ssizeknd> = g1int_max_ssize
implement
g1int_min<ssizeknd> = g1int_min_ssize

//
(* ****** ****** *)

(* end of [integer_size.dats] *)
