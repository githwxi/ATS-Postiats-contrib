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
(* Start time: September, 2011 *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/integer.atxt
** Time of generation: Tue Dec  6 09:50:54 2016
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
stadef intknd = int_kind
stadef uintknd = uint_kind
//
(* ****** ****** *)
//
fun{
k1,k2:tk
} g0int2int(x: g0int(k1)):<> g0int(k2)
//
fun
g0int2int_int_int(i0: int):<> int = "mac#%"
//
(* ****** ****** *)
//
// HX-2015-09-20:
// These are implemented in prelude/string.cats:
//
fun{tk:tk}
g0int2string(g0int(tk)):<!wrt> Strptr1
//
fun
g0int2string_int(i0: int):<!wrt> Strptr1 = "mac#%"
//
(* ****** ****** *)
//
fun{tk:tk}
g0string2int(rep: NSH(string)):<> g0int(tk)
//
fun
g0string2int_int(rep: NSH(string)):<> int = "mac#%"
//
(* ****** ****** *)
//
typedef
g0int_uop_type
  (tk: tk) =
  (g0int(tk)) -<fun0> g0int(tk)
//
(* ****** ****** *)
//
fun
{tk:tk}
g0int_neg : g0int_uop_type(tk)
overload ~ with g0int_neg of 0
overload neg with g0int_neg of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0int_abs : g0int_uop_type(tk)
overload abs with g0int_abs of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0int_succ : g0int_uop_type(tk)
fun
{tk:tk}
g0int_pred : g0int_uop_type(tk)
//
overload succ with g0int_succ of 0
overload pred with g0int_pred of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0int_half : g0int_uop_type(tk)
overload half with g0int_half of 0
//
(*
fun
{tk:tk}
g0int_double : g0int_uop_type(tk)
overload double with g0int_double of 0
*)
//
(* ****** ****** *)

typedef
g0int_aop_type
  (tk: tk) =
(
  g0int(tk)
, g0int(tk)
) -<fun0> g0int (tk)
// end of [g0int_aop_type]

fun
{tk:tk}
g0int_add : g0int_aop_type(tk)
overload + with g0int_add of 0
fun
{tk:tk}
g0int_sub : g0int_aop_type(tk)
overload - with g0int_sub of 0
fun
{tk:tk}
g0int_mul : g0int_aop_type(tk)
overload * with g0int_mul of 0
fun
{tk:tk}
g0int_div : g0int_aop_type(tk)
overload / with g0int_div of 0
fun
{tk:tk}
g0int_mod : g0int_aop_type(tk)
overload % with g0int_mod of 0
overload mod with g0int_mod of 0

(* ****** ****** *)

fun{}
mul_int1_size0{i:nat}(int(i), size_t):<> size_t
fun{}
mul_size0_int1{j:nat}(size_t, int(j)):<> size_t

(* ****** ****** *)

overload * with mul_int1_size0 of 11
overload * with mul_size0_int1 of 11

(* ****** ****** *)
//
fun
{tk:tk}
g0int_asl
  (x: g0int(tk), n: intGte(0)):<> g0int(tk)
fun
{tk:tk}
g0int_asr
  (x: g0int(tk), n: intGte(0)):<> g0int(tk)
//
overload << with g0int_asl of 0
overload >> with g0int_asr of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0int_npow
  (x: g0int(tk), n: intGte(0)):<> g0int(tk)
//
overload ** with g0int_npow of 0
//
(* ****** ****** *)
//
fun{tk:tk}
g0int_isltz (x: g0int (tk)):<> bool
fun{tk:tk}
g0int_isltez (x: g0int (tk)):<> bool
//
fun{tk:tk}
g0int_isgtz (x: g0int (tk)):<> bool
fun{tk:tk}
g0int_isgtez (x: g0int (tk)):<> bool
//
fun{tk:tk}
g0int_iseqz (x: g0int (tk)):<> bool
fun{tk:tk}
g0int_isneqz (x: g0int (tk)):<> bool
//
overload isltz with g0int_isltz of 0
overload isltez with g0int_isltez of 0
overload isgtz with g0int_isgtz of 0
overload isgtez with g0int_isgtez of 0
overload iseqz with g0int_iseqz of 0
overload isneqz with g0int_isneqz of 0
//
(* ****** ****** *)

typedef
g0int_cmp_type (tk:tk) =
  (g0int (tk), g0int (tk)) -<fun0> bool
// end of [g0int_cmp_type]

fun
{tk:tk}
g0int_lt : g0int_cmp_type(tk)
overload < with g0int_lt of 0
fun
{tk:tk}
g0int_lte : g0int_cmp_type(tk)
overload <= with g0int_lte of 0

fun
{tk:tk}
g0int_gt : g0int_cmp_type(tk)
overload > with g0int_gt of 0
fun
{tk:tk}
g0int_gte : g0int_cmp_type(tk)
overload >= with g0int_gte of 0

fun
{tk:tk}
g0int_eq : g0int_cmp_type(tk)
overload = with g0int_eq of 0
fun
{tk:tk}
g0int_neq : g0int_cmp_type(tk)
overload != with g0int_neq of 0
overload <> with g0int_neq of 0

(* ****** ****** *)

fun{tk:tk}
g0int_compare
  (x: g0int (tk), y: g0int (tk)):<> int
overload compare with g0int_compare of 0

(* ****** ****** *)

fun
{tk:tk}
g0int_max : g0int_aop_type(tk)
overload max with g0int_max of 0
fun
{tk:tk}
g0int_min : g0int_aop_type(tk)
overload min with g0int_min of 0

(* ****** ****** *)

fun{tk:tk}
lt_g0int_int (x: g0int (tk), y: int):<> bool
overload < with lt_g0int_int of 11
fun{tk:tk}
lte_g0int_int (x: g0int (tk), y: int):<> bool
overload <= with lte_g0int_int of 11
//
fun{tk:tk}
gt_g0int_int (x: g0int (tk), y: int):<> bool
overload > with gt_g0int_int of 11
fun{tk:tk}
gte_g0int_int (x: g0int (tk), y: int):<> bool
overload >= with gte_g0int_int of 11
//
fun{tk:tk}
eq_g0int_int (x: g0int (tk), y: int):<> bool
overload = with eq_g0int_int of 11
fun{tk:tk}
neq_g0int_int (x: g0int (tk), y: int):<> bool
overload != with neq_g0int_int of 11
overload <> with neq_g0int_int of 11
//
fun{tk:tk}
compare_g0int_int (x: g0int (tk), y: int):<> int
overload compare with compare_g0int_int of 11

(* ****** ****** *)
//
// HX: for indexed integer types
//
castfn
g0ofg1_int{tk:tk}(g1int(tk)):<> g0int(tk)
castfn
g1ofg0_int{tk:tk}(g0int(tk)):<> g1int(tk)
overload g0ofg1 with g0ofg1_int // index-erasing
overload g1ofg0 with g1ofg0_int // index-inducing
//
(* ****** ****** *)
//
fun{
k1,k2:tk
} g1int2int // i2i
  {i:int} (x: g1int (k1, i)):<> g1int (k2, i)
//
fun
g1int2int_int_int{i:int}(int(i)):<> int(i) = "mac#%"
//
(* ****** ****** *)

fun{tk:tk}
g1string2int (str: NSH(string)):<> g1int(tk)

(* ****** ****** *)

prfun
g1int_get_index
  {tk:tk}{i1:int}
  (x: g1int(tk, i1)): [i2:int] EQINT(i1, i2)
// end of [g1int_get_index]

(* ****** ****** *)
//
typedef
g1int_neg_type (tk:tk) =
  {i:int} g1int(tk, i) -<fun0> g1int(tk, ~i)
//
fun
{tk:tk}
g1int_neg : g1int_neg_type(tk)
overload ~ with g1int_neg of 10 // ~ for uminus
overload neg with g1int_neg of 10

(* ****** ****** *)
//
typedef
g1int_abs_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int(tk, abs(i))
//
fun
{tk:tk}
g1int_abs : g1int_abs_type(tk)
overload abs with g1int_abs of 10
//
(* ****** ****** *)
//
typedef
g1int_succ_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, i+1)
//
fun{tk:tk}
g1int_succ : g1int_succ_type(tk)
overload succ with g1int_succ of 10
//
(* ****** ****** *)
//
typedef
g1int_pred_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, i-1)
//
fun{tk:tk}
g1int_pred : g1int_pred_type(tk)
overload pred with g1int_pred of 10
//
(* ****** ****** *)
//
typedef
g1int_half_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, i/2)
//
fun{tk:tk}
g1int_half : g1int_half_type(tk)
overload half with g1int_half of 10
//

