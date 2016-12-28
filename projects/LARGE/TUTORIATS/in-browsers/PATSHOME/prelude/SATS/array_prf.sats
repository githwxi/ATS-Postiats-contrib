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
** $PATSHOME/prelude/SATS/CODEGEN/array_prf.atxt
** Time of generation: Sun Nov 20 21:18:20 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2012 *)

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)

prfun
array_v_split
  {a:vt0p}
  {l:addr}
  {n:int}{i:nat | i <= n}
(
  pfarr: array_v (INV(a), l, n)
) :<prf> @(
  array_v (a, l, i), array_v (a, l+i*sizeof(a), n-i)
) // end of [array_v_split]

prfun
array_v_split_at
  {a:vt0p}
  {l:addr}
  {n:int}{i:nat | i <= n}
(
  pfarr: array_v (INV(a), l, n) | i: size_t (i)
) :<prf> @(
  array_v (a, l, i), array_v (a, l+i*sizeof(a), n-i)
) // end of [array_v_split_at]

(* ****** ****** *)

prfun
array_v_unsplit
  {a:vt0p}
  {l:addr}
  {n1,n2:int}
(
  pf1arr: array_v (INV(a), l, n1)
, pf2arr: array_v (a, l+n1*sizeof(a), n2)
) :<prf> array_v (a, l, n1+n2) // end of [array_v_unsplit]

(* ****** ****** *)
//
prfun
array_v_extend :
  {a:vt0p}
  {l:addr}{n:int}
  (array_v (INV(a), l, n), a @ l+n*sizeof(a)) -<prf> array_v (a, l, n+1)
//
prfun
array_v_unextend :
  {a:vt0p}
  {l:addr}
  {n:int | n > 0}
  (array_v (INV(a), l, n)) -<prf> (array_v (a, l, n-1), a @ l+(n-1)*sizeof(a))
//
(* ****** ****** *)

prfun
array_v_takeout
  {a:vt0p}
  {l:addr}
  {n:int }
  {i:nat | i < n}
(
  pfarr: array_v (INV(a), l, n)
) :<prf> vtakeout (
  array_v (a, l, n), a @ (l+i*sizeof(a))
) (* end of [array_v_takeout] *)

(* ****** ****** *)

praxi
array_v_group
  {a:vt0p}{l:addr}{m,n:int}
  (pf: array_v (INV(a), l, m*n)): array_v (@[a][n], l, m)
// end of [array_v_group]

praxi
array_v_ungroup
  {a:vt0p}{l:addr}{m,n:int}
  (pf: array_v (@[INV(a)][n], l, m)): array_v (INV(a), l, m*n)
// end of [array_v_ungroup]

(* ****** ****** *)

(* end of [array_prf.sats] *)
