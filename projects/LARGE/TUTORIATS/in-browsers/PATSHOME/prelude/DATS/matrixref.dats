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
** $PATSHOME/prelude/DATS/CODEGEN/matrixref.atxt
** Time of generation: Sun Nov 20 21:18:29 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement{a}
matrixref_make_elt
  (nrow, ncol, x) =
  matrixptr_refize(matrixptr_make_elt<a> (nrow, ncol, x))
// end of [matrixref_make_elt]

(* ****** ****** *)

implement{a}
matrixref_get_at_size
  (A, i, n, j) = let
//
val
(
vbox pf | p
) = matrixref_get_viewptr (A)
//
in
  matrix_get_at_size (!p, i, n, j)
end // end of [matrixref_get_at_size]

(* ****** ****** *)
//
implement
{a}(*tmp*)
matrixref_get_at_int
  (M, i, n, j) =
  matrixref_get_at_size (M, i2sz(i), i2sz(n), i2sz(j))
//
(* ****** ****** *)

implement{a}
matrixref_set_at_size
  (A, i, n, j, x) = let
//
val
(
vbox pf | p
) = matrixref_get_viewptr (A)
//
in
  matrix_set_at_size (!p, i, n, j, x)
end // end of [matrixref_set_at_size]

(* ****** ****** *)
//
implement
{a}(*tmp*)
matrixref_set_at_int
  (M, i, n, j, x) =
  matrixref_set_at_size (M, i2sz(i), i2sz(n), i2sz(j), x)
//
(* ****** ****** *)

implement{a}
fprint_matrixref
  {m,n}
(
  out, M, nrow, ncol
) = {
//
val M =
$UN.castvwtp1{matrixptr(a, m, n)}(M)
//
val () = fprint_matrixptr<a> (out, M, nrow, ncol)
//
prval ((*void*)) = $UN.cast2void (M)
//
} (* end of [fprint_matrixref] *)

implement{a}
fprint_matrixref_sep
  {m,n}
(
  out, M, nrow, ncol, sep1, sep2
) = {
//
val M =
$UN.castvwtp1{matrixptr(a, m, n)}(M)
//
val () =
fprint_matrixptr_sep<a> (out, M, nrow, ncol, sep1, sep2)
//
prval ((*void*)) = $UN.cast2void (M)
//
} (* end of [fprint_matrixref_sep] *)

(* ****** ****** *)

implement
{a}(*tmp*)
matrixref_copy
  {m,n} (M, m, n) = let
//
val A = $UN.cast{arrayref(a,m*n)}(M)
//
in
  $UN.castvwtp0{matrixptr(a,m,n)}(arrayref_copy<a>(A, m*n))
end // end of [matrixref_copy]

(* ****** ****** *)

implement{a}
matrixref_tabulate
  (nrow, ncol) =
(
  matrixptr_refize (matrixptr_tabulate<a>(nrow, ncol))
) (* end of [matrixref_tabulate] *)

implement{a}
matrixref_tabulate_cloref
  (nrow, ncol, f) =
  matrixptr_refize (matrixptr_tabulate_cloref<a>(nrow, ncol, f))
// end of [matrixref_tabulate_cloref]

(* ****** ****** *)

implement{a}
matrixref_foreach
  (A, m, n) = let
//
var env: void = ()
//
in
  matrixref_foreach_env<a><void> (A, m, n, env)
end // end of [matrixref_foreach]

implement
{a}{env}
matrixref_foreach_env
  (A, m, n, env) = let
  val (vbox pf | p) = matrixref_get_viewptr (A)
in
  $effmask_ref (matrix_foreach_env<a><env> (!p, m, n, env))
end // end of [matrixref_foreach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
matrixref_foreach_cloref
  (A, m, n, fwork) = let
//
implement
{a2}{env}
matrix_foreach$fwork
  (x, env) = let
  val (pf, fpf | p) = $UN.ptr_vtake{a}(addr@x)
  val ((*void*)) = fwork(!p)
  prval ((*void*)) = fpf(pf)
in
  // nothing
end // end of [matrix_foreach$work]
//
in
  matrixref_foreach<a>(A, m, n)
end // end of [matrixref_foreach_cloref]

(* ****** ****** *)

local
//
datatype
mtrxszref
(
  a:viewt@ype
) =
{m,n:int}
MTRXSZREF of
(
  matrixref(a, m, n)
, size_t(m), size_t(n)
) // end of [mtrxszref]
//
assume mtrxszref_vt0ype_type = mtrxszref
//
in (* in of [local] *)

