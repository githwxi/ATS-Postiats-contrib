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
// Start Time: January, 2014
//

(* 
  The linearity of formulas and sorts will prevent memory leaks when
  people use this interface.
*)

staload "solving/smt.sats"

(* Reference Counting *)

(*
  Since formulas are linear, we only allow you to use one once. If a term
  appears multiple times in an expression, just up its reference count.
  
  ^ is a prefix operator to increment the reference count of a linear term,
  and to obtain a new reference to it.
  
  In actual code, this looks a little messy.
*)

symintr ^

overload ^ with formula_dup

(* Sorts *)

symintr Int

fun
int_constant_name (string): formula

overload Int with int_constant_name

fun
int_numeral (int): formula

overload Int with int_numeral

symintr Bool

fun
bool_constant_name (string): formula

overload Bool with bool_constant_name

fun
bool_bool (bool): formula

overload Bool with bool_bool

(* Quantifiers *)

symintr ForAll

fun
forall1 (formula, formula): formula

overload ForAll with forall1

fun
forall2 (formula, formula, formula): formula

overload ForAll with forall2

(* Propositional *)

fun
And (formula, formula): formula

fun
Or (formula, formula): formula

fun
Not (formula): formula

symintr ==>

fun
Implies (formula, formula): formula

overload ==> with Implies

fun
If (condition:formula, true: formula, false: formula): formula

(* Arithmetic *)

fun neg_formula (formula): formula
fun add_formula_formula (formula, formula): formula
fun sub_formula_formula (formula, formula): formula
fun mul_formula_formula (formula, formula): formula
fun div_formula_formula (formula, formula): formula
fun mod_formula_formula (formula, formula): formula

overload ~ with neg_formula
overload + with add_formula_formula
overload - with sub_formula_formula
overload * with mul_formula_formula
overload / with div_formula_formula
overload mod with mod_formula_formula

fun gt_formula_formula (formula, formula): formula
fun gte_formula_formula (formula, formula): formula
fun eq_formula_formula (formula, formula): formula
fun lte_formula_formula (formula, formula): formula
fun lt_formula_formula (formula, formula): formula

overload > with gt_formula_formula
overload >= with gte_formula_formula
overload = with eq_formula_formula
overload <= with lte_formula_formula
overload < with lt_formula_formula

(* Arrays *)

fun 
Select (array: formula, i: formula): formula

overload [] with Select

fun
Store (array: formula, i: formula, v: formula): formula

overload [] with Store