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
** $PATSHOME/prelude/SATS/CODEGEN/tuple.atxt
** Time of generation: Sun Nov 20 21:18:17 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: December, 2012 *)

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)
//
typedef tup2
  (a0:t0p, a1:t0p) = @(a0, a1)
typedef tup3
  (a0:t0p, a1:t0p, a2:t0p) = @(a0, a1, a2)
typedef tup4
  (a0:t0p, a1:t0p, a2:t0p, a3:t0p) = @(a0, a1, a2, a3)
//
stadef tup = tup2
stadef tup = tup3
stadef tup = tup4
//
(* ****** ****** *)
//
typedef tupbox1
  (a0:t0p) = $tup(a0)
typedef tupbox2
  (a0:t0p, a1:t0p) = $tup(a0, a1)
typedef tupbox3
  (a0:t0p, a1:t0p, a2:t0p) = $tup(a0, a1, a2)
typedef tupbox4
  (a0:t0p, a1:t0p, a2:t0p, a3:t0p) = $tup(a0, a1, a2, a3)
//
stadef tupbox = tupbox1
stadef tupbox = tupbox2
stadef tupbox = tupbox3
stadef tupbox = tupbox4
//
(* ****** ****** *)

fun{} fprint_tup$beg (out: FILEref): void
fun{} fprint_tup$end (out: FILEref): void
fun{} fprint_tup$sep (out: FILEref): void

(* ****** ****** *)

fun{
a0,a1:t0p
} fprint_tupval2 (out: FILEref, x: @(a0, a1)): void
fun{
a0,a1,a2:t0p
} fprint_tupval3 (out: FILEref, x: @(a0, a1, a2)): void
fun{
a0,a1,a2,a3:t0p
} fprint_tupval4 (out: FILEref, x: @(a0, a1, a2, a3)): void

(* ****** ****** *)

fun{
a0,a1:vt0p
} fprint_tupref2 (out: FILEref, x: &(a0, a1)): void
fun{
a0,a1,a2:vt0p
} fprint_tupref3 (out: FILEref, x: &(a0, a1, a2)): void
fun{
a0,a1,a2,a3:vt0p
} fprint_tupref4 (out: FILEref, x: &(a0, a1, a2, a3)): void

(* ****** ****** *)

fun{} fprint_tupbox$beg (out: FILEref): void
fun{} fprint_tupbox$end (out: FILEref): void
fun{} fprint_tupbox$sep (out: FILEref): void

(* ****** ****** *)

fun{
a0:t0p
} fprint_tupbox1 (out: FILEref, x: $tup(a0)): void
fun{
a0,a1:t0p
} fprint_tupbox2 (out: FILEref, x: $tup(a0, a1)): void
fun{
a0,a1,a2:t0p
} fprint_tupbox3 (out: FILEref, x: $tup(a0, a1, a2)): void
fun{
a0,a1,a2,a3:t0p
} fprint_tupbox4 (out: FILEref, x: $tup(a0, a1, a2, a3)): void

(* ****** ****** *)

fun{
a0,a1:t0p
} tupval2_equal
  (x: @(a0, a1), y: @(a0, a1)):<> bool
// end of [tupval2_equal]

fun{
a0,a1,a2:t0p
} tupval3_equal
  (x: @(a0, a1, a2), y: @(a0, a1, a2)):<> bool
// end of [tupval3_equal]

fun{
a0,a1,a2,a3:t0p
} tupval4_equal
  (x: @(a0, a1, a2, a3), y: @(a0, a1, a2, a3)):<> bool
// end of [tupval4_equal]

(* ****** ****** *)

fun{
a0,a1:vt0p
} tupref2_equal
  (x: &(a0, a1), y: &(a0, a1)):<> bool
// end of [tupref2_equal]

fun{
a0,a1,a2:vt0p
} tupref3_equal
  (x: &(a0, a1, a2), y: &(a0, a1, a2)):<> bool
// end of [tupref3_equal]

fun{
a0,a1,a2,a3:vt0p
} tupref4_equal
  (x: &(a0, a1, a2, a3), y: &(a0, a1, a2, a3)):<> bool
// end of [tupref4_equal]

(* ****** ****** *)

fun{
a0,a1:t0p
} tupval2_compare
  (x: @(a0, a1), y: @(a0, a1)):<> int
// end of [tupval2_compare]

fun{
a0,a1,a2:t0p
} tupval3_compare
  (x: @(a0, a1, a2), y: @(a0, a1, a2)):<> int
// end of [tupval3_compare]

fun{
a0,a1,a2,a3:t0p
} tupval4_compare
  (x: @(a0, a1, a2, a3), y: @(a0, a1, a2, a3)):<> int
// end of [tupval4_compare]

(* ****** ****** *)

fun{
a0,a1:vt0p
} tupref2_compare
  (x: &(a0, a1), y: &(a0, a1)):<> int
// end of [tupref2_compare]

fun{
a0,a1,a2:vt0p
} tupref3_compare
  (x: &(a0, a1, a2), y: &(a0, a1, a2)):<> int
// end of [tupref3_compare]

fun{
a0,a1,a2,a3:vt0p
} tupref4_compare
  (x: &(a0, a1, a2, a3), y: &(a0, a1, a2, a3)):<> int
// end of [tupref4_compare]

(* ****** ****** *)

(* end of [tuple.sats] *)
