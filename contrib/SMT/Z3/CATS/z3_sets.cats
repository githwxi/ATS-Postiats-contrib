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

#ifndef Z3_Z3_SETS_CATS
#define Z3_Z3_SETS_CATS

/* ****** ****** */

ATSinline()
Z3_ast
atscntrb_Z3_mk_empty_set
  (Z3_context ctx, Z3_sort domain)
{
  return
  atscntrb_Z3_inc_ref(
    ctx, Z3_mk_empty_set(ctx, domain)
  ) ; // end of [return]
} // end of [atscntrb_Z3_mk_empty_set]

/* ****** ****** */

#endif // end of [Z3_Z3_SETS_CATS]

/* ****** ****** */

/* end of [z3_sets.cats] */
