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
** $PATSHOME/prelude/SATS/CODEGEN/matrixref.atxt
** Time of generation: Sun Nov 20 21:18:21 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2013 *)

(* ****** ****** *)

#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)
//
// matrixref:
// reference to a matrix
// with no dimension info attached
//
(* ****** ****** *)
//
abstype
matrixref_vt0ype_int_int_type
  (a:vt@ype(*inv*), nrow: int, ncol:int) = ptr
//
stadef matrixref = matrixref_vt0ype_int_int_type
//
(* ****** ****** *)

praxi
lemma_matrixref_param
  {a:vt0p}{m,n:int}
  (M: matrixref(a, m, n)): [m >= 0; n >= 0] void
// end of [lemma_matrixref_param]

(* ****** ****** *)
//
castfn
matrixref2ptr
  {a:vt0p}{m,n:int}(M: matrixref(INV(a), m, n)):<> Ptr0
//
(* ****** ****** *)
//
castfn
matrixptr_refize
  {a:vt0p}{l:addr}{m,n:int}
  (matrixptr(INV(a), l, m, n)):<!wrt> matrixref(a, m, n)
//
castfn
matrixref_get_viewptr
  {a:vt0p}
  {m,n:int}
(
  M: matrixref(a, m, n)
) :<> [l:addr] (vbox(matrix_v(a, l, m, n)) | ptr l)
//
(* ****** ****** *)

castfn
arrayref2matrixref
  {a:vt0p}{m,n:nat}
  (A: arrayref(a, m*n)):<> matrixref(a, m, n)
// end of [arrayref2matrixref]

(* ****** ****** *)

fun{
a:t0p
} matrixref_make_elt
  {m,n:int}
  (size_t(m), size_t(n), x0: a):<!wrt> matrixref(a, m, n)
// end of [matrixref_make_elt]

(* ****** ****** *)

fun{a:t0p}
matrixref_get_at_int
  {m,n:int}
(
  M: matrixref(a, m, n), i: natLt(m), n: int(n), j: natLt(n)
) :<!ref> (a) // end of [matrixref_get_at_int]

fun{a:t0p}
matrixref_get_at_size
  {m,n:int}
(
  M: matrixref(a, m, n), i: sizeLt(m), n: size_t(n), j: sizeLt(n)
) :<!ref> (a) // end of [matrixref_get_at_size]
//
symintr matrixref_get_at
overload matrixref_get_at with matrixref_get_at_int of 0
overload matrixref_get_at with matrixref_get_at_size of 0
//
(* ****** ****** *)

fun{a:t0p}
matrixref_set_at_int
  {m,n:int}
(
  M: matrixref(a, m, n), i: natLt(m), n: int n, j: natLt(n), x: a
) :<!refwrt> void // end of [matrixref_set_at_int]

fun{a:t0p}
matrixref_set_at_size
  {m,n:int}
(
  M: matrixref(a, m, n), i: sizeLt(m), n: size_t n, j: sizeLt(n), x: a
) :<!refwrt> void // end of [matrixref_set_at_size]

symintr matrixref_set_at
overload matrixref_set_at with matrixref_set_at_int of 0
overload matrixref_set_at with matrixref_set_at_size of 0

(* ****** ****** *)

fun{a:vt0p}
matrixref_exch_at_int
  {m,n:int}
(
  M: matrixref(a, m, n)
, i: natLt(m), n: int n, j: natLt(n), x: &a >> _
) :<!refwrt> void // end of [matrixref_exch_at_int]

fun{a:vt0p}
matrixref_exch_at_size
  {m,n:int}
(
  M: matrixref(a, m, n)
, i: sizeLt(m), n: size_t n, j: sizeLt(n), x: &a >> _
) :<!refwrt> void // end of [matrixref_exch_at_size]

symintr matrixref_exch_at
overload matrixref_exch_at with matrixref_exch_at_int of 0
overload matrixref_exch_at with matrixref_exch_at_size of 0

(* ****** ****** *)

