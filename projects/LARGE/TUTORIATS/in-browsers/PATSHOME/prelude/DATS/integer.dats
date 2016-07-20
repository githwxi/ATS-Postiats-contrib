(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
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

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/integer.atxt
** Time of generation: Sat Oct 17 15:19:51 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: May, 2012 *)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0 // no dynloading at run-time

(* ****** ****** *)
//
//
(* ****** ****** *)
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
g0int2int<intknd,intknd> = g0int2int_int_int
implement
g0int2int<intknd,lintknd> = g0int2int_int_lint
implement
g0int2int<intknd,llintknd> = g0int2int_int_llint
implement
g0int2int<intknd,ssizeknd> = g0int2int_int_ssize

(* ****** ****** *)

implement g0int_neg<intknd> = g0int_neg_int
implement g0int_abs<intknd> = g0int_abs_int
implement g0int_succ<intknd> = g0int_succ_int
implement g0int_pred<intknd> = g0int_pred_int
implement g0int_half<intknd> = g0int_half_int
implement g0int_add<intknd> = g0int_add_int
implement g0int_sub<intknd> = g0int_sub_int
implement g0int_mul<intknd> = g0int_mul_int
implement g0int_div<intknd> = g0int_div_int
implement g0int_mod<intknd> = g0int_mod_int
implement g0int_asl<intknd> = g0int_asl_int
implement g0int_asr<intknd> = g0int_asr_int
implement g0int_isltz<intknd> = g0int_isltz_int
implement g0int_isltez<intknd> = g0int_isltez_int
implement g0int_isgtz<intknd> = g0int_isgtz_int
implement g0int_isgtez<intknd> = g0int_isgtez_int
implement g0int_iseqz<intknd> = g0int_iseqz_int
implement g0int_isneqz<intknd> = g0int_isneqz_int
implement g0int_lt<intknd> = g0int_lt_int
implement g0int_lte<intknd> = g0int_lte_int
implement g0int_gt<intknd> = g0int_gt_int
implement g0int_gte<intknd> = g0int_gte_int
implement g0int_eq<intknd> = g0int_eq_int
implement g0int_neq<intknd> = g0int_neq_int
implement g0int_compare<intknd> = g0int_compare_int
implement g0int_max<intknd> = g0int_max_int
implement g0int_min<intknd> = g0int_min_int
//
implement fprint_val<int> (out, x) = fprint_int (out, x)
//
implement g0int_neg<lintknd> = g0int_neg_lint
implement g0int_abs<lintknd> = g0int_abs_lint
implement g0int_succ<lintknd> = g0int_succ_lint
implement g0int_pred<lintknd> = g0int_pred_lint
implement g0int_half<lintknd> = g0int_half_lint
implement g0int_add<lintknd> = g0int_add_lint
implement g0int_sub<lintknd> = g0int_sub_lint
implement g0int_mul<lintknd> = g0int_mul_lint
implement g0int_div<lintknd> = g0int_div_lint
implement g0int_mod<lintknd> = g0int_mod_lint
implement g0int_asl<lintknd> = g0int_asl_lint
implement g0int_asr<lintknd> = g0int_asr_lint
implement g0int_isltz<lintknd> = g0int_isltz_lint
implement g0int_isltez<lintknd> = g0int_isltez_lint
implement g0int_isgtz<lintknd> = g0int_isgtz_lint
implement g0int_isgtez<lintknd> = g0int_isgtez_lint
implement g0int_iseqz<lintknd> = g0int_iseqz_lint
implement g0int_isneqz<lintknd> = g0int_isneqz_lint
implement g0int_lt<lintknd> = g0int_lt_lint
implement g0int_lte<lintknd> = g0int_lte_lint
implement g0int_gt<lintknd> = g0int_gt_lint
implement g0int_gte<lintknd> = g0int_gte_lint
implement g0int_eq<lintknd> = g0int_eq_lint
implement g0int_neq<lintknd> = g0int_neq_lint
implement g0int_compare<lintknd> = g0int_compare_lint
implement g0int_max<lintknd> = g0int_max_lint
implement g0int_min<lintknd> = g0int_min_lint
//
implement fprint_val<lint> (out, x) = fprint_lint (out, x)
//
implement g0int_neg<llintknd> = g0int_neg_llint
implement g0int_abs<llintknd> = g0int_abs_llint
implement g0int_succ<llintknd> = g0int_succ_llint
implement g0int_pred<llintknd> = g0int_pred_llint
implement g0int_half<llintknd> = g0int_half_llint
implement g0int_add<llintknd> = g0int_add_llint
implement g0int_sub<llintknd> = g0int_sub_llint
implement g0int_mul<llintknd> = g0int_mul_llint
implement g0int_div<llintknd> = g0int_div_llint
implement g0int_mod<llintknd> = g0int_mod_llint
implement g0int_asl<llintknd> = g0int_asl_llint
implement g0int_asr<llintknd> = g0int_asr_llint
implement g0int_isltz<llintknd> = g0int_isltz_llint
implement g0int_isltez<llintknd> = g0int_isltez_llint
implement g0int_isgtz<llintknd> = g0int_isgtz_llint
implement g0int_isgtez<llintknd> = g0int_isgtez_llint
implement g0int_iseqz<llintknd> = g0int_iseqz_llint
implement g0int_isneqz<llintknd> = g0int_isneqz_llint
implement g0int_lt<llintknd> = g0int_lt_llint
implement g0int_lte<llintknd> = g0int_lte_llint
implement g0int_gt<llintknd> = g0int_gt_llint
implement g0int_gte<llintknd> = g0int_gte_llint
implement g0int_eq<llintknd> = g0int_eq_llint
implement g0int_neq<llintknd> = g0int_neq_llint
implement g0int_compare<llintknd> = g0int_compare_llint
implement g0int_max<llintknd> = g0int_max_llint
implement g0int_min<llintknd> = g0int_min_llint
//
implement fprint_val<llint> (out, x) = fprint_llint (out, x)
//
implement g0int_neg<ssizeknd> = g0int_neg_ssize
implement g0int_abs<ssizeknd> = g0int_abs_ssize
implement g0int_succ<ssizeknd> = g0int_succ_ssize
implement g0int_pred<ssizeknd> = g0int_pred_ssize
implement g0int_half<ssizeknd> = g0int_half_ssize
implement g0int_add<ssizeknd> = g0int_add_ssize
implement g0int_sub<ssizeknd> = g0int_sub_ssize
implement g0int_mul<ssizeknd> = g0int_mul_ssize
implement g0int_div<ssizeknd> = g0int_div_ssize
implement g0int_mod<ssizeknd> = g0int_mod_ssize
implement g0int_asl<ssizeknd> = g0int_asl_ssize
implement g0int_asr<ssizeknd> = g0int_asr_ssize
implement g0int_isltz<ssizeknd> = g0int_isltz_ssize
implement g0int_isltez<ssizeknd> = g0int_isltez_ssize
implement g0int_isgtz<ssizeknd> = g0int_isgtz_ssize
implement g0int_isgtez<ssizeknd> = g0int_isgtez_ssize
implement g0int_iseqz<ssizeknd> = g0int_iseqz_ssize
implement g0int_isneqz<ssizeknd> = g0int_isneqz_ssize
implement g0int_lt<ssizeknd> = g0int_lt_ssize
implement g0int_lte<ssizeknd> = g0int_lte_ssize
implement g0int_gt<ssizeknd> = g0int_gt_ssize
implement g0int_gte<ssizeknd> = g0int_gte_ssize
implement g0int_eq<ssizeknd> = g0int_eq_ssize
implement g0int_neq<ssizeknd> = g0int_neq_ssize
implement g0int_compare<ssizeknd> = g0int_compare_ssize
implement g0int_max<ssizeknd> = g0int_max_ssize
implement g0int_min<ssizeknd> = g0int_min_ssize
//
implement fprint_val<ssize_t> (out, x) = fprint_ssize (out, x)
//
(* ****** ****** *)

