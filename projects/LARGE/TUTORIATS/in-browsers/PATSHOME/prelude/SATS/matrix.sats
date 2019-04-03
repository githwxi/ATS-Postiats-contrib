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
** $PATSHOME/prelude/SATS/CODEGEN/matrix.atxt
** Time of generation: Sun Nov 20 21:18:20 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

vtypedef
RD(a:vt0p) = a // for commenting: read-only
#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

sortdef t0p = t@ype
sortdef vtp = viewtype
sortdef vt0p = viewt@ype

(* ****** ****** *)

absvt@ype
matrix_vt0ype_int_int_vt0ype
  (a:vt@ype+, row:int, col:int) = array(a, row*col)
stadef matrix = matrix_vt0ype_int_int_vt0ype

(* ****** ****** *)

viewdef
matrix_v (
  a:viewt@ype+, l:addr, row:int, col:int
) = matrix (a, row, col) @ l

(* ****** ****** *)

exception
MatrixSubscriptExn of ((*void*))

(* ****** ****** *)
//
praxi
lemma_matrix_param
  {a:vt0p}
  {l:addr}{m,n:int}
(
  M: &matrix(INV(a), m, n)
) : [m >= 0; n >= 0] void
//
praxi
lemma_matrix_v_param
  {a:vt0p}
  {l:addr}{m,n:int}
(
  pf0: !matrix_v(INV(a), l, m, n)
) : [m >= 0; n >= 0] void // end-of-fun
//
(* ****** ****** *)
//
praxi
array2matrix_v
  {a:vt0p}
  {l:addr}{m,n:int}
(
  pf0:
  array_v(INV(a), l, m*n)
) : matrix_v (a, l, m(*nrow*), n(*ncol*))
praxi
matrix2array_v
  {a:vt0p}
  {l:addr}{m,n:int}
  (pf0: matrix_v(INV(a), l, m, n)): array_v (a, l, m*n)
//
(* ****** ****** *)
//
// HX: row-major style
//
absview
matrow_view
(
  a:vt@ype+
, l:addr, m:int, n:int
)
//
stadef matrow_v = matrow_view
//
absview
matcol_view
(
  a:vt@ype+
, l:addr, m:int, n:int
)
//
stadef matcol_v = matcol_view
//
(* ****** ****** *)
//
fun{a:vt0p}
matrix_getref_at_int
  {m,n:int}
(
  M: &RD(matrix(INV(a), m, n))
, i: natLt (m), n: int n, j: natLt (n)
) :<> cPtr1 (a) // end-of-function
//
fun{a:vt0p}
matrix_getref_at_size
  {m,n:int}
(
  M: &RD(matrix(INV(a), m, n))
, i: sizeLt (m), n: size_t n, j: sizeLt (n)
) :<> cPtr1 (a) // end-of-function
//
symintr matrix_getref_at
//
overload
matrix_getref_at with matrix_getref_at_int
overload
matrix_getref_at with matrix_getref_at_size
//
(* ****** ****** *)
//
fun{a:t0p}
matrix_get_at_int
  {m,n:int}
(
  M: &RD(matrix(INV(a), m, n))
, i: natLt (m), n: int n, j: natLt (n)
) :<> (a) // end-of-function
//
overload [] with matrix_get_at_int
//
fun{a:t0p}
matrix_get_at_size
  {m,n:int}
(
  M: &RD(matrix(INV(a), m, n))
, i: sizeLt (m), n: size_t n, j: sizeLt(n)
) :<> (a) // endfun
//
overload [] with matrix_get_at_size
//
symintr matrix_get_at
//
overload
matrix_get_at with matrix_get_at_int of 0
overload
matrix_get_at with matrix_get_at_size of 0
//
(* ****** ****** *)
//
fun{a:t0p}
matrix_set_at_int
  {m,n:int}
(
  M: &matrix(INV(a), m, n)
, i: natLt (m), n: int n, j: natLt (n), x: a
) :<!wrt> void // end-of-function
//
overload [] with matrix_set_at_int
//
fun{a:t0p}
matrix_set_at_size
  {m,n:int}
