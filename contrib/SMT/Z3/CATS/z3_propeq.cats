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

#ifndef Z3_Z3_PROPEQ_CATS
#define Z3_Z3_PROPEQ_CATS

/* ****** ****** */

ATSinline()
Z3_ast
atscntrb_Z3_mk_true
  (Z3_context ctx)
{
  return atscntrb_Z3_inc_ref(ctx, Z3_mk_true(ctx)) ;
} // end of [atscntrb_Z3_mk_true]

ATSinline()
Z3_ast
atscntrb_Z3_mk_false
  (Z3_context ctx)
{
  return atscntrb_Z3_inc_ref(ctx, Z3_mk_false(ctx)) ;
} // end of [atscntrb_Z3_mk_false]

/* ****** ****** */


Z3_DECLARE_MK_AST(Z3_mk_eq, Z3_ast l, Z3_ast r) {
  Z3_BODY_MK_AST(Z3_mk_eq, l, r)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_not, Z3_ast ast) {
  Z3_BODY_MK_AST(Z3_mk_not, ast)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_and, unsigned num_args, Z3_ast const args[]) {
  Z3_BODY_MK_AST(Z3_mk_and, num_args, args)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_or, unsigned num_args, Z3_ast const args[]) {
  Z3_BODY_MK_AST(Z3_mk_or, num_args, args)
}

/* ****** ****** */

ATSinline()
Z3_ast
atscntrb_Z3_mk_or2
  (Z3_context ctx, Z3_ast a0, Z3_ast a1)
{
  Z3_ast a01[2] ;
  a01[0] = a0 ; a01[1] = a1 ;

  Z3_BODY_MK_AST(Z3_mk_or, 2, a01)
} // end of [atscntrb_Z3_mk_or2]

/* ****** ****** */

ATSinline()
Z3_ast
atscntrb_Z3_mk_and2
  (Z3_context ctx, Z3_ast a0, Z3_ast a1)
{
  Z3_ast a01[2] ;
  a01[0] = a0 ; a01[1] = a1 ;
  Z3_BODY_MK_AST(Z3_mk_and, 2, a01)
} // end of [atscntrb_Z3_mk_and2]

#endif // end of [Z3_Z3_PROPEQ_CATS]

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_ite, Z3_ast cond, Z3_ast t, Z3_ast f) {
  Z3_BODY_MK_AST(Z3_mk_ite, cond, t, f)
}

/* ****** ****** */

Z3_DECLARE_MK_AST(Z3_mk_implies, Z3_ast a0, Z3_ast a1) {
  Z3_BODY_MK_AST(Z3_mk_implies, a0, a1)
}

/* ****** ****** */

/* end of [z3_propeq.cats] */
