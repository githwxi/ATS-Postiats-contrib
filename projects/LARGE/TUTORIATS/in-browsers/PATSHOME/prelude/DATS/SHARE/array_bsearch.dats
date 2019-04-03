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
** $PATSHOME/prelude/DATS/CODEGEN/array.atxt
** Time of generation: Sat Oct 17 15:20:00 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2013 *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
array_bsearch
  {n} (A, asz) = let
//
fun loop
  {l,r:nat | l <= r; r <= n} .<r-l>.
(
  A: &array (a, n), l: size_t l, r: size_t r
) :<> sizeLte (n) =
(
if l < r then let
  val m = l + half (r-l)
  val pm = addr@ (A.[m])
  val (
    pf, fpf | pm
  ) = $UN.ptr_vtake{a}(pm)
  val sgn = array_bsearch$ford<a> (!pm)
  prval () = fpf (pf)
in
  if sgn <= 0 then loop (A, l, m) else loop (A, succ(m), r)
end else l (* end of [if] *)
)
//
prval () = lemma_array_param (A)
//
in
  loop (A, g1i2u(0), asz)
end (* end of [array_bsearch] *)

(* ****** ****** *)

implement
{a}(*tmp*)
array_bsearch_fun
  (A, asz, key, cmp) = let
//
val p0 = addr@(key)
//
implement
array_bsearch$ford<a>
  (x) = sgn where
{
//
val
(
  pf, fpf | p0
) = $UN.ptr_vtake (p0)
val sgn = cmp (!p0, x)
prval ((*void*)) = fpf (pf)
//
} (* endimp *)
//
in
  array_bsearch<a> (A, asz)
end (* end of [array_bsearch_fun] *)

(* ****** ****** *)

(*
//
// HX: [qsort] is in libc/stdlib
//
void *bsearch
(
  const void *key
, const void *base
, size_t nmemb, size_t size
, int (*compar)(const void *, const void *)
) ; // end of [bsearch]
*)
implement{a}
array_bsearch_stdlib
  (A, asz, key, cmp) = let
in
//
$extfcall (
  Ptr0, "atspre_array_bsearch", addr@(key), addr@(A), asz, sizeof<a>, cmp
) // end of [$extfcall]
//
end // end of [array_bsearch_stdlib]

(* ****** ****** *)

(* end of [array_bsearch.dats] *)
