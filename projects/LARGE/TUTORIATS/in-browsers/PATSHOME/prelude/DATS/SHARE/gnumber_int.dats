(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
** $PATSHOME/prelude/DATS/CODEGEN/gnumber_int.atxt
** Time of generation: Sat Oct 17 15:19:59 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)

(* ****** ****** *)

implement
gnumber_int<int> (x) = g0int2int_int_int (x)
implement
gnumber_int<lint> (x) = g0int2int_int_lint (x)
implement
gnumber_int<llint> (x) = g0int2int_int_llint (x)
implement
gnumber_int<ssize_t> (x) = g0int2int_int_ssize (x)

(* ****** ****** *)

implement
gneg_val<int> (x) = ~x
implement
gneg_val<lint> (x) = ~x
implement
gneg_val<llint> (x) = ~x

(* ****** ****** *)

implement
gsucc_val<int> (x) = succ (x)
implement
gsucc_val<lint> (x) = succ (x)
implement
gsucc_val<llint> (x) = succ (x)
implement
gsucc_val<ssize_t> (x) = succ (x)

(* ****** ****** *)

implement
gpred_val<int> (x) = pred (x)
implement
gpred_val<lint> (x) = pred (x)
implement
gpred_val<llint> (x) = pred (x)

(* ****** ****** *)

implement
gadd_val_val<int> (x, y) = x + y
implement
gadd_val_val<lint> (x, y) = x + y
implement
gadd_val_val<llint> (x, y) = x + y
implement
gadd_val_val<ssize_t> (x, y) = x + y

(* ****** ****** *)

implement
gsub_val_val<int> (x, y) = x - y
implement
gsub_val_val<lint> (x, y) = x - y
implement
gsub_val_val<llint> (x, y) = x - y

(* ****** ****** *)

implement
gmul_val_val<int> (x, y) = x * y
implement
gmul_val_val<lint> (x, y) = x * y
implement
gmul_val_val<llint> (x, y) = x * y
implement
gmul_val_val<ssize_t> (x, y) = x * y

(* ****** ****** *)

implement
gdiv_val_val<int> (x, y) = x / y
implement
gdiv_val_val<lint> (x, y) = x / y
implement
gdiv_val_val<llint> (x, y) = x / y
implement
gdiv_val_val<ssize_t> (x, y) = x / y

(* ****** ****** *)

implement
gmod_val_val<int> (x, y) = x mod y
implement
gmod_val_val<lint> (x, y) = x mod y
implement
gmod_val_val<llint> (x, y) = x mod y
implement
gmod_val_val<ssize_t> (x, y) = x mod y

(* ****** ****** *)

(*
implement
gconjugate_val<int> (x) = x
implement
gconjugate_val<lint> (x) = x
implement
gconjugate_val<llint> (x) = x
implement
gconjugate_val<ssize_t> (x) = x
*)

(* ****** ****** *)

(* end of [gnumber_int.dats] *)
