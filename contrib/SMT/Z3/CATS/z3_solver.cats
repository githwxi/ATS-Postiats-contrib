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

#ifndef Z3_Z3_SOLVER_CATS
#define Z3_Z3_SOLVER_CATS

/* ****** ****** */

ATSinline()
Z3_tactic
atscntrb_Z3_mk_tactic(Z3_context ctx, Z3_string name) {
  Z3_tactic s = Z3_mk_tactic(ctx, name);
  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    fprintf(stderr, "Z3 Error:%s\n", Z3_get_error_msg_ex(ctx, e));
    exit(1);
  }
  Z3_tactic_inc_ref(ctx, s);
  return s;
}

#define atscntrb_Z3_tactic_dec_ref Z3_tactic_dec_ref

/* ****** ****** */

ATSinline()
Z3_solver
atscntrb_Z3_mk_solver_from_tactic(Z3_context ctx, Z3_tactic t) {
  Z3_solver s = Z3_mk_solver_from_tactic(ctx, t);
  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    fprintf(stderr, "Z3 Error: %s\n", Z3_get_error_msg_ex(ctx, e));
    exit(1);
  }
  Z3_solver_inc_ref(ctx, s);
  return s;
}

ATSinline()
Z3_solver
atscntrb_Z3_mk_solver(Z3_context ctx) {
  Z3_solver s = Z3_mk_solver(ctx);
  Z3_error_code e = Z3_get_error_code(ctx);
  if (e != Z3_OK) {
    fprintf(stderr, "Z3 Error: %s\n", Z3_get_error_msg_ex(ctx, e));
    exit(1);
  }
  Z3_solver_inc_ref(ctx, s);
  return s;
}

ATSinline()
Z3_solver
atscntrb_Z3_solver_inc_ref(Z3_context ctx, Z3_solver s) {
  Z3_solver_inc_ref(ctx, s);
  return s;
}

#define atscntrb_Z3_solver_assert Z3_solver_assert
#define atscntrb_Z3_solver_check Z3_solver_check
#define atscntrb_Z3_solver_dec_ref Z3_solver_dec_ref

/* ****** ****** */

#define atscntrb_Z3_get_num_scopes Z3_get_num_scopes

/* ****** ****** */

#endif
