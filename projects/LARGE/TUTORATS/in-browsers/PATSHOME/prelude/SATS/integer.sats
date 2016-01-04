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
** $PATSHOME/prelude/SATS/CODEGEN/integer.atxt
** Time of generation: Sat Oct 17 15:19:43 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: September, 2011 *)

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
stadef lintknd = lint_kind
stadef llintknd = llint_kind
stadef ssizeknd = ssize_kind
//
stadef uintknd = uint_kind
stadef ulintknd = ulint_kind
stadef ullintknd = ullint_kind
stadef sizeknd = size_kind
//
(* ****** ****** *)
//
fun{
k1,k2:tk
} g0int2int (x: g0int (k1)):<> g0int (k2)
//
fun g0int2int_int_int (x: int):<> int = "mac#%"
fun g0int2int_int_lint (x: int):<> lint = "mac#%"
fun g0int2int_int_llint (x: int):<> llint = "mac#%"
fun g0int2int_int_ssize (x: int):<> ssize_t = "mac#%"
//
fun g0int2int_lint_int (x: int):<> int = "mac#%"
fun g0int2int_lint_lint (x: int):<> lint = "mac#%"
fun g0int2int_lint_llint (x: int):<> llint = "mac#%"
fun g0int2int_lint_ssize (x: int):<> ssize_t = "mac#%"
//
fun g0int2int_ssize_int (x: int):<> int = "mac#%"
fun g0int2int_ssize_lint (x: int):<> lint = "mac#%"
fun g0int2int_ssize_llint (x: int):<> llint = "mac#%"
fun g0int2int_ssize_ssize (x: int):<> ssize_t = "mac#%"
//
fun g0int2int_sint_int (x: sint):<> int = "mac#%"
//
(* ****** ****** *)
//
// HX-2015-09-20:
// These functions are implemented in prelude/string.cats:
//
fun{tk:tk}
g0int2string (x: g0int (tk)):<!wrt> Strptr1
//
fun g0int2string_int (x: int):<!wrt> Strptr1 = "mac#%"
fun g0int2string_lint (x: lint):<!wrt> Strptr1 = "mac#%"
fun g0int2string_llint (x: llint):<!wrt> Strptr1 = "mac#%"
(*
fun g0int2string_ssize (x: ssize_t):<!wrt> Strptr1 = "mac#%"
*)
//
(* ****** ****** *)
//
fun{tk:tk}
g0string2int (str: NSH(string)):<> g0int (tk)
//
fun g0string2int_int (x: NSH(string)):<> int = "mac#%"
fun g0string2int_lint (x: NSH(string)):<> lint = "mac#%"
fun g0string2int_llint (x: NSH(string)):<> llint = "mac#%"
fun g0string2int_ssize (x: NSH(string)):<> ssize_t = "mac#%"
//
(* ****** ****** *)

typedef
g0int_uop_type
  (tk: tkind) = (g0int (tk)) -<fun0> g0int (tk)
// end of [g0int_uop_type]

(* ****** ****** *)

fun
{tk:tk}
g0int_neg : g0int_uop_type(tk)
overload ~ with g0int_neg of 0 // ~ for uminus
overload neg with g0int_neg of 0

fun
{tk:tk}
g0int_abs : g0int_uop_type(tk)
overload abs with g0int_abs of 0

(* ****** ****** *)

fun
{tk:tk}
g0int_succ : g0int_uop_type(tk)
overload succ with g0int_succ of 0

fun
{tk:tk}
g0int_pred : g0int_uop_type(tk)
overload pred with g0int_pred of 0

(* ****** ****** *)

fun
{tk:tk}
g0int_half : g0int_uop_type(tk)
overload half with g0int_half of 0

(*
fun
{tk:tk}
g0int_double : g0int_uop_type(tk)
overload double with g0int_double of 0
*)

(* ****** ****** *)

typedef
g0int_aop_type (tk: tkind) =
   (g0int (tk), g0int (tk)) -<fun0> g0int (tk)
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
mul_int1_size0 {i:nat} (int(i), size_t):<> size_t
fun{}
mul_size0_int1 {j:nat} (size_t, int(j)):<> size_t

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
g0ofg1_int {tk:tk} (x: g1int tk):<> g0int (tk)
castfn
g1ofg0_int {tk:tk} (x: g0int tk):<> g1int (tk)
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
fun g1int2int_int_int {i:int} (x: int i):<> int (i) = "mac#%"
fun g1int2int_int_lint {i:int} (x: int i):<> lint (i) = "mac#%"
fun g1int2int_int_llint {i:int} (x: int i):<> llint (i) = "mac#%"
fun g1int2int_int_ssize {i:int} (x: int i):<> ssize_t (i) = "mac#%"
//
(* ****** ****** *)

fun{tk:tk}
g1string2int (str: NSH(string)):<> g1int (tk)

(* ****** ****** *)

prfun
g1int_get_index
  {tk:tk}{i1:int}
  (x: g1int (tk, i1)): [i2:int] EQINT (i1, i2)
// end of [g1int_get_index]

(* ****** ****** *)

typedef
g1int_neg_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, ~i)
fun
{tk:tk}
g1int_neg : g1int_neg_type(tk)
overload ~ with g1int_neg of 10 // ~ for uminus
overload neg with g1int_neg of 10

typedef
g1int_abs_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, abs(i))
fun
{tk:tk}
g1int_abs : g1int_abs_type(tk)
overload abs with g1int_abs of 10

(* ****** ****** *)

typedef
g1int_succ_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, i+1)
fun{tk:tk}
g1int_succ : g1int_succ_type(tk)
overload succ with g1int_succ of 10

typedef
g1int_pred_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, i-1)
fun{tk:tk}
g1int_pred : g1int_pred_type(tk)
overload pred with g1int_pred of 10

typedef
g1int_half_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, i/2)
fun{tk:tk}
g1int_half : g1int_half_type(tk)
overload half with g1int_half of 10

(*
typedef
g1int_double_type (tk:tk) =
  {i:int} g1int (tk, i) -<fun0> g1int (tk, 2*i)
fun{tk:tk}
g1int_double : g1int_double_type(tk)
overload double with g1int_double of 10
*)

(* ****** ****** *)
//
typedef
g1int_add_type
  (tk:tk) =
  {i,j:int}
  (g1int (tk,i), g1int (tk,j)) -<fun0> g1int (tk, i+j)
//
fun
{tk:tk}
g1int_add : g1int_add_type(tk)
//
fun{}
add_size1_int1
  {i,j:int | i+j >= 0} (x: size_t (i), j: int (j)):<> size_t (i+j)
fun{}
add_int1_size1
  {i,j:int | i+j >= 0} (x: int (i), j: size_t (j)):<> size_t (i+j)
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
  (g1int (tk,i), g1int (tk,j)) -<fun0> g1int (tk, i-j)
