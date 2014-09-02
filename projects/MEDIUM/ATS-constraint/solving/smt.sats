(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-20?? Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
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
//
// Author: William Blair (wdblair AT cs DOT bu DOT edu)
// Start Time: April, 2013
//
(* ****** ****** *)

absvtype solver = ptr

absvtype formula = ptr
absvtype func_decl = ptr
absvtype sort = ptr

(* ****** ****** *)

fun the_solver_get (): solver

(* ****** ****** *)

// Building Terms and Formulas

fun make_solver (): solver

fun delete_solver (solver): void

overload ~ with delete_solver

fun make_int_sort (): sort

fun make_bool_sort (): sort

fun make_real_sort (): sort

fun make_bitvec_sort (width: int): sort

fun make_array_sort (): sort

fun make_abstract_sort (symbol: string): sort

fun make_int_constant (
  id: int, _: !sort
): formula

fun make_real (
  num: formula, den: formula
): formula

fun make_fresh_constant (
  !sort
): formula

fun 
make_func_decl (
  name: string, domain: List0_vt (sort), range: sort
): func_decl

fun
make_app (
  f: func_decl, args: List0_vt (formula)
): formula

(* ****** ****** *)

fun 
parse_smtlib2_file
  (file:string, decl: List0_vt(@(string, func_decl))): formula
  
(* ****** ****** *)

// Prop Logic and Equality

fun make_true  (): formula
fun make_false (): formula

fun make_not (
  formula
): formula

fun make_and2 (
  formula, formula
): formula

fun make_or2 (
  formula, formula
): formula

fun make_ite (
  condition: formula, t: formula, f: formula
): formula

fun make_implies (
  formula, formula
): formula

(* ****** ****** *)

// Integer Arithmetic

symintr make_numeral

fun make_numeral_int (
  int, !sort
): formula

overload make_numeral with make_numeral_int

fun make_numeral_string (
  string, !sort
): formula

overload make_numeral with make_numeral_string

fun make_numeral_uninterpreted (
  !sort
): formula

overload make_numeral with make_numeral_uninterpreted

fun make_negate (formula): formula

fun make_add2 (formula, formula): formula

fun make_sub2 (formula, formula): formula

fun make_mul2 (formula, formula): formula

fun make_div (formula,  formula): formula

fun make_lt (formula,  formula): formula
fun make_le (formula,  formula): formula
fun make_gt (formula,  formula): formula
fun make_ge (formula,  formula): formula
fun make_eq (formula,  formula): formula

(* ****** ****** *)

// Bit Vectors

fun make_bv_from_int (width: int, i: formula): formula

fun make_bv_sub2 (formula, formula): formula

fun make_bv_add2 (formula, formula): formula

fun make_bv_land2 (formula, formula): formula

fun make_bv_eq (formula, formula): formula

(* ****** ****** *)

// Reals

fun make_real_from_int (formula): formula

fun is_int (formula): formula

(* ****** ****** *)

// Solving

fun push (
  !solver
): void

fun pop (
  !solver
): void

fun assert (!solver, formula): void

fun is_valid (!solver, formula): bool

(* ****** ****** *)

fun formula_dup (!formula): formula

fun formula_free (formula): void

fun sort_free (sort): void

fun func_decl_dup (!func_decl): func_decl

fun func_decl_free (func_decl): void

(* ****** ****** *)

// Debugging (SMT-Lib)

fun string_of_formula (
  !formula
): string

(* ****** ****** *)