implement{} mul_int1_size0 (i, j) = i2sz(i) * j
implement{} mul_size0_int1 (i, j) = i * i2sz(j)

(* ****** ****** *)

implement
{tk}(*tk*)
g0int_npow
  (x, n) = let
//
typedef gint = g0int(tk)
//
fun
loop
(
  x: gint, res: gint, n: int
) : gint = (
//
if
(n > 1)
then let
  val n2 = n >> 1
  val b0 = n - (n2 << 1)
  val xx = x * x
in
  if b0 = 0
    then loop(xx, res, n2) else loop(xx, x * res, n2)
  // end of [if]
end // end of [then]
else (
  if n > 0 then x * res else res
) (* end of [else] *)
//
) (* end of [loop] *)
//
val res = $UN.cast{gint}(1)
//
in
  $effmask_all(loop(x, res, n))
end // end of [g0int_npow]

(* ****** ****** *)

implement
g1int2int<intknd,intknd> = g1int2int_int_int
implement
g1int2int<intknd,lintknd> = g1int2int_int_lint
implement
g1int2int<intknd,llintknd> = g1int2int_int_llint
implement
g1int2int<intknd,ssizeknd> = g1int2int_int_ssize

(* ****** ****** *)

implement g1int_neg<intknd> = g1int_neg_int
implement g1int_abs<intknd> = g1int_abs_int
implement g1int_succ<intknd> = g1int_succ_int
implement g1int_pred<intknd> = g1int_pred_int
implement g1int_half<intknd> = g1int_half_int
implement g1int_add<intknd> = g1int_add_int
implement g1int_sub<intknd> = g1int_sub_int
implement g1int_mul<intknd> = g1int_mul_int
implement g1int_div<intknd> = g1int_div_int
implement g1int_nmod<intknd> = g1int_nmod_int
implement g1int_isltz<intknd> = g1int_isltz_int
implement g1int_isltez<intknd> = g1int_isltez_int
implement g1int_isgtz<intknd> = g1int_isgtz_int
implement g1int_isgtez<intknd> = g1int_isgtez_int
implement g1int_iseqz<intknd> = g1int_iseqz_int
implement g1int_isneqz<intknd> = g1int_isneqz_int
implement g1int_lt<intknd> = g1int_lt_int
implement g1int_lte<intknd> = g1int_lte_int
implement g1int_gt<intknd> = g1int_gt_int
implement g1int_gte<intknd> = g1int_gte_int
implement g1int_eq<intknd> = g1int_eq_int
implement g1int_neq<intknd> = g1int_neq_int
implement g1int_compare<intknd> = g1int_compare_int
implement g1int_max<intknd> = g1int_max_int
implement g1int_min<intknd> = g1int_min_int
//
implement g1int_neg<lintknd> = g1int_neg_lint
implement g1int_abs<lintknd> = g1int_abs_lint
implement g1int_succ<lintknd> = g1int_succ_lint
implement g1int_pred<lintknd> = g1int_pred_lint
implement g1int_half<lintknd> = g1int_half_lint
implement g1int_add<lintknd> = g1int_add_lint
implement g1int_sub<lintknd> = g1int_sub_lint
implement g1int_mul<lintknd> = g1int_mul_lint
implement g1int_div<lintknd> = g1int_div_lint
implement g1int_nmod<lintknd> = g1int_nmod_lint
implement g1int_isltz<lintknd> = g1int_isltz_lint
implement g1int_isltez<lintknd> = g1int_isltez_lint
implement g1int_isgtz<lintknd> = g1int_isgtz_lint
implement g1int_isgtez<lintknd> = g1int_isgtez_lint
implement g1int_iseqz<lintknd> = g1int_iseqz_lint
implement g1int_isneqz<lintknd> = g1int_isneqz_lint
implement g1int_lt<lintknd> = g1int_lt_lint
implement g1int_lte<lintknd> = g1int_lte_lint
implement g1int_gt<lintknd> = g1int_gt_lint
implement g1int_gte<lintknd> = g1int_gte_lint
implement g1int_eq<lintknd> = g1int_eq_lint
implement g1int_neq<lintknd> = g1int_neq_lint
implement g1int_compare<lintknd> = g1int_compare_lint
implement g1int_max<lintknd> = g1int_max_lint
implement g1int_min<lintknd> = g1int_min_lint
//
implement g1int_neg<llintknd> = g1int_neg_llint
implement g1int_abs<llintknd> = g1int_abs_llint
implement g1int_succ<llintknd> = g1int_succ_llint
implement g1int_pred<llintknd> = g1int_pred_llint
implement g1int_half<llintknd> = g1int_half_llint
implement g1int_add<llintknd> = g1int_add_llint
implement g1int_sub<llintknd> = g1int_sub_llint
implement g1int_mul<llintknd> = g1int_mul_llint
implement g1int_div<llintknd> = g1int_div_llint
implement g1int_nmod<llintknd> = g1int_nmod_llint
implement g1int_isltz<llintknd> = g1int_isltz_llint
implement g1int_isltez<llintknd> = g1int_isltez_llint
implement g1int_isgtz<llintknd> = g1int_isgtz_llint
implement g1int_isgtez<llintknd> = g1int_isgtez_llint
implement g1int_iseqz<llintknd> = g1int_iseqz_llint
implement g1int_isneqz<llintknd> = g1int_isneqz_llint
implement g1int_lt<llintknd> = g1int_lt_llint
implement g1int_lte<llintknd> = g1int_lte_llint
implement g1int_gt<llintknd> = g1int_gt_llint
implement g1int_gte<llintknd> = g1int_gte_llint
implement g1int_eq<llintknd> = g1int_eq_llint
implement g1int_neq<llintknd> = g1int_neq_llint
implement g1int_compare<llintknd> = g1int_compare_llint
implement g1int_max<llintknd> = g1int_max_llint
implement g1int_min<llintknd> = g1int_min_llint
//
implement g1int_neg<ssizeknd> = g1int_neg_ssize
implement g1int_abs<ssizeknd> = g1int_abs_ssize
implement g1int_succ<ssizeknd> = g1int_succ_ssize
implement g1int_pred<ssizeknd> = g1int_pred_ssize
implement g1int_half<ssizeknd> = g1int_half_ssize
implement g1int_add<ssizeknd> = g1int_add_ssize
implement g1int_sub<ssizeknd> = g1int_sub_ssize
implement g1int_mul<ssizeknd> = g1int_mul_ssize
implement g1int_div<ssizeknd> = g1int_div_ssize
implement g1int_nmod<ssizeknd> = g1int_nmod_ssize
implement g1int_isltz<ssizeknd> = g1int_isltz_ssize
implement g1int_isltez<ssizeknd> = g1int_isltez_ssize
implement g1int_isgtz<ssizeknd> = g1int_isgtz_ssize
implement g1int_isgtez<ssizeknd> = g1int_isgtez_ssize
implement g1int_iseqz<ssizeknd> = g1int_iseqz_ssize
implement g1int_isneqz<ssizeknd> = g1int_isneqz_ssize
implement g1int_lt<ssizeknd> = g1int_lt_ssize
implement g1int_lte<ssizeknd> = g1int_lte_ssize
implement g1int_gt<ssizeknd> = g1int_gt_ssize
implement g1int_gte<ssizeknd> = g1int_gte_ssize
implement g1int_eq<ssizeknd> = g1int_eq_ssize
implement g1int_neq<ssizeknd> = g1int_neq_ssize
implement g1int_compare<ssizeknd> = g1int_compare_ssize
implement g1int_max<ssizeknd> = g1int_max_ssize
implement g1int_min<ssizeknd> = g1int_min_ssize
//
(* ****** ****** *)

