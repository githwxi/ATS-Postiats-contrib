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
** $PATSHOME/prelude/DATS/CODEGEN/integer_short.atxt
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
g0int2int<sintknd,intknd> = g0int2int_sint_int
implement
g0int2uint<sintknd,uintknd> = g0int2uint_sint_uint
//
(* ****** ****** *)
//
implement
g0uint2int<usintknd,intknd> = g0uint2int_usint_int
implement
g0uint2uint<usintknd,uintknd> = g0uint2uint_usint_uint
//
(* ****** ****** *)
//
implement
g0int_neg<sintknd> = g0int_neg_sint
implement
g0int_abs<sintknd> = g0int_abs_sint
implement
g0int_succ<sintknd> = g0int_succ_sint
implement
g0int_pred<sintknd> = g0int_pred_sint
implement
g0int_half<sintknd> = g0int_half_sint
implement
g0int_add<sintknd> = g0int_add_sint
implement
g0int_sub<sintknd> = g0int_sub_sint
implement
g0int_mul<sintknd> = g0int_mul_sint
implement
g0int_div<sintknd> = g0int_div_sint
implement
g0int_mod<sintknd> = g0int_mod_sint
implement
g0int_asl<sintknd> = g0int_asl_sint
implement
g0int_asr<sintknd> = g0int_asr_sint
implement
g0int_isltz<sintknd> = g0int_isltz_sint
implement
g0int_isltez<sintknd> = g0int_isltez_sint
implement
g0int_isgtz<sintknd> = g0int_isgtz_sint
implement
g0int_isgtez<sintknd> = g0int_isgtez_sint
implement
g0int_iseqz<sintknd> = g0int_iseqz_sint
implement
g0int_isneqz<sintknd> = g0int_isneqz_sint
implement
g0int_lt<sintknd> = g0int_lt_sint
implement
g0int_lte<sintknd> = g0int_lte_sint
implement
g0int_gt<sintknd> = g0int_gt_sint
implement
g0int_gte<sintknd> = g0int_gte_sint
implement
g0int_eq<sintknd> = g0int_eq_sint
implement
g0int_neq<sintknd> = g0int_neq_sint
implement
g0int_compare<sintknd> = g0int_compare_sint
implement
g0int_max<sintknd> = g0int_max_sint
implement
g0int_min<sintknd> = g0int_min_sint
//
implement
fprint_val<sint> (out, x) = fprint_sint (out, x)
//
implement
g0uint_succ<usintknd> = g0uint_succ_usint
implement
g0uint_pred<usintknd> = g0uint_pred_usint
implement
g0uint_half<usintknd> = g0uint_half_usint
implement
g0uint_add<usintknd> = g0uint_add_usint
implement
g0uint_sub<usintknd> = g0uint_sub_usint
implement
g0uint_mul<usintknd> = g0uint_mul_usint
implement
g0uint_div<usintknd> = g0uint_div_usint
implement
g0uint_mod<usintknd> = g0uint_mod_usint
implement
g0uint_lsl<usintknd> = g0uint_lsl_usint
implement
g0uint_lsr<usintknd> = g0uint_lsr_usint
implement
g0uint_lnot<usintknd> = g0uint_lnot_usint
implement
g0uint_lor<usintknd> = g0uint_lor_usint
implement
g0uint_lxor<usintknd> = g0uint_lxor_usint
implement
g0uint_land<usintknd> = g0uint_land_usint
implement
g0uint_isgtz<usintknd> = g0uint_isgtz_usint
implement
g0uint_iseqz<usintknd> = g0uint_iseqz_usint
implement
g0uint_isneqz<usintknd> = g0uint_isneqz_usint
implement
g0uint_lt<usintknd> = g0uint_lt_usint
implement
g0uint_lte<usintknd> = g0uint_lte_usint
implement
g0uint_gt<usintknd> = g0uint_gt_usint
implement
g0uint_gte<usintknd> = g0uint_gte_usint
implement
g0uint_eq<usintknd> = g0uint_eq_usint
implement
g0uint_neq<usintknd> = g0uint_neq_usint
implement
g0uint_compare<usintknd> = g0uint_compare_usint
implement
g0uint_max<usintknd> = g0uint_max_usint
implement
g0uint_min<usintknd> = g0uint_min_usint
//
implement
fprint_val<usint> (out, x) = fprint_usint (out, x)
//
(* ****** ****** *)

(* end of [integer_short.dats] *)