(* ****** ****** *)

(*
//
typedef
g1int_double_type
  (tk:tk) =
  {i:int}
  g1int (tk, i) -<fun0> g1int (tk, 2*i)
//
fun{tk:tk}
g1int_double : g1int_double_type(tk)
overload double with g1int_double of 10
//
*)

(* ****** ****** *)
//
typedef
g1int_add_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> g1int(tk, i+j)
//
fun
{tk:tk}
g1int_add : g1int_add_type(tk)
//
fun{}
add_size1_int1
  {i,j:int | i+j >= 0}
  (i: size_t(i), j: int(j)):<> size_t(i+j)
fun{}
add_int1_size1
  {i,j:int | i+j >= 0}
  (i: int(i), j: size_t(j)):<> size_t(i+j)
//
(* ****** ****** *)

overload + with g1int_add of 20
overload + with add_size1_int1 of 22
overload + with add_int1_size1 of 22

(* ****** ****** *)
//
typedef
g1int_sub_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> g1int(tk, i-j)
//
fun
{tk:tk}
g1int_sub : g1int_sub_type(tk)
//
fun{}
sub_size1_int1
  {i,j:int | i-j >= 0}
  (i: size_t(i), j: int(j)):<> size_t(i-j)
//
(* ****** ****** *)

overload - with g1int_sub of 20
overload - with sub_size1_int1 of 22

(* ****** ****** *)
//
typedef
g1int_mul_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> g1int(tk, i*j)
//
fun
{tk:tk}
g1int_mul : g1int_mul_type(tk)
//
fun
{tk:tk}
g1int_mul2
  {i,j:int}
(
  x: g1int (tk, i)
, y: g1int (tk, j)
) :<> [ij:int]
  (MUL (i, j, ij) | g1int (tk, ij))
// end of [g1int_mul2]
//
fun{}
mul_int1_size1
  {i,j:int | i >= 0}
  (i: int(i), j: size_t(j)):<> size_t(i*j)
fun{}
mul_size1_int1
  {i,j:int | j >= 0}
  (i: size_t(i), j: int(j)):<> size_t(i*j)
//
(* ****** ****** *)

overload * with g1int_mul of 20
overload * with mul_int1_size1 of 22
overload * with mul_size1_int1 of 22

(* ****** ****** *)
//
typedef
g1int_div_type
  (tk:tk) =
  {i,j:int | j != 0}
(
  g1int(tk, i), g1int(tk, j)
) -<fun0>
  [r:int | r == i/j ] g1int(tk, r)
