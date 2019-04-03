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

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: June, 2012 *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/SATS/CODEGEN/intrange.atxt
** Time of generation: Sun Nov 20 21:18:18 2016
*)

(* ****** ****** *)
//
// HX-2013-04:
// intrange (l, r) is for integers i satisfying l <= i < r
//
(* ****** ****** *)
//
fun{}
intrange_foreach (l: int, r: int): int
fun{env:vt0p}
intrange_foreach_env (l: int, r: int, env: &(env) >> _): int
//
fun{env:vt0p}
intrange_foreach$cont (i: int, env: &env): bool
fun{env:vt0p}
intrange_foreach$fwork (i: int, env: &(env) >> _): void
//
(* ****** ****** *)

fun{}
int_foreach_cloref
(
  n: int, fwork: (int) -<cloref1> void
) : int // end of [int_foreach_cloref]
fun{}
intrange_foreach_cloref
(
  l: int, r: int, fwork: (int) -<cloref1> void
) : int // end of [intrange_foreach_cloref]

(* ****** ****** *)
//
fun{}
intrange_rforeach (l: int, r: int): int
fun{env:vt0p}
intrange_rforeach_env (l: int, r: int, env: &(env) >> _): int
//
fun{env:vt0p}
intrange_rforeach$cont (i: int, env: &env): bool
fun{env:vt0p}
intrange_rforeach$fwork (i: int, env: &(env) >> _): void
//
(* ****** ****** *)

fun{}
int_rforeach_cloref
(
  n: int, fwork: (int) -<cloref1> void
) : int // end of [int_rforeach_cloref]
fun{}
intrange_rforeach_cloref
(
  l: int, r: int, fwork: (int) -<cloref1> void
) : int // end of [intrange_rforeach_cloref]

(* ****** ****** *)
//
fun{}
intrange2_foreach
  (l1: int, r1: int, l2: int, r2: int): void
//
fun{env:vt0p}
intrange2_foreach_env
  (l1: int, r1: int, l2: int, r2: int, env: &(env) >> _): void
//
fun{env:vt0p}
intrange2_foreach$fwork (i: int, j: int, env: &env >> _): void
//
(* ****** ****** *)
//
fun{}
streamize_intrange_l(m: int): stream_vt(int)
fun{}
streamize_intrange_lr(m: int, n: int): stream_vt(int)
//
(* ****** ****** *)

(* end of [intrange.sats] *)
