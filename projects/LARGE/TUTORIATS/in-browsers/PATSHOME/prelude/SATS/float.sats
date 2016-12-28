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
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: September, 2011 *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/float.atxt
** Time of generation: Sun Nov 20 21:18:16 2016
*)

(* ****** ****** *)

stadef fltknd = float_kind
stadef dblknd = double_kind
stadef ldblknd = ldouble_kind

(* ****** ****** *)
//
fun
{tk1,tk2:tk}
g0int2float(x: g0int(tk1)):<> g0float(tk2)
//
fun
g0int2float_int_float(x: int):<> float = "mac#%"
fun
g0int2float_int_double(x: int):<> double = "mac#%"
fun
g0int2float_lint_double(x: lint):<> double = "mac#%"
//
(* ****** ****** *)
//
fun
{tk1,tk2:tk}
g0float2int(x: g0float(tk1)):<> g0int(tk2)
//
fun
g0float2int_float_int(x: float):<> int = "mac#%"
fun
g0float2int_float_lint(x: float):<> lint = "mac#%"
fun
g0float2int_double_int(x: double):<> int = "mac#%"
fun
g0float2int_double_lint(x: double):<> lint = "mac#%"
fun
g0float2int_double_llint(x: double):<> llint = "mac#%"
//
(* ****** ****** *)
//
fun
{tk1,tk2:tk}
g0float2float(x: g0float(tk1)):<> g0float(tk2)
//
fun
g0float2float_float_float(x: float):<> float = "mac#%"
fun
g0float2float_float_double(x: float):<> double = "mac#%"
fun
g0float2float_double_float(x: double):<> float = "mac#%"
fun
g0float2float_double_double(x: double):<> double = "mac#%"
//
(* ****** ****** *)
//
fun
{tk:tk}
g0string2float(rep: NSH(string)):<> g0float(tk)
//
fun
g0string2float_double(rep: NSH(string)):<> double = "mac#%"
//
(* ****** ****** *)
//
typedef
g0float_uop_type
  (tk:tk) =
  g0float(tk) -<fun0> g0float(tk)
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_abs : g0float_uop_type(tk)
fun
{tk:tk}
g0float_neg : g0float_uop_type(tk)
//
overload abs with g0float_abs of 0
overload ~ with g0float_neg of 0 // ~ for uminus
overload neg with g0float_neg of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_succ : g0float_uop_type(tk)
fun
{tk:tk}
g0float_pred : g0float_uop_type(tk)
//
overload succ with g0float_succ of 0
overload pred with g0float_pred of 0
//
(* ****** ****** *)
//
typedef
g0float_aop_type
  (tk:tk) =
  (g0float(tk), g0float(tk)) -<fun0> g0float(tk)
// end of [g0float_aop_type]
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_add : g0float_aop_type(tk)
overload + with g0float_add of 0
fun
{tk:tk}
g0float_sub : g0float_aop_type(tk)
overload - with g0float_sub of 0
fun
{tk:tk}
g0float_mul : g0float_aop_type(tk)
overload * with g0float_mul of 0
fun
{tk:tk}
g0float_div : g0float_aop_type(tk)
overload / with g0float_div of 0
fun
{tk:tk}
g0float_mod : g0float_aop_type(tk)
overload % with g0float_mod of 0
overload mod with g0float_mod of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_isltz(g0float(tk)):<> bool
fun
{tk:tk}
g0float_isltez(g0float(tk)):<> bool
//
overload isltz with g0float_isltz of 0
overload isltez with g0float_isltez of 0
//
fun
{tk:tk}
g0float_isgtz(g0float(tk)):<> bool
fun
{tk:tk}
g0float_isgtez(g0float(tk)):<> bool
//
overload isgtz with g0float_isgtz of 0
overload isgtez with g0float_isgtez of 0
//
fun
{tk:tk}
g0float_iseqz(g0float(tk)):<> bool
fun
{tk:tk}
g0float_isneqz(g0float(tk)):<> bool
//
overload iseqz with g0float_iseqz of 0
overload isneqz with g0float_isneqz of 0
//
(* ****** ****** *)
//
typedef
g0float_cmp_type
  (tk:tk) =
  (g0float(tk), g0float(tk)) -<fun0> bool