(*
fprint_matrix$sep1 // col separation
fprint_matrix$sep2 // row separation
*)
fun{a:vt0p}
fprint_matrixref{m,n:int}
(
  out: FILEref
, M: matrixref(a, m, n), m: size_t m, n: size_t n
) : void // end of [fprint_matrixref]

fun{a:vt0p}
fprint_matrixref_sep{m,n:int}
(
  out: FILEref
, M: matrixref(a, m, n), m: size_t(m), n: size_t(n)
, sep1: NSH(string), sep2: NSH(string)
) : void // end of [fprint_matrixref_sep]

(* ****** ****** *)
//
fun{a:t0p}
matrixref_copy
  {m,n:int}
(
  M: matrixref(a, m, n), m: size_t(m), n: size_t(n)
) : matrixptr (a, m, n) // end-of-fun
//
(* ****** ****** *)

(*
fun{a:vt0p}
matrix_tabulate$fopr (i: size_t, j: size_t): (a)
*)
fun{a:vt0p}
matrixref_tabulate
  {m,n:int} (nrow: size_t m, ncol: size_t n): matrixref(a, m, n)
//
fun{a:vt0p}
matrixref_tabulate_cloref
  {m,n:int}
(
  nrow: size_t m, ncol: size_t n, f: (sizeLt(m), sizeLt(n)) -<cloref> a
) : matrixref(a, m, n) // end-of-fun
//
(* ****** ****** *)

(*
fun{
a:vt0p}{env:vt0p
} matrix_foreach$fwork
  (x: &a >> _, env: &(env) >> _): void
*)
//
fun{
a:vt0p
} matrixref_foreach{m,n:int}
(
  A: matrixref(a, m, n), m: size_t m, n: size_t n
) : void // end of [matrixref_foreach]
//
fun{
a:vt0p}{env:vt0p
} matrixref_foreach_env{m,n:int}
(
  A: matrixref(a, m, n), m: size_t m, n: size_t n, env: &(env) >> _
) : void // end of [matrixref_foreach_env]
//
fun{
a:vt0p
} matrixref_foreach_cloref{m,n:int}
(
  A: matrixref(a, m, n), m: size_t(m), n: size_t(n), fwork: (&(a) >> _) -<cloref1> void 
) : void // end of [mtrxszref_foreach_cloref]
//
(* ****** ****** *)
//
// mtrxszref: a reference to a matrix with size information attached
//
(* ****** ****** *)
//
abstype // in-variant
mtrxszref_vt0ype_type(a:vt@ype) = ptr
//
stadef mtrxszref = mtrxszref_vt0ype_type
//
(* ****** ****** *)

fun{}
mtrxszref_make_matrixref
  {a:vt0p}{m,n:int}
(
  M: matrixref(a, m, n), m: size_t m, n: size_t n
) :<!wrt> mtrxszref(a) // endfun

(* ****** ****** *)
//
fun{}
mtrxszref_get_ref{a:vt0p} (M: mtrxszref(a)):<> Ptr1
//
fun{}
mtrxszref_get_nrow{a:vt0p} (M: mtrxszref(a)):<> size_t
fun{}
mtrxszref_get_ncol{a:vt0p} (M: mtrxszref(a)):<> size_t
//
(* ****** ****** *)

symintr .ref
overload .ref with mtrxszref_get_ref

(* ****** ****** *)

fun{}
mtrxszref_get_refsize{a:vt0p}
(
  M: mtrxszref(a)
, nrol: &size_t? >> size_t m, ncol: &size_t? >> size_t(n)
) :<!wrt> #[m,n:nat] matrixref(a, m, n) // endfun

(* ****** ****** *)

fun{a:t0p}
mtrxszref_make_elt
  (nrow: size_t, ncol: size_t, init: a):<!wrt> mtrxszref(a)
// end of [mtrxszref_make_elt]

(* ****** ****** *)
//
fun{a:t0p}
mtrxszref_get_at_int
  (M: mtrxszref(a), i: int, j: int):<!exnref> (a)
