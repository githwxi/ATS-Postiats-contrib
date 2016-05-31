(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
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
*)

(* ****** ****** *)

(*
** Start Time: February, 2016
**
** Author: Hanwen Wu
** Authoremail: steinwaywhw AT gmail DOT com
**
** Author: William Blair 
** Authoremail: wdblair AT bu DOT edu
**
** Author: Hongwei Xi
** Authoremail: gmhwxi AT gmail DOT com
*)

(* ****** ****** *)
//
#ifndef
ATSCNTRB_SMT_Z3_Z3_HEADER
#include "./z3_header.sats"
#endif // end of [ifndef]
//
(* ****** ****** *)

fun
Z3_parse_smtlib2_string {m,n:nat}
(
  ctx: !Z3_context, str: Z3_string, 
  num_sort: uint m, sort_names: &(@[Z3_symbol][m]), sorts: &(@[Z3_sort][m]),
  num_decl: uint n, decl_names: &(@[Z3_symbol][n]), decls: &(@[Z3_func_decl][n])
): Z3_ast = "mac#%" // end-of-fun


fun
Z3_parse_smtlib2_file {m,n:nat}
(
  ctx: !Z3_context, file: Z3_string, 
  num_sort: uint m, sort_names: &(@[Z3_symbol][m]), sorts: &(@[Z3_sort][m]),
  num_decl: uint n, decl_names: &(@[Z3_symbol][n]), decls: &(@[Z3_func_decl][n])
): Z3_ast = "mac#%" // end-of-fun


(* ****** ****** *)

(* end of [z3_parsers.sats] *)
