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
** $PATSHOME/prelude/SATS/CODEGEN/integer_short.atxt
** Time of generation: Sun Nov 20 21:18:15 2016
*)

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)
//
stadef sintknd = sint_kind
stadef usintknd = usint_kind
//
(* ****** ****** *)
//
fun g0int2int_int_sint(int):<> sint = "mac#%"
fun g0uint2int_uint_sint(uint):<> sint = "mac#%"
//
fun g0int2uint_int_usint(int):<> usint = "mac#%"
fun g0uint2uint_uint_usint(uint):<> usint = "mac#%"
//
(* ****** ****** *)

fun g0int2uint_sint_usint(sint):<> usint = "mac#%"
fun g0uint2int_usint_sint(usint):<> sint = "mac#%"

(* ****** ****** *)
//
fun g0int2int_sint_int(sint):<> int = "mac#%"
fun g0int2uint_sint_uint(sint):<> uint = "mac#%"
//
(* ****** ****** *)
//
fun g0uint2int_usint_int(usint):<> int = "mac#%"
fun g0uint2uint_usint_uint(usint):<> uint = "mac#%"
//
(* ****** ****** *)
//
fun print_sint (sint): void = "mac#%"
fun prerr_sint (sint): void = "mac#%"
fun fprint_sint : fprint_type (sint) = "mac#%"
overload print with print_sint
overload prerr with prerr_sint
overload fprint with fprint_sint
fun print_usint (usint): void = "mac#%"
fun prerr_usint (usint): void = "mac#%"
fun fprint_usint : fprint_type (usint) = "mac#%"
overload print with print_usint
overload prerr with prerr_usint
overload fprint with fprint_usint
//
(* ****** ****** *)
//
fun g0int_neg_sint (x: sint):<> sint = "mac#%"
fun g0int_abs_sint (x: sint):<> sint = "mac#%"
fun g0int_succ_sint (x: sint):<> sint = "mac#%"
fun g0int_pred_sint (x: sint):<> sint = "mac#%"
fun g0int_half_sint (x: sint):<> sint = "mac#%"
fun g0int_asl_sint (x: sint, n: intGte(0)):<> sint = "mac#%"
fun g0int_asr_sint (x: sint, n: intGte(0)):<> sint = "mac#%"
fun g0int_add_sint (x: sint, y: sint):<> sint = "mac#%"
fun g0int_sub_sint (x: sint, y: sint):<> sint = "mac#%"
fun g0int_mul_sint (x: sint, y: sint):<> sint = "mac#%"
fun g0int_div_sint (x: sint, y: sint):<> sint = "mac#%"
fun g0int_mod_sint (x: sint, y: sint):<> sint = "mac#%"
fun g0int_lt_sint (x: sint, y: sint):<> bool = "mac#%"
fun g0int_lte_sint (x: sint, y: sint):<> bool = "mac#%"
fun g0int_gt_sint (x: sint, y: sint):<> bool = "mac#%"
fun g0int_gte_sint (x: sint, y: sint):<> bool = "mac#%"
fun g0int_eq_sint (x: sint, y: sint):<> bool = "mac#%"
fun g0int_neq_sint (x: sint, y: sint):<> bool = "mac#%"
fun g0int_compare_sint (x: sint, y: sint):<> int = "mac#%"
fun g0int_max_sint (x: sint, y: sint):<> sint = "mac#%"
fun g0int_min_sint (x: sint, y: sint):<> sint = "mac#%"
fun g0int_isltz_sint (x: sint):<> bool = "mac#%"
fun g0int_isltez_sint (x: sint):<> bool = "mac#%"
fun g0int_isgtz_sint (x: sint):<> bool = "mac#%"
fun g0int_isgtez_sint (x: sint):<> bool = "mac#%"
fun g0int_iseqz_sint (x: sint):<> bool = "mac#%"
fun g0int_isneqz_sint (x: sint):<> bool = "mac#%"
fun g0uint_succ_usint (x: usint):<> usint = "mac#%"
fun g0uint_pred_usint (x: usint):<> usint = "mac#%"
fun g0uint_half_usint (x: usint):<> usint = "mac#%"
fun g0uint_add_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_sub_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_mul_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_div_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_mod_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_lsl_usint (x: usint, n: intGte(0)):<> usint = "mac#%"
fun g0uint_lsr_usint (x: usint, n: intGte(0)):<> usint = "mac#%"
fun g0uint_lnot_usint (x: usint):<> usint = "mac#%"
fun g0uint_lor_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_lxor_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_land_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_lt_usint (x: usint, y: usint):<> bool = "mac#%"
fun g0uint_lte_usint (x: usint, y: usint):<> bool = "mac#%"
fun g0uint_gt_usint (x: usint, y: usint):<> bool = "mac#%"
fun g0uint_gte_usint (x: usint, y: usint):<> bool = "mac#%"
fun g0uint_eq_usint (x: usint, y: usint):<> bool = "mac#%"
fun g0uint_neq_usint (x: usint, y: usint):<> bool = "mac#%"
fun g0uint_compare_usint (x: usint, y: usint):<> int = "mac#%"
fun g0uint_max_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_min_usint (x: usint, y: usint):<> usint = "mac#%"
fun g0uint_isgtz_usint (x: usint):<> bool = "mac#%"
fun g0uint_iseqz_usint (x: usint):<> bool = "mac#%"
fun g0uint_isneqz_usint (x: usint):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun g1int_neg_sint : g1int_neg_type (sintknd) = "mac#%"
fun g1int_abs_sint : g1int_abs_type (sintknd) = "mac#%"
fun g1int_succ_sint : g1int_succ_type (sintknd) = "mac#%"
fun g1int_pred_sint : g1int_pred_type (sintknd) = "mac#%"
fun g1int_half_sint : g1int_half_type (sintknd) = "mac#%"
fun g1int_add_sint : g1int_add_type (sintknd) = "mac#%"
fun g1int_sub_sint : g1int_sub_type (sintknd) = "mac#%"
fun g1int_mul_sint : g1int_mul_type (sintknd) = "mac#%"
fun g1int_div_sint : g1int_div_type (sintknd) = "mac#%"
fun g1int_nmod_sint : g1int_nmod_type (sintknd) = "mac#%"
fun g1int_lt_sint : g1int_lt_type (sintknd) = "mac#%"
fun g1int_lte_sint : g1int_lte_type (sintknd) = "mac#%"
fun g1int_gt_sint : g1int_gt_type (sintknd) = "mac#%"
fun g1int_gte_sint : g1int_gte_type (sintknd) = "mac#%"
fun g1int_eq_sint : g1int_eq_type (sintknd) = "mac#%"
fun g1int_neq_sint : g1int_neq_type (sintknd) = "mac#%"
fun g1int_compare_sint : g1int_compare_type (sintknd) = "mac#%"
fun g1int_max_sint : g1int_max_type (sintknd) = "mac#%"
fun g1int_min_sint : g1int_min_type (sintknd) = "mac#%"
fun g1int_isltz_sint : g1int_isltz_type (sintknd) = "mac#%"
fun g1int_isltez_sint : g1int_isltez_type (sintknd) = "mac#%"
fun g1int_isgtz_sint : g1int_isgtz_type (sintknd) = "mac#%"
fun g1int_isgtez_sint : g1int_isgtez_type (sintknd) = "mac#%"
fun g1int_iseqz_sint : g1int_iseqz_type (sintknd) = "mac#%"
fun g1int_isneqz_sint : g1int_isneqz_type (sintknd) = "mac#%"
fun g1uint_succ_usint : g1uint_succ_type (usintknd) = "mac#%"
fun g1uint_pred_usint : g1uint_pred_type (usintknd) = "mac#%"
fun g1uint_half_usint : g1uint_half_type (usintknd) = "mac#%"
fun g1uint_add_usint : g1uint_add_type (usintknd) = "mac#%"
fun g1uint_sub_usint : g1uint_sub_type (usintknd) = "mac#%"
fun g1uint_mul_usint : g1uint_mul_type (usintknd) = "mac#%"
fun g1uint_div_usint : g1uint_div_type (usintknd) = "mac#%"
fun g1uint_mod_usint : g1uint_mod_type (usintknd) = "mac#%"
fun g1uint_lt_usint : g1uint_lt_type (usintknd) = "mac#%"
fun g1uint_lte_usint : g1uint_lte_type (usintknd) = "mac#%"
fun g1uint_gt_usint : g1uint_gt_type (usintknd) = "mac#%"
fun g1uint_gte_usint : g1uint_gte_type (usintknd) = "mac#%"
fun g1uint_eq_usint : g1uint_eq_type (usintknd) = "mac#%"
fun g1uint_neq_usint : g1uint_neq_type (usintknd) = "mac#%"
fun g1uint_compare_usint : g1uint_compare_type (usintknd) = "mac#%"
fun g1uint_max_usint : g1uint_max_type (usintknd) = "mac#%"
fun g1uint_min_usint : g1uint_min_type (usintknd) = "mac#%"
fun g1uint_isgtz_usint : g1uint_isgtz_type (usintknd) = "mac#%"
fun g1uint_iseqz_usint : g1uint_iseqz_type (usintknd) = "mac#%"
fun g1uint_isneqz_usint : g1uint_isneqz_type (usintknd) = "mac#%"
//
(* ****** ****** *)

(* end of [integer_short.sats] *)
