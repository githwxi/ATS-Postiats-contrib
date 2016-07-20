/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
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
*) */

/* ****** ****** */

/*
** Source:
** $PATSHOME/prelude/CATS/CODEGEN/integer_ptr.atxt
** Time of generation: Sat Oct 17 15:20:02 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: January, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_PRELUDE_CATS_INTEGER_PTR
#define ATSLIB_PRELUDE_CATS_INTEGER_PTR

/* ****** ****** */

#include <stdint.h>

/* ****** ****** */

typedef intptr_t atstype_intptr ;
typedef uintptr_t atstype_uintptr ;

/* ****** ****** */
//
#define atspre_g0int2int_int_intptr(x) ((atstype_intptr)(x))
#define atspre_g0int2int_lint_intptr(x) ((atstype_intptr)(x))
//
#define atspre_g0int2uint_int_uintptr(x) ((atstype_uintptr)(x))
//
#define atspre_g0uint2uint_uint_uintptr(x) ((atstype_uintptr)(x))
#define atspre_g0uint2uint_ulint_uintptr(x) ((atstype_uintptr)(x))
//
/* ****** ****** */
//
#define atspre_g1int2int_int_intptr atspre_g0int2int_int_intptr
#define atspre_g1int2int_lint_intptr atspre_g0int2int_lint_intptr
//
#define atspre_g1int2uint_int_uintptr atspre_g0int2uint_int_uintptr
//
#define atspre_g1uint2uint_uint_uintptr atspre_g0uint2uint_uint_uintptr
#define atspre_g1uint2uint_ulint_uintptr atspre_g0uint2uint_ulint_uintptr
//
/* ****** ****** */

ATSinline()
atstype_intptr
atspre_g0int_neg_intptr
  (atstype_intptr x) { return (-x) ; }
// end of [atspre_g0int_neg_intptr]
ATSinline()
atstype_intptr
atspre_g0int_succ_intptr
  (atstype_intptr x) { return (x + 1) ; }
// end of [atspre_g0int_succ_intptr]
ATSinline()
atstype_intptr
atspre_g0int_pred_intptr
  (atstype_intptr x) { return (x - 1) ; }
// end of [atspre_g0int_pred_intptr]
ATSinline()
atstype_intptr
atspre_g0int_half_intptr
  (atstype_intptr x) { return (x / 2) ; }
// end of [atspre_g0int_half_intptr]
ATSinline()
atstype_intptr
atspre_g0int_add_intptr
  (atstype_intptr x1, atstype_intptr x2) { return (x1 + x2) ; }
// end of [atspre_g0int_add_intptr]
ATSinline()
atstype_intptr
atspre_g0int_sub_intptr
  (atstype_intptr x1, atstype_intptr x2) { return (x1 - x2) ; }
// end of [atspre_g0int_sub_intptr]
ATSinline()
atstype_intptr
atspre_g0int_mul_intptr
  (atstype_intptr x1, atstype_intptr x2) { return (x1 * x2) ; }
// end of [atspre_g0int_mul_intptr]
ATSinline()
atstype_intptr
atspre_g0int_div_intptr
  (atstype_intptr x1, atstype_intptr x2) { return (x1 / x2) ; }
// end of [atspre_g0int_div_intptr]
ATSinline()
atstype_intptr
atspre_g0int_mod_intptr
  (atstype_intptr x1, atstype_intptr x2) { return (x1 % x2) ; }
