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
** $PATSHOME/prelude/SATS/CODEGEN/grandom.atxt
** Time of generation: Sun Nov 20 21:18:19 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: June, 2015 *)

(* ****** ****** *)
//
fun{a:vt0p}
grandom_val (): a // for randval generation
//
fun{a:vt0p} // for random value
grandom_ref (x: &(a?) >> a): void // initialization
//
(* ****** ****** *)
//
fun{} grandom_int(): int
fun{} grandom_uint(): uint
//
fun{} grandom_bool(): bool
//
fun{} grandom_float(): float
fun{} grandom_double(): double
//
(* ****** ****** *)
//
fun{a:t0p}
grandom_list
  {n:nat}(n: int(n)): list(a, n)
//
fun{a:vt0p}
grandom_list_vt
  {n:nat}(n: int(n)): list_vt(a, n)
//
(* ****** ****** *)
//
fun{a:vt0p}
grandom_arrayptr
  {n:int}(asz: size_t(n)): arrayptr(a, n)
fun{a:vt0p}
grandom_arrayref
  {n:int}(asz: size_t(n)): arrayref(a, n)
//
fun{a:vt0p}
grandom_arrszref(asz: size_t): arrszref(a)
//
(* ****** ****** *)

(* end of [grandom.sats] *)
