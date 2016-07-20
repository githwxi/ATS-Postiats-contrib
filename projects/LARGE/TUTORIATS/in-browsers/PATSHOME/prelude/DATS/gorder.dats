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
** $PATSHOME/prelude/DATS/CODEGEN/gorder.atxt
** Time of generation: Sat Oct 17 15:19:55 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2013 *)

(* ****** ****** *)

implement{a}
glt_val_val (x, y) = gcompare_val_val<a> (x, y) < 0
implement{a}
glte_val_val (x, y) = gcompare_val_val<a> (x, y) <= 0
implement{a}
ggt_val_val (x, y) = gcompare_val_val<a> (x, y) > 0
implement{a}
ggte_val_val (x, y) = gcompare_val_val<a> (x, y) >= 0

(* ****** ****** *)

implement{a}
glt_val_int (x, y) = glt_val_val<a> (x, gnumber_int<a>(y))
implement{a}
glte_val_int (x, y) = glte_val_val<a> (x, gnumber_int<a>(y))
implement{a}
ggt_val_int (x, y) = ggt_val_val<a> (x, gnumber_int<a>(y))
implement{a}
ggte_val_int (x, y) = ggte_val_val<a> (x, gnumber_int<a>(y))

(* ****** ****** *)

implement{a}
geq_val_val (x, y) = gcompare_val_val<a> (x, y) = 0
implement{a}
gneq_val_val (x, y) = gcompare_val_val<a> (x, y) != 0

(* ****** ****** *)

implement{a}
geq_val_int (x, y) = geq_val_val<a> (x, gnumber_int<a>(y))
implement{a}
gneq_val_int (x, y) = gneq_val_val<a> (x, gnumber_int<a>(y))

(* ****** ****** *)

implement{a}
gisltz_val (x) = glt_val_int<a> (x, 0)
implement{a}
gisltez_val (x) = glte_val_int<a> (x, 0)
implement{a}
gisgtz_val (x) = ggt_val_int<a> (x, 0)
implement{a}
gisgtez_val (x) = ggte_val_int<a> (x, 0)

(* ****** ****** *)

implement{a}
giseqz_val (x) = geq_val_int<a> (x, 0)
implement{a}
gisneqz_val (x) = gneq_val_int<a> (x, 0)

(* ****** ****** *)

implement{a}
glt_ref_ref (x, y) = gcompare_ref_ref<a> (x, y) < 0
implement{a}
glte_ref_ref (x, y) = gcompare_ref_ref<a> (x, y) <= 0
implement{a}
ggt_ref_ref (x, y) = gcompare_ref_ref<a> (x, y) > 0
implement{a}
ggte_ref_ref (x, y) = gcompare_ref_ref<a> (x, y) >= 0

(* ****** ****** *)

implement{a}
geq_ref_ref (x, y) = gcompare_ref_ref<a> (x, y) = 0
implement{a}
gneq_ref_ref (x, y) = gcompare_ref_ref<a> (x, y) != 0

(* ****** ****** *)

implement(a:t0p)
gcompare_ref_ref<a> (x, y) = gcompare_val_val<a> (x, y)

(* ****** ****** *)

implement{a}
gabs_val (x) =
  if gisgtez_val (x) then x else gneg_val<a> (x)
// end of [gabs_val]

(* ****** ****** *)

implement{a}
gmax_val_val (x, y) = if ggte_val_val (x, y) then x else y
implement{a}
gmin_val_val (x, y) = if glte_val_val (x, y) then x else y

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