(
  M: &matrix(INV(a), m, n)
, i: sizeLt (m), n: size_t n, j: sizeLt (n), x: a
) :<!wrt> void // end-of-function
//
overload [] with matrix_set_at_size
//
symintr matrix_set_at
//
overload
matrix_set_at with matrix_set_at_int of 0
overload
matrix_set_at with matrix_set_at_size of 0
//
(* ****** ****** *)

fun{a:vt0p}
matrix_exch_at_int
  {m,n:int}
(
  M: &matrix(INV(a), m, n)
, i: natLt (m), n: int n, j: natLt (n), x: &a>>a
) :<!wrt> void // endfun

fun{a:vt0p}
matrix_exch_at_size
  {m,n:int}
(
  M: &matrix(INV(a), m, n)
, i: sizeLt (m), n: size_t n, j: sizeLt (n), x: &a>>a
) :<!wrt> void // endfun

symintr matrix_exch_at
overload matrix_exch_at with matrix_exch_at_int
overload matrix_exch_at with matrix_exch_at_size

(* ****** ****** *)

fun{a:vt0p}
matrix_ptr_alloc
  {m,n:int}
(
  row: size_t m, col: size_t n
) :<!wrt> [l:agz]
(
  matrix_v(a?, l, m, n), mfree_gc_v (l) | ptr l
) // end of [matrix_ptr_alloc]

fun{}
matrix_ptr_free
  {a:vt0p}{l:addr}{m,n:int}
(
  matrix_v(a?, l, m, n), mfree_gc_v l | ptr l
) :<!wrt> void // end of [matrix_ptr_free]

(* ****** ****** *)
//
fun{a:vt0p}
matrix_tabulate$fopr
  (i: size_t, j: size_t): (a)
//
fun{a:vt0p}
matrix_ptr_tabulate
  {m,n:int}
(
  nrow: size_t m, ncol: size_t n
) : [l:addr]
(
  matrix_v (a, l, m, n), mfree_gc_v (l) | ptr(l)
) (* end of [matrixptr_tabulate] *)
//
(* ****** ****** *)
//
fun{}
fprint_matrix$sep1(out: FILEref): void // col sep
fun{}
fprint_matrix$sep2(out: FILEref): void // row sep
//
fun{a:vt0p}
fprint_matrix_int
  {m,n:int}
(
  out: FILEref
, mat: &matrix(INV(a), m, n), m: int(m), n: int(n)
) : void // end of [fprint_matrix_int]
fun{a:vt0p}
fprint_matrix_size
  {m,n:int}
(
  out: FILEref
, mat: &matrix(INV(a), m, n), m: size_t(m), n: size_t(n)
) : void // end of [fprint_matrix_size]
//
symintr fprint_matrix
//
overload fprint_matrix with fprint_matrix_int
overload fprint_matrix with fprint_matrix_size
//
(* ****** ****** *)

fun{a:vt0p}
fprint_matrix_sep
  {m,n:int}
(
  out: FILEref
, M: &matrix(INV(a), m, n)
, m: size_t(m), n: size_t(n)
, sep1: NSH(string), sep2: NSH(string)
) : void // end of [fprint_matrix_sep]

(* ****** ****** *)

fun{a:vt0p}
matrix_ptr_takeout_elt
  {l0:addr}
  {m,n:int}
  {i,j:nat | i < m; j < n}
(
  pfm: matrix_v(INV(a), l0, m, n)
| base: ptr(l0)
, i: size_t(i), n: size_t(n), j: size_t(j)
) :<>
[l:addr]
(
  a @ l
, a @ l -<lin,prf> matrix_v (a, l0, m, n)
| ptr (l)
) (* end of [matrix_ptr_takeout_elt] *)

fun{a:vt0p}
matrix_ptr_takeout_row
  {l0:addr}
  {m,n:int}
  {i:int | i < m}