implement{tk}
g1int_sgn (x) = compare_g1int_int<tk> (x, 0)

(* ****** ****** *)
//
implement{
} add_size1_int1
  {i,j}(i, j) = $UN.cast{size_t(i+j)}(i+g0i2u(j))
implement{
} add_int1_size1
  {i,j}(i, j) = $UN.cast{size_t(i+j)}(g0i2u(i)+j)
//
implement{
} sub_size1_int1
  {i,j}(i, j) = $UN.cast{size_t(i-j)}(i-g0i2u(j))
//
(* ****** ****** *)

implement{tk}
g1int_mul2 {i,j} (x, y) = let
  prval pf = mul_make {i,j} () in (pf | g1int_mul<tk> (x, y))
end // end of [let] // end of [g1int_mul2]

(* ****** ****** *)
//
implement{
} mul_int1_size1
  {i,j}(i, j) = $UN.cast{size_t(i*j)}(g0i2u(i)*j)
implement{
} mul_size1_int1
  {i,j}(i, j) = $UN.cast{size_t(i*j)}(i*g0i2u(j))
//
(* ****** ****** *)

implement{tk}
g1int_ndiv {i,j} (x, y) = let
  val q = g1int_div (x, y) in $UN.cast{g1int(tk,ndiv(i,j))}(q)