//
fun
{tk:tk}
g1int_sub : g1int_sub_type(tk)
//
fun{}
sub_size1_int1
  {i,j:int | i-j >= 0} (x: size_t (i), j: int (j)):<> size_t (i-j)
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
  (g1int (tk,i), g1int (tk,j)) -<fun0> g1int (tk, i*j)
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
  {i,j:int | i >= 0} (x: int (i), j: size_t (j)):<> size_t (i*j)
fun{}
mul_size1_int1
  {i,j:int | j >= 0} (x: size_t (i), j: int (j)):<> size_t (i*j)
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
  (g1int (tk, i), g1int (tk, j)) -<fun0> g1int (tk)
//
fun
{tk:tk}
g1int_div : g1int_div_type(tk)
//
(* ****** ****** *)
//
typedef
g1int_ndiv_type
  (tk:tk) =
  {i,j:int | i >= 0; j > 0}
  (g1int (tk, i), g1int (tk, j)) -<fun0> g1int (tk, ndiv_int_int(i,j))
//
fun{tk:tk}
g1int_ndiv : g1int_ndiv_type(tk)

(* ****** ****** *)

fun{tk:tk}
g1int_ndiv2
  {i,j:int | i >= 0; j > 0}
(
  x: g1int (tk, i), y: g1int (tk, j)
) :<>
[
  q,r:int | 0 <= r; r < j
] (
  DIVMOD (i, j, q, r) | g1int (tk, q)
) (* end of [g1int_ndiv2] *)

(* ****** ****** *)

overload / with g1int_div of 20
overload ndiv with g1int_ndiv of 20

(* ****** ****** *)

(*
** HX: [g1int_mod] is intentionally skipped
*)

(* ****** ****** *)

typedef
g1int_nmod_type
  (tk:tk) =
  {i,j:int | i >= 0; j > 0}
  (g1int (tk, i), g1int (tk, j)) -<fun0> g1int (tk, nmod_int_int(i, j))
// end of [g1int_nmod_type]

fun{tk:tk}
g1int_nmod : g1int_nmod_type(tk)

(* ****** ****** *)

fun{tk:tk}
g1int_nmod2
  {i,j:int | i >= 0; j > 0}
(
  x: g1int (tk, i), y: g1int (tk, j)
) :<> [q,r:nat | r < j]
(
  DIVMOD (i, j, q, r) | g1int (tk, r)
) (* end of [g1int_nmod2] *)

(* ****** ****** *)
//
fun{tk:tk}
nmod_g1int_int1
  {i,j:int | i >= 0; j > 0}
  (x: g1int (tk, i), y: int (j)):<> int(i%j)
//
fun{tk:tk}
nmod2_g1int_int1
  {i,j:int | i >= 0; j > 0}
(
  x: g1int (tk, i), y: int (j)
) :<> [q,r:nat | r < j] (DIVMOD (i, j, q, r) | int (r))
//
(* ****** ****** *)

overload nmod with g1int_nmod of 20
overload nmod with nmod_g1int_int1 of 21

(* ****** ****** *)

typedef
g1int_ngcd_type
  (tk:tk) =
  {i,j:int | i >= 0; j >= 0}
  (g1int (tk, i), g1int (tk, j)) -<fun0> [r:nat] g1int (tk, r)
// end of [g1int_ngcd_type]

fun{tk:tk}
g1int_ngcd : g1int_ngcd_type(tk)
(*
overload ngcd with g1int_ngcd of 20 // HX: [ngcd] is no longer pre-declared
*)

(* ****** ****** *)

typedef
g1int_isltz_type (tk:tk) =
  {i:int} (g1int (tk, i)) -<fun0> bool (i < 0)
typedef
g1int_isltez_type (tk:tk) =
  {i:int} (g1int (tk, i)) -<fun0> bool (i <= 0)
fun{tk:tk}
g1int_isltz : g1int_isltz_type(tk)
overload isltz with g1int_isltz of 10
fun{tk:tk}
g1int_isltez : g1int_isltez_type(tk)
overload isltez with g1int_isltez of 10

(* ****** ****** *)

typedef
g1int_isgtz_type (tk:tk) =
  {i:int} (g1int (tk, i)) -<fun0> bool (i > 0)
typedef
g1int_isgtez_type (tk:tk) =
  {i:int} (g1int (tk, i)) -<fun0> bool (i >= 0)
fun{tk:tk}
g1int_isgtz : g1int_isgtz_type(tk)
overload isgtz with g1int_isgtz of 10
fun{tk:tk}
g1int_isgtez : g1int_isgtez_type(tk)
overload isgtez with g1int_isgtez of 10

(* ****** ****** *)

typedef
g1int_iseqz_type (tk:tk) =
  {i:int} (g1int (tk, i)) -<fun0> bool (i > 0)
typedef
g1int_isneqz_type (tk:tk) =
  {i:int} (g1int (tk, i)) -<fun0> bool (i >= 0)
fun{tk:tk}
g1int_iseqz : g1int_iseqz_type(tk)
overload iseqz with g1int_iseqz of 10
fun{tk:tk}
g1int_isneqz : g1int_isneqz_type(tk)
overload isneqz with g1int_isneqz of 10

(* ****** ****** *)
//
typedef
g1int_lt_type
  (tk:tk) =
  {i,j:int}
  (g1int (tk, i), g1int (tk, j)) -<fun0> bool (i < j)
typedef
g1int_lte_type
  (tk:tk) =
  {i,j:int}
  (g1int (tk, i), g1int (tk, j)) -<fun0> bool (i <= j)
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
  (g1int (tk, i), g1int (tk, j)) -<fun0> bool (i > j)
typedef
g1int_gte_type
  (tk:tk) =
  {i,j:int}
  (g1int (tk, i), g1int (tk, j)) -<fun0> bool (i >= j)
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
  (g1int (tk, i), g1int (tk, j)) -<fun0> bool (i == j)
typedef
g1int_neq_type
  (tk:tk) =
  {i,j:int}
  (g1int (tk, i), g1int (tk, j)) -<fun0> bool (i != j)
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
  (g1int (tk, i), g1int (tk, j)) -<fun0> int (sgn(i-j))
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
  (g1int (tk, i), g1int (tk, j)) -<fun0> g1int (tk, max(i, j))
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
  (g1int (tk, i), g1int (tk, j)) -<fun0> g1int (tk, min(i, j))
//
fun
{tk:tk}
g1int_min : g1int_min_type(tk)
overload min with g1int_min of 20
//
(* ****** ****** *)

fun{tk:tk}
lt_g1int_int{i,j:int}
  (x: g1int (tk, i), y: int (j)):<> bool (i < j)
overload < with lt_g1int_int of 21
fun{tk:tk}
lte_g1int_int{i,j:int}
  (x: g1int (tk, i), y: int (j)):<> bool (i <= j)
overload <= with lte_g1int_int of 21
//
fun{tk:tk}
gt_g1int_int{i,j:int}
  (x: g1int (tk, i), y: int (j)):<> bool (i > j)