// end of [g0float_cmp_type]
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_lt : g0float_cmp_type(tk)
overload < with g0float_lt of 0
fun
{tk:tk}
g0float_lte : g0float_cmp_type(tk)
overload <= with g0float_lte of 0
fun
{tk:tk}
g0float_gt : g0float_cmp_type(tk)
overload > with g0float_gt of 0
fun
{tk:tk}
g0float_gte : g0float_cmp_type(tk)
overload >= with g0float_gte of 0
fun
{tk:tk}
g0float_eq : g0float_cmp_type(tk)
overload = with g0float_eq of 0
fun
{tk:tk}
g0float_neq : g0float_cmp_type(tk)
overload != with g0float_neq of 0
overload <> with g0float_neq of 0
//
(* ****** ****** *)
//
typedef
g0float_compare_type
  (tk:tk) =
  (g0float(tk), g0float(tk)) -<fun0> int
// end of [g0float_compare_type]
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_compare
  : g0float_compare_type(tk)
//
overload compare with g0float_compare of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_max : g0float_aop_type(tk)
fun
{tk:tk}
g0float_min : g0float_aop_type(tk)
//
overload max with g0float_max of 0
overload min with g0float_min of 0
//
(* ****** ****** *)

fun g0float_neg_float
  : g0float_uop_type(fltknd) = "mac#%"
fun g0float_abs_float
  : g0float_uop_type(fltknd) = "mac#%"

fun g0float_succ_float
  : g0float_uop_type(fltknd) = "mac#%"
fun g0float_pred_float
  : g0float_uop_type(fltknd) = "mac#%"

fun g0float_add_float
  : g0float_aop_type(fltknd) = "mac#%"
fun g0float_sub_float
  : g0float_aop_type(fltknd) = "mac#%"
fun g0float_mul_float
  : g0float_aop_type(fltknd) = "mac#%"
fun g0float_div_float
  : g0float_aop_type(fltknd) = "mac#%"
fun g0float_mod_float
  : g0float_aop_type(fltknd) = "mac#%"

fun g0float_lt_float
  : g0float_cmp_type(fltknd) = "mac#%"
fun g0float_lte_float
  : g0float_cmp_type(fltknd) = "mac#%"
fun g0float_gt_float
  : g0float_cmp_type(fltknd) = "mac#%"
fun g0float_gte_float
  : g0float_cmp_type(fltknd) = "mac#%"
fun g0float_eq_float
  : g0float_cmp_type(fltknd) = "mac#%"
fun g0float_neq_float
  : g0float_cmp_type(fltknd) = "mac#%"

fun g0float_compare_float
  : g0float_compare_type(fltknd) = "mac#%"

fun g0float_max_float
  : g0float_aop_type(fltknd) = "mac#%"
fun g0float_min_float
  : g0float_aop_type(fltknd) = "mac#%"

(* ****** ****** *)

fun g0float_neg_double
  : g0float_uop_type(dblknd) = "mac#%"
fun g0float_abs_double
  : g0float_uop_type(dblknd) = "mac#%"

fun g0float_succ_double
  : g0float_uop_type(dblknd) = "mac#%"
fun g0float_pred_double
  : g0float_uop_type(dblknd) = "mac#%"

fun g0float_add_double
  : g0float_aop_type(dblknd) = "mac#%"
fun g0float_sub_double
  : g0float_aop_type(dblknd) = "mac#%"
fun g0float_mul_double
  : g0float_aop_type(dblknd) = "mac#%"
fun g0float_div_double
  : g0float_aop_type(dblknd) = "mac#%"
fun g0float_mod_double
  : g0float_aop_type(dblknd) = "mac#%"

fun g0float_lt_double
  : g0float_cmp_type(dblknd) = "mac#%"
fun g0float_lte_double
  : g0float_cmp_type(dblknd) = "mac#%"
fun g0float_gt_double
  : g0float_cmp_type(dblknd) = "mac#%"
fun g0float_gte_double
  : g0float_cmp_type(dblknd) = "mac#%"
fun g0float_eq_double
  : g0float_cmp_type(dblknd) = "mac#%"
fun g0float_neq_double
  : g0float_cmp_type(dblknd) = "mac#%"

fun g0float_compare_double
  : g0float_compare_type(dblknd) = "mac#%"

fun g0float_max_double
  : g0float_aop_type(dblknd) = "mac#%"
fun g0float_min_double
  : g0float_aop_type(dblknd) = "mac#%"

(* ****** ****** *)

fun g0float_neg_ldouble
  : g0float_uop_type(ldblknd) = "mac#%"
fun g0float_abs_ldouble
  : g0float_uop_type(ldblknd) = "mac#%"

fun g0float_succ_ldouble
  : g0float_uop_type(ldblknd) = "mac#%"