end // end of [let] // end of [g1int_ndiv]

(* ****** ****** *)

implement{tk}
g1int_ndiv2 {i,j} (x, y) = let
  val [q:int] q = g1int_div (x, y)
  prval [q2:int,r:int] pf = divmod_istot{i,j}()
  prval EQINT() = $UN.castview0{EQINT(q,q2)}(0)
in
  (pf | q)
end // end of [let] // end of [g1int_ndiv2]

(* ****** ****** *)

implement{tk}
g1int_nmod2 {i,j} (x, y) = let
  val r = g1int_nmod (x, y)
  prval [q:int,r2:int] pf = divmod_istot{i,j}()
  prval EQINT() = $UN.castview0{EQINT(i%j,r2)}(0)
in
  (pf | r)
end // end of [let] // end of [g1int_nmod2]

(* ****** ****** *)

implement
nmod_g1int_int1<intknd> (x, y) = g1i2i(g1int_nmod (x, g1i2i(y)))
implement
nmod_g1int_int1<lintknd> (x, y) = g1i2i(g1int_nmod (x, g1i2i(y)))
implement
nmod_g1int_int1<llintknd> (x, y) = g1i2i(g1int_nmod (x, g1i2i(y)))

(* ****** ****** *)

implement{tk}
nmod2_g1int_int1{i,j}(x, y) = let
  val r = nmod_g1int_int1 (x, y)
  prval [q:int,r2:int] pf = divmod_istot{i,j}()
  prval EQINT() = $UN.castview0{EQINT(i%j,r2)}(0)
in
  (pf | r)
end // end of [let] // end of [nmod2_g1int_int1]

(* ****** ****** *)

implement{tk}
g1int_ngcd (x, y) = let
//
fun loop{i,j:nat} .<j>.
(
  x: g1int (tk, i), y: g1int (tk, j)
) :<> [r:nat] g1int (tk, r) = let
in
//
if y > 0 then loop (y, g1int_nmod (x, y)) else x
//
end // end of [loop]
//
in
  loop (x, y)
end // end of [g1int_ngcd]

(* ****** ****** *)
//
// HX: int -> uint
//
implement
g0int2uint<intknd,uintknd> = g0int2uint_int_uint
implement
g0int2uint<intknd,ulintknd> = g0int2uint_int_ulint
implement
g0int2uint<intknd,ullintknd> = g0int2uint_int_ullint
implement
g0int2uint<intknd,sizeknd> = g0int2uint_int_size
//
implement
g0int2uint<lintknd,ulintknd> = g0int2uint_lint_ulint
implement
g0int2uint<lintknd,ullintknd> = g0int2uint_lint_ullint
implement
g0int2uint<lintknd,sizeknd> = g0int2uint_lint_size
//
implement
g0int2uint<llintknd,ullintknd> = g0int2uint_llint_ullint
//
implement
g0int2uint<ssizeknd,sizeknd> = g0int2uint_ssize_size

(* ****** ****** *)
//
// HX: uint -> int
//
implement
g0uint2int<uintknd,intknd> = g0uint2int_uint_int
implement
g0uint2int<uintknd,lintknd> = g0uint2int_uint_lint
implement
g0uint2int<uintknd,llintknd> = g0uint2int_uint_llint
implement
g0uint2int<uintknd,ssizeknd> = g0uint2int_uint_ssize
//
implement
g0uint2int<sizeknd,intknd> = g0uint2int_size_int
implement
g0uint2int<sizeknd,lintknd> = g0uint2int_size_lint
implement
g0uint2int<sizeknd,llintknd> = g0uint2int_size_llint
implement
g0uint2int<sizeknd,ssizeknd> = g0uint2int_size_ssize
//
(* ****** ****** *)
//
// HX: uint -> uint
//
implement
g0uint2uint<uintknd,uintknd> = g0uint2uint_uint_uint
implement
g0uint2uint<uintknd,ulintknd> = g0uint2uint_uint_ulint
implement
g0uint2uint<uintknd,ullintknd> = g0uint2uint_uint_ullint
implement
g0uint2uint<uintknd,sizeknd> = g0uint2uint_uint_size