overload > with gt_g1int_int of 21
fun{tk:tk}
gte_g1int_int{i,j:int}
  (x: g1int (tk, i), y: int (j)):<> bool (i >= j)
overload >= with gte_g1int_int of 21
//
fun{tk:tk}
eq_g1int_int{i,j:int}
  (x: g1int (tk, i), y: int (j)):<> bool (i == j)
overload = with eq_g1int_int of 21
fun{tk:tk}
neq_g1int_int{i,j:int}
  (x: g1int (tk, i), y: int (j)):<> bool (i != j)
overload != with neq_g1int_int of 21
overload <> with neq_g1int_int of 21
//
fun{tk:tk}
compare_g1int_int{i,j:int}
  (x: g1int (tk, i), y: int (j)):<> int (sgn(i-j))
overload compare with compare_g1int_int of 21
//
(* ****** ****** *)

fun
{tk:tk}
g1int_sgn {i:int} (x: g1int (tk, i)):<> int(sgn(i))

(* ****** ****** *)
//
// HX: for unsigned unindexed integer types
//
(* ****** ****** *)

fun{
k1,k2:tk
} g0int2uint (x: g0int (k1)):<> g0uint (k2)
//
fun g0int2uint_int_uint (x: int):<> uint = "mac#%"
fun g0int2uint_int_ulint (x: int):<> ulint = "mac#%"
fun g0int2uint_int_ullint (x: int):<> ullint = "mac#%"
fun g0int2uint_int_size (x: int):<> size_t = "mac#%"
//
fun g0int2uint_lint_ulint (x: lint):<> ulint = "mac#%"
fun g0int2uint_lint_ullint (x: lint):<> ullint = "mac#%"
fun g0int2uint_lint_size (x: lint):<> size_t = "mac#%"
//
fun g0int2uint_llint_ullint (x: llint):<> ullint = "mac#%"
//
fun g0int2uint_ssize_size (x: ssize_t):<> size_t = "mac#%"
//
(* ****** ****** *)

fun{
k1,k2:tk
} g0uint2int (x: g0uint (k1)):<> g0int (k2)
//
fun g0uint2int_uint_int (x: uint):<> int = "mac#%"
fun g0uint2int_uint_lint (x: uint):<> lint = "mac#%"
fun g0uint2int_uint_llint (x: uint):<> llint = "mac#%"
fun g0uint2int_uint_ssize (x: uint):<> ssize_t = "mac#%"
//
fun g0uint2int_size_int (x: size_t):<> int = "mac#%"
fun g0uint2int_size_lint (x: size_t):<> lint = "mac#%"
fun g0uint2int_size_llint (x: size_t):<> llint = "mac#%"
fun g0uint2int_size_ssize (x: size_t):<> ssize_t = "mac#%"
//
(* ****** ****** *)

fun{
k1,k2:tk
} g0uint2uint (x: g0uint (k1)):<> g0uint (k2)
//
fun g0uint2uint_uint_uint (x: uint):<> uint = "mac#%"
fun g0uint2uint_uint_ulint (x: uint):<> ulint = "mac#%"
fun g0uint2uint_uint_ullint (x: uint):<> ullint = "mac#%"
fun g0uint2uint_uint_size (x: uint):<> size_t = "mac#%"
//
fun g0uint2uint_ulint_uint (x: ulint):<> uint = "mac#%"
fun g0uint2uint_ulint_ulint (x: ulint):<> ulint = "mac#%"
fun g0uint2uint_ulint_ullint (x: ulint):<> ullint = "mac#%"
fun g0uint2uint_ulint_size (x: ulint):<> size_t = "mac#%"
//
fun g0uint2uint_size_uint (x: size_t):<> uint = "mac#%"
fun g0uint2uint_size_ulint (x: size_t):<> ulint = "mac#%"
fun g0uint2uint_size_ullint (x: size_t):<> ullint = "mac#%"
fun g0uint2uint_size_size (x: size_t):<> size_t = "mac#%"
//
fun g0uint2uint_usint_uint (x: usint):<> uint = "mac#%"
//
(* ****** ****** *)

fun{tk:tk}
g0string2uint (str: NSH(string)):<> g0uint (tk)
//
fun g0string2uint_uint (x: NSH(string)):<> uint = "mac#%"
fun g0string2uint_ulint (x: NSH(string)):<> ulint = "mac#%"
fun g0string2uint_ullint (x: NSH(string)):<> ullint = "mac#%"
fun g0string2uint_size (x: NSH(string)):<> size_t = "mac#%"
//
(* ****** ****** *)

fun{tk:tk}
g0uint_succ (x: g0uint (tk)):<> g0uint (tk)
overload succ with g0uint_succ of 0
fun{tk:tk}
g0uint_pred (x: g0uint (tk)):<> g0uint (tk)
overload pred with g0uint_pred of 0

fun{tk:tk}
g0uint_half (x: g0uint (tk)):<> g0uint (tk)
overload half with g0uint_half of 0

(*
fun{tk:tk}
g0uint_double (x: g0uint (tk)):<> g0uint (tk)
overload double with g0uint_double of 0
*)

(* ****** ****** *)

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

(* ****** ****** *)

fun
{tk:tk}
g0uint_lsl (x: g0uint (tk), n: intGte(0)):<> g0uint (tk)
overload << with g0uint_lsl
fun
{tk:tk}
g0uint_lsr (x: g0uint (tk), n: intGte(0)):<> g0uint (tk)
overload >> with g0uint_lsr

(* ****** ****** *)

