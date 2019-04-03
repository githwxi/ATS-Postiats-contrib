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
** $PATSHOME/prelude/SATS/CODEGEN/gprint.atxt
** Time of generation: Sun Dec 25 17:18:00 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: August, 2012 *)

(* ****** ****** *)

#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

sortdef t0p = t@ype

(* ****** ****** *)

fun{}
gprint$out(): FILEref

(* ****** ****** *)

fun{}
gprint_flush(): void

(* ****** ****** *)

fun{}
gprint_newline(): void

(* ****** ****** *)

fun{a:t0p}
gprint_val (x: a): void
fun{a:vt0p}
gprint_ref (x: &INV(a)): void

(* ****** ****** *)

fun{}
gprint_int (x: int): void
fun{}
gprint_bool (x: bool): void
fun{}
gprint_char (x: char): void
fun{}
gprint_float (x: float): void
fun{}
gprint_double (x: double): void
fun{}
gprint_string (x: string): void

(* ****** ****** *)
//
overload gprint with gprint_int
overload gprint with gprint_bool
overload gprint with gprint_char
overload gprint with gprint_float
overload gprint with gprint_double
overload gprint with gprint_string
//
(* ****** ****** *)

fun{} gprint_list$beg(): void
fun{} gprint_list$end(): void
fun{} gprint_list$sep(): void
//
fun{a:t0p}
gprint_list (xs: List(a)): void
//
overload gprint with gprint_list
//
(* ****** ****** *)

fun{} gprint_listlist$beg1(): void
fun{} gprint_listlist$end1(): void
fun{} gprint_listlist$sep1(): void
//
fun{} gprint_listlist$beg2(): void
fun{} gprint_listlist$end2(): void
fun{} gprint_listlist$sep2(): void
//
fun{a:t0p}
gprint_listlist (xss: List(List(a))): void

(* ****** ****** *)
//
fun{} gprint_array$beg(): void
fun{} gprint_array$end(): void
fun{} gprint_array$sep(): void
//
fun{a:t0p}
gprint_array
  {n:int}
(
  &(@[INV(a)][n]), size_t(n)
) : void // end-of-function
//
fun{a:t0p}
gprint_arrayptr
  {n:int}
(
  !arrayptr(INV(a), n), size_t(n)
) : void // end-of-function
//
fun{a:t0p}
gprint_arrayref
  {n:int}
  (arrayref(a, n), size_t(n)): void
// end of [gprint_arrayref]
//
(* ****** ****** *)
//
fun{a:t0p}
gprint_arrszref(ASZ: arrszref(a)): void
//
overload gprint with gprint_arrayref
//
(* ****** ****** *)

(* end of [gprint.sats] *)