//
typedef
g1int_ndiv_type
  (tk:tk) =
  {i,j:int | i >= 0; j > 0}
(
  g1int(tk, i), g1int(tk, j)
) -<fun0> g1int(tk, ndiv_int_int(i,j))
//
fun
{tk:tk}
g1int_div : g1int_div_type(tk)
fun
{tk:tk}
g1int_ndiv : g1int_ndiv_type(tk)
//
(* ****** ****** *)

fun
{tk:tk}
g1int_ndiv2
  {i,j:int | i >= 0; j > 0}
(
  x: g1int(tk, i), y: g1int(tk, j)
) :<>
[
  q,r:int | 0 <= r; r < j
] (
  DIVMOD (i, j, q, r) | g1int (tk, q)
) (* end of [g1int_ndiv2] *)

(* ****** ****** *)
//
fun{tk:tk}
ndiv_g1int_int1
  {i,j:int | i >= 0; j > 0}
(
  g1int(tk, i), int(j)
) :<> g1int(tk, ndiv_int_int(i,j))
//
(* ****** ****** *)
//
overload / with g1int_div of 20
//
overload ndiv with g1int_ndiv of 20
overload ndiv with ndiv_g1int_int1 of 21
//
(* ****** ****** *)

(*
** HX: [g1int_mod] is intentionally skipped
*)

(* ****** ****** *)
//
typedef
g1int_nmod_type
  (tk:tk) =
  {i,j:int | i >= 0; j > 0}
(
  g1int(tk, i), g1int(tk, j)
) -<fun0> g1int(tk, nmod_int_int(i, j))
//
fun{tk:tk}
g1int_nmod : g1int_nmod_type(tk)
//
overload nmod with g1int_nmod of 20
//
(* ****** ****** *)

fun{tk:tk}
g1int_nmod2
  {i,j:int | i >= 0; j > 0}
(
  x: g1int(tk, i), y: g1int(tk, j)
) :<> [q,r:nat | r < j]
(
  DIVMOD(i, j, q, r) | g1int(tk, r)
) (* end of [g1int_nmod2] *)

(* ****** ****** *)
//
fun{tk:tk}
nmod_g1int_int1
  {i,j:int | i >= 0; j > 0}
  (x: g1int(tk, i), y: int(j)):<> int(i%j)
//
fun{tk:tk}
nmod2_g1int_int1
  {i,j:int | i >= 0; j > 0}
(
  x: g1int(tk, i), y: int(j)
) :<> [q,r:nat | r < j] (DIVMOD(i, j, q, r) | int(r))
//
overload nmod with nmod_g1int_int1 of 21
//
(* ****** ****** *)
//
(*
//
// HX-2016-12:
// [ngcd] is no longer pre-declared
//
typedef
g1int_ngcd_type
  (tk:tk) =
  {i,j:int | i >= 0; j >= 0}
(
  g1int(tk, i), g1int(tk, j)
) -<fun0> g1int(tk, ngcd_int_int(i, j))
//
fun{tk:tk}
g1int_ngcd : g1int_ngcd_type(tk)
//
// overload ngcd with g1int_ngcd of 20
//
*)
//
(* ****** ****** *)
//
typedef
g1int_isltz_type
  (tk:tk) =
  {i:int}
  (g1int(tk, i)) -<fun0> bool(i < 0)
typedef
g1int_isltez_type
  (tk:tk) =
  {i:int}
  (g1int (tk, i)) -<fun0> bool(i <= 0)
//
fun{tk:tk}
g1int_isltz : g1int_isltz_type(tk)
fun{tk:tk}
g1int_isltez : g1int_isltez_type(tk)
//
overload isltz with g1int_isltz of 10
overload isltez with g1int_isltez of 10
//
(* ****** ****** *)
//
typedef
g1int_isgtz_type
  (tk:tk) =
  {i:int}
  (g1int(tk, i)) -<fun0> bool(i > 0)
typedef
g1int_isgtez_type
  (tk:tk) =
  {i:int}
  (g1int (tk, i)) -<fun0> bool(i >= 0)
//
fun{tk:tk}
g1int_isgtz : g1int_isgtz_type(tk)
fun{tk:tk}
g1int_isgtez : g1int_isgtez_type(tk)
//
overload isgtz with g1int_isgtz of 10
overload isgtez with g1int_isgtez of 10
//
(* ****** ****** *)
//
typedef
g1int_iseqz_type
  (tk:tk) =
  {i:int}
  (g1int (tk, i)) -<fun0> bool(i > 0)
typedef
g1int_isneqz_type
  (tk:tk) =
  {i:int}
  (g1int (tk, i)) -<fun0> bool(i >= 0)
//
fun{tk:tk}
g1int_iseqz : g1int_iseqz_type(tk)
fun{tk:tk}
g1int_isneqz : g1int_isneqz_type(tk)
//
overload iseqz with g1int_iseqz of 10
overload isneqz with g1int_isneqz of 10
//
(* ****** ****** *)
//
typedef
g1int_lt_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> bool(i < j)
//
typedef
g1int_lte_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> bool(i <= j)
//
fun{tk:tk}
g1int_lt : g1int_lt_type(tk)
overload < with g1int_lt of 20
fun{tk:tk}
g1int_lte : g1int_lte_type(tk)
overload <= with g1int_lte of 20
//
(* ****** ****** *)
//
typedef
g1int_gt_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> bool(i > j)
//
typedef
g1int_gte_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> bool(i >= j)
//
fun
{tk:tk}
g1int_gt : g1int_gt_type(tk)
overload > with g1int_gt of 20
fun
{tk:tk}
g1int_gte : g1int_gte_type(tk)
overload >= with g1int_gte of 20
//
(* ****** ****** *)
//
typedef
g1int_eq_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> bool(i == j)
typedef
g1int_neq_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> bool(i != j)
//
fun
{tk:tk}
g1int_eq : g1int_eq_type(tk)
overload = with g1int_eq of 20
fun
{tk:tk}
g1int_neq : g1int_neq_type(tk)
overload != with g1int_neq of 20
overload <> with g1int_neq of 20
//
(* ****** ****** *)
//
typedef
g1int_compare_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> int(sgn(i-j))
//
fun{tk:tk}
g1int_compare : g1int_compare_type(tk)
overload compare with g1int_compare of 20
//
(* ****** ****** *)
//
typedef
g1int_max_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> g1int(tk, max(i, j))
//
fun
{tk:tk}
g1int_max : g1int_max_type(tk)
overload max with g1int_max of 20
//
typedef
g1int_min_type
  (tk:tk) =
  {i,j:int}