(* ****** ****** *)

implement
g0uint2uint<sizeknd,ulintknd> = g0uint2uint_size_ulint
implement
g0uint2uint<sizeknd,ullintknd> = g0uint2uint_size_ullint
implement
g0uint2uint<sizeknd,sizeknd> = g0uint2uint_size_size

(* ****** ****** *)

implement g0uint_succ<uintknd> = g0uint_succ_uint
implement g0uint_pred<uintknd> = g0uint_pred_uint
implement g0uint_half<uintknd> = g0uint_half_uint
implement g0uint_add<uintknd> = g0uint_add_uint
implement g0uint_sub<uintknd> = g0uint_sub_uint
implement g0uint_mul<uintknd> = g0uint_mul_uint
implement g0uint_div<uintknd> = g0uint_div_uint
implement g0uint_mod<uintknd> = g0uint_mod_uint
implement g0uint_lsl<uintknd> = g0uint_lsl_uint
implement g0uint_lsr<uintknd> = g0uint_lsr_uint
implement g0uint_lnot<uintknd> = g0uint_lnot_uint
implement g0uint_lor<uintknd> = g0uint_lor_uint
implement g0uint_lxor<uintknd> = g0uint_lxor_uint
implement g0uint_land<uintknd> = g0uint_land_uint
implement g0uint_isgtz<uintknd> = g0uint_isgtz_uint
implement g0uint_iseqz<uintknd> = g0uint_iseqz_uint
implement g0uint_isneqz<uintknd> = g0uint_isneqz_uint
implement g0uint_lt<uintknd> = g0uint_lt_uint
implement g0uint_lte<uintknd> = g0uint_lte_uint
implement g0uint_gt<uintknd> = g0uint_gt_uint
implement g0uint_gte<uintknd> = g0uint_gte_uint
implement g0uint_eq<uintknd> = g0uint_eq_uint
implement g0uint_neq<uintknd> = g0uint_neq_uint
implement g0uint_compare<uintknd> = g0uint_compare_uint
implement g0uint_max<uintknd> = g0uint_max_uint
implement g0uint_min<uintknd> = g0uint_min_uint
//
implement fprint_val<uint> (out, x) = fprint_uint (out, x)
//
implement g0uint_succ<ulintknd> = g0uint_succ_ulint
implement g0uint_pred<ulintknd> = g0uint_pred_ulint
implement g0uint_half<ulintknd> = g0uint_half_ulint
implement g0uint_add<ulintknd> = g0uint_add_ulint
implement g0uint_sub<ulintknd> = g0uint_sub_ulint
implement g0uint_mul<ulintknd> = g0uint_mul_ulint
implement g0uint_div<ulintknd> = g0uint_div_ulint
implement g0uint_mod<ulintknd> = g0uint_mod_ulint
implement g0uint_lsl<ulintknd> = g0uint_lsl_ulint
implement g0uint_lsr<ulintknd> = g0uint_lsr_ulint
implement g0uint_lnot<ulintknd> = g0uint_lnot_ulint
implement g0uint_lor<ulintknd> = g0uint_lor_ulint
implement g0uint_lxor<ulintknd> = g0uint_lxor_ulint
implement g0uint_land<ulintknd> = g0uint_land_ulint
implement g0uint_isgtz<ulintknd> = g0uint_isgtz_ulint
implement g0uint_iseqz<ulintknd> = g0uint_iseqz_ulint
implement g0uint_isneqz<ulintknd> = g0uint_isneqz_ulint
implement g0uint_lt<ulintknd> = g0uint_lt_ulint
implement g0uint_lte<ulintknd> = g0uint_lte_ulint
implement g0uint_gt<ulintknd> = g0uint_gt_ulint
implement g0uint_gte<ulintknd> = g0uint_gte_ulint
implement g0uint_eq<ulintknd> = g0uint_eq_ulint
implement g0uint_neq<ulintknd> = g0uint_neq_ulint
implement g0uint_compare<ulintknd> = g0uint_compare_ulint
implement g0uint_max<ulintknd> = g0uint_max_ulint
implement g0uint_min<ulintknd> = g0uint_min_ulint
//
implement fprint_val<ulint> (out, x) = fprint_ulint (out, x)
//
implement g0uint_succ<ullintknd> = g0uint_succ_ullint
implement g0uint_pred<ullintknd> = g0uint_pred_ullint
implement g0uint_half<ullintknd> = g0uint_half_ullint
implement g0uint_add<ullintknd> = g0uint_add_ullint
implement g0uint_sub<ullintknd> = g0uint_sub_ullint
implement g0uint_mul<ullintknd> = g0uint_mul_ullint
implement g0uint_div<ullintknd> = g0uint_div_ullint
implement g0uint_mod<ullintknd> = g0uint_mod_ullint
implement g0uint_lsl<ullintknd> = g0uint_lsl_ullint
implement g0uint_lsr<ullintknd> = g0uint_lsr_ullint
implement g0uint_lnot<ullintknd> = g0uint_lnot_ullint
implement g0uint_lor<ullintknd> = g0uint_lor_ullint
implement g0uint_lxor<ullintknd> = g0uint_lxor_ullint
implement g0uint_land<ullintknd> = g0uint_land_ullint
implement g0uint_isgtz<ullintknd> = g0uint_isgtz_ullint
implement g0uint_iseqz<ullintknd> = g0uint_iseqz_ullint
implement g0uint_isneqz<ullintknd> = g0uint_isneqz_ullint
implement g0uint_lt<ullintknd> = g0uint_lt_ullint
implement g0uint_lte<ullintknd> = g0uint_lte_ullint
implement g0uint_gt<ullintknd> = g0uint_gt_ullint
implement g0uint_gte<ullintknd> = g0uint_gte_ullint
implement g0uint_eq<ullintknd> = g0uint_eq_ullint
implement g0uint_neq<ullintknd> = g0uint_neq_ullint
implement g0uint_compare<ullintknd> = g0uint_compare_ullint
implement g0uint_max<ullintknd> = g0uint_max_ullint
implement g0uint_min<ullintknd> = g0uint_min_ullint
//
implement fprint_val<ullint> (out, x) = fprint_ullint (out, x)
//
implement g0uint_succ<sizeknd> = g0uint_succ_size
implement g0uint_pred<sizeknd> = g0uint_pred_size
implement g0uint_half<sizeknd> = g0uint_half_size
implement g0uint_add<sizeknd> = g0uint_add_size
implement g0uint_sub<sizeknd> = g0uint_sub_size
implement g0uint_mul<sizeknd> = g0uint_mul_size
implement g0uint_div<sizeknd> = g0uint_div_size
implement g0uint_mod<sizeknd> = g0uint_mod_size
implement g0uint_lsl<sizeknd> = g0uint_lsl_size
implement g0uint_lsr<sizeknd> = g0uint_lsr_size
implement g0uint_lnot<sizeknd> = g0uint_lnot_size
implement g0uint_lor<sizeknd> = g0uint_lor_size
implement g0uint_lxor<sizeknd> = g0uint_lxor_size
implement g0uint_land<sizeknd> = g0uint_land_size
implement g0uint_isgtz<sizeknd> = g0uint_isgtz_size
implement g0uint_iseqz<sizeknd> = g0uint_iseqz_size
implement g0uint_isneqz<sizeknd> = g0uint_isneqz_size
implement g0uint_lt<sizeknd> = g0uint_lt_size
implement g0uint_lte<sizeknd> = g0uint_lte_size
implement g0uint_gt<sizeknd> = g0uint_gt_size
implement g0uint_gte<sizeknd> = g0uint_gte_size
implement g0uint_eq<sizeknd> = g0uint_eq_size
implement g0uint_neq<sizeknd> = g0uint_neq_size
implement g0uint_compare<sizeknd> = g0uint_compare_size
implement g0uint_max<sizeknd> = g0uint_max_size
implement g0uint_min<sizeknd> = g0uint_min_size
//
implement fprint_val<size_t> (out, x) = fprint_size (out, x)
//
(* ****** ****** *)
//
// HX: int -> uint
//
implement
g1int2uint<intknd,uintknd> = g1int2uint_int_uint
implement
g1int2uint<intknd,ulintknd> = g1int2uint_int_ulint
implement
g1int2uint<intknd,ullintknd> = g1int2uint_int_ullint
implement
g1int2uint<intknd,sizeknd> = g1int2uint_int_size
//
implement
g1int2uint<ssizeknd,sizeknd> = g1int2uint_ssize_size

