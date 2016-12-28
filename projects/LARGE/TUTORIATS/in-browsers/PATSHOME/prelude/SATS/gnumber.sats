(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2015 Hongwei Xi, ATS Trustful Software, Inc.
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

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/gnumber.atxt
** Time of generation: Sun Nov 20 21:18:18 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: September, 2011 *)

(* ****** ****** *)

(* Author: Brandon Barker *)
(* Authoremail: brandon.barker AT gmail DOT com *)
(* Start time: July, 2013 *)

(* ****** ****** *)
//
// HX: for unindexed gnumber types
//
(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)

abstype
fprecision_prop (a1:t0p, a2:t0p)
propdef
fprecision (a1:t0p, a2:t0p) = fprecision_prop (a1, a2)
praxi
fprecision_float (): fprecision (float, float)
praxi
fprecision_double (): fprecision (double, double)
praxi
fprecision_ldouble (): fprecision (ldouble, ldouble)

(* ****** ****** *)
//
// HX: generic number operations
//
(* ****** ****** *)
//

//
fun{a:t0p} gnumber_int (x: int):<> a
fun{a:t0p} gnumber_double (x: double):<> a
//
(* ****** ****** *)

fun{a:t0p} gabs_val (x: a):<> a
fun{a:t0p} gneg_val (x: a):<> a
fun{a:t0p} gsucc_val (x: a):<> a
fun{a:t0p} gpred_val (x: a):<> a
fun{a:t0p} grecip_val (x: a):<!exn> a

(* ****** ****** *)

fun{a:t0p} gadd_val_val (x: a, y: a):<> a
fun{a:t0p} gsub_val_val (x: a, y: a):<> a
fun{a:t0p} gmul_val_val (x: a, y: a):<> a
fun{a:t0p} gdiv_val_val (x: a, y: a):<!exn> a
fun{a:t0p} gmod_val_val (x: a, y: a):<!exn> a

(* ****** ****** *)
//
fun{a:t0p} gadd_val_int (x: a, y: int):<> a
fun{a:t0p} gsub_val_int (x: a, y: int):<> a
//
fun{a:t0p} gmul_int_val (x: int, y: a):<> a
fun{a:t0p} gmul_val_int (x: a, y: int):<> a
//
fun{a:t0p} gdiv_int_val (x: int, y: a):<!exn> a
fun{a:t0p} gdiv_val_int (x: a, y: int):<!exn> a
fun{a:t0p} gmod_val_int (x: a, y: int):<!exn> a
//
(* ****** ****** *)

fun{a:t0p} gsqrt_val (x: a):<!exn> a

(* ****** ****** *)

fun{a:t0p} gconjugate_val (x: a):<> a

(* ****** ****** *)

fun{a:t0p} gpow_int_val (n: intGte(0), x: a):<> a

(* ****** ****** *)

(* end of [gnumber.sats] *)