(
  g1int(tk, i)
, g1int(tk, j)
) -<fun0> g1int(tk, min(i, j))
//
fun
{tk:tk}
g1int_min : g1int_min_type(tk)
overload min with g1int_min of 20
//
(* ****** ****** *)
//
fun{tk:tk}
lt_g1int_int{i,j:int}
  (g1int(tk, i), int(j)):<> bool(i < j)
fun{tk:tk}
lte_g1int_int{i,j:int}
  (g1int(tk, i), int(j)):<> bool(i <= j)
//
overload < with lt_g1int_int of 21
overload <= with lte_g1int_int of 21
//
fun{tk:tk}
gt_g1int_int{i,j:int}
  (g1int(tk, i), int(j)):<> bool(i > j)
fun{tk:tk}
gte_g1int_int{i,j:int}
  (g1int(tk, i), int(j)):<> bool(i >= j)
//
overload > with gt_g1int_int of 21
overload >= with gte_g1int_int of 21
//
fun{tk:tk}
eq_g1int_int{i,j:int}
  (g1int(tk, i), int(j)):<> bool(i == j)
overload = with eq_g1int_int of 21
fun{tk:tk}
neq_g1int_int{i,j:int}
  (g1int(tk, i), int(j)):<> bool(i != j)
//
overload != with neq_g1int_int of 21
overload <> with neq_g1int_int of 21
//
fun{tk:tk}
compare_g1int_int{i,j:int}
  (g1int(tk, i), int(j)):<> int(sgn(i-j))
//
overload compare with compare_g1int_int of 21
//
(* ****** ****** *)

fun
{tk:tk}
g1int_sgn{i:int}(g1int(tk, i)):<> int(sgn(i))

(* ****** ****** *)
//
// HX: for unsigned unindexed integer types
//
(* ****** ****** *)

fun{
k1,k2:tk
} g0int2uint(g0int(k1)):<> g0uint(k2)
//
fun
g0int2uint_int_uint(int):<> uint = "mac#%"
//
(* ****** ****** *)

fun{
k1,k2:tk
} g0uint2int(g0uint(k1)):<> g0int(k2)
//
fun
g0uint2int_uint_int(uint):<> int = "mac#%"
//
(* ****** ****** *)
//
fun{
k1,k2:tk
} g0uint2uint(g0uint(k1)):<> g0uint(k2)
//
fun
g0uint2uint_uint_uint(uint):<> uint = "mac#%"
//
(* ****** ****** *)
//
fun{tk:tk}
g0string2uint(rep: NSH(string)):<> g0uint(tk)
//
fun
g0string2uint_uint(rep: NSH(string)):<> uint = "mac#%"
//
(* ****** ****** *)
//
fun{tk:tk}
g0uint_succ
  (g0uint(tk)):<> g0uint(tk)
fun{tk:tk}
g0uint_pred
  (g0uint(tk)):<> g0uint(tk)
//
overload succ with g0uint_succ of 0
overload pred with g0uint_pred of 0
//
(* ****** ****** *)
//
fun{tk:tk}
g0uint_half
  (g0uint(tk)):<> g0uint(tk)
