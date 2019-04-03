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
** $PATSHOME/prelude/SATS/CODEGEN/integer_size.atxt
** Time of generation: Sun Nov 20 21:18:15 2016
*)

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)
//
stadef sizeknd = size_kind
stadef ssizeknd = ssize_kind
//
(* ****** ****** *)
//
fun g0int2uint_int_size(int):<> size_t = "mac#%"
fun g0uint2uint_uint_size(uint):<> size_t = "mac#%"
//
fun g0int2int_int_ssize(int):<> ssize_t = "mac#%"
fun g0uint2int_uint_ssize(uint):<> ssize_t = "mac#%"
//
(* ****** ****** *)
//
fun g0int2uint_lint_size(lint):<> size_t = "mac#%"
fun g0uint2uint_ulint_size(ulint):<> size_t = "mac#%"
//
fun g0int2int_lint_ssize(lint):<> ssize_t = "mac#%"
fun g0uint2int_ulint_ssize(ulint):<> ssize_t = "mac#%"
//
(* ****** ****** *)
//
fun g0uint2int_size_int(size_t):<> int = "mac#%"
fun g0uint2int_size_lint(size_t):<> lint = "mac#%"
fun g0uint2int_size_llint(size_t):<> llint = "mac#%"
//
fun g0uint2int_size_ssize(size_t):<> ssize_t = "mac#%"
//
fun g0uint2uint_size_uint(size_t):<> uint = "mac#%"
fun g0uint2uint_size_ulint(size_t):<> ulint = "mac#%"
fun g0uint2uint_size_ullint(size_t):<> ullint = "mac#%"
//
fun g0uint2uint_size_size(sz: size_t):<> size_t = "mac#%"
//
(* ****** ****** *)
//
fun g0int2int_ssize_int(ssize_t):<> int = "mac#%"
fun g0int2int_ssize_lint(ssize_t):<> lint = "mac#%"
fun g0int2int_ssize_llint(ssize_t):<> llint = "mac#%"
//
fun g0int2int_ssize_ssize(ssize_t):<> ssize_t = "mac#%"
//
fun g0int2uint_ssize_uint(ssize_t):<> uint = "mac#%"
fun g0int2uint_ssize_ulint(ssize_t):<> ulint = "mac#%"
fun g0int2uint_ssize_ullint(ssize_t):<> ullint = "mac#%"
//
fun g0int2uint_ssize_size(ssz: ssize_t):<> size_t = "mac#%"
//
(* ****** ****** *)
//
fun g0uint2string_size(sz: size_t):<!wrt> Strptr1 = "mac#%"
fun g0string2uint_size(rep: NSH(string)):<> size_t = "mac#%"
//
fun g0int2string_ssize(ssz: ssize_t):<!wrt> Strptr1 = "mac#%"
fun g0string2int_ssize(rep: NSH(string)):<> ssize_t = "mac#%"
//
(* ****** ****** *)
//
fun print_size (size_t): void = "mac#%"
fun prerr_size (size_t): void = "mac#%"
fun fprint_size : fprint_type (size_t) = "mac#%"
overload print with print_size
overload prerr with prerr_size
overload fprint with fprint_size
//
fun print_ssize (ssize_t): void = "mac#%"
fun prerr_ssize (ssize_t): void = "mac#%"
fun fprint_ssize : fprint_type (ssize_t) = "mac#%"
overload print with print_ssize
overload prerr with prerr_ssize
overload fprint with fprint_ssize
//
(* ****** ****** *)
//
fun g0uint_succ_size (x: size_t):<> size_t = "mac#%"
fun g0uint_pred_size (x: size_t):<> size_t = "mac#%"
fun g0uint_half_size (x: size_t):<> size_t = "mac#%"
fun g0uint_add_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_sub_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_mul_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_div_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_mod_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_lsl_size (x: size_t, n: intGte(0)):<> size_t = "mac#%"
fun g0uint_lsr_size (x: size_t, n: intGte(0)):<> size_t = "mac#%"
fun g0uint_lnot_size (x: size_t):<> size_t = "mac#%"
fun g0uint_lor_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_lxor_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_land_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_lt_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_lte_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_gt_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_gte_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_eq_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_neq_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_compare_size (x: size_t, y: size_t):<> int = "mac#%"
fun g0uint_max_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_min_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_isgtz_size (x: size_t):<> bool = "mac#%"
fun g0uint_iseqz_size (x: size_t):<> bool = "mac#%"
fun g0uint_isneqz_size (x: size_t):<> bool = "mac#%"
//
fun g0int_neg_ssize (x: ssize_t):<> ssize_t = "mac#%"
fun g0int_abs_ssize (x: ssize_t):<> ssize_t = "mac#%"
fun g0int_succ_ssize (x: ssize_t):<> ssize_t = "mac#%"
fun g0int_pred_ssize (x: ssize_t):<> ssize_t = "mac#%"
fun g0int_half_ssize (x: ssize_t):<> ssize_t = "mac#%"
fun g0int_asl_ssize (x: ssize_t, n: intGte(0)):<> ssize_t = "mac#%"
fun g0int_asr_ssize (x: ssize_t, n: intGte(0)):<> ssize_t = "mac#%"
fun g0int_add_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_sub_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_mul_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_div_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_mod_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_lt_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_lte_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_gt_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_gte_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_eq_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_neq_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_compare_ssize (x: ssize_t, y: ssize_t):<> int = "mac#%"
fun g0int_max_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_min_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_isltz_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isltez_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isgtz_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isgtez_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_iseqz_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isneqz_ssize (x: ssize_t):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun
g1int2uint_int_size:
g1int2uint_type(intknd, sizeknd) = "mac#%"
fun
g1uint2uint_uint_size:
g1uint2uint_type(uintknd, sizeknd) = "mac#%"
//
fun
g1int2int_int_ssize:
g1int2int_type(intknd, ssizeknd) = "mac#%"
fun
g1uint2int_uint_ssize:
g1uint2int_type(uintknd, ssizeknd) = "mac#%"
//
(* ****** ****** *)
//
fun
g1uint2int_size_int:
g1uint2int_type(sizeknd, intknd) = "mac#%"
fun
g1uint2uint_size_uint:
g1uint2uint_type(sizeknd, uintknd) = "mac#%"
//
fun
g1uint2uint_size_size:
g1uint2uint_type(sizeknd, sizeknd) = "mac#%"
//
(* ****** ****** *)
//
fun
g1int2int_ssize_int:
g1int2int_type(ssizeknd, intknd) = "mac#%"
fun
g1int2uint_ssize_uint:
g1int2uint_type(ssizeknd, uintknd) = "mac#%"
//
fun
g1int2int_ssize_ssize:
g1int2int_type(ssizeknd, ssizeknd) = "mac#%"
//
(* ****** ****** *)
//
fun
g1uint2int_size_ssize:
g1uint2int_type(sizeknd, ssizeknd) = "mac#%"
fun
g1int2uint_ssize_size:
g1int2uint_type(ssizeknd, sizeknd) = "mac#%"
//
(* ****** ****** *)
//
fun g1uint_succ_size : g1uint_succ_type (sizeknd) = "mac#%"
fun g1uint_pred_size : g1uint_pred_type (sizeknd) = "mac#%"
fun g1uint_half_size : g1uint_half_type (sizeknd) = "mac#%"
fun g1uint_add_size : g1uint_add_type (sizeknd) = "mac#%"
fun g1uint_sub_size : g1uint_sub_type (sizeknd) = "mac#%"
fun g1uint_mul_size : g1uint_mul_type (sizeknd) = "mac#%"
fun g1uint_div_size : g1uint_div_type (sizeknd) = "mac#%"
fun g1uint_mod_size : g1uint_mod_type (sizeknd) = "mac#%"
fun g1uint_lt_size : g1uint_lt_type (sizeknd) = "mac#%"
fun g1uint_lte_size : g1uint_lte_type (sizeknd) = "mac#%"
fun g1uint_gt_size : g1uint_gt_type (sizeknd) = "mac#%"
fun g1uint_gte_size : g1uint_gte_type (sizeknd) = "mac#%"
fun g1uint_eq_size : g1uint_eq_type (sizeknd) = "mac#%"
fun g1uint_neq_size : g1uint_neq_type (sizeknd) = "mac#%"
fun g1uint_compare_size : g1uint_compare_type (sizeknd) = "mac#%"
fun g1uint_max_size : g1uint_max_type (sizeknd) = "mac#%"
fun g1uint_min_size : g1uint_min_type (sizeknd) = "mac#%"
fun g1uint_isgtz_size : g1uint_isgtz_type (sizeknd) = "mac#%"
fun g1uint_iseqz_size : g1uint_iseqz_type (sizeknd) = "mac#%"
fun g1uint_isneqz_size : g1uint_isneqz_type (sizeknd) = "mac#%"
//
fun g1int_neg_ssize : g1int_neg_type (ssizeknd) = "mac#%"
fun g1int_abs_ssize : g1int_abs_type (ssizeknd) = "mac#%"
fun g1int_succ_ssize : g1int_succ_type (ssizeknd) = "mac#%"
fun g1int_pred_ssize : g1int_pred_type (ssizeknd) = "mac#%"
fun g1int_half_ssize : g1int_half_type (ssizeknd) = "mac#%"
fun g1int_add_ssize : g1int_add_type (ssizeknd) = "mac#%"
fun g1int_sub_ssize : g1int_sub_type (ssizeknd) = "mac#%"
fun g1int_mul_ssize : g1int_mul_type (ssizeknd) = "mac#%"
fun g1int_div_ssize : g1int_div_type (ssizeknd) = "mac#%"
fun g1int_nmod_ssize : g1int_nmod_type (ssizeknd) = "mac#%"
fun g1int_lt_ssize : g1int_lt_type (ssizeknd) = "mac#%"
fun g1int_lte_ssize : g1int_lte_type (ssizeknd) = "mac#%"
fun g1int_gt_ssize : g1int_gt_type (ssizeknd) = "mac#%"
fun g1int_gte_ssize : g1int_gte_type (ssizeknd) = "mac#%"
fun g1int_eq_ssize : g1int_eq_type (ssizeknd) = "mac#%"
fun g1int_neq_ssize : g1int_neq_type (ssizeknd) = "mac#%"
fun g1int_compare_ssize : g1int_compare_type (ssizeknd) = "mac#%"
fun g1int_max_ssize : g1int_max_type (ssizeknd) = "mac#%"
fun g1int_min_ssize : g1int_min_type (ssizeknd) = "mac#%"
fun g1int_isltz_ssize : g1int_isltz_type (ssizeknd) = "mac#%"
fun g1int_isltez_ssize : g1int_isltez_type (ssizeknd) = "mac#%"
fun g1int_isgtz_ssize : g1int_isgtz_type (ssizeknd) = "mac#%"
fun g1int_isgtez_ssize : g1int_isgtez_type (ssizeknd) = "mac#%"
fun g1int_iseqz_ssize : g1int_iseqz_type (ssizeknd) = "mac#%"
fun g1int_isneqz_ssize : g1int_isneqz_type (ssizeknd) = "mac#%"
//
(* ****** ****** *)
//
macdef i2sz(x) = g1int2uint_int_size(,(x))
macdef u2sz(x) = g1uint2uint_uint_size(,(x))
//
macdef i2ssz(x) = g1int2int_int_ssize(,(x))
macdef u2ssz(x) = g1uint2int_uint_ssize(,(x))
//
(* ****** ****** *)
//
symintr sz2i
overload sz2i with g0uint2int_size_int of 0
overload sz2i with g1uint2int_size_int of 10
//
symintr sz2u
overload sz2u with g0uint2uint_size_uint of 0
overload sz2u with g1uint2uint_size_uint of 10
//
(* ****** ****** *)

(* end of [integer_size.sats] *)
