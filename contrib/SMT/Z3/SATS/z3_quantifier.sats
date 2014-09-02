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
** Start Time: April, 2013
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
ATSCNTRB_SML_Z3_Z3_HEADER
#include "./z3_header.sats"
#endif
//
(* ****** ****** *)

fun Z3_mk_pattern {n:nat} (
  !Z3_context, uint n, &(@[Z3_ast][n])
): Z3_pattern = "mac#%"

fun Z3_mk_bound (
  ctx: !Z3_context, index: uint, ty: Z3_sort
): Z3_ast = "mac#%"

fun Z3_mk_forall {n:nat} (
  ctx: !Z3_context, weight: uint, num_patterns: uint, patterns: ptr,
  num_decls: uint n, sorts: &(@[Z3_sort][n]), decl_names: &(@[Z3_symbol][n]), body: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_forall_const {n:nat} (
  ctx: !Z3_context, weight: uint, num_bound: uint n, bound: &(@[Z3_app][n]), num_patterns: uint, patterns: ptr, body: !Z3_ast
): Z3_ast = "mac#%"

(* end of [z3_quantifier.sats] *)