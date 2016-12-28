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
** $PATSHOME/prelude/SATS/CODEGEN/extern.atxt
** Time of generation: Sun Nov 20 21:18:22 2016
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
minus_vt0ype_view_view
  (vt1:vt@ype+, v2:view-) = vt1
absvt@ype
minus_vt0ype_view_vt0ype
  (vt1:vt@ype+, v2:view-) = vt1
//
viewdef
minus_v
(vt1:vt0p, v2:view) =
minus_vt0ype_view_view(vt1, v2)
viewdef
minus_vt
(vt1:vt0p, v2:view) =
minus_vt0ype_view_vt0ype(vt1, v2)
//
praxi
minus_v_addback
  {vt1:vt0p}{v2:view}
  (minus_v(INV(vt1), v2), v2 | !vt1): void
//
castfn
minus_vt_addback
  {vt1:vt0p}{v2:view}
  (pf: v2 | x0: minus_vt(INV(vt1), v2)): (vt1)
//
symintr minus_addback
overload minus_addback with minus_v_addback
overload minus_addback with minus_vt_addback
//
(* ****** ****** *)
//
typedef
vtget0_ftype
  (vt1:vt0p, vt2:vt0p) =
  (!vt1 >> minus_vt(vt1,vt2)) -<fun> vt2
//
typedef
vtget1_ftype
  (vt1:vt0p, vt2:vt0p) =
  (!vt1) -<fun> (minus_v(vt1, vt2) | vt2)
//
vtypedef vtget1
  (vt1:vt0p, vt2:vt0p) = (minus_v(vt1, vt2) | vt2)
//
(* ****** ****** *)
//
// HX-2016-08:
// It is implemented in [pointer.dats]
//
fun
{a:vt0p}
aptr_vtget0_elt
  {l:agz}
: vtget0_ftype(aptr(INV(a), l), a)
//
fun
{a:vt0p}
aptr_vtget1_elt
  {l:agz}
: vtget1_ftype(aptr(INV(a), l), a)
//
overload vtget0 with aptr_vtget0_elt
overload vtget1 with aptr_vtget1_elt
//
(* ****** ****** *)

castfn
argv_takeout_strarr
  {n:int} (
  argv: !argv (n)
) :<> [l:addr] (
  array_v(string, l, n), minus_v(argv(n), array_v(string, l, n)) | ptr(l)
) // end of [argv_takeout_strarr]

castfn
argv_takeout_parray
  {n:int} (
  argv: !argv (n)
) :<> [l:addr] (
  parray_v(string, l, n), minus_v(argv(n), parray_v(string, l, n)) | ptr(l)
) // end of [argv_takeout_parray]

(* ****** ****** *)

(* end of [extern.sats] *)
