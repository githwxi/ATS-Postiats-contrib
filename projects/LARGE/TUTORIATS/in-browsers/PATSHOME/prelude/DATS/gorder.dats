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
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: March, 2013 *)

(* ****** ****** *)

(*
** Source:
** $PATSHOME/prelude/DATS/CODEGEN/gorder.atxt
** Time of generation: Sun Nov 20 21:18:26 2016
*)

(* ****** ****** *)
//
implement
{a}(*tmp*)
glt_val_val(x, y) =
  gcompare_val_val<a> (x, y) < 0
implement
{a}(*tmp*)
glte_val_val(x, y) =
  gcompare_val_val<a> (x, y) <= 0
implement
{a}(*tmp*)
ggt_val_val(x, y) =
  gcompare_val_val<a> (x, y) > 0
implement
{a}(*tmp*)
ggte_val_val(x, y) =
  gcompare_val_val<a> (x, y) >= 0
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
glt_val_int(x, y) =
  glt_val_val<a> (x, gnumber_int<a>(y))
implement
{a}(*tmp*)
glte_val_int(x, y) =
  glte_val_val<a> (x, gnumber_int<a>(y))
implement
{a}(*tmp*)
ggt_val_int(x, y) =
  ggt_val_val<a> (x, gnumber_int<a>(y))
implement
{a}(*tmp*)
ggte_val_int(x, y) =
  ggte_val_val<a> (x, gnumber_int<a>(y))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
geq_val_val(x, y) =
  gcompare_val_val<a> (x, y) = 0
implement
{a}(*tmp*)
gneq_val_val(x, y) =
  gcompare_val_val<a> (x, y) != 0
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
geq_val_int(x, y) =
  geq_val_val<a> (x, gnumber_int<a>(y))
implement
{a}(*tmp*)
gneq_val_int(x, y) =
  gneq_val_val<a> (x, gnumber_int<a>(y))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
gisltz_val(x) = glt_val_int<a> (x, 0)
implement
{a}(*tmp*)
gisltez_val(x) = glte_val_int<a> (x, 0)
//
implement
{a}(*tmp*)
gisgtz_val(x) = ggt_val_int<a> (x, 0)
implement
{a}(*tmp*)
gisgtez_val(x) = ggte_val_int<a> (x, 0)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
giseqz_val(x) = geq_val_int<a> (x, 0)
implement
{a}(*tmp*)
gisneqz_val(x) = gneq_val_int<a> (x, 0)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
glt_ref_ref(x, y) =
  gcompare_ref_ref<a> (x, y) < 0
implement
{a}(*tmp*)
glte_ref_ref(x, y) =
  gcompare_ref_ref<a> (x, y) <= 0
implement
{a}(*tmp*)
ggt_ref_ref(x, y) =
  gcompare_ref_ref<a> (x, y) > 0
implement
{a}(*tmp*)
ggte_ref_ref(x, y) =
  gcompare_ref_ref<a> (x, y) >= 0
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
geq_ref_ref(x, y) =
  gcompare_ref_ref<a> (x, y) = 0
implement
{a}(*tmp*)
gneq_ref_ref(x, y) =
  gcompare_ref_ref<a> (x, y) != 0
//
(* ****** ****** *)
//
implement
(a:t0p)(*tmp*)
gcompare_ref_ref<a>
  (x, y) = gcompare_val_val<a> (x, y)
//
(* ****** ****** *)

implement
{a}(*tmp*)
gabs_val(x) =
  if gisgtez_val<a>(x) then x else gneg_val<a>(x)
// end of [gabs_val]

(* ****** ****** *)
//
implement
{a}(*tmp*)
gmax_val_val(x, y) =
  if ggte_val_val<a> (x, y) then x else y
implement
{a}(*tmp*)
gmin_val_val(x, y) =
  if glte_val_val<a> (x, y) then x else y
//
(* ****** ****** *)

#include "./SHARE/gorder_int.dats"
#include "./SHARE/gorder_uint.dats"

(* ****** ****** *)

#include "./SHARE/gorder_bool.dats"
#include "./SHARE/gorder_char.dats"

(* ****** ****** *)

#include "./SHARE/gorder_float.dats"

(* ****** ****** *)

#include "./SHARE/gorder_string.dats"

(* ****** ****** *)

(* end of [gorder.dats] *)
