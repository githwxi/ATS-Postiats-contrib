(***********************************************************************)
(*                                                                     *)
(*                       ATS/contrib/libats-hwxi                       *)
(*                                                                     *)
(***********************************************************************)

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

(* ****** ****** *)
//
// HX-2014-06-04: ported from ATS1
//
(* ****** ****** *)
//
// for supporting SIMD on vectors of 2 doubles
//
(* ****** ****** *)

%{#
//
#include "SIMD/CATS/v2df.cats"
//
%} // end of [%{#]

(* ****** ****** *)

#define
ATS_PACKNAME "ATSCNTRB.libats-hwxi.SIMD"
#define
ATS_EXTERN_PREFIX "atscntrb_libatshwxi_SIMD_"

(* ****** ****** *)
//
abst@ype v2df =
$extype"atscntrb_v2df_type"
//
(* ****** ****** *)

val v2df_0_0: v2df = "mac#%"
val v2df_1_1: v2df = "mac#%"

(* ****** ****** *)
//
fun v2df_get_fst (dd: v2df): double = "mac#%"
fun v2df_get_snd (dd: v2df): double = "mac#%"
//
(* ****** ****** *)
//
symintr v2df_make
//
fun
v2df_make_int_int
  (i0: int, i1: int): v2df = "mac#%"
fun
v2df_make_double_double
  (d0: double, d1: double): v2df = "mac#%"
//
overload v2df_make with v2df_make_int_int
overload v2df_make with v2df_make_double_double
//
(* ****** ****** *)
//
fun
add_v2df_v2df
  (dd0: v2df, dd1: v2df): v2df = "mac#%"
fun
sub_v2df_v2df
  (dd0: v2df, dd1: v2df): v2df = "mac#%"
fun
mul_v2df_v2df
  (dd0: v2df, dd1: v2df): v2df = "mac#%"
fun
div_v2df_v2df
  (dd0: v2df, dd1: v2df): v2df = "mac#%"
//
overload + with add_v2df_v2df of 0
overload - with sub_v2df_v2df of 0
overload * with mul_v2df_v2df of 0
overload / with div_v2df_v2df of 0
//
(* ****** ****** *)

(* end of [v2df.sats] *)
