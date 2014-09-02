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

#ifndef Z3_Z3_SORT_CATS
#define Z3_Z3_SORT_CATS

/* ****** ****** */

Z3_DECLARE_DEC_REF(Z3_sort)

ATSinline()
Z3_sort
atscntrb_Z3_mk_int_sort(Z3_context ctx) {
  Z3_sort ty = Z3_mk_int_sort(ctx);

  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    Z3_string msg = Z3_get_error_msg_ex(ctx, e);
    fprintf(stderr, "Z3 Error: %s\n", msg);
  }
  Z3_inc_ref(ctx, Z3_sort_to_ast(ctx, ty));
  return ty;
}

ATSinline()
Z3_sort
atscntrb_Z3_mk_bool_sort(Z3_context ctx) {
  Z3_sort ty = Z3_mk_bool_sort(ctx);

  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    Z3_string msg = Z3_get_error_msg_ex(ctx, e);
    fprintf(stderr, "Z3 Error: %s\n", msg);
  }
  Z3_inc_ref(ctx, Z3_sort_to_ast(ctx, ty));
  return ty;
}

ATSinline()
Z3_sort
atscntrb_Z3_mk_real_sort(Z3_context ctx) {
  Z3_sort ty = Z3_mk_real_sort(ctx);

  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    Z3_string msg = Z3_get_error_msg_ex(ctx, e);
    fprintf(stderr, "Z3 Error: %s\n", msg);
  }
  Z3_inc_ref(ctx, Z3_sort_to_ast(ctx, ty));
  return ty;
}

ATSinline()
Z3_sort
atscntrb_Z3_mk_array_sort(Z3_context ctx, Z3_sort domain, Z3_sort range) {
  Z3_sort ty = Z3_mk_array_sort(ctx, domain, range);

  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    Z3_string msg = Z3_get_error_msg_ex(ctx, e);
    fprintf(stderr, "Z3 Error: %s\n", msg);
  }
  Z3_inc_ref(ctx, Z3_sort_to_ast(ctx, ty));
  return ty;
}



ATSinline()
Z3_sort
atscntrb_Z3_sort_inc_ref (Z3_context ctx, Z3_sort ty) {
  Z3_inc_ref(ctx, Z3_sort_to_ast(ctx, ty));
  return ty;
}

#define atscntrb_Z3_sort_dec_ref Z3_dec_ref

/* ****** ****** */

#endif