(
  pfm: matrix_v(INV(a), l0, m, n)
| base: ptr(l0), i: size_t(i), n: size_t(n)
) :<>
[l:addr]
(
  matrow_v(a, l, m, n)
, matrow_v(a, l, m, n) -<lin,prf> matrix_v(a, l0, m, n)
| ptr (l)
) (* end of [matrix_ptr_takeout_row] *)

fun{a:vt0p}
matrix_ptr_takeout_col
  {l0:addr}
  {m,n:int}
  {i:int | i < m}
(
  pfm: matrix_v(INV(a), l0, m, n)
| base: ptr l0, i: size_t(i), n: size_t(n)
) :<>
[l:addr]
(
  matcol_v(a, l, m, n)
, matcol_v(a, l, m, n) -<lin,prf> matrix_v(a, l0, m, n)
| ptr (l)
) (* end of [matrix_ptr_takeout_col] *)

(* ****** ****** *)
//
fun{}
matrix_foreach$rowsep(): void
fun{
a:vt0p}{env:vt0p
} matrix_foreach$fwork
  (x: &a >> _, env: &(env) >> _): void
fun{
a:vt0p
} matrix_foreach{m,n:int}
(
  M: &matrix(INV(a), m, n) >> _, size_t(m), size_t(n)
) : void // end of [matrix_foreach]
fun{
a:vt0p}{env:vt0p
} matrix_foreach_env{m,n:int}
(
  M: &matrix(INV(a), m, n) >> _, size_t(m), size_t(n), env: &(env) >> _
) : void // end of [matrix_foreach_env]
//
(* ****** ****** *)
//
fun{
a:vt0p}{env:vt0p
} matrix_foreachrow$fwork
  {n:int}
(
  A: &array(INV(a), n) >> _, n: size_t(n), env: &(env) >> _
) : void // end of [matrix_foreachrow$fwork]
//
fun{
a:vt0p
} matrix_foreachrow{m,n:int}
(
  M: &matrix(INV(a), m, n) >> _, m: size_t(m), n: size_t(n)
) : void // end of [matrix_foreachrow]
//
fun{
a:vt0p}{env:vt0p
} matrix_foreachrow_env{m,n:int}
(
  M: &matrix(INV(a), m, n) >> _, m: size_t(m), n: size_t(n), env: &(env) >> _
) : void // end of [matrix_foreachrow_env]
//
(* ****** ****** *)
//
fun{a:vt0p}
matrix_initize$init
  (i: size_t, j: size_t, x: &a? >> a): void
//
fun{a:vt0p}
matrix_initize{m,n:int}
(
  M: &matrix(a?, m, n) >> matrix(a, m, n), m: size_t(m), n: size_t(n)
) : void // end of [matrix_initize]
//
macdef matrix_initialize = matrix_initize
//
(* ****** ****** *)
//
fun{a:vt0p}
matrix_uninitize$clear
  (i: size_t, j: size_t, x: &a >> a?): void
//
fun{a:vt0p}
matrix_uninitize{m,n:int}
(
  M: &matrix(a, m, n) >> matrix(a?, m, n), m: size_t(m), n: size_t(n)
) : void // end of [matrix_uninitize]
//
(* ****** ****** *)

fun
{a:vt0p}
{b:vt0p}
matrix_mapto$fwork
  (x: &a, y: &b? >> b): void
fun
{a:vt0p}
{b:vt0p}
matrix_mapto
  {m,n:int}
(
  A: &matrix(INV(a), m, n)
, B: &matrix(b?, m, n) >> matrix(b, m, n)
, m: size_t m, n: size_t n
) : void // end of [matrix_mapto]

(* ****** ****** *)

fun
{a,b:vt0p}
{c:vt0p}
matrix_map2to$fwork
  (x: &a, y: &b, z: &c? >> c): void
fun
{a,b:vt0p}
{c:vt0p}
matrix_map2to
  {m,n:int}
(
  A: &matrix(INV(a), m, n)
, B: &matrix(INV(b),  m, n)
, C: &matrix(c?, m, n) >> matrix(c, m, n)
, m: size_t m, n: size_t n
) : void // end of [matrix_map2to]

(* ****** ****** *)

(* end of [matrix.sats] *)
