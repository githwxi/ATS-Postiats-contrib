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
** $PATSHOME/prelude/DATS/CODEGEN/gnumber.atxt
** Time of generation: Sun Nov 20 21:18:27 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)

(* ****** ****** *)

(* Author: Brandon Barker *)
(* Authoremail: brandon.barker AT gmail DOT com *)
(* Start time: July, 2013 *)

(* ****** ****** *)

implement
{a}(*tmp*)
gadd_val_int(x, y) = gadd_val_val<a> (x, gnumber_int<a> (y))
implement
{a}(*tmp*)
gsub_val_int(x, y) = gsub_val_val<a> (x, gnumber_int<a> (y))
  
(* ****** ****** *)

implement
{a}(*tmp*)
gmul_int_val(x, y) = gmul_val_val<a> (gnumber_int<a> (x), y)
implement
{a}(*tmp*)
gmul_val_int(x, y) = gmul_val_val<a> (x, gnumber_int<a> (y))

(* ****** ****** *)

implement
{a}(*tmp*)
gdiv_int_val(x, y) = gdiv_val_val<a> (gnumber_int<a> (x), y)
implement
{a}(*tmp*)
gdiv_val_int(x, y) = gdiv_val_val<a> (x, gnumber_int<a> (y))
implement
{a}(*tmp*)
gmod_val_int(x, y) = gmod_val_val<a> (x, gnumber_int<a> (y))

(* ****** ****** *)

implement
{a}(*tmp*)
gpow_int_val
  (n, x) = let
//
fun
loop
{n:pos} .<n>.
(
  n: int(n), x: a, res: a
) :<> (a) =
(
//
if
n >= 2
then let
  val n2 = half(n)
  val r2 = n - (n2 + n2)
in
  if r2 = 0
    then loop (n2, gmul_val_val<a> (x, x), res)
    else loop (n2, gmul_val_val<a> (x, x), gmul_val_val<a> (x, res))
  // end of [if]
end else gmul_val_val<a> (x, res)
//
) (* end of [loop] *)
//
in
//
if
n >= 2
then loop (n-1, x, x)
else (
  if n >= 1 then x else gnumber_int<a> (1)
) (* end of [else] *)
//
end // end of [gpow_int_val]

(* ****** ****** *)

#include "./SHARE/gnumber_int.dats"
#include "./SHARE/gnumber_uint.dats"

(* ****** ****** *)

#include "./SHARE/gnumber_float.dats"

(* ****** ****** *)

(* end of [gnumber.dats] *)
