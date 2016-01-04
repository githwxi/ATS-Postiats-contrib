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
** $PATSHOME/prelude/SATS/CODEGEN/extern.atxt
** Time of generation: Sat Oct 17 15:19:51 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2012 *)

(* ****** ****** *)

sortdef vt0p = viewt@ype

(* ****** ****** *)

abstype
carrayptr (a:t@ype, l:addr, n:int) = ptr(l)
typedef
carrayptr0 (a:t@ype, n:int) = [l:addr] carrayptr (a, l, n)
typedef
carrayptr1 (a:t@ype, n:int) = [l:addr | l > null] carrayptr (a, l, n)

(* ****** ****** *)
//
// HX-2014-01-30: these are inherently unsafe:
//
castfn
carrayptr_null
  {a:t@ype}{n:nat} (p: ptr(null)):<> carrayptr (a, null, n)
castfn
carrayptr_array
  {a:t@ype}{n:int} (A: &array(INV(a), n)):<> carrayptr1 (a, n)
castfn
carrayptr_arrayref
  {a:t@ype}{n:int} (A: arrayref(INV(a), n)):<> carrayptr1 (a, n)
castfn
carrayptr_arrayptr
  {a:t@ype}{l:addr}{n:int}
  (A: !arrayptr(INV(a), l, n)):<> [l > null] carrayptr (a, l, n)
//
(* ****** ****** *)

symintr carrayptr
overload carrayptr with carrayptr_null
overload carrayptr with carrayptr_array
overload carrayptr with carrayptr_arrayref
overload carrayptr with carrayptr_arrayptr

(* ****** ****** *)
//
// HX: note that (vt1 \minus v2) roughly means that a ticket of
// [v2] is taken from [vt1]; the ticket must be returned before
// [vt1] is consumed. However, the ticket should not be issued
// repeatedly for otherwise safety may be potentially compromised.
//
absview
minus_viewt0ype_view_view (vt1: vt0p, v2: view) = vt1
viewdef
minus(vt1: vt0p, v2: view) = minus_viewt0ype_view_view(vt1, v2)
//
praxi minus_addback
  {vt1:vt0p}{v2:view} (pf1: minus (vt1, v2), pf2: v2 | x: !vt1): void
//
(* ****** ****** *)

vtypedef vtget0 (vt1:vt0p, vt2: vt0p) = (minus (vt1, vt2) | vt2)

(* ****** ****** *)

castfn
argv_takeout_strarr
  {n:int} (
  argv: !argv (n)
) :<> [l:addr] (
  array_v (string, l, n), minus (argv n, array_v (string, l, n)) | ptr l
) // end of [argv_takeout_strarr]

castfn
argv_takeout_parray
  {n:int} (
  argv: !argv (n)
) :<> [l:addr] (
  parray_v (string, l, n), minus (argv n, parray_v (string, l, n)) | ptr l
) // end of [argv_takeout_parray]

(* ****** ****** *)

(* end of [extern.sats] *)
