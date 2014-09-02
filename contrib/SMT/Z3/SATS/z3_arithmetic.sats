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
 
fun Z3_mk_sub2 (
  ctx: !Z3_context, left: !Z3_ast, right: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_add2 (
  ctx: !Z3_context, left: !Z3_ast, right: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_mul2 (
  ctx: !Z3_context, left: !Z3_ast, right: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_div (
  ctx: !Z3_context, num: !Z3_ast, den: !Z3_ast
): Z3_ast = "mac#%"

(* ****** ****** *)

fun Z3_mk_lt (
  ctx: !Z3_context, left: !Z3_ast, right: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_le (
  ctx: !Z3_context, left: !Z3_ast, right: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_gt (
  ctx: !Z3_context, left: !Z3_ast, right: !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_ge (
  ctx: !Z3_context, left: !Z3_ast, right: !Z3_ast
): Z3_ast = "mac#%"

(* ****** ****** *)

fun Z3_mk_unary_minus (
  ctx: !Z3_context, num: !Z3_ast
): Z3_ast = "mac#%"

(* ****** ****** *)

fun Z3_mk_is_int (
  ctx: !Z3_context, num: !Z3_ast
): Z3_ast = "mac#%"

(* ****** ****** *)

fun Z3_mk_int2real (
  ctx: !Z3_context, num: !Z3_ast
): Z3_ast = "mac#%"

(* ****** ****** *)

(* end of [z3_arithmetic.sats] *)
