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
** $PATSHOME/prelude/SATS/CODEGEN/reference.atxt
** Time of generation: Sun Nov 20 21:18:17 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2012 *)

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)

castfn ref_get_ptr
  {a:vt0p} (r: ref a):<> [l:agz] ptr (l)
castfn ref_get_viewptr
  {a:vt0p} (r: ref a):<> [l:agz] (vbox (a @ l) | ptr l)
// end of [ref_get_viewptr]

(* ****** ****** *)

(*
macdef ptr_of_ref = ref_get_ptr
*)

(* ****** ****** *)

fun{a:vt0p} ref (x: a):<!wrt> ref a
fun{a:vt0p} ref_make_elt (x: a):<!wrt> ref a

castfn ref_make_viewptr
  {a:vt0p}{l:addr} (pf: a @ l | p: ptr l):<> ref (a)
// end of [ref_make_viewptr]

(* ****** ****** *)
//
fun{a:t0p} ref_get_elt (r: ref a):<!ref> a
fun{a:t0p} ref_set_elt (r: ref a, x: a):<!refwrt> void
//
(* ****** ****** *)
//
fun{a:vt0p} ref_exch_elt (r: ref a, x: &a>>a):<!refwrt> void
//
(* ****** ****** *)

(*
** HX-2012-05:
** this is not particularly useful except for the purpose
** of avoiding using the [vbox] pattern
*)

fun{}
ref_app_fun{a:vt0p}
(
  r: ref a, f: (&(a)>>_) -<0,!wrt> void
) :<!refwrt> void // end of [ref_app_fun]

fun{}
ref_app_funenv{a:vt0p}
  {v:view}{vt:viewtype}
(
  pfv: !v
| r: ref a, f: (!v | &(a)>>_, !vt) -<0,!wrt> void, env: !vt
) :<!refwrt> void // end of [ref_app_funenv]

(* ****** ****** *)
//
// HX-2013-10: unsafe but convenient
//
fun{}
ref_vtakeout
  {a:vt0p}
(
  ref: ref (a)
) :<!ref> [l:addr] (a @ l, (a @ l) -<lin,prf> void | ptr(l))
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)

overload [] with ref_get_elt // ref[]
overload [] with ref_set_elt // ref[] := (val)

(* ****** ****** *)

(* end of [reference.sats] *)
