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
Z3_mk_empty_set
(
  ctx: !Z3_context, domain: !Z3_sort
): Z3_ast = "mac#%" // end-of-fun

fun Z3_mk_full_set
(
  ctx: !Z3_context, domain: !Z3_sort
): Z3_ast = "mac#%"

fun Z3_mk_set_add
(
  ctx: !Z3_context, set: !Z3_ast, elem: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_set_del
(
  ctx: !Z3_context, set: !Z3_ast, elem: !Z3_ast 
): Z3_ast = "mac#%"

fun Z3_mk_set_union
(
  ctx: !Z3_context, a: !Z3_ast, b: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_set_intersect
(
  ctx: !Z3_context, a: !Z3_ast, b: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_set_difference
(
  ctx: !Z3_context, a: !Z3_ast, b: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_set_complement
(
  ctx: !Z3_context, set: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_set_member
(
  ctx: !Z3_context, elem: !Z3_ast, set: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_set_subset
(
  ctx: !Z3_context, a: !Z3_ast, b: !Z3_ast
): Z3_ast = "mac#%"


(* ****** ****** *)

(* end of [z3_sets.sats] *)