(* ****** ****** *)
//
// HX: uint -> int
//
implement
g1uint2int<uintknd,intknd> = g1uint2int_uint_int
implement
g1uint2int<uintknd,lintknd> = g1uint2int_uint_lint
implement
g1uint2int<uintknd,llintknd> = g1uint2int_uint_llint
implement
g1uint2int<uintknd,ssizeknd> = g1uint2int_uint_ssize
//
implement
g1uint2int<sizeknd,intknd> = g1uint2int_size_int
implement
g1uint2int<sizeknd,lintknd> = g1uint2int_size_lint
implement
g1uint2int<sizeknd,llintknd> = g1uint2int_size_llint
implement
g1uint2int<sizeknd,ssizeknd> = g1uint2int_size_ssize

(* ****** ****** *)
//
// HX: uint -> uint
//
implement
g1uint2uint<uintknd,uintknd> = g1uint2uint_uint_uint
implement
g1uint2uint<uintknd,ulintknd> = g1uint2uint_uint_ulint
implement
g1uint2uint<uintknd,ullintknd> = g1uint2uint_uint_ullint
implement
g1uint2uint<uintknd,sizeknd> = g1uint2uint_uint_size
//
implement
g1uint2uint<sizeknd,uintknd> = g1uint2uint_size_uint
implement
g1uint2uint<sizeknd,ulintknd> = g1uint2uint_size_ulint
implement
g1uint2uint<sizeknd,ullintknd> = g1uint2uint_size_ullint
implement
g1uint2uint<sizeknd,sizeknd> = g1uint2uint_size_size

(* ****** ****** *)