// end of [atspre_g0int_mod_intptr]
ATSinline()
atstype_bool
atspre_g0int_isltz_intptr (atstype_intptr x)
{
  return (x < 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_isltz_intptr]
ATSinline()
atstype_bool
atspre_g0int_isltez_intptr (atstype_intptr x)
{
  return (x <= 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_isltez_intptr]
ATSinline()
atstype_bool
atspre_g0int_isgtz_intptr (atstype_intptr x)
{
  return (x > 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_isgtz_intptr]
ATSinline()
atstype_bool
atspre_g0int_isgtez_intptr (atstype_intptr x)
{
  return (x >= 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_isgtez_intptr]
ATSinline()
atstype_bool
atspre_g0int_iseqz_intptr (atstype_intptr x)
{
  return (x == 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_iseqz_intptr]
ATSinline()
atstype_bool
atspre_g0int_isneqz_intptr (atstype_intptr x)
{
  return (x != 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_isneqz_intptr]
ATSinline()
atstype_bool
atspre_g0int_lt_intptr
(
  atstype_intptr x1, atstype_intptr x2
) {
  return (x1 < x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_lt_intptr]
ATSinline()
atstype_bool
atspre_g0int_lte_intptr
(
  atstype_intptr x1, atstype_intptr x2
) {
  return (x1 <= x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_lte_intptr]
ATSinline()
atstype_bool
atspre_g0int_gt_intptr
(
  atstype_intptr x1, atstype_intptr x2
) {
  return (x1 > x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_gt_intptr]
ATSinline()
atstype_bool
atspre_g0int_gte_intptr
(
  atstype_intptr x1, atstype_intptr x2
) {
  return (x1 >= x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_gte_intptr]
ATSinline()
atstype_bool
atspre_g0int_eq_intptr
(
  atstype_intptr x1, atstype_intptr x2
) {
  return (x1 == x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_eq_intptr]
ATSinline()
atstype_bool
atspre_g0int_neq_intptr
(
  atstype_intptr x1, atstype_intptr x2
) {
  return (x1 != x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0int_neq_intptr]
//
/* ****** ****** */

ATSinline()
atstype_uintptr
atspre_g0uint_succ_uintptr
  (atstype_uintptr x) { return (x + 1) ; }
// end of [atspre_g0uint_succ_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_pred_uintptr
  (atstype_uintptr x) { return (x - 1) ; }
// end of [atspre_g0uint_pred_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_half_uintptr
  (atstype_uintptr x) { return (x >> 1) ; }
// end of [atspre_g0uint_pred_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_add_uintptr
  (atstype_uintptr x1, atstype_uintptr x2) { return (x1 + x2) ; }
// end of [atspre_g0uint_add_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_sub_uintptr
  (atstype_uintptr x1, atstype_uintptr x2) { return (x1 - x2) ; }
// end of [atspre_g0uint_sub_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_mul_uintptr
  (atstype_uintptr x1, atstype_uintptr x2) { return (x1 * x2) ; }
// end of [atspre_g0uint_mul_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_div_uintptr
  (atstype_uintptr x1, atstype_uintptr x2) { return (x1 / x2) ; }
// end of [atspre_g0uint_div_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_mod_uintptr
  (atstype_uintptr x1, atstype_uintptr x2) { return (x1 % x2) ; }
// end of [atspre_g0uint_mod_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_lsl_uintptr
  (atstype_uintptr x, atstype_int n) { return (x << n) ; }
// end of [atspre_g0uint_lsl_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_lsr_uintptr
  (atstype_uintptr x, atstype_int n) { return (x >> n) ; }
// end of [atspre_g0uint_lsr_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_lnot_uintptr
  (atstype_uintptr x) { return ~(x) ; }
// end of [atspre_g0uint_lnot_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_lor_uintptr
  (atstype_uintptr x, atstype_uintptr y) { return (x | y) ; }
// end of [atspre_g0uint_uintptr_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_land_uintptr
  (atstype_uintptr x, atstype_uintptr y) { return (x & y) ; }
// end of [atspre_g0uint_uintptr_uintptr]
ATSinline()
atstype_uintptr
atspre_g0uint_lxor_uintptr
  (atstype_uintptr x, atstype_uintptr y) { return (x ^ y) ; }
// end of [atspre_g0uint_uintptr_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_isgtz_uintptr (atstype_uintptr x)
{
  return (x > 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_isgtz_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_iseqz_uintptr (atstype_uintptr x)
{
  return (x == 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_iseqz_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_isneqz_uintptr (atstype_uintptr x)
{
  return (x != 0 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_isneqz_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_lt_uintptr
(
  atstype_uintptr x1, atstype_uintptr x2
) {
  return (x1 < x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_lt_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_lte_uintptr
(
  atstype_uintptr x1, atstype_uintptr x2
) {
  return (x1 <= x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_lte_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_gt_uintptr
(
  atstype_uintptr x1, atstype_uintptr x2
) {
  return (x1 > x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_gt_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_gte_uintptr
(
  atstype_uintptr x1, atstype_uintptr x2
) {
  return (x1 >= x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_gte_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_eq_uintptr
(
  atstype_uintptr x1, atstype_uintptr x2
) {
  return (x1 == x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_eq_uintptr]
ATSinline()
atstype_bool
atspre_g0uint_neq_uintptr
(
  atstype_uintptr x1, atstype_uintptr x2
) {
  return (x1 != x2 ? atsbool_true : atsbool_false) ;
} // end of [atspre_g0uint_neq_uintptr]
//
/* ****** ****** */

#endif // ifndef ATSLIB_PRELUDE_CATS_INTEGER_PTR

/* ****** ****** */

/* end of [integer_ptr.cats] */

