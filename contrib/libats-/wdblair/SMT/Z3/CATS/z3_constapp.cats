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

#ifndef Z3_Z3_CONSTAPP_CATS
#define Z3_Z3_CONSTAPP_CATS

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_const, Z3_symbol sym, Z3_sort ty) {
  Z3_BODY_MK_AST(Z3_mk_const, sym, ty)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_fresh_const, Z3_string prefix, Z3_sort ty) {
  Z3_BODY_MK_AST(Z3_mk_fresh_const, prefix, ty)
}

/* ****** ****** */

ATSinline()
Z3_func_decl
atscntrb_Z3_mk_func_decl (Z3_context ctx, Z3_symbol s, unsigned int n, void **domain, Z3_sort range) {
  Z3_func_decl dec = Z3_mk_func_decl(ctx, s, n, (Z3_sort *)domain, range);
  
  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    Z3_string msg = Z3_get_error_msg_ex(ctx, e);
    fprintf(stderr, "Z3 Error: %s\n", msg);
  }
  Z3_inc_ref(ctx, Z3_func_decl_to_ast(ctx, dec));
  return dec;
}

/* ****** ****** */

ATSinline()
Z3_func_decl
atscntrb_Z3_func_decl_inc_ref (Z3_context ctx, Z3_func_decl d) {
  Z3_inc_ref(ctx, Z3_func_decl_to_ast(ctx, d));
  return d;
}

ATSinline()
void
atscntrb_Z3_func_decl_dec_ref (Z3_context ctx, Z3_func_decl d) {
  Z3_dec_ref(ctx, Z3_func_decl_to_ast(ctx, d));
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_app, Z3_func_decl f, unsigned int n, void **args) {
  Z3_BODY_MK_AST(Z3_mk_app, f, n, (Z3_ast const *)args)
}

/* ****** ****** */

#endif // end of [Z3_Z3_CONSTAPP_CATS]

/* ****** ****** */

/* end of [z3_constapp.cats] */
