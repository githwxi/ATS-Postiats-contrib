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

// Constructors

fun Z3_mk_int2bv (
  !Z3_context, int, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bv2int (
  !Z3_context, !Z3_ast, is_signed: bool
): Z3_ast = "mac#%"

fun Z3_mk_bv_sort (
  !Z3_context, uint
): Z3_sort = "mac#%"

(* ****** ****** *)

// Bitwise Operators

fun Z3_mk_bvnot (
  !Z3_context, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvredand (
  !Z3_context, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvredor (
  !Z3_context, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvand (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvor (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvxor (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvneg (
  !Z3_context, !Z3_ast
): Z3_ast = "mac#%"

// Arithmetic

fun Z3_mk_bvadd (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvsub (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvmul (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvudiv (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvurem (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvsdiv (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvsrem (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvsmod (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvshl (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvlshr (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvashr (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

(* ****** ****** *)

// Boolean Operators

fun Z3_mk_bvult (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvslt (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvule (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvsle (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvuge (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvsge (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvugt (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

fun Z3_mk_bvsgt (
  !Z3_context, !Z3_ast, !Z3_ast
): Z3_ast = "mac#%"

(* ****** ****** *)

(* end of [z3_bitvector.sats] *)
