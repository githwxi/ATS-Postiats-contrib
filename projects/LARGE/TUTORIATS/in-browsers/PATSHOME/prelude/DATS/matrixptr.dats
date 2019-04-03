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
** $PATSHOME/prelude/DATS/CODEGEN/matrixptr.atxt
** Time of generation: Sun Nov 20 21:18:29 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement{}
arrayptr2matrixptr_int(A, m, n) = $UN.castvwtp0(A)
implement{}
arrayptr2matrixptr_size(A, m, n) = $UN.castvwtp0(A)

(* ****** ****** *)

implement{a}
matrixptr_make_elt
  {m, n} (m, n, x0) = let
  val mn = $UN.cast{Size}(m * n)
in
  $UN.castvwtp0{matrixptr(a,m,n)}(arrayptr_make_elt<a> (mn, x0))
end // end of [matrixptr_make_elt]

(* ****** ****** *)

implement{a}
matrixptr_get_at_int
  (M, i, n, j) = let
  val ij = $UN.cast{Size}(i * n + j)
in
  $UN.ptr0_get<a> (ptr_add<a> (ptrcast(M), ij))
end // end of [matrixptr_get_at_int]

implement{a}
matrixptr_get_at_size
  (M, i, n, j) = let
  val ij = $UN.cast{Size}(i * n + j)
in
  $UN.ptr0_get<a> (ptr_add<a> (ptrcast(M), ij))
end // end of [matrixptr_get_at_size]

(* ****** ****** *)

implement{a}
matrixptr_set_at_int
  (M, i, n, j, x) = let
  val ij = $UN.cast{Size}(i * n + j)
in
  $UN.ptr0_set<a> (ptr_add<a> (ptrcast(M), ij), x)
end // end of [matrixptr_set_at_int]

implement{a}
matrixptr_set_at_size
  (M, i, n, j, x) = let
  val ij = $UN.cast{Size}(i * n + j)
in
  $UN.ptr0_set<a> (ptr_add<a> (ptrcast(M), ij), x)
end // end of [matrixptr_set_at_size]

(* ****** ****** *)

implement{a}
matrixptr_exch_at_int
  (M, i, n, j, x) = let
  val ij = $UN.cast{Size}(i * n + j)
in
  $UN.ptr0_exch<a> (ptr_add<a> (ptrcast(M), ij), x)
end // end of [matrixptr_exch_at_int]

implement{a}
matrixptr_exch_at_size
  (M, i, n, j, x) = let
  val ij = $UN.cast{Size}(i * n + j)
in
  $UN.ptr0_exch<a> (ptr_add<a> (ptrcast(M), ij), x)
end // end of [matrixptr_exch_at_size]

(* ****** ****** *)

implement{a}
fprint_matrixptr
  {m,n} (out, M, m, n) = let
//
val p0 = ptrcast (M)
//
val (
  pf, fpf | p0
) = $UN.ptr_vtake {matrix(a,m,n)} (p0)
val () = fprint_matrix<a> (out, !p0, m, n)
prval () = fpf (pf)
//
in
  // nothing
end // end of [fprint_matrixptr]

(* ****** ****** *)

implement{a}
fprint_matrixptr_sep
(
  out, M, m, n, sep1, sep2
) = let
//
implement
fprint_matrix$sep1<> (out) = fprint_string (out, sep1)
implement
fprint_matrix$sep2<> (out) = fprint_string (out, sep2)
//
in
  fprint_matrixptr<a> (out, M, m, n)
end // end of [fprint_matrixptr_sep]

(* ****** ****** *)

(*
implement matrixptr_free = ATS_MFREE
*)

(* ****** ****** *)

implement{a}
matrixptr_foreach
  (M, m, n) = let
  var env: void = () in
  matrixptr_foreach_env<a><void> (M, m, n, env)
end // end of [matrixptr_foreach]

implement
{a}{env}
matrixptr_foreach_env
  (M, m, n, env) = res where
{
//
val p = ptrcast(M)
prval pfarr = matrixptr_takeout(M)
val res = matrix_foreach_env<a><env> (!p, m, n, env)
prval () = matrixptr_addback(pfarr | M)
//
} (* end of [matrixptr_foreach_env] *)

(* ****** ****** *)

implement
{a}(*tmp*)
matrixptr_initize
  (M, m, n) = () where
{
//
val p = ptrcast(M)
prval pfarr = matrixptr_takeout(M)
val () = matrix_initize<a>(!p, m, n)
prval () = matrixptr_addback(pfarr | M)
//
} (* end of [matrixptr_initize] *)

(* ****** ****** *)

implement
{a}(*tmp*)
matrixptr_uninitize
  (M, m, n) = () where
{
//
val p = ptrcast(M)
prval pfarr = matrixptr_takeout(M)
val () = matrix_uninitize<a>(!p, m, n)
prval () = matrixptr_addback(pfarr | M)
//
} (* end of [matrixptr_uninitize] *)

(* ****** ****** *)

implement
{a}(*tmp*)
matrixptr_freelin
  (M, m, n) = let
//
val () =
matrixptr_uninitize<a>(M, m, n)
//
in
  matrixptr_free{a?}(M)
end // end of [matrixptr_freelin]

(* ****** ****** *)

implement{a}
matrixptr_tabulate
  (nrow, ncol) =
(
  matrixptr_encode2(matrix_ptr_tabulate<a> (nrow, ncol))
) (* end of [matrixptr_tabulate] *)

(* ****** ****** *)

implement{a}
matrixptr_tabulate_cloref
  {m,n} (nrow, ncol, f) = let
//
implement(a2)
matrix_tabulate$fopr<a2> (i, j) =
  $UN.castvwtp0{a2}(f($UN.cast{sizeLt(m)}(i), $UN.cast{sizeLt(n)}(j)))
//
in
  matrixptr_tabulate<a> (nrow, ncol)
end // end of [matrixptr_tabulate_cloref]

(* ****** ****** *)

(* end of [matrixptr.dats] *)
