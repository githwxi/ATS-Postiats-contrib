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
** $PATSHOME/prelude/DATS/CODEGEN/matrix.atxt
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
matrix_getref_at_int
  (M, i, n, j) =
  $UN.cast{cPtr1(a)}(ptr_add<a> (addr@(M), i*n+j))
// end of [matrix_getref_at_int]

implement{a}
matrix_getref_at_size
  (M, i, n, j) =
  $UN.cast{cPtr1(a)}(ptr_add<a> (addr@(M), i*n+j))
// end of [matrix_getref_at_size]

(* ****** ****** *)

implement{a}
matrix_get_at_int
  (M, i, n, j) = $UN.cptr_get (matrix_getref_at_int (M, i, n, j))
// end of [matrix_get_at_int]

implement{a}
matrix_set_at_int
  (M, i, n, j, x) = $UN.cptr_set (matrix_getref_at_int (M, i, n, j), x)
// end of [matrix_set_at_int]

implement{a}
matrix_exch_at_int
  (M, i, n, j, x) = $UN.cptr_exch (matrix_getref_at_int (M, i, n, j), x)
// end of [matrix_exch_at_int]

(* ****** ****** *)

implement{a}
matrix_get_at_size
  (M, i, n, j) = $UN.cptr_get (matrix_getref_at_size (M, i, n, j))
// end of [matrix_get_at_size]

implement{a}
matrix_set_at_size
  (M, i, n, j, x) = $UN.cptr_set (matrix_getref_at_size (M, i, n, j), x)
// end of [matrix_set_at_size]

implement{a}
matrix_exch_at_size
  (M, i, n, j, x) = $UN.cptr_exch (matrix_getref_at_size (M, i, n, j), x)
// end of [matrix_exch_at_size]

(* ****** ****** *)

implement{a}
matrix_ptr_alloc
  (row, col) = let
//
val
(
  pfarr, pfgc | p
) = array_ptr_alloc<a> (row*col)
//
prval pfmat = array2matrix_v(pfarr)
//
in
  @(pfmat, pfgc | p)
end // end of [matrix_ptr_alloc]

(* ****** ****** *)

implement{}
matrix_ptr_free
  {a}(pfmat, pfgc | p) = let
//
prval
pfarr = matrix2array_v{a?}(pfmat)
//
in
  array_ptr_free (pfarr, pfgc | p)
end // end of [matrix_ptr_free]

(* ****** ****** *)

implement{a}
matrix_ptr_tabulate
  (row, col) = let
//
val (pf, pfgc | p) = matrix_ptr_alloc<a> (row, col)
//
implement
matrix_initize$init<a> (i, j, x) = x := matrix_tabulate$fopr<a> (i, j)
//
val () = matrix_initize<a> (!p, row, col)
//
in
  @(pf, pfgc | p)
end // end of [matrix_ptr_tabulate]

(* ****** ****** *)

implement{}
fprint_matrix$sep1 (out) = fprint (out, ", ")
implement{}
fprint_matrix$sep2 (out) = fprint (out, "; ")

implement{a}
fprint_matrix_int
  (out, M, m, n) = let
//
prval () = lemma_matrix_param (M)
//
in
  fprint_matrix_size (out, M, i2sz(m), i2sz(n))
end // end of [fprint_matrix_int]

implement{a}
fprint_matrix_size
  {m,n} (out, M, m, n) = let
//
implement
fprint_array$sep<> (out) = fprint_matrix$sep1 (out)
//
fun loop {l:addr}
(
  out: FILEref, p0: ptr l, m: size_t m, n: size_t n, i: size_t
) : void = let
in
//
if i < m then let
  val () =
  (
    if i > 0 then fprint_matrix$sep2 (out)
  ) : void // end of [val]
  val (
    pf, fpf | p0
  ) = $UN.ptr_vtake{array(a,n)}(p0)
  val () = fprint_array (out, !p0, n)
  prval () = fpf (pf)
in
  loop (out, ptr_add<a> (p0, n), m, n, succ(i))
end else () // end of [if]
//
end // end of [loop]
//
in
  loop (out, addr@ (M), m, n, i2sz(0))
end // end of [fprint_matrix_size]

(* ****** ****** *)

implement{a}
fprint_matrix_sep
(
  out, M, m, n, sep1, sep2
) = let
//
implement
fprint_matrix$sep1<>
  (out) = fprint (out, sep1)
implement
fprint_matrix$sep2<>
  (out) = fprint (out, sep2)
//
in
  fprint_matrix_size (out, M, m, n)
end // end of [fprint_matrix_sep]

(* ****** ****** *)
//
implement
{}(*tmp*)
matrix_foreach$rowsep() = ()
//
implement{a}
matrix_foreach
  (A, m, n) = let
//
var env: void = ()
//
in
  matrix_foreach_env<a><void> (A, m, n, env)
end // end of [matrix_foreach]
//
(*
implement
{a}{env}
matrix_foreach_env
  (A, m, n, env) = let
//
implement
array_foreach$cont<a><env>
  (x, env) = true
implement
array_foreach$fwork<a><env>
  (x, env) =
  matrix_foreach$fwork<a><env> (x, env)
//
val p = addr@(A)
prval pf = matrix2array_v{a}(view@(A))
//
val _(*mn*) = array_foreach_env<a> (!p, m*n, env)
prval ((*void*)) = view@(A) := array2matrix_v{a}(pf)
//
in
  // nothing
end // end of [matrix_foreach_env]
*)
//
implement
{a}{env}
matrix_foreach_env
  {m,n}(M, m, n, env) = let
