/***********************************************************************/
/*                                                                     */
/*                       ATS/contrib/libats-hwxi                       */
/*                                                                     */
/***********************************************************************/

/*
(*
** Copyright (C) 2014 Hongwei Xi, ATS Trustful Software, Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and associated documentation files (the "Software"),
** to deal in the Software without restriction, including without limitation
** the rights to use, copy, modify, merge, publish, distribute, sublicense,
** and/or sell copies of the Software, and to permit persons to whom the
** Software is furnished to do so, subject to the following stated conditions:
** 
** The above copyright notice and this permission notice shall be included in
** all copies or substantial portions of the Software.
** 
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
** OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
** THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
** FROM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
** IN THE SOFTWARE.
*)
*/

/* ****** ****** */
//
// HX-2014-06-04: ported from ATS1
//
/* ****** ****** */
//
// for supporting SIMD on vectors of 2 doubles
//
/* ****** ****** */

#ifndef ATSCNTRB_LIBATSHWXI_SIMD_V2DF_CATS
#define ATSCNTRB_LIBATSHWXI_SIMD_V2DF_CATS

/* ****** ****** */
//
// for vectors of two doubles
//
typedef double v2df __attribute__((vector_size(16))) ;
//
typedef v2df atscntrb_v2df_type ; // HX: extype-name
//
/* ****** ****** */
//
static
v2df atscntrb_libatshwxi_SIMD_v2df_0_0 = { 0.0, 0.0 } ;
static
v2df atscntrb_libatshwxi_SIMD_v2df_1_1 = { 1.0, 1.0 } ;
//
/* ****** ****** */

ATSinline()
v2df
atscntrb_libatshwxi_SIMD_v2df_make_int_int
  (int i0, int i1)
{
  v2df dd = { (double)i0, (double)i1 } ; return dd ;
} /* end of [atscntrb_libatshwxi_SIMD_v2df_make_int_int] */

ATSinline()
v2df
atscntrb_libatshwxi_SIMD_v2df_make_double_double
  (double d0, double d1)
{
  v2df dd = { d0, d1 } ; return dd ;
} /* end of [atscntrb_libatshwxi_SIMD_v2df_make_double_double] */

/* ****** ****** */
//
ATSinline()
double
atscntrb_libatshwxi_SIMD_v2df_get_fst
  (v2df dd) { return ((double*)&dd)[0] ; }
//
ATSinline()
double
atscntrb_libatshwxi_SIMD_v2df_get_snd
  (v2df dd) { return ((double*)&dd)[1] ; }
//
/* ****** ****** */

ATSinline()
v2df
atscntrb_libatshwxi_SIMD_add_v2df_v2df
(
  v2df dd1, v2df dd2
) {
  return (dd1 + dd2) ;
} /* end of [atscntrb_libatshwxi_SIMD_add_v2df_v2df] */

ATSinline()
v2df
atscntrb_libatshwxi_SIMD_sub_v2df_v2df
(
  v2df dd1, v2df dd2
) {
  return (dd1 - dd2) ;
} /* end of [atscntrb_libatshwxi_SIMD_sub_v2df_v2df] */

ATSinline()
v2df
atscntrb_libatshwxi_SIMD_mul_v2df_v2df
(
  v2df dd1, v2df dd2
) { 
  return (dd1 * dd2) ;
} /* end of [atscntrb_libatshwxi_SIMD_mul_v2df_v2df] */

ATSinline()
v2df
atscntrb_libatshwxi_SIMD_div_v2df_v2df
(
  v2df dd1, v2df dd2
) { 
  return (dd1 / dd2) ;
} /* end of [atscntrb_libatshwxi_SIMD_div_v2df_v2df] */

/* ****** ****** */

#endif /* ATSCNTRB_LIBATSHWXI_SIMD_V2DF_CATS */

/* end of [v2df.cats] */
