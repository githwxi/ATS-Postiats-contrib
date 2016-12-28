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
** $PATSHOME/prelude/SATS/CODEGEN/integer_ptr.atxt
** Time of generation: Sun Nov 20 21:18:16 2016
*)

(* ****** ****** *)
//
// HX: for unindexed integer types
//
(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)

typedef SHR(a:t@ype) = a // for commenting purpose
typedef NSH(a:t@ype) = a // for commenting purpose

(* ****** ****** *)
//
stadef intptrknd = intptr_kind
stadef uintptrknd = uintptr_kind
//
(* ****** ****** *)
//
fun g0int2int_int_intptr(int):<> intptr = "mac#%"
fun g1int2int_int_intptr{i:int}(int(i)):<> intptr(i) = "mac#%"
fun g0int2int_lint_intptr(lint):<> intptr = "mac#%"
fun g1int2int_lint_intptr{i:int}(lint(i)):<> intptr(i) = "mac#%"
//
(* ****** ****** *)
//
fun g0int2uint_int_uintptr(int):<> uintptr = "mac#%"
fun g1int2uint_int_uintptr{i:nat}(int(i)):<> uintptr(i) = "mac#%"
//
(* ****** ****** *)
//
fun g0uint2uint_uint_uintptr(uint):<> uintptr = "mac#%"
fun g1uint2uint_uint_uintptr{u:int}(uint(u)):<> uintptr(u) = "mac#%"
fun g0uint2uint_ulint_uintptr(ulint):<> uintptr = "mac#%"
fun g1uint2uint_ulint_uintptr{u:int}(ulint(u)):<> uintptr(u) = "mac#%"
//
(* ****** ****** *)
//
fun g0int_neg_intptr (x: intptr):<> intptr = "mac#%"
fun g0int_abs_intptr (x: intptr):<> intptr = "mac#%"
fun g0int_succ_intptr (x: intptr):<> intptr = "mac#%"
fun g0int_pred_intptr (x: intptr):<> intptr = "mac#%"
fun g0int_half_intptr (x: intptr):<> intptr = "mac#%"
fun g0int_asl_intptr (x: intptr, n: intGte(0)):<> intptr = "mac#%"
fun g0int_asr_intptr (x: intptr, n: intGte(0)):<> intptr = "mac#%"
fun g0int_add_intptr (x: intptr, y: intptr):<> intptr = "mac#%"
fun g0int_sub_intptr (x: intptr, y: intptr):<> intptr = "mac#%"
fun g0int_mul_intptr (x: intptr, y: intptr):<> intptr = "mac#%"
fun g0int_div_intptr (x: intptr, y: intptr):<> intptr = "mac#%"
fun g0int_mod_intptr (x: intptr, y: intptr):<> intptr = "mac#%"
fun g0int_lt_intptr (x: intptr, y: intptr):<> bool = "mac#%"
fun g0int_lte_intptr (x: intptr, y: intptr):<> bool = "mac#%"
fun g0int_gt_intptr (x: intptr, y: intptr):<> bool = "mac#%"
fun g0int_gte_intptr (x: intptr, y: intptr):<> bool = "mac#%"
fun g0int_eq_intptr (x: intptr, y: intptr):<> bool = "mac#%"
fun g0int_neq_intptr (x: intptr, y: intptr):<> bool = "mac#%"
fun g0int_compare_intptr (x: intptr, y: intptr):<> int = "mac#%"
fun g0int_max_intptr (x: intptr, y: intptr):<> intptr = "mac#%"
fun g0int_min_intptr (x: intptr, y: intptr):<> intptr = "mac#%"
fun g0int_isltz_intptr (x: intptr):<> bool = "mac#%"
fun g0int_isltez_intptr (x: intptr):<> bool = "mac#%"
fun g0int_isgtz_intptr (x: intptr):<> bool = "mac#%"
fun g0int_isgtez_intptr (x: intptr):<> bool = "mac#%"
fun g0int_iseqz_intptr (x: intptr):<> bool = "mac#%"
fun g0int_isneqz_intptr (x: intptr):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun print_intptr (intptr): void = "mac#%"
fun prerr_intptr (intptr): void = "mac#%"
fun fprint_intptr : fprint_type (intptr) = "mac#%"
overload print with print_intptr
overload prerr with prerr_intptr
overload fprint with fprint_intptr
//
(* ****** ****** *)
//
fun g0uint_succ_uintptr (x: uintptr):<> uintptr = "mac#%"
fun g0uint_pred_uintptr (x: uintptr):<> uintptr = "mac#%"
fun g0uint_half_uintptr (x: uintptr):<> uintptr = "mac#%"
fun g0uint_add_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_sub_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_mul_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_div_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_mod_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_lsl_uintptr (x: uintptr, n: intGte(0)):<> uintptr = "mac#%"
fun g0uint_lsr_uintptr (x: uintptr, n: intGte(0)):<> uintptr = "mac#%"
fun g0uint_lnot_uintptr (x: uintptr):<> uintptr = "mac#%"
fun g0uint_lor_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_lxor_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_land_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_lt_uintptr (x: uintptr, y: uintptr):<> bool = "mac#%"
fun g0uint_lte_uintptr (x: uintptr, y: uintptr):<> bool = "mac#%"
fun g0uint_gt_uintptr (x: uintptr, y: uintptr):<> bool = "mac#%"
fun g0uint_gte_uintptr (x: uintptr, y: uintptr):<> bool = "mac#%"
fun g0uint_eq_uintptr (x: uintptr, y: uintptr):<> bool = "mac#%"
fun g0uint_neq_uintptr (x: uintptr, y: uintptr):<> bool = "mac#%"
fun g0uint_compare_uintptr (x: uintptr, y: uintptr):<> int = "mac#%"
fun g0uint_max_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_min_uintptr (x: uintptr, y: uintptr):<> uintptr = "mac#%"
fun g0uint_isgtz_uintptr (x: uintptr):<> bool = "mac#%"
fun g0uint_iseqz_uintptr (x: uintptr):<> bool = "mac#%"
fun g0uint_isneqz_uintptr (x: uintptr):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun print_uintptr (uintptr): void = "mac#%"
fun prerr_uintptr (uintptr): void = "mac#%"
fun fprint_uintptr : fprint_type (uintptr) = "mac#%"
overload print with print_uintptr
overload prerr with prerr_uintptr
overload fprint with fprint_uintptr
//
(* ****** ****** *)
//
fun g1int_neg_intptr : g1int_neg_type (intptrknd) = "mac#%"
fun g1int_abs_intptr : g1int_abs_type (intptrknd) = "mac#%"
fun g1int_succ_intptr : g1int_succ_type (intptrknd) = "mac#%"
fun g1int_pred_intptr : g1int_pred_type (intptrknd) = "mac#%"
fun g1int_half_intptr : g1int_half_type (intptrknd) = "mac#%"
fun g1int_add_intptr : g1int_add_type (intptrknd) = "mac#%"
fun g1int_sub_intptr : g1int_sub_type (intptrknd) = "mac#%"
fun g1int_mul_intptr : g1int_mul_type (intptrknd) = "mac#%"
fun g1int_div_intptr : g1int_div_type (intptrknd) = "mac#%"
fun g1int_nmod_intptr : g1int_nmod_type (intptrknd) = "mac#%"
fun g1int_lt_intptr : g1int_lt_type (intptrknd) = "mac#%"
fun g1int_lte_intptr : g1int_lte_type (intptrknd) = "mac#%"
fun g1int_gt_intptr : g1int_gt_type (intptrknd) = "mac#%"
fun g1int_gte_intptr : g1int_gte_type (intptrknd) = "mac#%"
fun g1int_eq_intptr : g1int_eq_type (intptrknd) = "mac#%"
fun g1int_neq_intptr : g1int_neq_type (intptrknd) = "mac#%"
fun g1int_compare_intptr : g1int_compare_type (intptrknd) = "mac#%"
fun g1int_max_intptr : g1int_max_type (intptrknd) = "mac#%"
fun g1int_min_intptr : g1int_min_type (intptrknd) = "mac#%"
fun g1int_isltz_intptr : g1int_isltz_type (intptrknd) = "mac#%"
fun g1int_isltez_intptr : g1int_isltez_type (intptrknd) = "mac#%"
fun g1int_isgtz_intptr : g1int_isgtz_type (intptrknd) = "mac#%"
fun g1int_isgtez_intptr : g1int_isgtez_type (intptrknd) = "mac#%"
fun g1int_iseqz_intptr : g1int_iseqz_type (intptrknd) = "mac#%"
fun g1int_isneqz_intptr : g1int_isneqz_type (intptrknd) = "mac#%"
//
(* ****** ****** *)
//
fun g1uint_succ_uintptr : g1uint_succ_type (uintptrknd) = "mac#%"
fun g1uint_pred_uintptr : g1uint_pred_type (uintptrknd) = "mac#%"
fun g1uint_half_uintptr : g1uint_half_type (uintptrknd) = "mac#%"
fun g1uint_add_uintptr : g1uint_add_type (uintptrknd) = "mac#%"
fun g1uint_sub_uintptr : g1uint_sub_type (uintptrknd) = "mac#%"
fun g1uint_mul_uintptr : g1uint_mul_type (uintptrknd) = "mac#%"
fun g1uint_div_uintptr : g1uint_div_type (uintptrknd) = "mac#%"
fun g1uint_mod_uintptr : g1uint_mod_type (uintptrknd) = "mac#%"
fun g1uint_lt_uintptr : g1uint_lt_type (uintptrknd) = "mac#%"
fun g1uint_lte_uintptr : g1uint_lte_type (uintptrknd) = "mac#%"
fun g1uint_gt_uintptr : g1uint_gt_type (uintptrknd) = "mac#%"
fun g1uint_gte_uintptr : g1uint_gte_type (uintptrknd) = "mac#%"
fun g1uint_eq_uintptr : g1uint_eq_type (uintptrknd) = "mac#%"
fun g1uint_neq_uintptr : g1uint_neq_type (uintptrknd) = "mac#%"
fun g1uint_compare_uintptr : g1uint_compare_type (uintptrknd) = "mac#%"
fun g1uint_max_uintptr : g1uint_max_type (uintptrknd) = "mac#%"
fun g1uint_min_uintptr : g1uint_min_type (uintptrknd) = "mac#%"
fun g1uint_isgtz_uintptr : g1uint_isgtz_type (uintptrknd) = "mac#%"
fun g1uint_iseqz_uintptr : g1uint_iseqz_type (uintptrknd) = "mac#%"
fun g1uint_isneqz_uintptr : g1uint_isneqz_type (uintptrknd) = "mac#%"
//
(* ****** ****** *)
//
macdef i2ptr (x) = g1int2int_int_intptr (,(x))
//
macdef u2ptr (x) = g1uint2uint_uint_uintptr (,(x))
//
(* ****** ****** *)

(* end of [integer_ptr.sats] *)