//
prval () = lemma_matrix_param(M)
//
fnx
loop1
(
  p: ptr
, i: sizeLte(m), env: &env >> _
) : void = (
//
if
i < m
then loop2(p, i, i2sz(0), env) where
{
  val () =
    if i > 0 then matrix_foreach$rowsep()
  // end of [val]
}
//
) (* end of [loop1] *)
//
and
loop2
(
  p: ptr
, i: sizeLt(m), j: sizeLte(n), env: &env >> _
) : void = (
//
if
j < n
then let
//
val
(pf, fpf | p) =
$UN.ptr_vtake{a}(p)
//
val ((*void*)) =
  matrix_foreach$fwork<a><env>(!p, env)
//
prval ((*void*)) = fpf(pf)
//
in
  loop2(ptr_succ<a>(p), i, succ(j), env)
end // end of [then]
else loop1(p, succ(i), env) // end of [else]
//
) (* end of [loop2] *)
//
in
  loop1(addr@M, i2sz(0), env)
end // end of [matrix_foreach_env]
//
(* ****** ****** *)

implement{a}
matrix_foreachrow
  (A, m, n) = let
//
var env: void = ()
//
in
  matrix_foreachrow_env<a><void> (A, m, n, env)
end // end of [matrix_foreachrow]

implement
{a}{env}
matrix_foreachrow_env
  {m,n}(M, m, n, env) = let
//
prval () = lemma_matrix_param(M)
//
fun
loop
(
  p: ptr, i: sizeLte(m), env: &env >> _
) : void = (
//
if
i < m
then let
//
val
(pf, fpf | p) =
$UN.ptr_vtake{@[a][n]}(p)
val () =
  matrix_foreachrow$fwork<a><env>(!p, n, env)
prval ((*void*)) = fpf(pf)
//
in
  loop(ptr_add<a>(p, n), succ(i), env)
end // end of [then]
else () // end of [else]
//
) (* end of [loop] *)
//
in
  loop(addr@M, i2sz(0), env)
end // end of [matrix_foreachrow_env]

(* ****** ****** *)

implement{a}
matrix_initize
  (M, m, n) = let
//
infixl (/) %
#define % g0uint_mod
//
implement
array_initize$init<a>
  (ij, x) = let
in
  matrix_initize$init<a> (ij/n, ij%n, x)
end // end of [array_initize$init]
//
val p = addr@(M)
prval pf = matrix2array_v{a?}(view@(M))
val () = array_initize<a> (!p, m * n)
prval () = view@(M) := array2matrix_v{a}(pf)
//
in
  // nothing
end // end of [matrix_initize]

(* ****** ****** *)

implement{a}
matrix_uninitize
  (M, m, n) = let
//
infixl (/) %
#define % g0uint_mod
//
implement
array_uninitize$clear<a>
  (ij, x) = let
in
  matrix_uninitize$clear<a> (ij/n, ij%n, x)
end // end of [array_uninitize$clear]
//
val p = addr@(M)
prval pf = matrix2array_v{a}(view@(M))
val () = array_uninitize<a> (!p, m * n)
prval () = view@(M) := array2matrix_v{a?}(pf)
//
in
  // nothing
end // end of [matrix_uninitize]

(* ****** ****** *)

implement
{a}{b}
matrix_mapto
  {m,n} (A, B, m, n) = let
//
val pA = addr@(A)
val pB = addr@(B)
//
prval pfA = matrix2array_v{a}(view@(A))
prval pfB = matrix2array_v{b?}(view@(B))
//
local
//
implement
array_mapto$fwork<a><b>
  (x, y) = matrix_mapto$fwork<a><b> (x, y)
//
in (* in of [local] *)
//
val ((*void*)) = array_mapto<a><b> (!pA, !pB, m*n)
//
end // end of [local]
//
prval () = view@(A) := array2matrix_v {a}{..}{m,n} (pfA)
prval () = view@(B) := array2matrix_v {b}{..}{m,n} (pfB)
//
in
  // nothing
end (* end of [matrix_mapto] *)

(* ****** ****** *)

implement
{a,b}{c}
matrix_map2to
  {m,n} (A, B, C, m, n) = let
//
val pA = addr@(A)
val pB = addr@(B)
val pC = addr@(C)
//
prval pfA = matrix2array_v{a}(view@(A))
prval pfB = matrix2array_v{b}(view@(B))
prval pfC = matrix2array_v{c?}(view@(C))
//
local
//
implement
array_map2to$fwork<a,b><c>
  (x, y, z) = matrix_map2to$fwork<a,b><c> (x, y, z)
//
in (* in of [local] *)
//
val ((*void*)) = array_map2to<a,b><c> (!pA, !pB, !pC, m*n)
//
end // end of [local]
//
prval () = view@(A) := array2matrix_v {a}{..}{m,n} (pfA)
prval () = view@(B) := array2matrix_v {b}{..}{m,n} (pfB)
prval () = view@(C) := array2matrix_v {c}{..}{m,n} (pfC)
//
in
  // nothing
end (* end of [matrix_map2to] *)

(* ****** ****** *)

(* end of [matrix.dats] *)