//
overload half with g0uint_half of 0
//
(*
fun{tk:tk}
g0uint_double
  (g0uint(tk)):<> g0uint(tk)
overload double with g0uint_double of 0
*)
//
(* ****** ****** *)
//
fun{
tk:tk
} g0uint_add
  (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload + with g0uint_add of 0
fun{
tk:tk
} g0uint_sub
  (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload - with g0uint_sub of 0
fun{
tk:tk
} g0uint_mul
  (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload * with g0uint_mul of 0
fun{
tk:tk
} g0uint_div
  (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload / with g0uint_div of 0
fun{
tk:tk
} g0uint_mod
  (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload % with g0uint_mod of 0
overload mod with g0uint_mod of 0
//
(* ****** ****** *)
//
fun
{tk:tk}
g0uint_lsl
(
  x: g0uint(tk), n: intGte(0)
) :<> g0uint(tk)
fun
{tk:tk}
g0uint_lsr
(
  x: g0uint(tk), n: intGte(0)
) :<> g0uint(tk)
//
overload << with g0uint_lsl of 10
overload >> with g0uint_lsr of 10
//
(* ****** ****** *)
//
fun
{tk:tk}
g0uint_lnot
  (g0uint(tk)):<> g0uint(tk)
overload ~ with g0uint_lnot
overload lnot with g0uint_lnot
//
fun
{tk:tk}
g0uint_lor
  (g0uint(tk), g0uint(tk)):<> g0uint(tk)
fun
{tk:tk}
g0uint_lxor
  (g0uint(tk), g0uint(tk)):<> g0uint(tk)
fun
{tk:tk}
g0uint_land
  (g0uint(tk), g0uint(tk)):<> g0uint(tk)
//
overload lor with g0uint_lor
overload lxor with g0uint_lxor
overload land with g0uint_land
//
(* ****** ****** *)
//
fun{tk:tk}
g0uint_isgtz(x: g0uint(tk)):<> bool
fun{tk:tk}
g0uint_iseqz(x: g0uint(tk)):<> bool
fun{tk:tk}
g0uint_isneqz(x: g0uint(tk)):<> bool
//
overload isgtz with g0uint_isgtz of 0
overload iseqz with g0uint_iseqz of 0
overload isneqz with g0uint_isneqz of 0
//
(* ****** ****** *)
//
fun{
tk:tk
} g0uint_lt
  (x: g0uint (tk), y: g0uint (tk)):<> bool
overload < with g0uint_lt of 0
fun{
tk:tk
} g0uint_lte
  (x: g0uint (tk), y: g0uint (tk)):<> bool
overload <= with g0uint_lte of 0
//
fun{
tk:tk
} g0uint_gt
  (x: g0uint (tk), y: g0uint (tk)):<> bool
overload > with g0uint_gt of 0
fun{
tk:tk
} g0uint_gte
  (x: g0uint (tk), y: g0uint (tk)):<> bool
overload >= with g0uint_gte of 0
//
fun{
tk:tk
} g0uint_eq
  (x: g0uint (tk), y: g0uint (tk)):<> bool
overload = with g0uint_eq of 0
fun{
tk:tk
} g0uint_neq
  (x: g0uint (tk), y: g0uint (tk)):<> bool
overload != with g0uint_neq of 0
overload <> with g0uint_neq of 0
//
fun{tk:tk}
g0uint_compare
  (x: g0uint(tk), y: g0uint(tk)):<> int
//
overload compare with g0uint_compare of 0
//
(* ****** ****** *)

fun
{tk:tk}
g0uint_max
  (g0uint(tk), g0uint(tk)):<> g0uint(tk)

fun
{tk:tk}
g0uint_min
  (g0uint(tk), g0uint(tk)):<> g0uint(tk)
//
overload max with g0uint_max of 0
overload min with g0uint_min of 0
//
(* ****** ****** *)
//
fun{tk:tk}
lt_g0uint_int
  (x: g0uint(tk), y: int):<> bool
fun{tk:tk}
lte_g0uint_int
  (x: g0uint(tk), y: int):<> bool
//
overload < with lt_g0uint_int of 11
overload <= with lte_g0uint_int of 11
//
fun{tk:tk}
gt_g0uint_int
  (x: g0uint(tk), y: int):<> bool
fun{tk:tk}
gte_g0uint_int
  (x: g0uint(tk), y: int):<> bool
//
overload > with gt_g0uint_int of 11
overload >= with gte_g0uint_int of 11
//
fun{tk:tk}
eq_g0uint_int
  (x: g0uint(tk), y: int):<> bool
fun{tk:tk}
neq_g0uint_int
  (x: g0uint(tk), y: int):<> bool
//
overload = with eq_g0uint_int of 11
overload != with neq_g0uint_int of 11
overload <> with neq_g0uint_int of 11
//
(* ****** ****** *)
//
// HX: for unsigned indexed integer types
//
praxi
lemma_g1uint_param
  {tk:tk}{i:int}(g1uint(tk, i)):<> [i >= 0] void
// end of [lemma_g1uint_param]
//
(* ****** ****** *)

castfn
size_of_int{i:nat}(x: int(i)):<> size_t(i)
castfn
ssize_of_int{i:int}(x: int(i)):<> ssize_t(i)

(* ****** ****** *)
//
castfn
g0ofg1_uint{tk:tk}(x: g1uint tk):<> g0uint (tk)
castfn
g1ofg0_uint{tk:tk}(x: g0uint tk):<> g1uint0 (tk)
//
overload g0ofg1 with g0ofg1_uint // index-erasing
overload g1ofg0 with g1ofg0_uint // index-inducing
//
(* ****** ****** *)
//
typedef
g1int2int_type
  (k1:tk, k2:tk) = 
  {i:int}
  (g1int(k1, i)) -<fun0> g1int(k2, i)
typedef
g1int2uint_type
  (k1:tk, k2:tk) =
  {i:nat}
  (g1int(k1, i)) -<fun0> g1uint(k2, i)
//
fun{
k1,k2:tk
} g1int2int : g1int2int_type(k1, k2)
fun{
k1,k2:tk
} g1int2uint : g1int2uint_type(k1, k2)
//
fun
g1int2int_int_int:
g1int2int_type(intknd, intknd) = "mac#%"
fun
g1int2uint_int_uint:
g1int2uint_type(intknd, uintknd) = "mac#%"
//
(* ****** ****** *)
//
typedef
g1uint2int_type
  (k1:tk, k2:tk) = 
  {u:int}
(
  g1uint(k1, u)
) -<fun0> [u>=0] g1int(k2, u)
typedef
g1uint2uint_type
  (k1:tk, k2:tk) =
  {u:int}
  (g1uint(k1, u)) -<fun0> g1uint(k2, u)
//
fun{
k1,k2:tk
} g1uint2int : g1uint2int_type(k1, k2)
fun{
k1,k2:tk
} g1uint2uint : g1uint2uint_type(k1, k2)
//
fun
g1uint2int_uint_int:
g1uint2int_type(uintknd, intknd) = "mac#%"
fun
g1uint2uint_uint_uint:
g1uint2uint_type(uintknd, uintknd) = "mac#%"
//
(* ****** ****** *)
//
fun{tk:tk}
g1string2uint(rep: NSH(string)):<> g1uint(tk)
//
(* ****** ****** *)
//
prfun
g1uint_get_index
  {tk:tk}{i1:int}
  (x: g1uint(tk, i1)): [i2:int] EQINT(i1, i2)
//
(* ****** ****** *)
//
typedef
g1uint_succ_type
  (tk:tk) =
  {i:int}
  (g1uint(tk, i)) -<fun0> g1uint(tk, i+1)
typedef
g1uint_pred_type
  (tk:tk) =
  {i:int | i > 0}
  (g1uint(tk, i)) -<fun0> g1uint(tk, i-1)
//
fun{tk:tk}
g1uint_succ : g1uint_succ_type(tk)
overload succ with g1uint_succ of 10
fun{tk:tk}
g1uint_pred : g1uint_pred_type(tk)
overload pred with g1uint_pred of 10
//
(* ****** ****** *)
//
typedef
g1uint_half_type
  (tk:tk) =
  {i:int}
(
  g1uint(tk, i)
) -<fun0> g1uint(tk, i/2)
//
fun{tk:tk}
g1uint_half : g1uint_half_type(tk)
overload half with g1uint_half of 10
//
typedef
g1uint_double_type
  (tk:tk) =
  {i:int}
(
  g1uint(tk, i)
) -<fun0> g1uint(tk, 2*i)
//
fun{tk:tk}
g1uint_double : g1uint_double_type(tk)
overload double with g1uint_double of 10
//
(* ****** ****** *)
//
typedef
g1uint_add_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> g1uint(tk, i+j)
typedef
g1uint_sub_type
  (tk:tk) =
  {i,j:int | i >= j}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> g1uint (tk, i-j)
//
fun
{tk:tk}
g1uint_add : g1uint_add_type(tk)
fun
{tk:tk}
g1uint_sub : g1uint_sub_type(tk)
//
overload + with g1uint_add of 20
overload - with g1uint_sub of 20
//
(* ****** ****** *)
//
typedef
g1uint_mul_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> g1uint (tk, i*j)
//
fun
{tk:tk}
g1uint_mul : g1uint_mul_type(tk)
fun
{tk:tk}
g1uint_mul2
  {i,j:int}
(
  x: g1uint(tk, i), y: g1uint(tk, j)
) :<> [ij:int] (MUL(i, j, ij) | g1uint(tk, ij))
//
overload * with g1uint_mul of 20
//
(* ****** ****** *)
//
typedef
g1uint_div_type
  (tk:tk) =
  {i,j:int | j > 0}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0>
  [r:nat | r == ndiv_int_int(i,j)] g1uint(tk, r)
// end of [g1uint_div_type]
//
fun
{tk:tk}
g1uint_div : g1uint_div_type(tk)
fun
{tk:tk}
g1uint_div2 {i,j:int | j > 0}
(
  x: g1uint (tk, i), y: g1uint (tk, j)
) :<> [q,r:int | 0 <= r; r < j] (DIVMOD (i, j, q, r) | g1uint (tk, q))
//
overload / with g1uint_div of 20
//
(* ****** ****** *)
//
typedef
g1uint_mod_type
  (tk:tk) =
  {i,j:int | j > 0}
(
  g1uint(tk, i)
, g1uint (tk, j)
) -<fun0> [r:nat | r < j] g1uint (tk, r)
// end of [g1uint_mod_type]
//
fun
{tk:tk}
g1uint_mod : g1uint_mod_type(tk)
fun
{tk:tk}
g1uint_mod2
  {i,j:int | j > 0}
(
  x: g1uint (tk, i), y: g1uint (tk, j)
) :<>
[
  q,r:int | 0 <= r; r < j
] (
  DIVMOD (i, j, q, r) | g1uint (tk, r)
) (* end of [g1uint_mod2] *)
//
overload mod with g1uint_mod of 20
//
(* ****** ****** *)
//
typedef
g1uint_isgtz_type
  (tk:tk) =
  {i:int}
  (g1uint(tk, i)) -<fun0> bool(i > 0)
//
fun{tk:tk}
g1uint_isgtz : g1uint_isgtz_type(tk)
overload isgtz with g1uint_isgtz of 10
//
(* ****** ****** *)
//
typedef
g1uint_iseqz_type
  (tk:tk) =
  {i:int}
  (g1uint(tk, i)) -<fun0> bool(i > 0)
typedef
g1uint_isneqz_type
  (tk:tk) =
  {i:int}
  (g1uint(tk, i)) -<fun0> bool(i >= 0)
//
fun{tk:tk}
g1uint_iseqz : g1uint_iseqz_type(tk)
fun{tk:tk}
g1uint_isneqz : g1uint_isneqz_type(tk)
//
overload iseqz with g1uint_iseqz of 10
overload isneqz with g1uint_isneqz of 10
//
(* ****** ****** *)
//
typedef
g1uint_lt_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i), g1uint(tk, j)
) -<fun0> bool(i < j) // endfun
typedef
g1uint_lte_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i), g1uint(tk, j)
) -<fun0> bool(i <= j) // endfun
//
fun{tk:tk}
g1uint_lt : g1uint_lt_type(tk)
fun{tk:tk}
g1uint_lte : g1uint_lte_type(tk)
//
overload < with g1uint_lt of 20
overload <= with g1uint_lte of 20
//
(* ****** ****** *)

typedef
g1uint_gt_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i), g1uint(tk, j)
) -<fun0> bool(i > j) // endfun
typedef
g1uint_gte_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i), g1uint(tk, j)
) -<fun0> bool(i >= j) // endfun
//
fun
{tk:tk}
g1uint_gt : g1uint_gt_type(tk)
fun
{tk:tk}
g1uint_gte : g1uint_gte_type(tk)
//
overload > with g1uint_gt of 20
overload >= with g1uint_gte of 20
//
(* ****** ****** *)
//
typedef
g1uint_eq_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> bool(i == j)
typedef
g1uint_neq_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> bool(i != j)
//
fun
{tk:tk}
g1uint_eq : g1uint_eq_type(tk)
fun
{tk:tk}
g1uint_neq : g1uint_neq_type(tk)
//
overload = with g1uint_eq of 20
overload != with g1uint_neq of 20
overload <> with g1uint_neq of 20
//
(* ****** ****** *)
//
typedef
g1uint_compare_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> int(sgn(i-j))
//
fun{tk:tk}
g1uint_compare : g1uint_compare_type(tk)
//
overload compare with g1uint_compare of 20
//
(* ****** ****** *)
//
typedef
g1uint_max_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> g1uint(tk, max(i, j))
typedef
g1uint_min_type
  (tk:tk) =
  {i,j:int}
