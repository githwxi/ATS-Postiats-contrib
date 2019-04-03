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
** $PATSHOME/prelude/SATS/CODEGEN/gorder.atxt
** Time of generation: Sun Nov 20 21:18:18 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: September, 2011 *)

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)
//
// HX: generic ordering ops
//
(* ****** ****** *)
//
fun
{a:t0p}
gisltz_val (x: a):<> bool
fun
{a:t0p}
gisltez_val (x: a):<> bool
//
fun
{a:t0p}
gisgtz_val (x: a):<> bool
fun
{a:t0p}
gisgtez_val (x: a):<> bool
//
fun
{a:t0p}
giseqz_val (x: a):<> bool
fun
{a:t0p}
gisneqz_val (x: a):<> bool
//
(* ****** ****** *)
//
fun
{a:t0p}
glt_val_val (x: a, y: a):<> bool
fun
{a:t0p}
glte_val_val (x: a, y: a):<> bool
//
fun
{a:t0p}
ggt_val_val (x: a, y: a):<> bool
fun
{a:t0p}
ggte_val_val (x: a, y: a):<> bool
//
(* ****** ****** *)
//
fun
{a:t0p}
glt_val_int (x: a, y: int):<> bool
fun
{a:t0p}
glte_val_int (x: a, y: int):<> bool
//
fun
{a:t0p}
ggt_val_int (x: a, y: int):<> bool
fun
{a:t0p}
ggte_val_int (x: a, y: int):<> bool
//
(* ****** ****** *)
//
fun
{a:t0p}
geq_val_val (x: a, y: a):<> bool
fun
{a:t0p}
gneq_val_val (x: a, y: a):<> bool
//
(* ****** ****** *)
//
fun
{a:t0p}
geq_val_int (x: a, y: int):<> bool
fun
{a:t0p}
gneq_val_int (x: a, y: int):<> bool
//
(* ****** ****** *)
//
fun
{a:t0p}
gcompare_val_val (x: a, y: a):<> int
//
(* ****** ****** *)
//
fun
{a:t0p}
gmax_val_val (x: a, y: a):<> (a)
fun
{a:t0p}
gmin_val_val (x: a, y: a):<> (a)
//
(* ****** ****** *)
//
fun
{a:vt0p}
glt_ref_ref (x: &INV(a), y: &a):<> bool
fun
{a:vt0p}
glte_ref_ref (x: &INV(a), y: &a):<> bool
//
fun
{a:vt0p}
ggt_ref_ref (x: &INV(a), y: &a):<> bool
fun
{a:vt0p}
ggte_ref_ref (x: &INV(a), y: &a):<> bool
//
(* ****** ****** *)
//
fun
{a:vt0p}
geq_ref_ref (x: &INV(a), y: &a):<> bool
fun
{a:vt0p}
gneq_ref_ref (x: &INV(a), y: &a):<> bool
//
(* ****** ****** *)
//
fun
{a:vt0p}
gcompare_ref_ref (x: &INV(a), y: &a):<> int
//
(* ****** ****** *)

(* end of [gorder.sats] *)
