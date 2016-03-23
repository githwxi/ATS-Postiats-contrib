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

#ifndef Z3_Z3_PARSERS_CATS
#define Z3_Z3_PARSERS_CATS

/* ****** ****** */

ATSinline()
Z3_ast
atscntrb_Z3_parse_smtlib2_string
  (Z3_context c, Z3_string str,
   unsigned num_sorts, Z3_symbol const sort_names[], Z3_sort const sorts[],
   unsigned num_decls, Z3_symbol const decl_names[], Z3_func_decl const decls[] )
{
  return
  atscntrb_Z3_inc_ref(c, 
  	Z3_parse_smtlib2_string(c, str, num_sorts, sort_names, sorts, num_decls, decl_names, decls)); // end of [return]
} // end of [atscntrb_Z3_mk_empty_set]


ATSinline()
Z3_ast
atscntrb_Z3_parse_smtlib2_file
  (Z3_context c, Z3_string file,
   unsigned num_sorts, Z3_symbol const sort_names[], Z3_sort const sorts[],
   unsigned num_decls, Z3_symbol const decl_names[], Z3_func_decl const decls[] )
{
  return
  atscntrb_Z3_inc_ref(c, 
  	Z3_parse_smtlib2_string(c, file, num_sorts, sort_names, sorts, num_decls, decl_names, decls)); // end of [return]
} // end of [atscntrb_Z3_mk_empty_set]



#endif // end of [Z3_Z3_PARSERS_CATS]

/* ****** ****** */

/* end of [z3_sets.cats] */
