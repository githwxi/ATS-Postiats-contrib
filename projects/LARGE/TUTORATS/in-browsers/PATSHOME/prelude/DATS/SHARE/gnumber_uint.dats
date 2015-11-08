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
** $PATSHOME/prelude/DATS/CODEGEN/gnumber_uint.atxt
** Time of generation: Sat Oct 17 15:20:00 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)

(* ****** ****** *)

implement
gnumber_int<uint> (x) = g0int2uint_int_uint (x)
implement
gnumber_int<ulint> (x) = g0int2uint_int_ulint (x)
implement
gnumber_int<ullint> (x) = g0int2uint_int_ullint (x)

(* ****** ****** *)

implement
gsucc_val<uint> (x) = succ (x)
implement
gsucc_val<ulint> (x) = succ (x)
implement
gsucc_val<ullint> (x) = succ (x)
implement
gsucc_val<size_t> (x) = succ (x)

(* ****** ****** *)

implement
gpred_val<uint> (x) = pred (x)
implement
gpred_val<ulint> (x) = pred (x)
implement
gpred_val<ullint> (x) = pred (x)
implement
gpred_val<size_t> (x) = pred (x)

(* ****** ****** *)

implement
gadd_val_val<uint> (x, y) = x + y
implement
gadd_val_val<ulint> (x, y) = x + y
implement
gadd_val_val<ullint> (x, y) = x + y
implement
gadd_val_val<size_t> (x, y) = x + y

(* ****** ****** *)

implement
gsub_val_val<uint> (x, y) = x - y
implement
gsub_val_val<ulint> (x, y) = x - y
implement
gsub_val_val<ullint> (x, y) = x - y
implement
gsub_val_val<size_t> (x, y) = x - y

(* ****** ****** *)

implement
gmul_val_val<uint> (x, y) = x * y
implement
gmul_val_val<ulint> (x, y) = x * y
implement
gmul_val_val<ullint> (x, y) = x * y
implement
gmul_val_val<size_t> (x, y) = x * y

(* ****** ****** *)

implement
gdiv_val_val<uint> (x, y) = x / y
implement
gdiv_val_val<ulint> (x, y) = x / y
implement
gdiv_val_val<ullint> (x, y) = x / y
implement
gdiv_val_val<size_t> (x, y) = x / y

(* ****** ****** *)

implement
gmod_val_val<uint> (x, y) = x mod y
implement
gmod_val_val<ulint> (x, y) = x mod y
implement
gmod_val_val<ullint> (x, y) = x mod y
implement
gmod_val_val<size_t> (x, y) = x mod y

(* ****** ****** *)

(*
implement
gconjugate_val<uint> (x) = x
implement
gconjugate_val<ulint> (x) = x
implement
gconjugate_val<ullint> (x) = x
implement
gconjugate_val<size_t> (x) = x
*)

(* ****** ****** *)

(* end of [gnumber_uint.dats] *)
