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
** $PATSHOME/prelude/DATS/CODEGEN/integer_ptr.atxt
** Time of generation: Sun Nov 20 21:18:24 2016
*)

(* ****** ****** *)

#define
ATS_DYNLOADFLAG 0 // no dynloading

(* ****** ****** *)
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
g0int2int<intknd,intptrknd> = g0int2int_int_intptr
implement
g0int2int<lintknd,intptrknd> = g0int2int_lint_intptr

(* ****** ****** *)

implement
g0uint2uint<uintknd,uintptrknd> = g0uint2uint_uint_uintptr
implement
g0uint2uint<ulintknd,uintptrknd> = g0uint2uint_ulint_uintptr

(* ****** ****** *)
//
implement
g0int_neg<intptrknd> = g0int_neg_intptr
implement
g0int_abs<intptrknd> = g0int_abs_intptr
implement
g0int_succ<intptrknd> = g0int_succ_intptr
implement
g0int_pred<intptrknd> = g0int_pred_intptr
implement
g0int_half<intptrknd> = g0int_half_intptr
implement
g0int_add<intptrknd> = g0int_add_intptr
implement
g0int_sub<intptrknd> = g0int_sub_intptr
implement
g0int_mul<intptrknd> = g0int_mul_intptr
implement
g0int_div<intptrknd> = g0int_div_intptr
implement
g0int_mod<intptrknd> = g0int_mod_intptr
implement
g0int_asl<intptrknd> = g0int_asl_intptr
implement
g0int_asr<intptrknd> = g0int_asr_intptr
implement
g0int_isltz<intptrknd> = g0int_isltz_intptr
implement
g0int_isltez<intptrknd> = g0int_isltez_intptr
implement
g0int_isgtz<intptrknd> = g0int_isgtz_intptr
implement
g0int_isgtez<intptrknd> = g0int_isgtez_intptr
implement
g0int_iseqz<intptrknd> = g0int_iseqz_intptr
implement
g0int_isneqz<intptrknd> = g0int_isneqz_intptr
implement
g0int_lt<intptrknd> = g0int_lt_intptr
implement
g0int_lte<intptrknd> = g0int_lte_intptr
implement
g0int_gt<intptrknd> = g0int_gt_intptr
implement
g0int_gte<intptrknd> = g0int_gte_intptr
implement
g0int_eq<intptrknd> = g0int_eq_intptr
implement
g0int_neq<intptrknd> = g0int_neq_intptr
implement
g0int_compare<intptrknd> = g0int_compare_intptr
implement
g0int_max<intptrknd> = g0int_max_intptr
implement
g0int_min<intptrknd> = g0int_min_intptr
//
implement
fprint_val<intptr> (out, x) = fprint_intptr (out, x)
//
implement
g0uint_succ<uintptrknd> = g0uint_succ_uintptr
implement
g0uint_pred<uintptrknd> = g0uint_pred_uintptr
implement
g0uint_half<uintptrknd> = g0uint_half_uintptr
implement
g0uint_add<uintptrknd> = g0uint_add_uintptr
implement
g0uint_sub<uintptrknd> = g0uint_sub_uintptr
implement
g0uint_mul<uintptrknd> = g0uint_mul_uintptr
implement
g0uint_div<uintptrknd> = g0uint_div_uintptr
implement
g0uint_mod<uintptrknd> = g0uint_mod_uintptr
implement
g0uint_lsl<uintptrknd> = g0uint_lsl_uintptr
implement
g0uint_lsr<uintptrknd> = g0uint_lsr_uintptr
implement
g0uint_lnot<uintptrknd> = g0uint_lnot_uintptr
implement
g0uint_lor<uintptrknd> = g0uint_lor_uintptr
implement
g0uint_lxor<uintptrknd> = g0uint_lxor_uintptr
implement
g0uint_land<uintptrknd> = g0uint_land_uintptr
implement
g0uint_isgtz<uintptrknd> = g0uint_isgtz_uintptr
implement
g0uint_iseqz<uintptrknd> = g0uint_iseqz_uintptr
implement
g0uint_isneqz<uintptrknd> = g0uint_isneqz_uintptr
implement
g0uint_lt<uintptrknd> = g0uint_lt_uintptr
implement
g0uint_lte<uintptrknd> = g0uint_lte_uintptr
implement
g0uint_gt<uintptrknd> = g0uint_gt_uintptr
implement
g0uint_gte<uintptrknd> = g0uint_gte_uintptr
implement
g0uint_eq<uintptrknd> = g0uint_eq_uintptr
implement
g0uint_neq<uintptrknd> = g0uint_neq_uintptr
implement
g0uint_compare<uintptrknd> = g0uint_compare_uintptr
implement
g0uint_max<uintptrknd> = g0uint_max_uintptr
implement
g0uint_min<uintptrknd> = g0uint_min_uintptr
//
implement
fprint_val<uintptr> (out, x) = fprint_uintptr (out, x)
//
(* ****** ****** *)

(* end of [integer_ptr.dats] *)
