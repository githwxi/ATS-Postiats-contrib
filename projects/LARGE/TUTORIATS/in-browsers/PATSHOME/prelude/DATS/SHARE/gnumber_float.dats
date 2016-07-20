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
** $PATSHOME/prelude/DATS/CODEGEN/gnumber.atxt
** Time of generation: Sat Oct 17 15:20:00 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)

(* ****** ****** *)

implement
gnumber_int<float> (x) = g0int2float_int_float (x)
implement
gnumber_int<double> (x) = g0int2float_int_double (x)
(*
implement
gnumber_int<ldouble> (x) = g0int2float_int_ldouble (x)
*)

(* ****** ****** *)

implement
gnumber_double<float> (x) = g0float2float_double_float (x)
implement
gnumber_double<double> (x) = g0float2float_double_double (x)
(*
implement
gnumber_double<ldouble> (x) = g0float2float_double_ldouble (x)
*)
(* ****** ****** *)

implement
gneg_val<float> (x) = ~x
implement
gneg_val<double> (x) = ~x
implement
gneg_val<ldouble> (x) = ~x

(* ****** ****** *)

implement
gsucc_val<float> (x) = succ (x)
implement
gsucc_val<double> (x) = succ (x)
implement
gsucc_val<ldouble> (x) = succ (x)

(* ****** ****** *)

implement
gpred_val<float> (x) = pred (x)
implement
gpred_val<double> (x) = pred (x)
implement
gpred_val<ldouble> (x) = pred (x)

(* ****** ****** *)

implement
grecip_val<float> (x) = 1.0f / x
implement
grecip_val<double> (x) = 1.0 / x
implement
grecip_val<ldouble> (x) = 1.0l / x

(* ****** ****** *)

implement
gadd_val_val<float> (x, y) = x + y
implement
gadd_val_val<double> (x, y) = x + y
implement
gadd_val_val<ldouble> (x, y) = x + y

(* ****** ****** *)

implement
gsub_val_val<float> (x, y) = x - y
implement
gsub_val_val<double> (x, y) = x - y
implement
gsub_val_val<ldouble> (x, y) = x - y

(* ****** ****** *)

implement
gmul_val_val<float> (x, y) = x * y
implement
gmul_val_val<double> (x, y) = x * y
implement
gmul_val_val<ldouble> (x, y) = x * y

(* ****** ****** *)

implement
gdiv_val_val<float> (x, y) = x / y
implement
gdiv_val_val<double> (x, y) = x / y
implement
gdiv_val_val<ldouble> (x, y) = x / y

(* ****** ****** *)

implement
gmod_val_val<float> (x, y) = x mod y
implement
gmod_val_val<double> (x, y) = x mod y
implement
gmod_val_val<ldouble> (x, y) = x mod y

(* ****** ****** *)

(*
implement
gconjugate_val<float> (x) = x
implement
gconjugate_val<double> (x) = x
implement
gconjugate_val<ldouble> (x) = x
*)

(* ****** ****** *)

(* end of [gnumber_float.dats] *)