implement g1uint_succ<uintknd> = g1uint_succ_uint
implement g1uint_pred<uintknd> = g1uint_pred_uint
implement g1uint_half<uintknd> = g1uint_half_uint
implement g1uint_add<uintknd> = g1uint_add_uint
implement g1uint_sub<uintknd> = g1uint_sub_uint
implement g1uint_mul<uintknd> = g1uint_mul_uint
implement g1uint_div<uintknd> = g1uint_div_uint
implement g1uint_mod<uintknd> = g1uint_mod_uint
implement g1uint_isgtz<uintknd> = g1uint_isgtz_uint
implement g1uint_iseqz<uintknd> = g1uint_iseqz_uint
implement g1uint_isneqz<uintknd> = g1uint_isneqz_uint
implement g1uint_lt<uintknd> = g1uint_lt_uint
implement g1uint_lte<uintknd> = g1uint_lte_uint
implement g1uint_gt<uintknd> = g1uint_gt_uint
implement g1uint_gte<uintknd> = g1uint_gte_uint
implement g1uint_eq<uintknd> = g1uint_eq_uint
implement g1uint_neq<uintknd> = g1uint_neq_uint
implement g1uint_compare<uintknd> = g1uint_compare_uint
implement g1uint_max<uintknd> = g1uint_max_uint
implement g1uint_min<uintknd> = g1uint_min_uint
//
implement g1uint_succ<ulintknd> = g1uint_succ_ulint
implement g1uint_pred<ulintknd> = g1uint_pred_ulint
implement g1uint_half<ulintknd> = g1uint_half_ulint
implement g1uint_add<ulintknd> = g1uint_add_ulint
implement g1uint_sub<ulintknd> = g1uint_sub_ulint
implement g1uint_mul<ulintknd> = g1uint_mul_ulint
implement g1uint_div<ulintknd> = g1uint_div_ulint
implement g1uint_mod<ulintknd> = g1uint_mod_ulint
implement g1uint_isgtz<ulintknd> = g1uint_isgtz_ulint
implement g1uint_iseqz<ulintknd> = g1uint_iseqz_ulint
implement g1uint_isneqz<ulintknd> = g1uint_isneqz_ulint
implement g1uint_lt<ulintknd> = g1uint_lt_ulint
implement g1uint_lte<ulintknd> = g1uint_lte_ulint
implement g1uint_gt<ulintknd> = g1uint_gt_ulint
implement g1uint_gte<ulintknd> = g1uint_gte_ulint
implement g1uint_eq<ulintknd> = g1uint_eq_ulint
implement g1uint_neq<ulintknd> = g1uint_neq_ulint
implement g1uint_compare<ulintknd> = g1uint_compare_ulint
implement g1uint_max<ulintknd> = g1uint_max_ulint
implement g1uint_min<ulintknd> = g1uint_min_ulint
//
implement g1uint_succ<ullintknd> = g1uint_succ_ullint
implement g1uint_pred<ullintknd> = g1uint_pred_ullint
implement g1uint_half<ullintknd> = g1uint_half_ullint
implement g1uint_add<ullintknd> = g1uint_add_ullint
implement g1uint_sub<ullintknd> = g1uint_sub_ullint
implement g1uint_mul<ullintknd> = g1uint_mul_ullint
implement g1uint_div<ullintknd> = g1uint_div_ullint
implement g1uint_mod<ullintknd> = g1uint_mod_ullint
implement g1uint_isgtz<ullintknd> = g1uint_isgtz_ullint
implement g1uint_iseqz<ullintknd> = g1uint_iseqz_ullint
implement g1uint_isneqz<ullintknd> = g1uint_isneqz_ullint
implement g1uint_lt<ullintknd> = g1uint_lt_ullint
implement g1uint_lte<ullintknd> = g1uint_lte_ullint
implement g1uint_gt<ullintknd> = g1uint_gt_ullint
implement g1uint_gte<ullintknd> = g1uint_gte_ullint
implement g1uint_eq<ullintknd> = g1uint_eq_ullint
implement g1uint_neq<ullintknd> = g1uint_neq_ullint
implement g1uint_compare<ullintknd> = g1uint_compare_ullint
implement g1uint_max<ullintknd> = g1uint_max_ullint
implement g1uint_min<ullintknd> = g1uint_min_ullint
//
implement g1uint_succ<sizeknd> = g1uint_succ_size
implement g1uint_pred<sizeknd> = g1uint_pred_size
implement g1uint_half<sizeknd> = g1uint_half_size
implement g1uint_add<sizeknd> = g1uint_add_size
implement g1uint_sub<sizeknd> = g1uint_sub_size
implement g1uint_mul<sizeknd> = g1uint_mul_size
implement g1uint_div<sizeknd> = g1uint_div_size
implement g1uint_mod<sizeknd> = g1uint_mod_size
implement g1uint_isgtz<sizeknd> = g1uint_isgtz_size
implement g1uint_iseqz<sizeknd> = g1uint_iseqz_size
implement g1uint_isneqz<sizeknd> = g1uint_isneqz_size
implement g1uint_lt<sizeknd> = g1uint_lt_size
implement g1uint_lte<sizeknd> = g1uint_lte_size
implement g1uint_gt<sizeknd> = g1uint_gt_size
implement g1uint_gte<sizeknd> = g1uint_gte_size
implement g1uint_eq<sizeknd> = g1uint_eq_size
implement g1uint_neq<sizeknd> = g1uint_neq_size
implement g1uint_compare<sizeknd> = g1uint_compare_size
implement g1uint_max<sizeknd> = g1uint_max_size
implement g1uint_min<sizeknd> = g1uint_min_size
//
(* ****** ****** *)

