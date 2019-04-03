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
** $PATSHOME/prelude/SATS/CODEGEN/integer_long.atxt
** Time of generation: Sun Nov 20 21:18:14 2016
*)

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)
//
stadef lintknd = lint_kind
stadef ulintknd = ulint_kind
//
stadef llintknd = llint_kind
stadef ullintknd = ullint_kind
//
(* ****** ****** *)
//
fun g0int2int_int_lint(int):<> lint = "mac#%"
fun g0uint2int_uint_lint(uint):<> lint = "mac#%"
//
fun g0int2uint_int_ulint(int):<> ulint = "mac#%"
fun g0uint2uint_uint_ulint(uint):<> ulint = "mac#%"
//
(* ****** ****** *)
//
fun g0int2int_lint_int(lint):<> int = "mac#%"
fun g0int2int_lint_lint(lint):<> lint = "mac#%"
fun g0int2int_lint_llint(lint):<> llint = "mac#%"
//
fun g0int2uint_lint_uint(lint):<> uint = "mac#%"
fun g0int2uint_lint_ulint(lint):<> ulint = "mac#%"
fun g0int2uint_lint_ullint(lint):<> ullint = "mac#%"
//
(* ****** ****** *)
//
fun g0uint2int_ulint_int(ulint):<> int = "mac#%"
fun g0uint2int_ulint_lint(ulint):<> lint = "mac#%"
fun g0uint2int_ulint_llint(ulint):<> llint = "mac#%"
//
fun g0uint2uint_ulint_uint(ulint):<> uint = "mac#%"
fun g0uint2uint_ulint_ulint(ulint):<> ulint = "mac#%"
fun g0uint2uint_ulint_ullint(ulint):<> ullint = "mac#%"
//
(* ****** ****** *)
//
fun g0int2int_int_llint(int):<> llint = "mac#%"
fun g0uint2int_uint_llint(uint):<> llint = "mac#%"
//
fun g0int2uint_int_ullint(int):<> ullint = "mac#%"
fun g0uint2uint_uint_ullint(uint):<> ullint = "mac#%"
//
(* ****** ****** *)
//
fun g0int2int_llint_int(llint):<> int = "mac#%"
fun g0int2int_llint_lint(llint):<> lint = "mac#%"
fun g0int2int_llint_llint(llint):<> llint = "mac#%"
//
fun g0int2uint_llint_uint(llint):<> uint = "mac#%"
fun g0int2uint_llint_ulint(llint):<> ulint = "mac#%"
fun g0int2uint_llint_ullint(llint):<> ullint = "mac#%"
//
(* ****** ****** *)
//
fun g0uint2int_ullint_int(ullint):<> int = "mac#%"
fun g0uint2int_ullint_lint(ullint):<> lint = "mac#%"
fun g0uint2int_ullint_llint(ullint):<> llint = "mac#%"
//
fun g0uint2uint_ullint_uint(ullint):<> uint = "mac#%"
fun g0uint2uint_ullint_ulint(ullint):<> ulint = "mac#%"
fun g0uint2uint_ullint_ullint(ullint):<> ullint = "mac#%"
//
(* ****** ****** *)
//
fun
g0int2string_lint(i0: lint):<!wrt> Strptr1 = "mac#%"
fun
g0int2string_llint(i0: llint):<!wrt> Strptr1 = "mac#%"
//
fun
g0uint2string_ulint(u0: ulint):<!wrt> Strptr1 = "mac#%"
fun
g0uint2string_ullint(u0: ullint):<!wrt> Strptr1 = "mac#%"
//
(* ****** ****** *)
//
fun
g0string2int_lint(rep: NSH(string)):<> lint = "mac#%"
fun
g0string2int_llint(rep: NSH(string)):<> llint = "mac#%"
//
fun
g0string2uint_ulint(rep: NSH(string)):<> ulint = "mac#%"
fun
g0string2uint_ullint(rep: NSH(string)):<> ullint = "mac#%"
//
(* ****** ****** *)
//
fun print_lint (lint): void = "mac#%"
fun prerr_lint (lint): void = "mac#%"
fun fprint_lint : fprint_type (lint) = "mac#%"
overload print with print_lint
overload prerr with prerr_lint
overload fprint with fprint_lint
//
fun print_ulint (ulint): void = "mac#%"
fun prerr_ulint (ulint): void = "mac#%"
fun fprint_ulint : fprint_type (ulint) = "mac#%"
overload print with print_ulint
overload prerr with prerr_ulint
overload fprint with fprint_ulint
//
fun print_llint (llint): void = "mac#%"
fun prerr_llint (llint): void = "mac#%"
fun fprint_llint : fprint_type (llint) = "mac#%"
overload print with print_llint
overload prerr with prerr_llint
overload fprint with fprint_llint
//
fun print_ullint (ullint): void = "mac#%"
fun prerr_ullint (ullint): void = "mac#%"
fun fprint_ullint : fprint_type (ullint) = "mac#%"
overload print with print_ullint
overload prerr with prerr_ullint
overload fprint with fprint_ullint
//
(* ****** ****** *)
//
fun g0int_neg_lint (x: lint):<> lint = "mac#%"
fun g0int_abs_lint (x: lint):<> lint = "mac#%"
fun g0int_succ_lint (x: lint):<> lint = "mac#%"
fun g0int_pred_lint (x: lint):<> lint = "mac#%"
fun g0int_half_lint (x: lint):<> lint = "mac#%"
fun g0int_asl_lint (x: lint, n: intGte(0)):<> lint = "mac#%"
fun g0int_asr_lint (x: lint, n: intGte(0)):<> lint = "mac#%"
fun g0int_add_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_sub_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_mul_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_div_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_mod_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_lt_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_lte_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_gt_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_gte_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_eq_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_neq_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_compare_lint (x: lint, y: lint):<> int = "mac#%"
fun g0int_max_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_min_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_isltz_lint (x: lint):<> bool = "mac#%"
fun g0int_isltez_lint (x: lint):<> bool = "mac#%"
fun g0int_isgtz_lint (x: lint):<> bool = "mac#%"
fun g0int_isgtez_lint (x: lint):<> bool = "mac#%"
fun g0int_iseqz_lint (x: lint):<> bool = "mac#%"
fun g0int_isneqz_lint (x: lint):<> bool = "mac#%"
//
fun g0uint_succ_ulint (x: ulint):<> ulint = "mac#%"
fun g0uint_pred_ulint (x: ulint):<> ulint = "mac#%"
fun g0uint_half_ulint (x: ulint):<> ulint = "mac#%"
fun g0uint_add_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_sub_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_mul_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_div_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_mod_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_lsl_ulint (x: ulint, n: intGte(0)):<> ulint = "mac#%"
fun g0uint_lsr_ulint (x: ulint, n: intGte(0)):<> ulint = "mac#%"
fun g0uint_lnot_ulint (x: ulint):<> ulint = "mac#%"
fun g0uint_lor_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_lxor_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_land_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_lt_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_lte_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_gt_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_gte_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_eq_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_neq_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_compare_ulint (x: ulint, y: ulint):<> int = "mac#%"
fun g0uint_max_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_min_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_isgtz_ulint (x: ulint):<> bool = "mac#%"
fun g0uint_iseqz_ulint (x: ulint):<> bool = "mac#%"
fun g0uint_isneqz_ulint (x: ulint):<> bool = "mac#%"
//
fun g0int_neg_llint (x: llint):<> llint = "mac#%"
fun g0int_abs_llint (x: llint):<> llint = "mac#%"
fun g0int_succ_llint (x: llint):<> llint = "mac#%"
fun g0int_pred_llint (x: llint):<> llint = "mac#%"
fun g0int_half_llint (x: llint):<> llint = "mac#%"
fun g0int_asl_llint (x: llint, n: intGte(0)):<> llint = "mac#%"
fun g0int_asr_llint (x: llint, n: intGte(0)):<> llint = "mac#%"
fun g0int_add_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_sub_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_mul_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_div_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_mod_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_lt_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_lte_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_gt_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_gte_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_eq_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_neq_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_compare_llint (x: llint, y: llint):<> int = "mac#%"
fun g0int_max_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_min_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_isltz_llint (x: llint):<> bool = "mac#%"
fun g0int_isltez_llint (x: llint):<> bool = "mac#%"
fun g0int_isgtz_llint (x: llint):<> bool = "mac#%"
fun g0int_isgtez_llint (x: llint):<> bool = "mac#%"
fun g0int_iseqz_llint (x: llint):<> bool = "mac#%"
fun g0int_isneqz_llint (x: llint):<> bool = "mac#%"
//
fun g0uint_succ_ullint (x: ullint):<> ullint = "mac#%"
fun g0uint_pred_ullint (x: ullint):<> ullint = "mac#%"
fun g0uint_half_ullint (x: ullint):<> ullint = "mac#%"
fun g0uint_add_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_sub_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_mul_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_div_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_mod_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_lsl_ullint (x: ullint, n: intGte(0)):<> ullint = "mac#%"
fun g0uint_lsr_ullint (x: ullint, n: intGte(0)):<> ullint = "mac#%"
fun g0uint_lnot_ullint (x: ullint):<> ullint = "mac#%"
fun g0uint_lor_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_lxor_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_land_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_lt_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_lte_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_gt_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_gte_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_eq_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_neq_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_compare_ullint (x: ullint, y: ullint):<> int = "mac#%"
fun g0uint_max_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_min_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_isgtz_ullint (x: ullint):<> bool = "mac#%"
fun g0uint_iseqz_ullint (x: ullint):<> bool = "mac#%"
fun g0uint_isneqz_ullint (x: ullint):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun g1int_neg_lint : g1int_neg_type (lintknd) = "mac#%"
fun g1int_abs_lint : g1int_abs_type (lintknd) = "mac#%"
fun g1int_succ_lint : g1int_succ_type (lintknd) = "mac#%"
fun g1int_pred_lint : g1int_pred_type (lintknd) = "mac#%"
fun g1int_half_lint : g1int_half_type (lintknd) = "mac#%"
fun g1int_add_lint : g1int_add_type (lintknd) = "mac#%"
fun g1int_sub_lint : g1int_sub_type (lintknd) = "mac#%"
fun g1int_mul_lint : g1int_mul_type (lintknd) = "mac#%"
fun g1int_div_lint : g1int_div_type (lintknd) = "mac#%"
fun g1int_nmod_lint : g1int_nmod_type (lintknd) = "mac#%"
fun g1int_lt_lint : g1int_lt_type (lintknd) = "mac#%"
fun g1int_lte_lint : g1int_lte_type (lintknd) = "mac#%"
fun g1int_gt_lint : g1int_gt_type (lintknd) = "mac#%"
fun g1int_gte_lint : g1int_gte_type (lintknd) = "mac#%"
fun g1int_eq_lint : g1int_eq_type (lintknd) = "mac#%"
fun g1int_neq_lint : g1int_neq_type (lintknd) = "mac#%"
fun g1int_compare_lint : g1int_compare_type (lintknd) = "mac#%"
fun g1int_max_lint : g1int_max_type (lintknd) = "mac#%"
fun g1int_min_lint : g1int_min_type (lintknd) = "mac#%"
fun g1int_isltz_lint : g1int_isltz_type (lintknd) = "mac#%"
fun g1int_isltez_lint : g1int_isltez_type (lintknd) = "mac#%"
fun g1int_isgtz_lint : g1int_isgtz_type (lintknd) = "mac#%"
fun g1int_isgtez_lint : g1int_isgtez_type (lintknd) = "mac#%"
fun g1int_iseqz_lint : g1int_iseqz_type (lintknd) = "mac#%"
fun g1int_isneqz_lint : g1int_isneqz_type (lintknd) = "mac#%"
//
fun g1uint_succ_ulint : g1uint_succ_type (ulintknd) = "mac#%"
fun g1uint_pred_ulint : g1uint_pred_type (ulintknd) = "mac#%"
fun g1uint_half_ulint : g1uint_half_type (ulintknd) = "mac#%"
fun g1uint_add_ulint : g1uint_add_type (ulintknd) = "mac#%"
fun g1uint_sub_ulint : g1uint_sub_type (ulintknd) = "mac#%"
fun g1uint_mul_ulint : g1uint_mul_type (ulintknd) = "mac#%"
fun g1uint_div_ulint : g1uint_div_type (ulintknd) = "mac#%"
fun g1uint_mod_ulint : g1uint_mod_type (ulintknd) = "mac#%"
fun g1uint_lt_ulint : g1uint_lt_type (ulintknd) = "mac#%"
fun g1uint_lte_ulint : g1uint_lte_type (ulintknd) = "mac#%"
fun g1uint_gt_ulint : g1uint_gt_type (ulintknd) = "mac#%"
fun g1uint_gte_ulint : g1uint_gte_type (ulintknd) = "mac#%"
fun g1uint_eq_ulint : g1uint_eq_type (ulintknd) = "mac#%"
fun g1uint_neq_ulint : g1uint_neq_type (ulintknd) = "mac#%"
fun g1uint_compare_ulint : g1uint_compare_type (ulintknd) = "mac#%"
fun g1uint_max_ulint : g1uint_max_type (ulintknd) = "mac#%"
fun g1uint_min_ulint : g1uint_min_type (ulintknd) = "mac#%"
fun g1uint_isgtz_ulint : g1uint_isgtz_type (ulintknd) = "mac#%"
fun g1uint_iseqz_ulint : g1uint_iseqz_type (ulintknd) = "mac#%"
fun g1uint_isneqz_ulint : g1uint_isneqz_type (ulintknd) = "mac#%"
//
fun g1int_neg_llint : g1int_neg_type (llintknd) = "mac#%"
fun g1int_abs_llint : g1int_abs_type (llintknd) = "mac#%"
fun g1int_succ_llint : g1int_succ_type (llintknd) = "mac#%"
fun g1int_pred_llint : g1int_pred_type (llintknd) = "mac#%"
fun g1int_half_llint : g1int_half_type (llintknd) = "mac#%"
fun g1int_add_llint : g1int_add_type (llintknd) = "mac#%"
fun g1int_sub_llint : g1int_sub_type (llintknd) = "mac#%"
fun g1int_mul_llint : g1int_mul_type (llintknd) = "mac#%"
fun g1int_div_llint : g1int_div_type (llintknd) = "mac#%"
fun g1int_nmod_llint : g1int_nmod_type (llintknd) = "mac#%"
fun g1int_lt_llint : g1int_lt_type (llintknd) = "mac#%"
fun g1int_lte_llint : g1int_lte_type (llintknd) = "mac#%"
fun g1int_gt_llint : g1int_gt_type (llintknd) = "mac#%"
fun g1int_gte_llint : g1int_gte_type (llintknd) = "mac#%"
fun g1int_eq_llint : g1int_eq_type (llintknd) = "mac#%"
fun g1int_neq_llint : g1int_neq_type (llintknd) = "mac#%"
fun g1int_compare_llint : g1int_compare_type (llintknd) = "mac#%"
fun g1int_max_llint : g1int_max_type (llintknd) = "mac#%"
fun g1int_min_llint : g1int_min_type (llintknd) = "mac#%"
fun g1int_isltz_llint : g1int_isltz_type (llintknd) = "mac#%"
fun g1int_isltez_llint : g1int_isltez_type (llintknd) = "mac#%"
fun g1int_isgtz_llint : g1int_isgtz_type (llintknd) = "mac#%"
fun g1int_isgtez_llint : g1int_isgtez_type (llintknd) = "mac#%"
fun g1int_iseqz_llint : g1int_iseqz_type (llintknd) = "mac#%"
fun g1int_isneqz_llint : g1int_isneqz_type (llintknd) = "mac#%"
//
fun g1uint_succ_ullint : g1uint_succ_type (ullintknd) = "mac#%"
fun g1uint_pred_ullint : g1uint_pred_type (ullintknd) = "mac#%"
fun g1uint_half_ullint : g1uint_half_type (ullintknd) = "mac#%"
fun g1uint_add_ullint : g1uint_add_type (ullintknd) = "mac#%"
fun g1uint_sub_ullint : g1uint_sub_type (ullintknd) = "mac#%"
fun g1uint_mul_ullint : g1uint_mul_type (ullintknd) = "mac#%"
fun g1uint_div_ullint : g1uint_div_type (ullintknd) = "mac#%"
fun g1uint_mod_ullint : g1uint_mod_type (ullintknd) = "mac#%"
fun g1uint_lt_ullint : g1uint_lt_type (ullintknd) = "mac#%"
fun g1uint_lte_ullint : g1uint_lte_type (ullintknd) = "mac#%"
fun g1uint_gt_ullint : g1uint_gt_type (ullintknd) = "mac#%"
fun g1uint_gte_ullint : g1uint_gte_type (ullintknd) = "mac#%"
fun g1uint_eq_ullint : g1uint_eq_type (ullintknd) = "mac#%"
fun g1uint_neq_ullint : g1uint_neq_type (ullintknd) = "mac#%"
fun g1uint_compare_ullint : g1uint_compare_type (ullintknd) = "mac#%"
fun g1uint_max_ullint : g1uint_max_type (ullintknd) = "mac#%"
fun g1uint_min_ullint : g1uint_min_type (ullintknd) = "mac#%"
fun g1uint_isgtz_ullint : g1uint_isgtz_type (ullintknd) = "mac#%"
fun g1uint_iseqz_ullint : g1uint_iseqz_type (ullintknd) = "mac#%"
fun g1uint_isneqz_ullint : g1uint_isneqz_type (ullintknd) = "mac#%"
//
(* ****** ****** *)
//
fun
g1int2int_int_lint:
g1int2int_type(intknd, lintknd) = "mac#%"
fun
g1int2int_int_llint:
g1int2int_type(intknd, llintknd) = "mac#%"
//
fun
g1int2int_lint_lint:
g1int2int_type(lintknd, lintknd) = "mac#%"
fun
g1int2int_lint_llint:
g1int2int_type(lintknd, llintknd) = "mac#%"
//
(* ****** ****** *)
//
fun
g1int2uint_int_ulint:
g1int2uint_type(intknd, ulintknd) = "mac#%"
fun
g1int2uint_int_ullint:
g1int2uint_type(intknd, ullintknd) = "mac#%"
//
(* ****** ****** *)
//
fun
g1uint2int_uint_lint:
g1uint2int_type(uintknd, lintknd) = "mac#%"
fun
g1uint2int_uint_llint:
g1uint2int_type(uintknd, llintknd) = "mac#%"
//
fun
g1uint2uint_uint_ulint:
g1uint2uint_type(uintknd, ulintknd) = "mac#%"
fun
g1uint2uint_uint_ullint:
g1uint2uint_type(uintknd, ullintknd) = "mac#%"
//
fun
g1uint2uint_ulint_uint:
g1uint2uint_type(uintknd, uintknd) = "mac#%"
fun
g1uint2uint_ulint_ulint:
g1uint2uint_type(uintknd, ulintknd) = "mac#%"
fun
g1uint2uint_ulint_ullint:
g1uint2uint_type(uintknd, ullintknd) = "mac#%"
//
(* ****** ****** *)

(* end of [integer_long.sats] *)