(
  g1uint(tk, i)
, g1uint(tk, j)
) -<fun0> g1uint(tk, min(i, j))
//
fun
{tk:tk}
g1uint_max : g1uint_max_type(tk)
fun
{tk:tk}
g1uint_min : g1uint_min_type(tk)
//
overload max with g1uint_max of 20
overload min with g1uint_min of 20
//
(* ****** ****** *)
//
fun{tk:tk}
lt_g1uint_int{i:int;j:nat}
  (g1uint(tk, i), int(j)):<> bool(i < j)
fun{tk:tk}
lte_g1uint_int{i:int;j:nat}
  (g1uint(tk, i), int(j)):<> bool(i <= j)
//
overload < with lt_g1uint_int of 21
overload <= with lte_g1uint_int of 21
//
fun{tk:tk}
gt_g1uint_int{i:int;j:nat}
  (g1uint(tk, i), int(j)):<> bool(i > j)
fun{tk:tk}
gte_g1uint_int{i:int;j:nat}
  (g1uint(tk, i), int(j)):<> bool(i >= j)
//
overload > with gt_g1uint_int of 21
overload >= with gte_g1uint_int of 21
//
fun{tk:tk}
eq_g1uint_int{i:int;j:nat}
  (g1uint(tk, i), int(j)):<> bool(i == j)
