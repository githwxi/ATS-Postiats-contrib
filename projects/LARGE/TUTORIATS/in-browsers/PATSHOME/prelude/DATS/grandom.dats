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
** $PATSHOME/prelude/DATS/CODEGEN/grandom.atxt
** Time of generation: Sun Nov 20 21:18:27 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: June, 2015 *)

(* ****** ****** *)

implement{} grandom_int() = 0
implement{} grandom_uint() = 0u

(* ****** ****** *)

implement{} grandom_bool() = false

(* ****** ****** *)

implement{} grandom_float() = 0.0f
implement{} grandom_double() = 0.0

(* ****** ****** *)

implement
grandom_val<int> () = grandom_int<> ()
implement
grandom_val<uint> () = grandom_uint<> ()

(* ****** ****** *)

implement
grandom_val<bool> () = grandom_bool<> ()

(* ****** ****** *)

implement
grandom_val<double> () = grandom_double<> ()

(* ****** ****** *)

implement
{a}(*tmp*)
grandom_ref(x) = (x := grandom_val<a> ())

(* ****** ****** *)
//
implement
{a}(*tmp*)
grandom_list
  (n) = list_vt2t(grandom_list_vt<a>(n))
//
implement
{a}(*tmp*)
grandom_list_vt
  (n) = res where
{
//
fun loop
  {n:nat} .<n>.
(
  n: int n, res: &ptr? >> list_vt (a, n)
) : void = let
in
//
if n > 0 then let
//
val () =
  res := cons_vt{a}{0} (_, _)
// end of [val]
val+list_vt_cons (x, res1) = res
val () = grandom_ref<a> (x)
val () = loop (pred (n), res1)
//
in
  fold@ (res)
end else res := nil_vt((*void*))
//
end // end of [loop]
//
var res: ptr // uninitialized
val () = loop (n, res)
//
} (* end of [grandom_list_vt] *)
//
(* ****** ****** *)

implement
{a}(*tmp*)
grandom_arrayptr
  (n) = A where {
//
val A =
  arrayptr_make_uninitized<a> (n)
//
implement
array_initize$init<a> (_, x) = grandom_ref<a> (x)
//
prval pf = arrayptr_takeout (A)
val () = array_initize<a> (!(ptrcast(A)), n)
prval () = arrayptr_addback (pf | A)
//
} (* end of [grandom_arrayptr] *)

implement
{a}(*tmp*)
grandom_arrayref (n) =
  arrayptr_refize(grandom_arrayptr<a> (n))
// end of [grandom_arrayref]

implement
{a}(*tmp*)
grandom_arrszref (n) = let
  val n = g1ofg0_uint (n) in
  arrszref_make_arrayref (grandom_arrayref<a> (n), n)
end // end of [grandom_arrszref]

(* ****** ****** *)

(* end of [grandom.dats] *)