implement{}
mtrxszref_make_matrixref
  (M, nrow, ncol) = MTRXSZREF (M, nrow, ncol)
// end of [mtrxszref_make_matrixref]

(* ****** ****** *)

implement{}
mtrxszref_get_ref (MSZ) = let
  val+MTRXSZREF (M, nrow, ncol) = MSZ in $UN.cast2Ptr1(M)
end // end of [mtrxszref_get_ref]

(* ****** ****** *)

implement{}
mtrxszref_get_nrow (MSZ) = let
  val+MTRXSZREF (M, nrow, ncol) = MSZ in nrow
end // end of [mtrxszref_get_nrow]

implement{}
mtrxszref_get_ncol (MSZ) = let
  val+MTRXSZREF (M, nrow, ncol) = MSZ in ncol
end // end of [mtrxszref_get_ncol]

(* ****** ****** *)

implement{}
mtrxszref_get_refsize
   (MSZ, nrow_r, ncol_r) = let
//
val+MTRXSZREF (M, nrow, ncol) = MSZ
//
prval ((*void*)) = lemma_matrixref_param (M)
//
in
  nrow_r := nrow; ncol_r := ncol; M(*matrixref*)
end // end of [mtrxszref_get_nrow]

end // end of [local]

(* ****** ****** *)

implement{a}
mtrxszref_make_elt
  (nrow, ncol, x) = let
//
val nrow = g1ofg0_uint (nrow)
val ncol = g1ofg0_uint (ncol)
val M =
  matrixref_make_elt<a> (nrow, ncol, x)
//
in
  mtrxszref_make_matrixref (M, nrow, ncol)
end // end of [mtrxszref_make_elt]

(* ****** ****** *)

implement{a}
mtrxszref_get_at_int
  (MSZ, i, j) = let
//
val i = g1ofg0_int(i)
and j = g1ofg0_int(j)
//
in
//
if
i >= 0
then (
//
if
j >= 0
then (
  mtrxszref_get_at_size(MSZ,i2sz(i),i2sz(j))
) else $raise MatrixSubscriptExn((* j < 0 *))
//
) else $raise MatrixSubscriptExn((* i < 0 *))
//
end // end of [mtrxszref_get_at_gint]

implement{a}
mtrxszref_get_at_size
  (MSZ, i, j) = let
//
var nrow: size_t
and ncol: size_t
//
val M =
$effmask_wrt (
  mtrxszref_get_refsize (MSZ, nrow, ncol)
) (* end of [val] *)
//
val i = g1ofg0_uint(i)
and j = g1ofg0_uint(j)
//
in
//
if
nrow > i
then (
//
if
ncol > j
then (
  matrixref_get_at_size (M, i, ncol, j)
) else $raise MatrixSubscriptExn((*void*))
//
) else $raise MatrixSubscriptExn((*void*))
//
end // end of [mtrxszref_get_at_size]

(* ****** ****** *)

implement{a}
mtrxszref_set_at_int
  (MSZ, i, j, x) = let
//
val i = g1ofg0_int(i)
and j = g1ofg0_int(j)
//
in
//
if
i >= 0
then (
//
if
j >= 0
then (
  mtrxszref_set_at_size(MSZ,i2sz(i),i2sz(j),x)
) else $raise MatrixSubscriptExn( (* j < 0 *) )
//
) else $raise MatrixSubscriptExn( (* i < 0 *) )
//
end // end of [mtrxszref_set_at_int]

implement{a}
mtrxszref_set_at_size
  (MSZ, i, j, x) = let
//
var nrow: size_t
and ncol: size_t
//
val M =
(
  mtrxszref_get_refsize (MSZ, nrow, ncol)
) (* end of [val] *)
//
val i = g1ofg0_uint (i)
and j = g1ofg0_uint (j)
//
in
//
if
nrow > i
then (
//
if
ncol > j
then (
  matrixref_set_at_size(M, i, ncol, j, x)
) else $raise MatrixSubscriptExn((*void*))
//
) else $raise MatrixSubscriptExn((*void*))
//
end // end of [mtrxszref_set_at_size]

(* ****** ****** *)

implement{a}
fprint_mtrxszref
  (out, MSZ) = let
//
var nrow: size_t
and ncol: size_t
val A =
  mtrxszref_get_refsize (MSZ, nrow, ncol)
