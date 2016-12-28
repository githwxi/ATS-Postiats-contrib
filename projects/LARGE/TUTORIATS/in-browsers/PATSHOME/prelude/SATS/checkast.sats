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
** $PATSHOME/prelude/SATS/CODEGEN/checkast.atxt
** Time of generation: Sun Nov 20 21:18:17 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: December, 2013 *)

(* ****** ****** *)

#define
ATS_PACKNAME "ATSLIB.prelude.checkast"

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)
//
fun{}
checkast_charNZ
  (c: char, msg: RD(string)): charNZ
//
(* ****** ****** *)

fun{tk:tk}
checkast_gintLt{i:int}
  (x: g0int(tk), i: int i, msg: RD(string)): g1intLt(tk, i)
fun{tk:tk}
checkast_gintLte{i:int}
  (x: g0int(tk), i: int i, msg: RD(string)): g1intLte(tk, i)
fun{tk:tk}
checkast_gintGt{i:int}
  (x: g0int(tk), i: int i, msg: RD(string)): g1intGt(tk, i)
fun{tk:tk}
checkast_gintGte{i:int}
  (x: g0int(tk), i: int i, msg: RD(string)): g1intGte(tk, i)
fun{tk:tk}
checkast_gintBtw{i,j:int}
  (x: g0int(tk), i: int i, j: int j, msg: RD(string)): g1intBtw(tk, i, j)
fun{tk:tk}
checkast_gintBtwe{i,j:int}
  (x: g0int(tk), i: int i, j: int j, msg: RD(string)): g1intBtwe(tk, i, j)

(* ****** ****** *)

macdef
ckastloc_charNZ(x) = checkast_charNZ(,(x), $mylocation)

(* ****** ****** *)

macdef
ckastloc_gintLt(x, i) = checkast_gintLt(,(x), ,(i), $mylocation)
macdef
ckastloc_gintLte(x, i) = checkast_gintLte(,(x), ,(i), $mylocation)
macdef
ckastloc_gintGt(x, i) = checkast_gintGt(,(x), ,(i), $mylocation)
macdef
ckastloc_gintGte(x, i) = checkast_gintGte(,(x), ,(i), $mylocation)
macdef
ckastloc_gintBtw(x, i, j) = checkast_gintBtw(,(x), ,(i), ,(j), $mylocation)
macdef
ckastloc_gintBtwe(x, i, j) = checkast_gintBtwe(,(x), ,(i), ,(j), $mylocation)

(* ****** ****** *)

fun{}
checkast_Ptr1(x: ptr, msg: RD(string)): Ptr1

(* ****** ****** *)

macdef
ckastloc_Ptr1(x) = checkast_Ptr1(,(x), $mylocation)

(* ****** ****** *)

fun{}
checkast_Strptr1(x: Strptr0, msg: RD(string)): Strptr1

(* ****** ****** *)

macdef
ckastloc_Strptr1(x) = checkast_Strptr1(,(x), $mylocation)

(* ****** ****** *)

(* end of [checkast.sats] *)
