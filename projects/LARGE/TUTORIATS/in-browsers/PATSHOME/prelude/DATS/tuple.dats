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
** $PATSHOME/prelude/DATS/CODEGEN/tuple.atxt
** Time of generation: Sun Nov 20 21:18:25 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: December, 2012 *)

(* ****** ****** *)
//
implement
fprint_tup$beg<>
  (out) = fprint_string(out, "(")
implement
fprint_tup$end<>
  (out) = fprint_string(out, ")")
implement
fprint_tup$sep<>
  (out) = fprint_string(out, ", ")
//
(* ****** ****** *)
//
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
//
implement
(a0,a1)
fprint_val<tup(a0,a1)>
  (out, x) = fprint_tupval2<a0,a1> (out, x)
//
(* ****** ****** *)
//
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
//
implement
(a0,a1,a2)
fprint_val<tup(a0,a1,a2)>
  (out, x) = fprint_tupval3<a0,a1,a2> (out, x)
//
(* ****** ****** *)
//
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
//
implement
(a0,a1,a2,a3)
fprint_val<tup(a0,a1,a2,a3)>
  (out, x) = fprint_tupval4<a0,a1,a2,a3> (out, x)
//
(* ****** ****** *)
//
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
//
implement
(a0,a1)
fprint_ref<tup(a0,a1)>
  (out, x) = fprint_tupref2<a0,a1> (out, x)
//
(* ****** ****** *)
//
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
fprint_ref<tup(a0,a1,a2)>
  (out, x) = fprint_tupref3<a0,a1,a2> (out, x)
//
(* ****** ****** *)
//
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
//
implement
(a0,a1,a2,a3)
fprint_ref<tup(a0,a1,a2,a3)>
  (out, x) = fprint_tupref4<a0,a1,a2,a3> (out, x)
//
(* ****** ****** *)
//
implement
fprint_tupbox$beg<>
  (out) = fprint_string(out, "$tup(")
//
implement
fprint_tupbox$end<> (out) = fprint_string(out, ")")
implement
fprint_tupbox$sep<> (out) = fprint_string(out, ", ")
//
(* ****** ****** *)
//
implement
{a0}
fprint_tupbox1
  (out, x) = let
  val () = fprint_tupbox$beg<> (out)
  val () = fprint_val<a0> (out, x.0)
  val () = fprint_tupbox$end<> (out)
in
  // nothing
end // end of [fprint_tupbox1]
//
implement(a0)
fprint_val<tupbox(a0)>
  (out, x) = fprint_tupbox1<a0> (out, x)
//
(* ****** ****** *)
//
implement
{a0,a1}
fprint_tupbox2
  (out, x) = let
  val () = fprint_tupbox$beg<> (out)
  val () = fprint_val<a0> (out, x.0)
  val () = fprint_tupbox$sep<> (out)
  val () = fprint_val<a1> (out, x.1)
  val () = fprint_tupbox$end<> (out)
in
  // nothing
end // end of [fprint_tupbox2]
//
implement(a0,a1)
fprint_val<tupbox(a0,a1)>
  (out, x) = fprint_tupbox2<a0,a1> (out, x)
//
(* ****** ****** *)
//
implement
{a0,a1,a2}
fprint_tupbox3
  (out, x) = let
  val () = fprint_tupbox$beg<> (out)
  val () = fprint_val<a0> (out, x.0)
  val () = fprint_tupbox$sep<> (out)
  val () = fprint_val<a1> (out, x.1)
  val () = fprint_tupbox$sep<> (out)
  val () = fprint_val<a2> (out, x.2)
  val () = fprint_tupbox$end<> (out)
in
  // nothing
end // end of [fprint_tupbox3]
//
implement(a0,a1,a2)
fprint_val<tupbox(a0,a1,a2)>
  (out, x) = fprint_tupbox3<a0,a1,a2> (out, x)
//
(* ****** ****** *)
//
implement
{a0,a1,a2,a3}
fprint_tupbox4
  (out, x) = let
  val () = fprint_tupbox$beg<> (out)
  val () = fprint_val<a0> (out, x.0)
  val () = fprint_tupbox$sep<> (out)
  val () = fprint_val<a1> (out, x.1)
  val () = fprint_tupbox$sep<> (out)
  val () = fprint_val<a2> (out, x.2)
  val () = fprint_tupbox$sep<> (out)
  val () = fprint_val<a3> (out, x.3)
  val () = fprint_tupbox$end<> (out)
in
  // nothing
end // end of [fprint_tupbox4]
//
implement(a0,a1,a2,a3)
fprint_val<tupbox(a0,a1,a2,a3)>
  (out, x) = fprint_tupbox4<a0,a1,a2,a3> (out, x)
//
(* ****** ****** *)

implement
{a0,a1}
tupval2_equal(x, y) =
(
//
if
gequal_val_val<a0>(x.0, y.0)
then gequal_val_val<a1>(x.1, y.1) else false
//
) (* end of [tupval2_val_val] *)

implement
(a0,a1)
gequal_val_val<tup(a0,a1)> (x, y) = tupval2_equal<a0,a1> (x, y)

(* ****** ****** *)

implement
{a0,a1,a2}
tupval3_equal(x, y) =
(
//
if
gequal_val_val<a0>(x.0, y.0)
then
(
  if gequal_val_val<a1>(x.1, y.1)
    then gequal_val_val<a2>(x.2, y.2) else false
  // end of [if]
) else false
//
) (* end of [tupval3_val_val] *)

implement
(a0,a1,a2)
gequal_val_val<tup(a0,a1,a2)> (x, y) = tupval3_equal<a0,a1,a2> (x, y)

(* ****** ****** *)

implement
{a0,a1,a2,a3}
tupval4_equal(x, y) =
(
//
if
gequal_val_val<a0>(x.0, y.0)
then
(
if
gequal_val_val<a1>(x.1, y.1)
then (
if
gequal_val_val<a2>(x.2, y.2)
  then gequal_val_val<a3>(x.3, y.3) else false
// end of [if]
) else false
) else false
//
) (* end of [tupval4_val_val] *)

implement
(a0,a1,a2,a3)
gequal_val_val<tup(a0,a1,a2,a3)> (x, y) = tupval4_equal<a0,a1,a2,a3> (x, y)

(* ****** ****** *)

implement
{a0,a1}
tupval2_compare (x, y) = let
  val sgn0 = gcompare_val_val<a0> (x.0, y.0)
in
  if sgn0 != 0
    then sgn0 else gcompare_val_val<a1> (x.1, y.1)
  // end of [if]
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
  if sgn1 != 0
    then sgn1 else gcompare_val_val<a2> (x.2, y.2)
  // end of [if]
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
  if sgn2 != 0
    then sgn2 else gcompare_val_val<a3> (x.3, y.3)
  // end of [if]
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