fun g0float_pred_ldouble
  : g0float_uop_type(ldblknd) = "mac#%"

fun g0float_add_ldouble
  : g0float_aop_type(ldblknd) = "mac#%"
fun g0float_sub_ldouble
  : g0float_aop_type(ldblknd) = "mac#%"
fun g0float_mul_ldouble
  : g0float_aop_type(ldblknd) = "mac#%"
fun g0float_div_ldouble
  : g0float_aop_type(ldblknd) = "mac#%"
fun g0float_mod_ldouble
  : g0float_aop_type(ldblknd) = "mac#%"

fun g0float_lt_ldouble
  : g0float_cmp_type(ldblknd) = "mac#%"
fun g0float_lte_ldouble
  : g0float_cmp_type(ldblknd) = "mac#%"
fun g0float_gt_ldouble
  : g0float_cmp_type(ldblknd) = "mac#%"
fun g0float_gte_ldouble
  : g0float_cmp_type(ldblknd) = "mac#%"
fun g0float_eq_ldouble
  : g0float_cmp_type(ldblknd) = "mac#%"
fun g0float_neq_ldouble
  : g0float_cmp_type(ldblknd) = "mac#%"

fun g0float_compare_ldouble
  : g0float_compare_type(ldblknd) = "mac#%"

fun g0float_max_ldouble
  : g0float_aop_type(ldblknd) = "mac#%"
fun g0float_min_ldouble
  : g0float_aop_type(ldblknd) = "mac#%"

(* ****** ****** *)
//
fun print_float (float): void = "mac#%"
fun prerr_float (float): void = "mac#%"
fun fprint_float : fprint_type (float) = "mac#%"
overload print with print_float
overload prerr with prerr_float
overload fprint with fprint_float
//
fun print_double (double): void = "mac#%"
fun prerr_double (double): void = "mac#%"
fun fprint_double : fprint_type (double) = "mac#%"
overload print with print_double
overload prerr with prerr_double
overload fprint with fprint_double
//
fun print_ldouble (ldouble): void = "mac#%"
fun prerr_ldouble (ldouble): void = "mac#%"
fun fprint_ldouble : fprint_type (ldouble) = "mac#%"
overload print with print_ldouble
overload prerr with prerr_ldouble
overload fprint with fprint_ldouble
//
(* ****** ****** *)
//
fun
add_int_float
  (int, float):<> float = "mac#%"
fun
add_float_int
  (float, int):<> float = "mac#%"
//
overload + with add_int_float of 0
overload + with add_float_int of 0
//
fun
add_int_double
  (int, double):<> double = "mac#%"
fun
add_double_int
  (double, int):<> double = "mac#%"
//
overload + with add_int_double of 0
overload + with add_double_int of 0
//
(* ****** ****** *)
//
fun
sub_int_float
  (int, float):<> float = "mac#%"
fun
sub_float_int
  (float, int):<> float = "mac#%"
//
overload - with sub_int_float of 0
overload - with sub_float_int of 0
//
fun
sub_int_double
  (int, double):<> double = "mac#%"
fun
sub_double_int
  (double, int):<> double = "mac#%"
//
overload - with sub_int_double of 0
overload - with sub_double_int of 0
//
(* ****** ****** *)
//
fun
mul_int_float
  (int, float):<> float = "mac#%"
fun
mul_float_int
  (float, int):<> float = "mac#%"
//
overload * with mul_int_float of 0
overload * with mul_float_int of 0
//
fun
mul_int_double
  (int, double):<> double = "mac#%"
fun
mul_double_int
  (double, int):<> double = "mac#%"
//
overload * with mul_int_double of 0
overload * with mul_double_int of 0
//
(* ****** ****** *)
//
fun
div_int_float
  (int, float):<> float = "mac#%"
fun
div_float_int
  (float, int):<> float = "mac#%"
overload / with div_int_float of 0
overload / with div_float_int of 0
//
fun
div_int_double
  (int, double):<> double = "mac#%"
fun
div_double_int
  (double, int):<> double = "mac#%"
overload / with div_int_double of 0
overload / with div_double_int of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0float_npow
  (x: g0float(tk), n: intGte(0)):<> g0float(tk)
//
overload ** with g0float_npow of 0
//
(* ****** ****** *)

macdef g0i2f (x) = g0int2float (,(x))
macdef g0f2i (x) = g0float2int (,(x))
macdef g0f2f (x) = g0float2float (,(x))

(* ****** ****** *)

(* end of [float.sats] *)
