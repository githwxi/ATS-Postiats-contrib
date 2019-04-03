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
** $PATSHOME/prelude/DATS/CODEGEN/integer.atxt
** Time of generation: Tue Dec  6 09:50:55 2016
*)

(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0 // no dynloading
//
(* ****** ****** *)
//
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
g0int2int<intknd,intknd> = g0int2int_int_int

(* ****** ****** *)
//
implement
g0int_neg<intknd> = g0int_neg_int
implement
g0int_abs<intknd> = g0int_abs_int
implement
g0int_succ<intknd> = g0int_succ_int
implement
g0int_pred<intknd> = g0int_pred_int
implement
g0int_half<intknd> = g0int_half_int
implement
g0int_add<intknd> = g0int_add_int
implement
g0int_sub<intknd> = g0int_sub_int
implement
g0int_mul<intknd> = g0int_mul_int
implement
g0int_div<intknd> = g0int_div_int
implement
g0int_mod<intknd> = g0int_mod_int
implement
g0int_asl<intknd> = g0int_asl_int
implement
g0int_asr<intknd> = g0int_asr_int
implement
g0int_isltz<intknd> = g0int_isltz_int
implement
g0int_isltez<intknd> = g0int_isltez_int
implement
g0int_isgtz<intknd> = g0int_isgtz_int
implement
g0int_isgtez<intknd> = g0int_isgtez_int
implement
g0int_iseqz<intknd> = g0int_iseqz_int
implement
g0int_isneqz<intknd> = g0int_isneqz_int
implement
g0int_lt<intknd> = g0int_lt_int
implement
g0int_lte<intknd> = g0int_lte_int
implement
g0int_gt<intknd> = g0int_gt_int
implement
g0int_gte<intknd> = g0int_gte_int
implement
g0int_eq<intknd> = g0int_eq_int
implement
g0int_neq<intknd> = g0int_neq_int
implement
g0int_compare<intknd> = g0int_compare_int
implement
g0int_max<intknd> = g0int_max_int
implement
g0int_min<intknd> = g0int_min_int
//
implement
fprint_val<int> (out, x) = fprint_int (out, x)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
mul_int1_size0(i, j) =
  let val i = g1int2uint_int_size(i) in i * j end
implement
{}(*tmp*)
mul_size0_int1(i, j) =
  let val j = g1int2uint_int_size(j) in i * j end
//
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
//
implement
g1int2int<intknd,intknd> = g1int2int_int_int
//
(* ****** ****** *)
//
implement
g1int_neg<intknd> = g1int_neg_int
implement
g1int_abs<intknd> = g1int_abs_int
implement
g1int_succ<intknd> = g1int_succ_int
implement
g1int_pred<intknd> = g1int_pred_int
implement
g1int_half<intknd> = g1int_half_int
implement
g1int_add<intknd> = g1int_add_int
implement
g1int_sub<intknd> = g1int_sub_int
implement
g1int_mul<intknd> = g1int_mul_int
implement
g1int_div<intknd> = g1int_div_int
implement
g1int_nmod<intknd> = g1int_nmod_int
implement
g1int_isltz<intknd> = g1int_isltz_int
implement
g1int_isltez<intknd> = g1int_isltez_int
implement
g1int_isgtz<intknd> = g1int_isgtz_int
implement
g1int_isgtez<intknd> = g1int_isgtez_int
implement
g1int_iseqz<intknd> = g1int_iseqz_int
implement
g1int_isneqz<intknd> = g1int_isneqz_int
implement
g1int_lt<intknd> = g1int_lt_int
implement
g1int_lte<intknd> = g1int_lte_int
implement
g1int_gt<intknd> = g1int_gt_int
implement
g1int_gte<intknd> = g1int_gte_int
implement
g1int_eq<intknd> = g1int_eq_int
implement
g1int_neq<intknd> = g1int_neq_int
implement
g1int_compare<intknd> = g1int_compare_int
implement
g1int_max<intknd> = g1int_max_int
implement
g1int_min<intknd> = g1int_min_int
//
(* ****** ****** *)

implement
{tk}(*tmp*)
g1int_sgn(x) = compare_g1int_int<tk> (x, 0)

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

implement
{tk}(*tmp*)
g1int_mul2
  {i,j}(x, y) = let
//
prval pf =
  mul_make{i,j}() in (pf | g1int_mul<tk> (x, y))
//
end // end of [let] // end of [g1int_mul2]

(* ****** ****** *)
//
implement
{}(*tmp*)
mul_int1_size1
  {i,j}(i, j) = $UN.cast{size_t(i*j)}(g0i2u(i)*j)
implement
{}(*tmp*)
mul_size1_int1
  {i,j}(i, j) = $UN.cast{size_t(i*j)}(i*g0i2u(j))
//
(* ****** ****** *)

implement
{tk}(*tmp*)
g1int_ndiv
  {i,j}(x, y) = let
//
val q =
g1int_div<tk>(x, y) in $UN.cast{g1int(tk,ndiv(i,j))}(q)
//
end // end of [let] // end of [g1int_ndiv]

(* ****** ****** *)

implement
{tk}(*tmp*)
g1int_ndiv2
  {i,j}(x, y) = let
//
val
[q:int] q = g1int_div(x, y)
//
prval
[q2:int,r:int]
pf_istot = divmod_istot{i,j}()
//
prval
EQINT((*void*)) =
  $UN.castview0{EQINT(q,q2)}(0)
//
in
  (pf_istot | q(*quotient*))
end // end of [let] // end of [g1int_ndiv2]

(* ****** ****** *)
//
implement
{tk}(*tmp*)
ndiv_g1int_int1
  (x, y) = g1i2i(g1int_ndiv(x, g1i2i(y)))
//
(* ****** ****** *)

implement
{tk}(*tmp*)
g1int_nmod2
  {i,j}(x, y) = let
//
val r = g1int_nmod(x, y)
//
prval
[q:int,r2:int]
pf_istot = divmod_istot{i,j}()
//
prval
EQINT((*void*)) =
  $UN.castview0{EQINT(i%j,r2)}(0)
//
in
  (pf_istot | r(*remainder*))
end // end of [let] // end of [g1int_nmod2]

(* ****** ****** *)
//
implement
{tk}(*tmp*)
nmod_g1int_int1
  (x, y) = g1i2i(g1int_nmod(x, g1i2i(y)))
//
(* ****** ****** *)

implement
{tk}(*tmp*)
nmod2_g1int_int1
  {i,j}(x, y) = let
//
val r = nmod_g1int_int1(x, y)
//
prval
[q:int,r2:int]
pf_istot = divmod_istot{i,j}()
//
prval
EQINT((*void*)) = $UN.castview0{EQINT(i%j,r2)}(0)
//
in
  (pf_istot | r(*remainder*))
end // end of [let] // end of [nmod2_g1int_int1]

(* ****** ****** *)

(*
//
// HX-2016-12:
// [ngcd] is no longer pre-declared
//
implement
{tk}(*tmp*)
g1int_ngcd
  (x, y) = let
//
fun
loop{i,j:nat} .<j>.
(
  x: g1int(tk, i)
, y: g1int(tk, j)
) :<> [r:nat] g1int(tk, r) = let
in
//
if y > 0 then loop (y, g1int_nmod(x, y)) else x
//
end // end of [loop]
//
in
  loop (x, y)
end // end of [g1int_ngcd]
*)

(* ****** ****** *)
//
// HX: int -> uint
//
implement
g0int2uint<intknd,uintknd> = g0int2uint_int_uint
//
(* ****** ****** *)
//
// HX: uint -> int
//
implement
g0uint2int<uintknd,intknd> = g0uint2int_uint_int
//
(* ****** ****** *)
//
// HX: uint -> uint
//
implement
g0uint2uint<uintknd,uintknd> = g0uint2uint_uint_uint
//
(* ****** ****** *)
//
implement
g0uint_succ<uintknd> = g0uint_succ_uint
implement
g0uint_pred<uintknd> = g0uint_pred_uint
implement
g0uint_half<uintknd> = g0uint_half_uint
implement
g0uint_add<uintknd> = g0uint_add_uint
implement
g0uint_sub<uintknd> = g0uint_sub_uint
implement
g0uint_mul<uintknd> = g0uint_mul_uint
implement
g0uint_div<uintknd> = g0uint_div_uint
implement
g0uint_mod<uintknd> = g0uint_mod_uint
implement
g0uint_lsl<uintknd> = g0uint_lsl_uint
implement
g0uint_lsr<uintknd> = g0uint_lsr_uint
implement
g0uint_lnot<uintknd> = g0uint_lnot_uint
implement
g0uint_lor<uintknd> = g0uint_lor_uint
implement
g0uint_lxor<uintknd> = g0uint_lxor_uint
implement
g0uint_land<uintknd> = g0uint_land_uint
implement
g0uint_isgtz<uintknd> = g0uint_isgtz_uint
implement
g0uint_iseqz<uintknd> = g0uint_iseqz_uint
implement
g0uint_isneqz<uintknd> = g0uint_isneqz_uint
implement
g0uint_lt<uintknd> = g0uint_lt_uint
implement
g0uint_lte<uintknd> = g0uint_lte_uint
implement
g0uint_gt<uintknd> = g0uint_gt_uint
implement
g0uint_gte<uintknd> = g0uint_gte_uint
implement
g0uint_eq<uintknd> = g0uint_eq_uint
implement
g0uint_neq<uintknd> = g0uint_neq_uint
implement
g0uint_compare<uintknd> = g0uint_compare_uint
implement
g0uint_max<uintknd> = g0uint_max_uint
implement
g0uint_min<uintknd> = g0uint_min_uint
//
implement
fprint_val<uint> (out, x) = fprint_uint (out, x)//
(* ****** ****** *)
//
// HX: int -> uint
//
implement
g1int2uint<intknd,uintknd> = g1int2uint_int_uint
//
(* ****** ****** *)
//
// HX: uint -> int
//
implement
g1uint2int<uintknd,intknd> = g1uint2int_uint_int
//
(* ****** ****** *)
//
// HX: uint -> uint
//
implement
g1uint2uint<uintknd,uintknd> = g1uint2uint_uint_uint
//
(* ****** ****** *)
//
implement
g1uint_succ<uintknd> = g1uint_succ_uint
implement
g1uint_pred<uintknd> = g1uint_pred_uint
implement
g1uint_half<uintknd> = g1uint_half_uint
implement
g1uint_add<uintknd> = g1uint_add_uint
implement
g1uint_sub<uintknd> = g1uint_sub_uint
implement
g1uint_mul<uintknd> = g1uint_mul_uint
implement
g1uint_div<uintknd> = g1uint_div_uint
implement
g1uint_mod<uintknd> = g1uint_mod_uint
implement
g1uint_isgtz<uintknd> = g1uint_isgtz_uint
implement
g1uint_iseqz<uintknd> = g1uint_iseqz_uint
implement
g1uint_isneqz<uintknd> = g1uint_isneqz_uint
implement
g1uint_lt<uintknd> = g1uint_lt_uint
implement
g1uint_lte<uintknd> = g1uint_lte_uint
implement
g1uint_gt<uintknd> = g1uint_gt_uint
implement
g1uint_gte<uintknd> = g1uint_gte_uint
implement
g1uint_eq<uintknd> = g1uint_eq_uint
implement
g1uint_neq<uintknd> = g1uint_neq_uint
implement
g1uint_compare<uintknd> = g1uint_compare_uint
implement
g1uint_max<uintknd> = g1uint_max_uint
implement
g1uint_min<uintknd> = g1uint_min_uint
//
(* ****** ****** *)

implement
{tk}(*tmp*)
g1uint_div2
  {i,j}(x, y) = let
//
prval () = lemma_g1uint_param (x)
//
val [q:int] q = g1uint_div (x, y)
//
prval
[q2:int,r:int] pf = divmod_istot{i,j}((*void*))
//
prval EQINT((*void*)) = $UN.castview0{EQINT(q,q2)}(0)
//
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
//
(* ****** ****** *)
//
implement g0string2int<intknd> = g0string2int_int
implement g0string2uint<uintknd> = g0string2uint_uint
//
(* ****** ****** *)

implement
{tk}(*tmp*)
g1string2int(rep) = g1ofg0_int(g0string2int<tk>(rep))
implement
{tk}(*tmp*)
g1string2uint(rep) = g1ofg0_uint(g0string2uint<tk>(rep))

(* ****** ****** *)

implement
{tk}(*tmp*)
lt_g0int_int
  (x, y) = g0int_lt<tk> (x, g0int2int(y))
implement
{tk}(*tmp*)
lte_g0int_int
  (x, y) = g0int_lte<tk> (x, g0int2int(y))
//
implement
{tk}(*tmp*)
gt_g0int_int
  (x, y) = g0int_gt<tk> (x, g0int2int(y))
implement
{tk}(*tmp*)
gte_g0int_int
  (x, y) = g0int_gte<tk> (x, g0int2int(y))
//
implement
{tk}(*tmp*)
eq_g0int_int
  (x, y) = g0int_eq<tk> (x, g0int2int(y))
implement
{tk}(*tmp*)
neq_g0int_int
  (x, y) = g0int_neq<tk> (x, g0int2int(y))
//
implement{tk}
compare_g0int_int
  (x, y) = g0int_compare<tk>(x, g0int2int(y))
//
(* ****** ****** *)

implement
{tk}(*tmp*)
lt_g1int_int
  (x, y) = g1int_lt<tk> (x, g1int2int(y))
implement
{tk}(*tmp*)
lte_g1int_int
  (x, y) = g1int_lte<tk> (x, g1int2int(y))
//
implement
{tk}(*tmp*)
gt_g1int_int
  (x, y) = g1int_gt<tk> (x, g1int2int(y))
implement
{tk}(*tmp*)
gte_g1int_int
  (x, y) = g1int_gte<tk> (x, g1int2int(y))
//
implement
{tk}(*tmp*)
eq_g1int_int
  (x, y) = g1int_eq<tk> (x, g1int2int(y))
implement
{tk}(*tmp*)
neq_g1int_int
  (x, y) = g1int_neq<tk> (x, g1int2int(y))
//
implement
{tk}(*tmp*)
compare_g1int_int
  (x, y) = g1int_compare<tk> (x, g1int2int(y))
//
(* ****** ****** *)

implement
{tk}(*tmp*)
lt_g0uint_int
  (x, y) = g0uint_lt<tk> (x, g0int2uint(y))
implement
{tk}(*tmp*)
lte_g0uint_int
  (x, y) = g0uint_lte<tk> (x, g0int2uint(y))
//
implement
{tk}(*tmp*)
gt_g0uint_int
  (x, y) = g0uint_gt<tk> (x, g0int2uint(y))
implement
{tk}(*tmp*)
gte_g0uint_int
  (x, y) = g0uint_gte<tk> (x, g0int2uint(y))
//
implement
{tk}(*tmp*)
eq_g0uint_int
  (x, y) = g0uint_eq<tk> (x, g0int2uint(y))
implement
{tk}(*tmp*)
neq_g0uint_int
  (x, y) = g0uint_neq<tk> (x, g0int2uint(y))
//
(* ****** ****** *)

implement
{tk}(*tmp*)
lt_g1uint_int
  (x, y) = g1uint_lt<tk> (x, g1int2uint(y))
implement
{tk}(*tmp*)
lte_g1uint_int
  (x, y) = g1uint_lte<tk> (x, g1int2uint(y))
//
implement
{tk}(*tmp*)
gt_g1uint_int
  (x, y) = g1uint_gt<tk> (x, g1int2uint(y))
implement
{tk}(*tmp*)
gte_g1uint_int
  (x, y) = g1uint_gte<tk> (x, g1int2uint(y))
//
implement
{tk}(*tmp*)
eq_g1uint_int
  (x, y) = g1uint_eq<tk> (x, g1int2uint(y))
implement
{tk}(*tmp*)
neq_g1uint_int
  (x, y) = g1uint_neq<tk> (x, g1int2uint(y))
//
(* ****** ****** *)

(* end of [integer.dats] *)
