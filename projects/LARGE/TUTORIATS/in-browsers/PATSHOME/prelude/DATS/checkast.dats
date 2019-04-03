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
** $PATSHOME/prelude/DATS/CODEGEN/checkast.atxt
** Time of generation: Sun Nov 20 21:18:26 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: December, 2013 *)

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

(*
staload "prelude/SATS/checkast.sats"
*)

(* ****** ****** *)

implement
{}(*tmp*)
checkast_charNZ
  (x, errmsg) = let
//
#define CNUL '\000'
//
val x = g1ofg0_char(x)
//
in
//
if
(
x != CNUL
)
then (x)
else let
  val () =
    fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
  // end of [val]
end // end of [else]
//
end // end of [checkast_charNZ]

(* ****** ****** *)

implement{tk}
checkast_gintLt
  (x, i, errmsg) = let
  val x = g1ofg0_int(x)
in
//
if x < i
  then (x)
  else let
    val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
    // end of [val]
  end // end of [else]
//
end // end of [checkast_gintLt]

(* ****** ****** *)

implement{tk}
checkast_gintLte
  (x, i, errmsg) = let
  val x = g1ofg0_int(x)
in
//
if x <= i
  then (x)
  else let
    val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
    // end of [val]
  end // end of [else]
//
end // end of [checkast_gintLte]

(* ****** ****** *)

implement{tk}
checkast_gintGt
  (x, i, errmsg) = let
  val x = g1ofg0_int(x)
in
//
if x > i
  then (x)
  else let
    val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
    // end of [val]
  end // end of [else]
//
end // end of [checkast_gintGt]

(* ****** ****** *)

implement{tk}
checkast_gintGte
  (x, i, errmsg) = let
  val x = g1ofg0_int(x)
in
//
if x >= i
  then (x)
  else let
    val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
    // end of [val]
  end // end of [else]
//
end // end of [checkast_gintGte]

(* ****** ****** *)

implement{tk}
checkast_gintBtw
  (x, i, j, errmsg) = let
  val x = g1ofg0_int(x)
in
//
if x >= i
  then
    if x < j then (x)
    else let
      val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
      // end of [val]
    end // end of [else]
  else let
    val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
    // end of [val]
  end // end of [else]
//
end // end of [checkast_gintBtw]

(* ****** ****** *)

implement{tk}
checkast_gintBtwe
  (x, i, j, errmsg) = let
  val x = g1ofg0_int(x)
in
//
if x >= i
  then
    if x <= j then (x)
    else let
      val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
      // end of [val]
    end // end of [else]
  else let
    val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
    // end of [val]
  end // end of [else]
//
end // end of [checkast_gintBtwe]

(* ****** ****** *)

implement{}
checkast_Ptr1
  (x, errmsg) = let
  val x = g1ofg0_ptr(x)
in
//
if x > 0
  then (x)
  else let
    val () =
      fprint! (stderr_ref, "exit(ATS): ", errmsg) in exit(1)
    // end of [val]
  end // end of [else]
// end of [if]
//
end // end of [checkast_Ptr1]

(* ****** ****** *)

implement{}
checkast_Strptr1
  (x, errmsg) = let
  val p = strptr2ptr(x)
in
//
if p > 0
  then (x)
  else let
    prval () =
      strptr_free_null (x)
    val ((*void*)) =
      fprint! (stderr_ref, "exit(ATS): ", errmsg)
    val ((*void*)) = exit_void(1)
  in
    $UN.castvwtp0{Strptr1}(0)
  end // end of [else]
// end of [if]
//
end // end of [checkast_Strptr1]

(* ****** ****** *)

(* end of [checkast.dats] *)
