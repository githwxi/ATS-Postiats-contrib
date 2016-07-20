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
** $PATSHOME/prelude/DATS/CODEGEN/tuple.atxt
** Time of generation: Sat Oct 17 15:19:53 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: December, 2012 *)

(* ****** ****** *)

implement
fprint_tup$beg<> (out) = fprint_string (out, "(")
implement
fprint_tup$end<> (out) = fprint_string (out, ")")
implement
fprint_tup$sep<> (out) = fprint_string (out, ", ")

(* ****** ****** *)

implement
{a0,a1}
fprint_tupval2
  (out, x) = let
  val () = fprint_tup$beg<> (out)
  val () = fprint_val<a0> (out, x.0)
  val () = fprint_tup$sep<> (out)
  val () = fprint_val<a1> (out, x.1)
  val () = fprint_tup$end<> (out)
in
  // nothing
end // end of [fprint_tupval2]

implement
(a0,a1)
fprint_val<tup(a0,a1)> (out, x) = fprint_tupval2<a0,a1> (out, x)

(* ****** ****** *)

implement
{a0,a1,a2}
fprint_tupval3
  (out, x) = let
  val () = fprint_tup$beg<> (out)
  val () = fprint_val<a0> (out, x.0)
  val () = fprint_tup$sep<> (out)
  val () = fprint_val<a1> (out, x.1)
  val () = fprint_tup$sep<> (out)
  val () = fprint_val<a2> (out, x.2)
  val () = fprint_tup$end<> (out)
in
  // nothing
end // end of [fprint_tupval3]

implement
(a0,a1,a2)
fprint_val<tup(a0,a1,a2)> (out, x) = fprint_tupval3<a0,a1,a2> (out, x)

(* ****** ****** *)

implement
{a0,a1,a2,a3}
fprint_tupval4
  (out, x) = let
  val () = fprint_tup$beg<> (out)
  val () = fprint_val<a0> (out, x.0)
  val () = fprint_tup$sep<> (out)
  val () = fprint_val<a1> (out, x.1)
  val () = fprint_tup$sep<> (out)
  val () = fprint_val<a2> (out, x.2)
  val () = fprint_tup$sep<> (out)
  val () = fprint_val<a3> (out, x.3)
  val () = fprint_tup$end<> (out)
in
  // nothing
end // end of [fprint_tupval4]

implement
(a0,a1,a2,a3)
fprint_val<tup(a0,a1,a2,a3)> (out, x) = fprint_tupval4<a0,a1,a2,a3> (out, x)

(* ****** ****** *)

implement
{a0,a1}
fprint_tupref2
  (out, x) = let
  val () = fprint_tup$beg<> (out)
  val () = fprint_ref<a0> (out, x.0)
  val () = fprint_tup$sep<> (out)
  val () = fprint_ref<a1> (out, x.1)
  val () = fprint_tup$end<> (out)
in
  // nothing
end // end of [fprint_tupref2]

implement
(a0,a1)
fprint_ref<tup(a0,a1)> (out, x) = fprint_tupref2<a0,a1> (out, x)

(* ****** ****** *)

implement
{a0,a1,a2}
fprint_tupref3
  (out, x) = let
  val () = fprint_tup$beg<> (out)
  val () = fprint_ref<a0> (out, x.0)
  val () = fprint_tup$sep<> (out)
  val () = fprint_ref<a1> (out, x.1)
  val () = fprint_tup$sep<> (out)
  val () = fprint_ref<a2> (out, x.2)
  val () = fprint_tup$end<> (out)
in
  // nothing
end // end of [fprint_tupref3]

implement
(a0,a1,a2)
fprint_ref<tup(a0,a1,a2)> (out, x) = fprint_tupref3<a0,a1,a2> (out, x)

(* ****** ****** *)

implement
{a0,a1,a2,a3}
fprint_tupref4
  (out, x) = let
  val () = fprint_tup$beg<> (out)
  val () = fprint_ref<a0> (out, x.0)
  val () = fprint_tup$sep<> (out)
  val () = fprint_ref<a1> (out, x.1)
  val () = fprint_tup$sep<> (out)
  val () = fprint_ref<a2> (out, x.2)
  val () = fprint_tup$sep<> (out)
  val () = fprint_ref<a3> (out, x.3)
  val () = fprint_tup$end<> (out)
in
  // nothing
end // end of [fprint_tupref4]

implement
(a0,a1,a2,a3)
fprint_ref<tup(a0,a1,a2,a3)> (out, x) = fprint_tupref4<a0,a1,a2,a3> (out, x)

(* ****** ****** *)

implement
{a0,a1}
tupval2_compare (x, y) = let
  val sgn0 = gcompare_val_val<a0> (x.0, y.0)
in
  if sgn0 != 0 then sgn0 else gcompare_val_val<a1> (x.1, y.1)
end // end of [tupval2_compare]  

implement
(a0,a1)
gcompare_val_val<tup(a0,a1)> (x, y) = tupval2_compare<a0,a1> (x, y)

(* ****** ****** *)

implement
{a0,a1,a2}
tupval3_compare (x, y) = let
//
val sgn0 = gcompare_val_val<a0> (x.0, y.0)
//
in
//
if
sgn0 != 0
then sgn0
else let
  val sgn1 = gcompare_val_val<a1> (x.1, y.1)
in
  if sgn1 != 0 then sgn1 else gcompare_val_val<a2> (x.2, y.2)
end // end of [if]
//
end // end of [tupval3_compare]

implement
(a0,a1,a2)
gcompare_val_val<tup(a0,a1,a2)> (x, y) = tupval3_compare<a0,a1,a2> (x, y)

(* ****** ****** *)

implement
{a0,a1,a2,a3}
tupval4_compare (x, y) = let
//
val sgn0 = gcompare_val_val<a0> (x.0, y.0)
//
in
//
if
sgn0 != 0
then sgn0
else let
  val sgn1 = gcompare_val_val<a1> (x.1, y.1)
in
//
if sgn1 != 0 then sgn1
else let
  val sgn2 = gcompare_val_val<a2> (x.2, y.2)
in
  if sgn2 != 0 then sgn2 else gcompare_val_val<a3> (x.3, y.3)
end // end of [if]
//
end // end of [if]
//
end // end of [tupval4_compare]  

implement
(a0,a1,a2,a3)
gcompare_val_val<tup(a0,a1,a2,a3)> (x, y) = tupval4_compare<a0,a1,a2,a3> (x, y)

(* ****** ****** *)

(* end of [tuple.dats] *)
