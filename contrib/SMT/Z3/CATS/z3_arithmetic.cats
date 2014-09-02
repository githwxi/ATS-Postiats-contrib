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

#ifndef Z3_Z3_ARITHMETIC_CATS
#define Z3_Z3_ARITHMETIC_CATS

/* ****** ****** */

ATSinline()
Z3_ast
atscntrb_Z3_mk_mul2 (Z3_context ctx, Z3_ast l, Z3_ast r) {
  Z3_ast args[2] = {l, r};
  Z3_BODY_MK_AST(Z3_mk_mul, 2, args)
}

ATSinline()
Z3_ast
atscntrb_Z3_mk_add2 (Z3_context ctx, Z3_ast l, Z3_ast r) {
  Z3_ast args[2] = {l, r};
  Z3_BODY_MK_AST(Z3_mk_add, 2, args)
}

ATSinline()
Z3_ast
atscntrb_Z3_mk_sub2 (Z3_context ctx, Z3_ast l, Z3_ast r) {
  Z3_ast args[2] = {l, r};
  Z3_BODY_MK_AST(Z3_mk_sub, 2, args)
}

ATSinline()
Z3_ast
atscntrb_Z3_mk_div (Z3_context ctx, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_div, l, r)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_lt, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_lt, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_le, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_le, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_gt, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_gt, l, r)
}

Z3_DECLARE_MK_AST(Z3_mk_ge, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_ge, l, r)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_unary_minus, Z3_ast num) {
  Z3_BODY_MK_AST(Z3_mk_unary_minus, num)
}

Z3_DECLARE_MK_AST(Z3_mk_is_int, Z3_ast num) {
  Z3_BODY_MK_AST(Z3_mk_is_int, num)
}

Z3_DECLARE_MK_AST(Z3_mk_int2real, Z3_ast num) {
  Z3_BODY_MK_AST(Z3_mk_int2real, num)
}

/* ****** ****** */

/* end of [z3_airthmetic.cats] */

#endif
