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
/*
// Declare and create a constant. 
*/
fun Z3_mk_const
(
  ctx: !Z3_context, s: Z3_symbol, ty: !Z3_sort
) : Z3_ast = "mac#%" // end of [Z3_mk_const]

(* ****** ****** *)

/*
// Declare and create a fresh constant.
*/
fun Z3_mk_fresh_const
(
  ctx: !Z3_context, prfix: Z3_string, ty: !Z3_sort
) : Z3_ast = "mac#%" // end of [Z3_mk_fresh_const]


/*
// Declare and create a function
*/
fun Z3_mk_func_decl {n:int}
(
  ctx: !Z3_context, s: Z3_symbol, n: uint n, domain: &(@[Z3_sort][n]), 
  range: !Z3_sort
) : Z3_func_decl = "mac#%" // end of [Z3_mk_func_decl]

fun Z3_func_decl_inc_ref (
  ctx: !Z3_context, decl: !Z3_func_decl
): Z3_func_decl = "mac#%" // end of [Z3_func_decl_inc_ref]

fun Z3_func_decl_dec_ref (
  ctx: !Z3_context, decl: Z3_func_decl
): void = "mac#%" // end of [Z3_func_decl_inc_ref]

fun Z3_mk_app {n:int}
(
  ctx: !Z3_context, f: Z3_func_decl, n: uint n, arguments: &(@[Z3_ast][n])
): Z3_ast = "mac#%"

(* ****** ****** *)

(* end of [z3_constapp.sats] *)
