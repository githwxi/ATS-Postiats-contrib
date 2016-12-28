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
** $PATSHOME/prelude/SATS/CODEGEN/parray.atxt
** Time of generation: Sun Nov 20 21:18:22 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2012 *)

(* ****** ****** *)

sortdef vtp = viewtype

(* ****** ****** *)

(*
** HX: for null-pointer terminated arrays
*)

dataview
parray_v (
  a:viewt@ype+, addr(*l*), int(*n*)
) = // for arrays with a sentinel at the end
  | {l:addr}{n:int}
    parray_v_cons (a, l, n+1) of (a @ l, parray_v (a, l+sizeof(a), n))
  | {l:addr} parray_v_nil (a, l, 0) of (ptr null @ l)
// end of [parray_v]

(* ****** ****** *)

prfun
lemma_parray_v_params{a:vtp}
  {l:addr}{n:int} (pf: !parray_v (INV(a), l, n)): [l > null;n >= 0] void
// end of [lemma_parray_v_params]

(* ****** ****** *)

fun{
a:vtp
} parray_is_empty
  {l:addr}{n:int} (
  pf: !parray_v (INV(a), l, n) | p: ptr l
) :<> bool (n == 0) // end of [parray_is_empty]

fun{
a:vtp
} parray_isnot_empty
  {l:addr}{n:int}
  (pf: !parray_v (INV(a), l, n) | p: ptr l):<> bool (n > 0)
// end of [parray_isnot_empty]

(* ****** ****** *)

fun{
a:vtp
} parray_size
  {l:addr}{n:int}
  (pf: !parray_v (INV(a), l, n) | p: ptr l):<> size_t (n)
// end of [parray_size]

(* ****** ****** *)

(* end of [parray.sats] *)
