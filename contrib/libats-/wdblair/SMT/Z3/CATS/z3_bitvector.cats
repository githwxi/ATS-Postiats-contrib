/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2012 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
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

#ifndef Z3_Z3_BITVECTOR_CATS
#define Z3_Z3_BITVECTOR_CATS

/* ****** ****** */

Z3_DECLARE_MK_AST (Z3_mk_int2bv, int n, Z3_ast num) {
  Z3_BODY_MK_AST(Z3_mk_int2bv, n, num)
}

Z3_DECLARE_MK_AST (Z3_mk_bv2int, Z3_ast num, Z3_bool is_signed) {
  Z3_BODY_MK_AST(Z3_mk_bv2int, num, is_signed)
}

ATSinline()
Z3_sort
atscntrb_Z3_mk_bv_sort(Z3_context ctx, unsigned int n) {
  Z3_sort ty = Z3_mk_bv_sort(ctx, n);
  
  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    Z3_string msg = Z3_get_error_msg_ex(ctx, e);
    fprintf(stderr, "Z3 Error: %s\n", msg);
  }
  Z3_inc_ref(ctx, Z3_sort_to_ast(ctx, ty));
  return ty;
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_bvnot, Z3_ast l) {
  Z3_BODY_MK_AST(Z3_mk_bvnot, l)
}

Z3_DECLARE_MK_AST(Z3_mk_bvredand, Z3_ast l) {
  Z3_BODY_MK_AST(Z3_mk_bvredand, l)
}

Z3_DECLARE_MK_AST(Z3_mk_bvredor, Z3_ast l) {
  Z3_BODY_MK_AST(Z3_mk_bvredor, l)
}

Z3_DECLARE_MK_AST(Z3_mk_bvand, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvand, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvor, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvor, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvxor, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvxor, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvshl, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvshl, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvashr, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvashr, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvlshr, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvlshr, l, r)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_bvneg, Z3_ast l) {
  Z3_BODY_MK_AST(Z3_mk_bvneg, l)
}

Z3_DECLARE_MK_AST(Z3_mk_bvadd, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvadd, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvsub, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvsub, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvmul, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvmul, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvudiv, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvudiv, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvurem, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvurem, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvsdiv, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvsdiv, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvsrem, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvsrem, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvsmod, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvsmod, l, r)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_bvult, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvult, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvslt, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvslt, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvule, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvule, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvsle, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvsle, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvuge, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvuge, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvsge, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvsge, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvugt, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvugt, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_bvsgt, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_bvsgt, l, r)
}

/* ****** ****** */

#endif