//
in
  fprint_matrixref<a> (out, A, nrow, ncol)
end // end of [fprint_mtrxszref]

implement{a}
fprint_mtrxszref_sep
  (out, MSZ, sep1, sep2) = let
//
var nrow: size_t
and ncol: size_t
val A =
  mtrxszref_get_refsize (MSZ, nrow, ncol)
//
in
  fprint_matrixref_sep<a> (out, A, nrow, ncol, sep1, sep2)
end // end of [fprint_mtrxszref_sep]

(* ****** ****** *)

implement{a}
mtrxszref_foreach
  (A) = let
//
var env: void = ()
//
in
  mtrxszref_foreach_env<a><void> (A, env)
end // end of [mtrxszref_foreach]

implement
{a}{env}
mtrxszref_foreach_env
  (MSZ, env) = let
//
var nrow: size_t and ncol: size_t
//
val MAT = mtrxszref_get_refsize(MSZ, nrow, ncol)
//
in
  matrixref_foreach_env<a><env> (MAT, nrow, ncol, env)
end // end of [mtrxszref_foreach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
mtrxszref_foreach_cloref
  (MSZ, fwork) = let
//
implement
{a2}{env}
matrix_foreach$fwork
  (x, env) = let
  val (pf, fpf | p) = $UN.ptr_vtake{a}(addr@x)
  val ((*void*)) = fwork(!p)
  prval ((*void*)) = fpf(pf)
in
  // nothing
end // end of [matrix_foreach$work]
//
in
  mtrxszref_foreach(MSZ)
end // end of [mtrxszref_foreach_cloref]

(* ****** ****** *)

implement{a}
mtrxszref_tabulate
  (nrow, ncol) = let
//
val nrow = g1ofg0_uint (nrow)
val ncol = g1ofg0_uint (ncol)
val M =
  matrixref_tabulate<a> (nrow, ncol)
//
in 
  mtrxszref_make_matrixref (M, nrow, ncol)
end // end of [mtrxszref_tabulate]

(* ****** ****** *)

implement{a}
mtrxszref_tabulate_cloref
(
  nrow, ncol, fclo
) = let
//
val M =
matrixref_tabulate_cloref<a>
(
  nrow, ncol, fclo
) (* end of [val] *)
//
in
//
mtrxszref_make_matrixref (M, nrow, ncol)
//
end // end of [mtrxszref_tabulate_cloref]

(* ****** ****** *)
//
implement
{a}(*tmp*)
streamize_mtrxszref_row_elt
  (MSZ) = let
//
var m: size_t and n: size_t
//
val M0 = mtrxszref_get_refsize(MSZ, m, n)
//
in
  streamize_matrixref_row_elt<a>(M0, m, n)
end // end of [streamize_mtrxszref_row_elt]
//
implement
{a}(*tmp*)
streamize_mtrxszref_col_elt
  (MSZ) = let
//
var m: size_t and n: size_t
//
val M0 = mtrxszref_get_refsize(MSZ, m, n)
//
in
  streamize_matrixref_col_elt<a>(M0, m, n)
end // end of [streamize_mtrxszref_col_elt]
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
streamize_matrixref_row_elt
  {m,n}(M0, m, n) = let
//
val A0 = $UN.cast{arrayref(a,m*n)}(M0)
//
in
  streamize_arrayref_elt<a>(A0, m * n)
end // end of [streamize_matrixref_row_elt]
//
implement
{a}(*tmp*)
streamize_matrixref_col_elt
  {m,n}
  (M0, m, n) =
  auxmain(i2sz(0)) where
{
//
prval () = lemma_g1uint_param(m)
prval () = lemma_g1uint_param(n)
//
fun
auxmain
(
j : sizeLte(n)
) : stream_vt(a) =
(
if (j < n)
then auxmain2(j, i2sz(0)) else stream_vt_make_nil()
)
//
and
auxmain2
(
j : sizeLt(n),
i : sizeLte(m)
) : stream_vt(a) = $ldelay
(
if
(i < m)
then
stream_vt_cons{a}
  (matrixref_get_at<a>(M0, i, n, j), auxmain2(j, i+1))
else !(auxmain(j+1))
) (* end of [auxmain2] *)
//
} (* end of [streamize_matrixref_col_elt] *)
//
(* ****** ****** *)
//
(* end of [matrixref.dats] *)