fun{a:t0p}
mtrxszref_get_at_size
  (M: mtrxszref(a), i: size_t, j: size_t):<!exnref> (a)
//
symintr mtrxszref_get_at
overload mtrxszref_get_at with mtrxszref_get_at_int of 0
overload mtrxszref_get_at with mtrxszref_get_at_size of 0
//
(* ****** ****** *)
//
fun{a:t0p}
mtrxszref_set_at_int
  (M: mtrxszref(a), i: int, j: int, x: a):<!exnrefwrt> void
fun{a:t0p}
mtrxszref_set_at_size
  (M: mtrxszref(a), i: size_t, j: size_t, x: a):<!exnrefwrt> void
//
symintr mtrxszref_set_at
overload mtrxszref_set_at with mtrxszref_set_at_int of 0
overload mtrxszref_set_at with mtrxszref_set_at_size of 0
//
(* ****** ****** *)

(*
fprint_matrix$sep1 // col separation
fprint_matrix$sep2 // row separation
*)
fun{a:vt0p}
fprint_mtrxszref
(
  out: FILEref, M: mtrxszref(a)
) : void // end of [fprint_mtrxszref]

fun{a:vt0p}
fprint_mtrxszref_sep
(
  out: FILEref
, M: mtrxszref(a), sep1: NSH(string), sep2: NSH(string)
) : void // end of [fprint_mtrxszref_sep]

(* ****** ****** *)
//
(*
fun{
a:vt0p}{env:vt0p
} matrix_foreach$fwork
  (x: &a >> _, env: &(env) >> _): void
*)
//
fun
{a:vt0p}
mtrxszref_foreach(mtrxszref(a)): void
fun{
a:vt0p}{env:vt0p
} mtrxszref_foreach_env(mtrxszref(a), &(env) >> _) : void
//
fun
{a:vt0p}
mtrxszref_foreach_cloref
  (M: mtrxszref(a), fwork: (&(a) >> _) -<cloref1> void ): void
//
(* ****** ****** *)
//
(*
fun
{a:vt0p}
matrix_tabulate$fopr(i: size_t, j: size_t): (a)
*)
fun
{a:vt0p}
mtrxszref_tabulate
  (nrow: size_t, ncol: size_t): mtrxszref(a)
//
fun
{a:vt0p}
mtrxszref_tabulate_cloref
  {m,n:int}
(
  m: size_t(m), n: size_t(n), f: (sizeLt(m), sizeLt(n)) -<cloref> a
) : mtrxszref(a) // end-of-fun
//
(* ****** ****** *)
//
fun{a:t0p}
streamize_mtrxszref_row_elt
  (MSZ: mtrxszref(a)): stream_vt(a)
fun{a:t0p}
streamize_mtrxszref_col_elt
  (MSZ: mtrxszref(a)): stream_vt(a)
//
fun{a:t0p}
streamize_matrixref_row_elt
  {m,n:int}
  (matrixref(a, m, n), size_t(m), size_t(n)): stream_vt(a)
fun{a:t0p}
streamize_matrixref_col_elt
  {m,n:int}
  (matrixref(a, m, n), size_t(m), size_t(n)): stream_vt(a)
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)

overload [] with matrixref_get_at_int of 0
overload [] with matrixref_get_at_size of 0
overload [] with matrixref_set_at_int of 0
overload [] with matrixref_set_at_size of 0

(* ****** ****** *)

overload [] with mtrxszref_get_at_int of 0
overload [] with mtrxszref_get_at_size of 0
overload [] with mtrxszref_set_at_int of 0
overload [] with mtrxszref_set_at_size of 0

(* ****** ****** *)

overload .nrow with mtrxszref_get_nrow
overload .ncol with mtrxszref_get_ncol

(* ****** ****** *)

overload fprint with fprint_matrixref
overload fprint with fprint_matrixref_sep
overload fprint with fprint_mtrxszref
overload fprint with fprint_mtrxszref_sep

(* ****** ****** *)

overload ptrcast with matrixref2ptr

(* ****** ****** *)

(* end of [matrixref.sats] *)
