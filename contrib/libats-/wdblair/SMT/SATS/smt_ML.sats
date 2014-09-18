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
  This interface is intended to support high-level programming of an
  SMT Solver.
  
  A programmer that uses the external constraint solver will use this
  interface to define macros or give interpretations to functions.
*)

(* Sorts *)

abstype Sort = ptr

abstype Bool = ptr
abstype Numeral = ptr
abstype BitVec (n:int) = ptr
abstype Array (a:type, b:type) = ptr
abstype Term = ptr
abstype Uninterpreted = ptr

symintr Int

fun
int_constant_name (string): Numeral

overload Int with int_constant_name

fun
int_numeral (int): Numeral

overload Int with int_numeral

symintr BitVec

fun
bitvec_numeral_int {n:int} (int, int n): BitVec (n)

overload BitVec with bitvec_numeral_int

fun
bitvec_numeral_uint {n:int} (uint, int): BitVec (n)

overload BitVec with bitvec_numeral_uint

symintr Bool

fun
bool_constant_name (string): Bool

overload Bool with bool_constant_name

fun
bool_bool (bool): Bool

overload Bool with bool_bool

(* Quantifiers *)

symintr ForAll

fun
forall1 (Numeral, Bool): Bool

overload ForAll with forall1

fun
forall2 (Numeral, Numeral, Bool): Bool

overload ForAll with forall2

(* Propositional *)

fun
And (Bool, Bool): Bool

fun
Or (Bool, Bool): Bool

fun
Not (Bool): Bool

symintr ==>

fun
Implies (Bool, Bool): Bool

overload ==> with Implies

fun
If {a:type} (condition: Bool, true: a, false: a): a

(* Arithmetic *)

fun neg_numeral (Numeral): Numeral
fun add_numeral_numeral (Numeral, Numeral): Numeral
fun sub_numeral_numeral (Numeral, Numeral): Numeral
fun mul_numeral_numeral (Numeral, Numeral): Numeral
fun div_numeral_numeral (Numeral, Numeral): Numeral
fun mod_numeral_numeral (Numeral, Numeral): Numeral

overload ~ with neg_numeral
overload + with add_numeral_numeral
overload - with sub_numeral_numeral
overload * with mul_numeral_numeral
overload / with div_numeral_numeral
overload mod with mod_numeral_numeral

fun gt_numeral_numeral (Numeral, Numeral): Bool
fun gte_numeral_numeral (Numeral, Numeral): Bool
fun eq_numeral_numeral (Numeral, Numeral): Bool
fun lte_numeral_numeral (Numeral, Numeral): Bool
fun lt_numeral_numeral (Numeral, Numeral): Bool

overload > with gt_numeral_numeral
overload >= with gte_numeral_numeral
overload = with eq_numeral_numeral
overload <= with lte_numeral_numeral
overload < with lt_numeral_numeral

(* Arrays *)

fun 
Select {a,b:type} (array: Array(a, b), i: a): b

overload [] with Select

fun
Store {a,b:type} (array: Array(a,b), i: a, v: b): Array (a,b)

overload [] with Store