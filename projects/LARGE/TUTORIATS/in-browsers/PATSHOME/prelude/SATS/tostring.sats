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
** $PATSHOME/prelude/SATS/CODEGEN/tostring.atxt
** Time of generation: Sun Nov 20 21:18:21 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: August, 2012 *)

(* ****** ****** *)

vtypedef
RD(a:vt0p) = a // for commenting: read-only
#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

sortdef t0p = t@ype
sortdef vt0p = vt@ype

(* ****** ****** *)

fun{}
tostring_int(int):<> string
fun{}
tostrptr_int(int):<!wrt> Strptr1

(* ****** ****** *)

fun{}
tostring_uint(uint):<> string
fun{}
tostrptr_uint(uint):<!wrt> Strptr1

(* ****** ****** *)

fun{}
tostring_bool(bool):<> string
fun{}
tostrptr_bool(bool):<!wrt> Strptr1

(* ****** ****** *)

fun{}
tostring_char(char):<> string
fun{}
tostrptr_char(char):<!wrt> Strptr1

(* ****** ****** *)

fun{}
tostring_double(double):<> string
fun{}
tostrptr_double(double):<!wrt> Strptr1

(* ****** ****** *)
//
fun
{a:t0p}
tostrptr_list
  (xs0: List(INV(a))): Strptr1
//
fun{}
tostrptr_list$beg((*void*)): String
fun{}
tostrptr_list$end((*void*)): String
fun{}
tostrptr_list$sep((*void*)): String
//
(* ****** ****** *)
//
fun
{a:vt0p}
tostrptr_array
  {n:int}
(
  &array(INV(a), n), size_t(n)
) : Strptr1 // end-of-function
//
fun{}
tostrptr_array$beg((*void*)): String
fun{}
tostrptr_array$end((*void*)): String
fun{}
tostrptr_array$sep((*void*)): String
//
(* ****** ****** *)
//
fun
{a:vt0p}
tostrptr_arrayref
  {n:int}
  (arrayref(a,n), size_t(n)): Strptr1
//
fun
{a:vt0p}
tostrptr_arrszref(arrszref(a)): Strptr1
//
(* ****** ****** *)

(* end of [tostring.sats] *)