fun
{tk:tk}
g0uint_lnot (x: g0uint (tk)):<> g0uint (tk)
overload ~ with g0uint_lnot
overload lnot with g0uint_lnot
fun
{tk:tk}
g0uint_lor (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload lor with g0uint_lor
fun
{tk:tk}
g0uint_lxor (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload lxor with g0uint_lxor
fun
{tk:tk}
g0uint_land (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload land with g0uint_land

(* ****** ****** *)

fun{tk:tk}
g0uint_isgtz (x: g0uint (tk)):<> bool
overload isgtz with g0uint_isgtz of 0
fun{tk:tk}
g0uint_iseqz (x: g0uint (tk)):<> bool
overload iseqz with g0uint_iseqz of 0
fun{tk:tk}
g0uint_isneqz (x: g0uint (tk)):<> bool
overload isneqz with g0uint_isneqz of 0

(* ****** ****** *)

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

fun{tk:tk}
g0uint_compare (x: g0uint (tk), y: g0uint (tk)):<> int
overload compare with g0uint_compare of 0

(* ****** ****** *)

fun
{tk:tk}
g0uint_max
  (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload max with g0uint_max of 0

fun
{tk:tk}
g0uint_min
  (x: g0uint (tk), y: g0uint (tk)):<> g0uint (tk)
overload min with g0uint_min of 0

(* ****** ****** *)

fun{tk:tk}
lt_g0uint_int (x: g0uint (tk), y: int):<> bool
overload < with lt_g0uint_int of 11
fun{tk:tk}
lte_g0uint_int (x: g0uint (tk), y: int):<> bool
overload <= with lte_g0uint_int of 11

fun{tk:tk}
gt_g0uint_int (x: g0uint (tk), y: int):<> bool
overload > with gt_g0uint_int of 11
fun{tk:tk}
gte_g0uint_int (x: g0uint (tk), y: int):<> bool
overload >= with gte_g0uint_int of 11

fun{tk:tk}
eq_g0uint_int (x: g0uint (tk), y: int):<> bool
overload = with eq_g0uint_int of 11
fun{tk:tk}
neq_g0uint_int (x: g0uint (tk), y: int):<> bool
overload != with neq_g0uint_int of 11
overload <> with neq_g0uint_int of 11

(* ****** ****** *)
//
// HX: for unsigned indexed integer types
//
praxi
lemma_g1uint_param
  {tk:tk} {i:int} (x: g1uint (tk, i)):<> [i >= 0] void
// end of [lemma_g1uint_param]

(* ****** ****** *)

castfn
size_of_int {i:nat} (x: int i):<> size_t (i)
castfn
ssize_of_int {i:int} (x: int i):<> ssize_t (i)

(* ****** ****** *)
//
castfn
g0ofg1_uint {tk:tk} (x: g1uint tk):<> g0uint (tk)
castfn
g1ofg0_uint {tk:tk} (x: g0uint tk):<> g1uint0 (tk)
//
overload g0ofg1 with g0ofg1_uint // index-erasing
overload g1ofg0 with g1ofg0_uint // index-inducing
//
(* ****** ****** *)
//
fun{
k1,k2:tk
} g1int2uint // i2u
  {i:nat} (x: g1int (k1, i)):<> g1uint (k2, i)
//
fun g1int2uint_int_uint{i:nat} (x: int i):<> uint (i) = "mac#%"
fun g1int2uint_int_ulint{i:nat} (x: int i):<> ulint (i) = "mac#%"
fun g1int2uint_int_ullint{i:nat} (x: int i):<> ullint (i) = "mac#%"
fun g1int2uint_int_size{i:nat} (x: int i):<> size_t (i) = "mac#%"
//
fun g1int2uint_ssize_size{i:nat} (x: ssize_t(i)):<> size_t(i) = "mac#%"
//
(* ****** ****** *)

typedef
g1uint2int_type
  (k1:tk, k2:tk) = 
  {u:int} (g1uint (k1, u)) -<fun0> [u>=0] g1int (k2, u)
//
fun{
k1,k2:tk
} g1uint2int : g1uint2int_type (k1, k2)
//
fun g1uint2int_uint_int : g1uint2int_type (uintknd, intknd) = "mac#%"
fun g1uint2int_uint_lint : g1uint2int_type (uintknd, lintknd) = "mac#%"
fun g1uint2int_uint_llint : g1uint2int_type (uintknd, llintknd) = "mac#%"
fun g1uint2int_uint_ssize : g1uint2int_type (uintknd, ssizeknd) = "mac#%"
//
fun g1uint2int_size_int : g1uint2int_type (sizeknd, intknd) = "mac#%"
fun g1uint2int_size_lint : g1uint2int_type (sizeknd, lintknd) = "mac#%"
fun g1uint2int_size_llint : g1uint2int_type (sizeknd, llintknd) = "mac#%"
fun g1uint2int_size_ssize : g1uint2int_type (sizeknd, ssizeknd) = "mac#%"
//
(* ****** ****** *)
//
typedef
g1uint2uint_type
  (k1:tk, k2:tk) =
  {u:int} (g1uint (k1, u)) -<fun0> g1uint (k2, u)
//
fun{
k1,k2:tk
} g1uint2uint : g1uint2uint_type (k1, k2)
//
fun g1uint2uint_uint_uint : g1uint2uint_type (uintknd, uintknd) = "mac#%"
fun g1uint2uint_uint_ulint : g1uint2uint_type (uintknd, ulintknd) = "mac#%"
fun g1uint2uint_uint_ullint : g1uint2uint_type (uintknd, ullintknd) = "mac#%"
fun g1uint2uint_uint_size : g1uint2uint_type (uintknd, sizeknd) = "mac#%"
//
fun g1uint2uint_ulint_uint : g1uint2uint_type (uintknd, uintknd) = "mac#%"
fun g1uint2uint_ulint_ulint : g1uint2uint_type (uintknd, ulintknd) = "mac#%"
fun g1uint2uint_ulint_ullint : g1uint2uint_type (uintknd, ullintknd) = "mac#%"
fun g1uint2uint_ulint_size : g1uint2uint_type (uintknd, sizeknd) = "mac#%"
//
fun g1uint2uint_size_uint : g1uint2uint_type (sizeknd, uintknd) = "mac#%"
fun g1uint2uint_size_ulint : g1uint2uint_type (sizeknd, ulintknd) = "mac#%"
fun g1uint2uint_size_ullint : g1uint2uint_type (sizeknd, ullintknd) = "mac#%"
fun g1uint2uint_size_size : g1uint2uint_type (sizeknd, sizeknd) = "mac#%"
//
(* ****** ****** *)

fun{tk:tk}
g1string2uint (str: NSH(string)):<> g1uint (tk)

(* ****** ****** *)

prfun
g1uint_get_index
  {tk:tk}{i1:int}
  (x: g1uint (tk, i1)): [i2:int] EQINT (i1, i2)
// end of [g1uint_get_index]

(* ****** ****** *)
//
typedef
g1uint_succ_type
  (tk:tk) =
  {i:int}
  (g1uint (tk, i)) -<fun0> g1uint (tk, i+1)
typedef
g1uint_pred_type
  (tk:tk) =
  {i:int | i > 0}
  (g1uint (tk, i)) -<fun0> g1uint (tk, i-1)
//
fun{tk:tk}
g1uint_succ : g1uint_succ_type(tk)
overload succ with g1uint_succ of 10
fun{tk:tk}
g1uint_pred : g1uint_pred_type(tk)
overload pred with g1uint_pred of 10
//
(* ****** ****** *)

typedef
g1uint_half_type (tk:tk) =
  {i:int} (g1uint (tk, i)) -<fun0> g1uint (tk, i/2)
fun{tk:tk}
g1uint_half : g1uint_half_type(tk)
overload half with g1uint_half of 10

(*
typedef
g1uint_double_type (tk:tk) =
  {i:int} (g1uint (tk, i)) -<fun0> g1uint (tk, 2*i)
fun{tk:tk}
g1uint_double : g1uint_double_type(tk)
overload double with g1uint_double of 10
*)

(* ****** ****** *)

typedef
g1uint_add_type
  (tk:tk) =
  {i,j:int}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> g1uint (tk, i+j)
fun
{tk:tk}
g1uint_add : g1uint_add_type(tk)
overload + with g1uint_add of 20

typedef
g1uint_sub_type
  (tk:tk) =
  {i,j:int | i >= j}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> g1uint (tk, i-j)
fun
{tk:tk}
g1uint_sub : g1uint_sub_type(tk)
overload - with g1uint_sub of 20

(* ****** ****** *)

typedef
g1uint_mul_type
  (tk:tk) =
  {i,j:int}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> g1uint (tk, i*j)
fun
{tk:tk}
g1uint_mul : g1uint_mul_type(tk)
overload * with g1uint_mul of 20

fun
{tk:tk}
g1uint_mul2 {i,j:int}
(
  x: g1uint (tk, i), y: g1uint (tk, j)
) :<> [ij:int] (MUL (i, j, ij) | g1uint (tk, ij))

(* ****** ****** *)

typedef
g1uint_div_type
  (tk:tk) =
  {i,j:int | j > 0}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> g1uint (tk)
// end of [g1uint_div_type]

fun
{tk:tk}
g1uint_div : g1uint_div_type(tk)
overload / with g1uint_div of 20

fun
{tk:tk}
g1uint_div2 {i,j:int | j > 0}
(
  x: g1uint (tk, i), y: g1uint (tk, j)
) :<> [q,r:int | 0 <= r; r < j] (DIVMOD (i, j, q, r) | g1uint (tk, q))

(* ****** ****** *)

typedef
g1uint_mod_type
  (tk:tk) =
  {i,j:int | j > 0}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> [r:nat | r < j] g1uint (tk, r)
// end of [g1uint_mod_type]

fun
{tk:tk}
g1uint_mod : g1uint_mod_type(tk)
overload mod with g1uint_mod of 20

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
) // end of [g1uint_mod2]

(* ****** ****** *)

typedef
g1uint_isgtz_type (tk:tk) =
  {i:int} (g1uint (tk, i)) -<fun0> bool (i > 0)
fun{tk:tk}
g1uint_isgtz : g1uint_isgtz_type(tk)
overload isgtz with g1uint_isgtz of 10

(* ****** ****** *)

typedef
g1uint_iseqz_type (tk:tk) =
  {i:int} (g1uint (tk, i)) -<fun0> bool (i > 0)
typedef
g1uint_isneqz_type (tk:tk) =
  {i:int} (g1uint (tk, i)) -<fun0> bool (i >= 0)
fun{tk:tk}
g1uint_iseqz : g1uint_iseqz_type(tk)
overload iseqz with g1uint_iseqz of 10
fun{tk:tk}
g1uint_isneqz : g1uint_isneqz_type(tk)
overload isneqz with g1uint_isneqz of 10

(* ****** ****** *)

typedef
g1uint_lt_type (tk:tk) =
  {i,j:int} (g1uint (tk, i), g1uint (tk, j)) -<fun0> bool (i < j)
fun{tk:tk}
g1uint_lt : g1uint_lt_type(tk)
overload < with g1uint_lt of 20
typedef
g1uint_lte_type (tk:tk) =
  {i,j:int} (g1uint (tk, i), g1uint (tk, j)) -<fun0> bool (i <= j)
fun{tk:tk}
g1uint_lte : g1uint_lte_type(tk)
overload <= with g1uint_lte of 20

(* ****** ****** *)

typedef
g1uint_gt_type (tk:tk) =
  {i,j:int} (g1uint (tk, i), g1uint (tk, j)) -<fun0> bool (i > j)
fun
{tk:tk}
g1uint_gt : g1uint_gt_type(tk)
overload > with g1uint_gt of 20
typedef
g1uint_gte_type (tk:tk) =
  {i,j:int} (g1uint (tk, i), g1uint (tk, j)) -<fun0> bool (i >= j)
fun
{tk:tk}
g1uint_gte : g1uint_gte_type(tk)
overload >= with g1uint_gte of 20

(* ****** ****** *)
//
typedef
g1uint_eq_type
  (tk:tk) =
  {i,j:int}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> bool (i == j)
typedef
g1uint_neq_type
  (tk:tk) =
  {i,j:int}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> bool (i != j)
//
fun
{tk:tk}
g1uint_eq : g1uint_eq_type(tk)
overload = with g1uint_eq of 20
fun
{tk:tk}
g1uint_neq : g1uint_neq_type(tk)
overload != with g1uint_neq of 20
overload <> with g1uint_neq of 20
//
(* ****** ****** *)

typedef
g1uint_compare_type
  (tk:tk) =
  {i,j:int}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> int (sgn(i-j))
fun{tk:tk}
g1uint_compare : g1uint_compare_type(tk)
overload compare with g1uint_compare of 20

(* ****** ****** *)

typedef
g1uint_max_type
  (tk:tk) =
  {i,j:int}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> g1uint (tk, max(i, j))
fun
{tk:tk}
g1uint_max : g1uint_max_type(tk)
overload max with g1uint_max of 20

typedef
g1uint_min_type
  (tk:tk) =
  {i,j:int}
  (g1uint (tk, i), g1uint (tk, j)) -<fun0> g1uint (tk, min(i, j))
fun
{tk:tk}
g1uint_min : g1uint_min_type(tk)
overload min with g1uint_min of 20

(* ****** ****** *)
//
fun{tk:tk}
lt_g1uint_int {i:int;j:nat}
  (x: g1uint (tk, i), y: int (j)):<> bool (i < j)
overload < with lt_g1uint_int of 21
fun{tk:tk}
lte_g1uint_int {i:int;j:nat}
  (x: g1uint (tk, i), y: int (j)):<> bool (i <= j)
overload <= with lte_g1uint_int of 21
//
fun{tk:tk}
gt_g1uint_int {i:int;j:nat}
  (x: g1uint (tk, i), y: int (j)):<> bool (i > j)
overload > with gt_g1uint_int of 21
fun{tk:tk}
gte_g1uint_int {i:int;j:nat}
  (x: g1uint (tk, i), y: int (j)):<> bool (i >= j)
overload >= with gte_g1uint_int of 21
//
fun{tk:tk}
eq_g1uint_int {i:int;j:nat}
  (x: g1uint (tk, i), y: int (j)):<> bool (i == j)
overload = with eq_g1uint_int of 21
fun{tk:tk}
neq_g1uint_int {i:int;j:nat}
  (x: g1uint (tk, i), y: int (j)):<> bool (i != j)
overload != with neq_g1uint_int of 21
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
fun g0int_isltz_int (x: int):<> bool = "mac#%"
fun g0int_isltez_int (x: int):<> bool = "mac#%"
fun g0int_isgtz_int (x: int):<> bool = "mac#%"
fun g0int_isgtez_int (x: int):<> bool = "mac#%"
fun g0int_iseqz_int (x: int):<> bool = "mac#%"
fun g0int_isneqz_int (x: int):<> bool = "mac#%"
fun g0int_lt_int (x: int, y: int):<> bool = "mac#%"
fun g0int_lte_int (x: int, y: int):<> bool = "mac#%"
fun g0int_gt_int (x: int, y: int):<> bool = "mac#%"
fun g0int_gte_int (x: int, y: int):<> bool = "mac#%"
fun g0int_eq_int (x: int, y: int):<> bool = "mac#%"
fun g0int_neq_int (x: int, y: int):<> bool = "mac#%"
fun g0int_compare_int (x: int, y: int):<> int = "mac#%"
fun g0int_max_int (x: int, y: int):<> int = "mac#%"
fun g0int_min_int (x: int, y: int):<> int = "mac#%"
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
fun g0int_isltz_lint (x: lint):<> bool = "mac#%"
fun g0int_isltez_lint (x: lint):<> bool = "mac#%"
fun g0int_isgtz_lint (x: lint):<> bool = "mac#%"
fun g0int_isgtez_lint (x: lint):<> bool = "mac#%"
fun g0int_iseqz_lint (x: lint):<> bool = "mac#%"
fun g0int_isneqz_lint (x: lint):<> bool = "mac#%"
fun g0int_lt_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_lte_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_gt_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_gte_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_eq_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_neq_lint (x: lint, y: lint):<> bool = "mac#%"
fun g0int_compare_lint (x: lint, y: lint):<> int = "mac#%"
fun g0int_max_lint (x: lint, y: lint):<> lint = "mac#%"
fun g0int_min_lint (x: lint, y: lint):<> lint = "mac#%"
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
fun g0int_isltz_llint (x: llint):<> bool = "mac#%"
fun g0int_isltez_llint (x: llint):<> bool = "mac#%"
fun g0int_isgtz_llint (x: llint):<> bool = "mac#%"
fun g0int_isgtez_llint (x: llint):<> bool = "mac#%"
fun g0int_iseqz_llint (x: llint):<> bool = "mac#%"
fun g0int_isneqz_llint (x: llint):<> bool = "mac#%"
fun g0int_lt_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_lte_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_gt_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_gte_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_eq_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_neq_llint (x: llint, y: llint):<> bool = "mac#%"
fun g0int_compare_llint (x: llint, y: llint):<> int = "mac#%"
fun g0int_max_llint (x: llint, y: llint):<> llint = "mac#%"
fun g0int_min_llint (x: llint, y: llint):<> llint = "mac#%"
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
fun g0int_isltz_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isltez_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isgtz_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isgtez_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_iseqz_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_isneqz_ssize (x: ssize_t):<> bool = "mac#%"
fun g0int_lt_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_lte_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_gt_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_gte_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_eq_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_neq_ssize (x: ssize_t, y: ssize_t):<> bool = "mac#%"
fun g0int_compare_ssize (x: ssize_t, y: ssize_t):<> int = "mac#%"
fun g0int_max_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
fun g0int_min_ssize (x: ssize_t, y: ssize_t):<> ssize_t = "mac#%"
//
(* ****** ****** *)
//
fun fprint_int
  : fprint_type (int) = "mac#%"
overload fprint with fprint_int
fun print_int (x: int): void = "mac#%"
fun prerr_int (x: int): void = "mac#%"
overload print with print_int
overload prerr with prerr_int
//
fun fprint_lint
  : fprint_type (lint) = "mac#%"
overload fprint with fprint_lint
fun print_lint (x: lint): void = "mac#%"
fun prerr_lint (x: lint): void = "mac#%"
overload print with print_lint
overload prerr with prerr_lint
//
fun fprint_llint
  : fprint_type (llint) = "mac#%"
overload fprint with fprint_llint
fun print_llint (x: llint): void = "mac#%"
fun prerr_llint (x: llint): void = "mac#%"
overload print with print_llint
overload prerr with prerr_llint
//
fun fprint_ssize
  : fprint_type (ssize_t) = "mac#%"
overload fprint with fprint_ssize
fun print_ssize (x: ssize_t): void = "mac#%"
fun prerr_ssize (x: ssize_t): void = "mac#%"
overload print with print_ssize
overload prerr with prerr_ssize
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
fun g0uint_isgtz_uint (x: uint):<> bool = "mac#%"
fun g0uint_iseqz_uint (x: uint):<> bool = "mac#%"
fun g0uint_isneqz_uint (x: uint):<> bool = "mac#%"
fun g0uint_lt_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_lte_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_gt_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_gte_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_eq_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_neq_uint (x: uint, y: uint):<> bool = "mac#%"
fun g0uint_compare_uint (x: uint, y: uint):<> int = "mac#%"
fun g0uint_max_uint (x: uint, y: uint):<> uint = "mac#%"
fun g0uint_min_uint (x: uint, y: uint):<> uint = "mac#%"
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
fun g0uint_isgtz_ulint (x: ulint):<> bool = "mac#%"
fun g0uint_iseqz_ulint (x: ulint):<> bool = "mac#%"
fun g0uint_isneqz_ulint (x: ulint):<> bool = "mac#%"
fun g0uint_lt_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_lte_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_gt_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_gte_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_eq_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_neq_ulint (x: ulint, y: ulint):<> bool = "mac#%"
fun g0uint_compare_ulint (x: ulint, y: ulint):<> int = "mac#%"
fun g0uint_max_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
fun g0uint_min_ulint (x: ulint, y: ulint):<> ulint = "mac#%"
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
fun g0uint_isgtz_ullint (x: ullint):<> bool = "mac#%"
fun g0uint_iseqz_ullint (x: ullint):<> bool = "mac#%"
fun g0uint_isneqz_ullint (x: ullint):<> bool = "mac#%"
fun g0uint_lt_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_lte_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_gt_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_gte_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_eq_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_neq_ullint (x: ullint, y: ullint):<> bool = "mac#%"
fun g0uint_compare_ullint (x: ullint, y: ullint):<> int = "mac#%"
fun g0uint_max_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
fun g0uint_min_ullint (x: ullint, y: ullint):<> ullint = "mac#%"
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
fun g0uint_isgtz_size (x: size_t):<> bool = "mac#%"
fun g0uint_iseqz_size (x: size_t):<> bool = "mac#%"
fun g0uint_isneqz_size (x: size_t):<> bool = "mac#%"
fun g0uint_lt_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_lte_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_gt_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_gte_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_eq_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_neq_size (x: size_t, y: size_t):<> bool = "mac#%"
fun g0uint_compare_size (x: size_t, y: size_t):<> int = "mac#%"
fun g0uint_max_size (x: size_t, y: size_t):<> size_t = "mac#%"
fun g0uint_min_size (x: size_t, y: size_t):<> size_t = "mac#%"
//
(* ****** ****** *)
//
fun fprint_uint
  : fprint_type (uint) = "mac#%"
overload fprint with fprint_uint
fun print_uint (x: uint): void = "mac#%"
fun prerr_uint (x: uint): void = "mac#%"
overload print with print_uint
overload prerr with prerr_uint
//
fun fprint_ulint
  : fprint_type (ulint) = "mac#%"
overload fprint with fprint_ulint
fun print_ulint (x: ulint): void = "mac#%"
fun prerr_ulint (x: ulint): void = "mac#%"
overload print with print_ulint
overload prerr with prerr_ulint
//
fun fprint_ullint
  : fprint_type (ullint) = "mac#%"
overload fprint with fprint_ullint
fun print_ullint (x: ullint): void = "mac#%"
fun prerr_ullint (x: ullint): void = "mac#%"
overload print with print_ullint
overload prerr with prerr_ullint
//
fun fprint_size
  : fprint_type (size_t) = "mac#%"
overload fprint with fprint_size
fun print_size (x: size_t): void = "mac#%"
fun prerr_size (x: size_t): void = "mac#%"
overload print with print_size
overload prerr with prerr_size
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
fun g1int_isltz_int : g1int_isltz_type (intknd) = "mac#%"
fun g1int_isltez_int : g1int_isltez_type (intknd) = "mac#%"
fun g1int_isgtz_int : g1int_isgtz_type (intknd) = "mac#%"
fun g1int_isgtez_int : g1int_isgtez_type (intknd) = "mac#%"
fun g1int_iseqz_int : g1int_iseqz_type (intknd) = "mac#%"
fun g1int_isneqz_int : g1int_isneqz_type (intknd) = "mac#%"
fun g1int_lt_int : g1int_lt_type (intknd) = "mac#%"
fun g1int_lte_int : g1int_lte_type (intknd) = "mac#%"
fun g1int_gt_int : g1int_gt_type (intknd) = "mac#%"
fun g1int_gte_int : g1int_gte_type (intknd) = "mac#%"
fun g1int_eq_int : g1int_eq_type (intknd) = "mac#%"
fun g1int_neq_int : g1int_neq_type (intknd) = "mac#%"
fun g1int_compare_int : g1int_compare_type (intknd) = "mac#%"
fun g1int_max_int : g1int_max_type (intknd) = "mac#%"
fun g1int_min_int : g1int_min_type (intknd) = "mac#%"
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
fun g1int_isltz_lint : g1int_isltz_type (lintknd) = "mac#%"
fun g1int_isltez_lint : g1int_isltez_type (lintknd) = "mac#%"
fun g1int_isgtz_lint : g1int_isgtz_type (lintknd) = "mac#%"
fun g1int_isgtez_lint : g1int_isgtez_type (lintknd) = "mac#%"
fun g1int_iseqz_lint : g1int_iseqz_type (lintknd) = "mac#%"
fun g1int_isneqz_lint : g1int_isneqz_type (lintknd) = "mac#%"
fun g1int_lt_lint : g1int_lt_type (lintknd) = "mac#%"
fun g1int_lte_lint : g1int_lte_type (lintknd) = "mac#%"
fun g1int_gt_lint : g1int_gt_type (lintknd) = "mac#%"
fun g1int_gte_lint : g1int_gte_type (lintknd) = "mac#%"
fun g1int_eq_lint : g1int_eq_type (lintknd) = "mac#%"
fun g1int_neq_lint : g1int_neq_type (lintknd) = "mac#%"
fun g1int_compare_lint : g1int_compare_type (lintknd) = "mac#%"
fun g1int_max_lint : g1int_max_type (lintknd) = "mac#%"
fun g1int_min_lint : g1int_min_type (lintknd) = "mac#%"
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
fun g1int_isltz_llint : g1int_isltz_type (llintknd) = "mac#%"
fun g1int_isltez_llint : g1int_isltez_type (llintknd) = "mac#%"
fun g1int_isgtz_llint : g1int_isgtz_type (llintknd) = "mac#%"
fun g1int_isgtez_llint : g1int_isgtez_type (llintknd) = "mac#%"
fun g1int_iseqz_llint : g1int_iseqz_type (llintknd) = "mac#%"
fun g1int_isneqz_llint : g1int_isneqz_type (llintknd) = "mac#%"
fun g1int_lt_llint : g1int_lt_type (llintknd) = "mac#%"
fun g1int_lte_llint : g1int_lte_type (llintknd) = "mac#%"
fun g1int_gt_llint : g1int_gt_type (llintknd) = "mac#%"
fun g1int_gte_llint : g1int_gte_type (llintknd) = "mac#%"
fun g1int_eq_llint : g1int_eq_type (llintknd) = "mac#%"
fun g1int_neq_llint : g1int_neq_type (llintknd) = "mac#%"
fun g1int_compare_llint : g1int_compare_type (llintknd) = "mac#%"
fun g1int_max_llint : g1int_max_type (llintknd) = "mac#%"
fun g1int_min_llint : g1int_min_type (llintknd) = "mac#%"
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
fun g1int_isltz_ssize : g1int_isltz_type (ssizeknd) = "mac#%"
fun g1int_isltez_ssize : g1int_isltez_type (ssizeknd) = "mac#%"
fun g1int_isgtz_ssize : g1int_isgtz_type (ssizeknd) = "mac#%"
fun g1int_isgtez_ssize : g1int_isgtez_type (ssizeknd) = "mac#%"
fun g1int_iseqz_ssize : g1int_iseqz_type (ssizeknd) = "mac#%"
fun g1int_isneqz_ssize : g1int_isneqz_type (ssizeknd) = "mac#%"
fun g1int_lt_ssize : g1int_lt_type (ssizeknd) = "mac#%"
fun g1int_lte_ssize : g1int_lte_type (ssizeknd) = "mac#%"
fun g1int_gt_ssize : g1int_gt_type (ssizeknd) = "mac#%"
fun g1int_gte_ssize : g1int_gte_type (ssizeknd) = "mac#%"
fun g1int_eq_ssize : g1int_eq_type (ssizeknd) = "mac#%"
fun g1int_neq_ssize : g1int_neq_type (ssizeknd) = "mac#%"
fun g1int_compare_ssize : g1int_compare_type (ssizeknd) = "mac#%"
fun g1int_max_ssize : g1int_max_type (ssizeknd) = "mac#%"
fun g1int_min_ssize : g1int_min_type (ssizeknd) = "mac#%"
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
fun g1uint_isgtz_uint : g1uint_isgtz_type (uintknd) = "mac#%"
fun g1uint_iseqz_uint : g1uint_iseqz_type (uintknd) = "mac#%"
fun g1uint_isneqz_uint : g1uint_isneqz_type (uintknd) = "mac#%"
fun g1uint_lt_uint : g1uint_lt_type (uintknd) = "mac#%"
fun g1uint_lte_uint : g1uint_lte_type (uintknd) = "mac#%"
fun g1uint_gt_uint : g1uint_gt_type (uintknd) = "mac#%"
fun g1uint_gte_uint : g1uint_gte_type (uintknd) = "mac#%"
fun g1uint_eq_uint : g1uint_eq_type (uintknd) = "mac#%"
fun g1uint_neq_uint : g1uint_neq_type (uintknd) = "mac#%"
fun g1uint_compare_uint : g1uint_compare_type (uintknd) = "mac#%"
fun g1uint_max_uint : g1uint_max_type (uintknd) = "mac#%"
fun g1uint_min_uint : g1uint_min_type (uintknd) = "mac#%"
//
fun g1uint_succ_ulint : g1uint_succ_type (ulintknd) = "mac#%"
fun g1uint_pred_ulint : g1uint_pred_type (ulintknd) = "mac#%"
fun g1uint_half_ulint : g1uint_half_type (ulintknd) = "mac#%"
fun g1uint_add_ulint : g1uint_add_type (ulintknd) = "mac#%"
fun g1uint_sub_ulint : g1uint_sub_type (ulintknd) = "mac#%"
fun g1uint_mul_ulint : g1uint_mul_type (ulintknd) = "mac#%"
fun g1uint_div_ulint : g1uint_div_type (ulintknd) = "mac#%"
fun g1uint_mod_ulint : g1uint_mod_type (ulintknd) = "mac#%"
fun g1uint_isgtz_ulint : g1uint_isgtz_type (ulintknd) = "mac#%"
fun g1uint_iseqz_ulint : g1uint_iseqz_type (ulintknd) = "mac#%"
fun g1uint_isneqz_ulint : g1uint_isneqz_type (ulintknd) = "mac#%"
fun g1uint_lt_ulint : g1uint_lt_type (ulintknd) = "mac#%"
fun g1uint_lte_ulint : g1uint_lte_type (ulintknd) = "mac#%"
fun g1uint_gt_ulint : g1uint_gt_type (ulintknd) = "mac#%"
fun g1uint_gte_ulint : g1uint_gte_type (ulintknd) = "mac#%"
fun g1uint_eq_ulint : g1uint_eq_type (ulintknd) = "mac#%"
fun g1uint_neq_ulint : g1uint_neq_type (ulintknd) = "mac#%"
fun g1uint_compare_ulint : g1uint_compare_type (ulintknd) = "mac#%"
fun g1uint_max_ulint : g1uint_max_type (ulintknd) = "mac#%"
fun g1uint_min_ulint : g1uint_min_type (ulintknd) = "mac#%"
//
fun g1uint_succ_ullint : g1uint_succ_type (ullintknd) = "mac#%"
fun g1uint_pred_ullint : g1uint_pred_type (ullintknd) = "mac#%"
fun g1uint_half_ullint : g1uint_half_type (ullintknd) = "mac#%"
fun g1uint_add_ullint : g1uint_add_type (ullintknd) = "mac#%"
fun g1uint_sub_ullint : g1uint_sub_type (ullintknd) = "mac#%"
fun g1uint_mul_ullint : g1uint_mul_type (ullintknd) = "mac#%"
fun g1uint_div_ullint : g1uint_div_type (ullintknd) = "mac#%"
fun g1uint_mod_ullint : g1uint_mod_type (ullintknd) = "mac#%"
fun g1uint_isgtz_ullint : g1uint_isgtz_type (ullintknd) = "mac#%"
fun g1uint_iseqz_ullint : g1uint_iseqz_type (ullintknd) = "mac#%"
fun g1uint_isneqz_ullint : g1uint_isneqz_type (ullintknd) = "mac#%"
fun g1uint_lt_ullint : g1uint_lt_type (ullintknd) = "mac#%"
fun g1uint_lte_ullint : g1uint_lte_type (ullintknd) = "mac#%"
fun g1uint_gt_ullint : g1uint_gt_type (ullintknd) = "mac#%"
fun g1uint_gte_ullint : g1uint_gte_type (ullintknd) = "mac#%"
fun g1uint_eq_ullint : g1uint_eq_type (ullintknd) = "mac#%"
fun g1uint_neq_ullint : g1uint_neq_type (ullintknd) = "mac#%"
fun g1uint_compare_ullint : g1uint_compare_type (ullintknd) = "mac#%"
fun g1uint_max_ullint : g1uint_max_type (ullintknd) = "mac#%"
fun g1uint_min_ullint : g1uint_min_type (ullintknd) = "mac#%"
//
fun g1uint_succ_size : g1uint_succ_type (sizeknd) = "mac#%"
fun g1uint_pred_size : g1uint_pred_type (sizeknd) = "mac#%"
fun g1uint_half_size : g1uint_half_type (sizeknd) = "mac#%"
fun g1uint_add_size : g1uint_add_type (sizeknd) = "mac#%"
fun g1uint_sub_size : g1uint_sub_type (sizeknd) = "mac#%"
fun g1uint_mul_size : g1uint_mul_type (sizeknd) = "mac#%"
fun g1uint_div_size : g1uint_div_type (sizeknd) = "mac#%"
fun g1uint_mod_size : g1uint_mod_type (sizeknd) = "mac#%"
fun g1uint_isgtz_size : g1uint_isgtz_type (sizeknd) = "mac#%"
fun g1uint_iseqz_size : g1uint_iseqz_type (sizeknd) = "mac#%"
fun g1uint_isneqz_size : g1uint_isneqz_type (sizeknd) = "mac#%"
fun g1uint_lt_size : g1uint_lt_type (sizeknd) = "mac#%"
fun g1uint_lte_size : g1uint_lte_type (sizeknd) = "mac#%"
fun g1uint_gt_size : g1uint_gt_type (sizeknd) = "mac#%"
fun g1uint_gte_size : g1uint_gte_type (sizeknd) = "mac#%"
fun g1uint_eq_size : g1uint_eq_type (sizeknd) = "mac#%"
fun g1uint_neq_size : g1uint_neq_type (sizeknd) = "mac#%"
fun g1uint_compare_size : g1uint_compare_type (sizeknd) = "mac#%"
fun g1uint_max_size : g1uint_max_type (sizeknd) = "mac#%"
fun g1uint_min_size : g1uint_min_type (sizeknd) = "mac#%"
//
(* ****** ****** *)
//
macdef g0i2i (x) = g0int2int (,(x))
macdef g1i2i (x) = g1int2int (,(x))
//
macdef g0i2u (x) = g0int2uint (,(x))
macdef g1i2u (x) = g1int2uint (,(x))
//
macdef g0u2i (x) = g0uint2int (,(x))
macdef g1u2i (x) = g1uint2int (,(x))
//
macdef g0u2u (x) = g0uint2uint (,(x))
macdef g1u2u (x) = g1uint2uint (,(x))
//
macdef i2u (x) = g1int2uint_int_uint (,(x))
macdef i2sz (x) = g1int2uint_int_size (,(x))
macdef i2ssz (x) = g1int2int_int_ssize (,(x))
//
(* ****** ****** *)
//
macdef u2i (x) = g1uint2int_uint_int (,(x))
macdef u2sz (x) = g1uint2uint_uint_size (,(x))
//
(* ****** ****** *)
//
(*
macdef sz2i (x) = g1uint2int_size_int (,(x))
macdef sz2u (x) = g1uint2uint_size_uint (,(x))
*)
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

(* end of [integer.sats] *)
