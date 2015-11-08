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
** $PATSHOME/libc/CATS/CODEGEN/math.atxt
** Time of generation: Wed Sep 23 16:09:12 2015
*/

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)
*/

/* ****** ****** */

#ifndef ATSLIB_LIBC_CATS_MATH
#define ATSLIB_LIBC_CATS_MATH

/* ****** ****** */

#include <math.h>

/* ****** ****** */

#define atslib_isfinite_float isfinite
#define atslib_isfinite_double isfinite
#define atslib_isfinite_ldouble isfinite

/* ****** ****** */

#define atslib_isnormal_float isnormal
#define atslib_isnormal_double isnormal
#define atslib_isnormal_ldouble isnormal

/* ****** ****** */

#define atslib_isinf_float isinf
#define atslib_isinf_double isinf
#define atslib_isinf_ldouble isinf

/* ****** ****** */

#define atslib_isnan_float isnan
#define atslib_isnan_double isnan
#define atslib_isnan_ldouble isnan

/* ****** ****** */

#define atslib_fpclassify_float fpclassify
#define atslib_fpclassify_double fpclassify
#define atslib_fpclassify_ldouble fpclassify

/* ****** ****** */

#define atslib_ceil_float ceilf
#define atslib_ceil_double ceil
#define atslib_ceil_ldouble ceill

/* ****** ****** */

#define atslib_floor_float floorf
#define atslib_floor_double floor
#define atslib_floor_ldouble floorl

/* ****** ****** */

#define atslib_round_float roundf
#define atslib_round_double round
#define atslib_round_ldouble roundl

/* ****** ****** */

#define atslib_trunc_float truncf
#define atslib_trunc_double trunc
#define atslib_trunc_ldouble truncl

/* ****** ****** */

#define atslib_fmod_float fmodf
#define atslib_fmod_double fmod
#define atslib_fmod_ldouble fmodl

/* ****** ****** */

#define atslib_fmax_float fmaxf
#define atslib_fmax_double fmax
#define atslib_fmax_ldouble fmaxl

/* ****** ****** */

#define atslib_fmin_float fminf
#define atslib_fmin_double fmin
#define atslib_fmin_ldouble fminl

/* ****** ****** */

#define atslib_fdim_float fdimf
#define atslib_fdim_double fdim
#define atslib_fdim_ldouble fdiml

/* ****** ****** */

#define atslib_fma_float fmaf
#define atslib_fma_double fma
#define atslib_fma_ldouble fmal

/* ****** ****** */

#define atslib_sqrt_float sqrtf
#define atslib_sqrt_double sqrt
#define atslib_sqrt_ldouble sqrtl

/* ****** ****** */

#define atslib_cbrt_float cbrtf
#define atslib_cbrt_double cbrt
#define atslib_cbrt_ldouble cbrtl

/* ****** ****** */

#define atslib_pow_float powf
#define atslib_pow_double pow
#define atslib_pow_ldouble powl

/* ****** ****** */

#define atslib_exp_float expf
#define atslib_exp_double exp
#define atslib_exp_ldouble expl

/* ****** ****** */
//
#define atslib_log_float logf
#define atslib_log_double log
#define atslib_log_ldouble logl
//
#define atslib_log10_float log10f
#define atslib_log10_double log10
#define atslib_log10_ldouble log10l
//
/* ****** ****** */
//
#define atslib_sin_float sinf
#define atslib_sin_double sin
#define atslib_sin_ldouble sinl
//
#define atslib_cos_float cosf
#define atslib_cos_double cos
#define atslib_cos_ldouble cosl
//
#define atslib_tan_float tanf
#define atslib_tan_double tan
#define atslib_tan_ldouble tanl
//
/* ****** ****** */
//
#define atslib_asin_float asinf
#define atslib_asin_double asin
#define atslib_asin_ldouble asinl
//
#define atslib_acos_float acosf
#define atslib_acos_double acos
#define atslib_acos_ldouble cosl
//
#define atslib_atan_float atanf
#define atslib_atan_double atan
#define atslib_atan_ldouble atanl
//
#define atslib_atan2_float atan2f
#define atslib_atan2_double atan2
#define atslib_atan2_ldouble atan2l
//
/* ****** ****** */
//
#define atslib_sinh_float sinhf
#define atslib_sinh_double sinh
#define atslib_sinh_ldouble sinhl
//
#define atslib_cosh_float coshf
#define atslib_cosh_double cosh
#define atslib_cosh_ldouble coshl
//
#define atslib_tanh_float tanhf
#define atslib_tanh_double tanh
#define atslib_tanh_ldouble tanhl
//
/* ****** ****** */

#define atslib_asinh_float asinhf
#define atslib_asinh_double asinh
#define atslib_asinh_ldouble asinhl
//
#define atslib_acosh_float acoshf
#define atslib_acosh_double acosh
#define atslib_acosh_ldouble acoshl
//
#define atslib_atanh_float atanhf
#define atslib_atanh_double atanh
#define atslib_atanh_ldouble atanhl
//
/* ****** ****** */

#endif // ifndef ATSLIB_LIBC_CATS_MATH

/* ****** ****** */

/* end of [math.cats] */