implement
{tk}(*tmp*)
g1uint_div2 {i,j} (x, y) = let
//
  prval () = lemma_g1uint_param (x)
//
  val [q:int] q = g1uint_div (x, y)
  prval [q2:int,r:int] pf = divmod_istot{i,j}()
  prval EQINT() = $UN.castview0{EQINT(q,q2)}(0)
in
  (pf | q)
end // end of [let] // end of [g1uint_div2]

(* ****** ****** *)

implement
{tk}(*tmp*)
g1uint_mod2 {i,j} (x, y) = let
//
  prval () = lemma_g1uint_param (x)
//
  val [r:int] r = g1uint_mod (x, y)
  prval [q:int,r2:int] pf = divmod_istot{i,j}()
  prval EQINT() = $UN.castview0{EQINT(r,r2)}(0)
in
  (pf | r)
end // end of [let] // end of [g1uint_mod2]

(* ****** ****** *)
//
implement g0int2string<intknd> = g0int2string_int
implement g0int2string<lintknd> = g0int2string_lint
implement g0int2string<llintknd> = g0int2string_llint
(*
implement g0int2string<ssizeknd> = g0int2string_ssize
*)
//
(* ****** ****** *)
//
implement g0string2int<intknd> = g0string2int_int
implement g0string2int<lintknd> = g0string2int_lint
implement g0string2int<llintknd> = g0string2int_llint
implement g0string2int<ssizeknd> = g0string2int_ssize
//
implement g0string2uint<uintknd> = g0string2uint_uint
implement g0string2uint<ulintknd> = g0string2uint_ulint
implement g0string2uint<ullintknd> = g0string2uint_ullint
implement g0string2uint<sizeknd> = g0string2uint_size
//
(* ****** ****** *)

implement{tk}
g1string2int (str) = g1ofg0_int (g0string2int<tk> (str))
implement{tk}
g1string2uint (str) = g1ofg0_uint (g0string2uint<tk> (str))

(* ****** ****** *)

implement{tk}
lt_g0int_int (x, y) = g0int_lt<tk> (x, g0int2int (y))
implement{tk}
lte_g0int_int (x, y) = g0int_lte<tk> (x, g0int2int (y))
implement{tk}
gt_g0int_int (x, y) = g0int_gt<tk> (x, g0int2int (y))
implement{tk}
gte_g0int_int (x, y) = g0int_gte<tk> (x, g0int2int (y))
implement{tk}
eq_g0int_int (x, y) = g0int_eq<tk> (x, g0int2int (y))
implement{tk}
neq_g0int_int (x, y) = g0int_neq<tk> (x, g0int2int (y))

implement{tk}
compare_g0int_int (x, y) = g0int_compare<tk> (x, g0int2int (y))

(* ****** ****** *)

implement{tk}
lt_g1int_int (x, y) = g1int_lt<tk> (x, g1int2int (y))
implement{tk}
lte_g1int_int (x, y) = g1int_lte<tk> (x, g1int2int (y))
implement{tk}
gt_g1int_int (x, y) = g1int_gt<tk> (x, g1int2int (y))
implement{tk}
gte_g1int_int (x, y) = g1int_gte<tk> (x, g1int2int (y))
implement{tk}
eq_g1int_int (x, y) = g1int_eq<tk> (x, g1int2int (y))
implement{tk}
neq_g1int_int (x, y) = g1int_neq<tk> (x, g1int2int (y))

implement{tk}
compare_g1int_int (x, y) = g1int_compare<tk> (x, g1int2int (y))

(* ****** ****** *)

implement{tk}
lt_g0uint_int (x, y) = g0uint_lt<tk> (x, g0int2uint (y))
implement{tk}
lte_g0uint_int (x, y) = g0uint_lte<tk> (x, g0int2uint (y))
implement{tk}
gt_g0uint_int (x, y) = g0uint_gt<tk> (x, g0int2uint (y))
implement{tk}
gte_g0uint_int (x, y) = g0uint_gte<tk> (x, g0int2uint (y))
implement{tk}
eq_g0uint_int (x, y) = g0uint_eq<tk> (x, g0int2uint (y))
implement{tk}
neq_g0uint_int (x, y) = g0uint_neq<tk> (x, g0int2uint (y))

(* ****** ****** *)

implement{tk}
lt_g1uint_int (x, y) = g1uint_lt<tk> (x, g1int2uint (y))
implement{tk}
lte_g1uint_int (x, y) = g1uint_lte<tk> (x, g1int2uint (y))
implement{tk}
gt_g1uint_int (x, y) = g1uint_gt<tk> (x, g1int2uint (y))
implement{tk}
gte_g1uint_int (x, y) = g1uint_gte<tk> (x, g1int2uint (y))
implement{tk}
eq_g1uint_int (x, y) = g1uint_eq<tk> (x, g1int2uint (y))
implement{tk}
neq_g1uint_int (x, y) = g1uint_neq<tk> (x, g1int2uint (y))

(* ****** ****** *)

(* end of [integer.dats] *)