fun{tk:tk}
neq_g1uint_int{i:int;j:nat}
  (g1uint(tk, i), int(j)):<> bool(i != j)
//
overload = with eq_g1uint_int of 21
overload != with neq_g1uint_int of 21
overload <> with neq_g1uint_int of 21
//
(* ****** ****** *)
//
fun print_int (int): void = "mac#%"
fun prerr_int (int): void = "mac#%"
fun fprint_int : fprint_type (int) = "mac#%"
overload print with print_int
overload prerr with prerr_int
overload fprint with fprint_int
//
fun print_uint (uint): void = "mac#%"
fun prerr_uint (uint): void = "mac#%"
fun fprint_uint : fprint_type (uint) = "mac#%"
overload print with print_uint
overload prerr with prerr_uint
overload fprint with fprint_uint
//
(* ****** ****** *)
//
fun g0int_neg_int (x: int):<> int = "mac#%"
fun g0int_abs_int (x: int):<> int = "mac#%"
fun g0int_succ_int (x: int):<> int = "mac#%"
fun g0int_pred_int (x: int):<> int = "mac#%"
fun g0int_half_int (x: int):<> int = "mac#%"
fun g0int_asl_int (x: int, n: intGte(0)):<> int = "mac#%"
fun g0int_asr_int (x: int, n: intGte(0)):<> int = "mac#%"
fun g0int_add_int (x: int, y: int):<> int = "mac#%"
fun g0int_sub_int (x: int, y: int):<> int = "mac#%"
fun g0int_mul_int (x: int, y: int):<> int = "mac#%"
fun g0int_div_int (x: int, y: int):<> int = "mac#%"
fun g0int_mod_int (x: int, y: int):<> int = "mac#%"
fun g0int_lt_int (x: int, y: int):<> bool = "mac#%"
fun g0int_lte_int (x: int, y: int):<> bool = "mac#%"
fun g0int_gt_int (x: int, y: int):<> bool = "mac#%"
fun g0int_gte_int (x: int, y: int):<> bool = "mac#%"
fun g0int_eq_int (x: int, y: int):<> bool = "mac#%"
fun g0int_neq_int (x: int, y: int):<> bool = "mac#%"
fun g0int_compare_int (x: int, y: int):<> int = "mac#%"
fun g0int_max_int (x: int, y: int):<> int = "mac#%"
fun g0int_min_int (x: int, y: int):<> int = "mac#%"
fun g0int_isltz_int (x: int):<> bool = "mac#%"
fun g0int_isltez_int (x: int):<> bool = "mac#%"
fun g0int_isgtz_int (x: int):<> bool = "mac#%"
fun g0int_isgtez_int (x: int):<> bool = "mac#%"
fun g0int_iseqz_int (x: int):<> bool = "mac#%"
fun g0int_isneqz_int (x: int):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun g0uint_succ_uint (x: uint):<> uint = "mac#%"
fun g0uint_pred_uint (x: uint):<> uint = "mac#%"
fun g0uint_half_uint (x: uint):<> uint = "mac#%"
fun g0uint_add_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_sub_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_mul_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_div_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_mod_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_lsl_uint (x: uint, n: intGte(0)):<> uint = "mac#%"
fun g0uint_lsr_uint (x: uint, n: intGte(0)):<> uint = "mac#%"
fun g0uint_lnot_uint (x: uint):<> uint = "mac#%"
fun g0uint_lor_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_lxor_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_land_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_lt_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_lte_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_gt_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_gte_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_eq_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_neq_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_compare_uint (x: uint, y: uint):<> int = "mac#%"
fun g0uint_max_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_min_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_isgtz_uint (x: uint):<> bool = "mac#%"
fun g0uint_iseqz_uint (x: uint):<> bool = "mac#%"
fun g0uint_isneqz_uint (x: uint):<> bool = "mac#%"
//
(* ****** ****** *)
//
fun g1int_neg_int : g1int_neg_type (intknd) = "mac#%"
fun g1int_abs_int : g1int_abs_type (intknd) = "mac#%"
fun g1int_succ_int : g1int_succ_type (intknd) = "mac#%"
fun g1int_pred_int : g1int_pred_type (intknd) = "mac#%"
fun g1int_half_int : g1int_half_type (intknd) = "mac#%"
fun g1int_add_int : g1int_add_type (intknd) = "mac#%"
fun g1int_sub_int : g1int_sub_type (intknd) = "mac#%"
fun g1int_mul_int : g1int_mul_type (intknd) = "mac#%"
fun g1int_div_int : g1int_div_type (intknd) = "mac#%"
fun g1int_nmod_int : g1int_nmod_type (intknd) = "mac#%"
fun g1int_lt_int : g1int_lt_type (intknd) = "mac#%"
fun g1int_lte_int : g1int_lte_type (intknd) = "mac#%"
fun g1int_gt_int : g1int_gt_type (intknd) = "mac#%"
fun g1int_gte_int : g1int_gte_type (intknd) = "mac#%"
fun g1int_eq_int : g1int_eq_type (intknd) = "mac#%"
fun g1int_neq_int : g1int_neq_type (intknd) = "mac#%"
fun g1int_compare_int : g1int_compare_type (intknd) = "mac#%"
fun g1int_max_int : g1int_max_type (intknd) = "mac#%"
fun g1int_min_int : g1int_min_type (intknd) = "mac#%"
fun g1int_isltz_int : g1int_isltz_type (intknd) = "mac#%"
fun g1int_isltez_int : g1int_isltez_type (intknd) = "mac#%"
fun g1int_isgtz_int : g1int_isgtz_type (intknd) = "mac#%"
fun g1int_isgtez_int : g1int_isgtez_type (intknd) = "mac#%"
fun g1int_iseqz_int : g1int_iseqz_type (intknd) = "mac#%"
fun g1int_isneqz_int : g1int_isneqz_type (intknd) = "mac#%"
//
(* ****** ****** *)
//
fun g1uint_succ_uint : g1uint_succ_type (uintknd) = "mac#%"
fun g1uint_pred_uint : g1uint_pred_type (uintknd) = "mac#%"
fun g1uint_half_uint : g1uint_half_type (uintknd) = "mac#%"
fun g1uint_add_uint : g1uint_add_type (uintknd) = "mac#%"
fun g1uint_sub_uint : g1uint_sub_type (uintknd) = "mac#%"
fun g1uint_mul_uint : g1uint_mul_type (uintknd) = "mac#%"
fun g1uint_div_uint : g1uint_div_type (uintknd) = "mac#%"
fun g1uint_mod_uint : g1uint_mod_type (uintknd) = "mac#%"
fun g1uint_lt_uint : g1uint_lt_type (uintknd) = "mac#%"
fun g1uint_lte_uint : g1uint_lte_type (uintknd) = "mac#%"
fun g1uint_gt_uint : g1uint_gt_type (uintknd) = "mac#%"
fun g1uint_gte_uint : g1uint_gte_type (uintknd) = "mac#%"
fun g1uint_eq_uint : g1uint_eq_type (uintknd) = "mac#%"
fun g1uint_neq_uint : g1uint_neq_type (uintknd) = "mac#%"
fun g1uint_compare_uint : g1uint_compare_type (uintknd) = "mac#%"
fun g1uint_max_uint : g1uint_max_type (uintknd) = "mac#%"
fun g1uint_min_uint : g1uint_min_type (uintknd) = "mac#%"
fun g1uint_isgtz_uint : g1uint_isgtz_type (uintknd) = "mac#%"
fun g1uint_iseqz_uint : g1uint_iseqz_type (uintknd) = "mac#%"
fun g1uint_isneqz_uint : g1uint_isneqz_type (uintknd) = "mac#%"
//
(* ****** ****** *)
//
macdef
i2u(x) = g1int2uint_int_uint(,(x))
macdef
u2i(x) = g1uint2int_uint_int(,(x))
//
(* ****** ****** *)
//
macdef g0i2i(x) = g0int2int(,(x))
macdef g1i2i(x) = g1int2int(,(x))
//
macdef g0i2u(x) = g0int2uint(,(x))
macdef g1i2u(x) = g1int2uint(,(x))
//
macdef g0u2i(x) = g0uint2int(,(x))
macdef g1u2i(x) = g1uint2int(,(x))
//
macdef g0u2u(x) = g0uint2uint(,(x))
macdef g1u2u(x) = g1uint2uint(,(x))
//
(* ****** ****** *)
//
// HX: implemented in [list_vt.dats]
//
fun{tk:tk}
listize_g0int_rep
  {b:int | b >= 2}
  (g0int(tk), int(b)):<!wrt> List0_vt(intBtw(0, b))
//
fun{tk:tk}
listize_g0uint_rep
  {b:int | b >= 2}
  (g0uint(tk), int(b)):<!wrt> List0_vt(intBtw(0, b))
//
(* ****** ****** *)

(* end of [integer.sats] *)
