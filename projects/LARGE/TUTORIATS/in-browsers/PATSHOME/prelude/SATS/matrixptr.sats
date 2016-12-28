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
** $PATSHOME/prelude/SATS/CODEGEN/matrixptr.atxt
** Time of generation: Sun Nov 20 21:18:20 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2012 *)

(* ****** ****** *)

typedef SHR(a:type) = a // for commenting purpose
typedef NSH(a:type) = a // for commenting purpose

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)

absvtype
matrixptr_vt0ype_addr_int_int_vtype
  (a:vt@ype+, l: addr, m: int, n: int) = ptr
//
stadef
matrixptr = matrixptr_vt0ype_addr_int_int_vtype
vtypedef
matrixptr
  (a:vt@ype, m: int, n: int) = [l:addr] matrixptr(a, l, m, n)
//
(* ****** ****** *)

absvtype
matrixptrout_vt0ype_addr_int_int_vtype
  (a:vt@ype, l: addr, m: int, n: int) = ptr
//
stadef
matrixptrout = matrixptrout_vt0ype_addr_int_int_vtype
//
(* ****** ****** *)

praxi
lemma_matrixptr_param{a:vt0p}
  {l:addr}{m,n:int} (A: !matrixptr(a, l, m, n)): [m >= 0; n >= 0] void
// end of [lemma_matrixptr_param]

(* ****** ****** *)

castfn
matrixptr_encode :
  {a:vt0p}{l:addr}{m,n:int}
  (matrix_v(INV(a), l, m, n), mfree_gc_v(l) | ptr l) -<0> matrixptr(a, l, m, n)
// end of [matrixptr_encode]

castfn
matrixptr_encode2 :
  {a:vt0p}{l:addr}{m,n:int}
  @(matrix_v(INV(a), l, m, n), mfree_gc_v(l) | ptr l) -<0> matrixptr(a, l, m, n)
// end of [matrixptr_encode2]

(* ****** ****** *)
//
castfn
matrixptr2ptr
  {a:vt0p}
  {l:addr}{m,n:int}
  (A: !matrixptr(INV(a), l, m, n)):<> ptr(l)
//
castfn
matrixptrout2ptr
  {a:t0p}
  {l:addr}{m,n:int}
  (A: !matrixptrout(INV(a), l, m, n)):<> ptr(l)
//
(* ****** ****** *)

praxi
matrixptr_takeout
  {a:vt0p}{l:addr}{m,n:int}
(
  !matrixptr(INV(a), l, m, n) >> matrixptrout(a?, l, m, n)
) : matrix_v(a, l, m, n) // endfun
praxi
matrixptr_addback
  {a:vt0p}{l:addr}{m,n:int}
(
  pf: matrix_v(INV(a), l, m, n)
| mat: !matrixptrout(a?, l, m, n) >> matrixptr(a, l, m, n)
) : void // end of [matrixptr_addback]

(* ****** ****** *)

fun{
} arrayptr2matrixptr_int
  {a:vt0p}{l:addr}{m,n:nat}
  (A: arrayptr(INV(a), l, m*n), m: int m, n: int n):<> matrixptr(a, l, m, n)
fun{
} arrayptr2matrixptr_size
  {a:vt0p}{l:addr}{m,n:int}
  (A: arrayptr(INV(a), l, m*n), m: size_t m, n: size_t n):<> matrixptr(a, l, m, n)
//
symintr arrayptr2matrixptr
overload arrayptr2matrixptr with arrayptr2matrixptr_int
overload arrayptr2matrixptr with arrayptr2matrixptr_size
//
(* ****** ****** *)

fun{
a:t0p
} matrixptr_make_elt
  {m,n:int}
  (m: size_t m, n: size_t n, x: a):<!wrt> matrixptr(a, m, n)
// end of [matrixptr_make_elt]

(* ****** ****** *)

fun{a:t0p}
matrixptr_get_at_int
  {m,n:int}
(
  A: !matrixptr(INV(a), m, n), i: natLt (m), n: int n, j: natLt (n)
) :<> (a) // end of [matrixptr_get_at_int]
fun{a:t0p}
matrixptr_get_at_size
  {m,n:int}
(
  A: !matrixptr(INV(a), m, n), i: sizeLt (m), n: size_t n, j: sizeLt (n)
) :<> (a) // end of [matrixptr_get_at_size]
//
symintr matrixptr_get_at
overload matrixptr_get_at with matrixptr_get_at_int of 0
overload matrixptr_get_at with matrixptr_get_at_size of 0
//
(* ****** ****** *)

fun{a:t0p}
matrixptr_set_at_int
  {m,n:int}
(
  A: !matrixptr(INV(a), m, n), i: natLt (m), n: int n, j: natLt (n), x: a
) :<!wrt> void // end of [matrixptr_set_at_int]
fun{a:t0p}
matrixptr_set_at_size
  {m,n:int}
(
  A: !matrixptr(INV(a), m, n), i: sizeLt (m), n: size_t n, j: sizeLt (n), x: a
) :<!wrt> void // end of [matrixptr_set_at_size]
//
symintr matrixptr_set_at
overload matrixptr_set_at with matrixptr_set_at_int of 0
overload matrixptr_set_at with matrixptr_set_at_size of 0
//
(* ****** ****** *)

fun{a:vt0p}
matrixptr_exch_at_int
  {m,n:int}
(
  A: !matrixptr(INV(a), m, n)
, i: natLt (m), n: int n, j: natLt (n), x: &a>>a
) :<!wrt> void // end of [matrixptr_exch_at_int]
fun{a:vt0p}
matrixptr_exch_at_size
  {m,n:int}
(
  A: !matrixptr(INV(a), m, n)
, i: sizeLt (m), n: size_t n, j: sizeLt (n), x: &a>>a
) :<!wrt> void // end of [matrixptr_exch_at_size]
//
symintr matrixptr_exch_at
overload matrixptr_exch_at with matrixptr_exch_at_int
overload matrixptr_exch_at with matrixptr_exch_at_size
//
(* ****** ****** *)

fun matrixptr_free
  {a:t0p}{l:addr}{m,n:int}
  (A: matrixptr(INV(a), l, m, n)):<!wrt> void = "mac#%"
// end of [matrixptr_free]

(* ****** ****** *)

(*
fprint_matrix$sep1 // col separation
fprint_matrix$sep2 // row separation
*)
fun{a:vt0p}
fprint_matrixptr{m,n:int}
(
  out: FILEref
, M: !matrixptr(INV(a), m, n), m: size_t m, n: size_t n
) : void // end of [fprint_matrixptr]

fun{a:vt0p}
fprint_matrixptr_sep{m,n:int}
(
  out: FILEref
, M: !matrixptr(INV(a), m, n), m: size_t (m), n: size_t (n)
, sep1: NSH(string), sep2: NSH(string)
) : void // end of [fprint_matrixptr_sep]

(* ****** ****** *)
//
(*
fun{a:vt0p}
matrix_initize$init (i: size_t, x: &a >> a?): void
*)
fun{a:vt0p}
matrixptr_initize
  {l:addr}{m,n:int}
(
  M: !matrixptr(a?, l, m, n) >> matrixptr(a, l, m, n), m: size_t(m), n: size_t(n)
) : void // end of [matrixptr_initize]
//
macdef
matrixptr_initialize = matrixptr_initize
//
(* ****** ****** *)
//
(*
fun{a:vt0p}
matrix_uninitize$clear
  (i: size_t, j: size_t, x: &a >> a?): void
*)
fun{a:vt0p}
matrixptr_uninitize
  {l:addr}{m,n:int}
(
  M: !matrixptr(INV(a), l, m, n) >> matrixptr(a?, l, m, n), m: size_t(m), n: size_t(n)
) : void // end of [matrixptr_uninitize]
//
macdef
matrixptr_uninitialize = matrixptr_uninitize
//
(* ****** ****** *)
//
(*
fun{a:vt0p}
matrix_uninitize$clear
  (i: size_t, j: size_t, x: &a >> a?): void
*)
fun{
a:vt0p
} matrixptr_freelin
  {l:addr}{m,n:int}
(
  A: matrixptr(INV(a), l, m, n), m: size_t(m), n: size_t(n)
) : void = "mac#%" // end-of-function
//
(* ****** ****** *)
//
(*
fun{a:vt0p}
matrix_tabulate$fopr (i: size_t, j: size_t): (a)
*)
fun{a:vt0p}
matrixptr_tabulate
  {m,n:int} (nrow: size_t m, ncol: size_t n): matrixptr (a, m, n)
//
fun{a:vt0p}
matrixptr_tabulate_cloref
  {m,n:int}
(
  nrow: size_t m, ncol: size_t n, f: (sizeLt(m), sizeLt(n)) -<cloref> a
) : matrixptr (a, m, n) // end-of-function
//
(* ****** ****** *)

(*
fun{
a:vt0p}{env:vt0p
} matrix_foreach$fwork (x: &a >> _, env: &(env) >> _): void
*)
//
fun{
a:vt0p
} matrixptr_foreach{m,n:int}
(
  A: !matrixptr(INV(a), m, n) >> _, m: size_t m, n: size_t n
) : void // end of [matrixptr_foreach]
fun{
a:vt0p}{env:vt0p
} matrixptr_foreach_env{m,n:int}
(
  A: !matrixptr(INV(a), m, n) >> _, m: size_t m, n: size_t n, env: &(env) >> _
) : void // end of [matrixptr_foreach_env]

(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)

overload [] with matrixptr_get_at_int
overload [] with matrixptr_get_at_size
overload [] with matrixptr_set_at_int
overload [] with matrixptr_set_at_size

(* ****** ****** *)

overload fprint with fprint_matrixptr
overload fprint with fprint_matrixptr_sep

(* ****** ****** *)

overload ptrcast with matrixptr2ptr
overload ptrcast with matrixptrout2ptr

(* ****** ****** *)

(* end of [matrixptr.sats] *)
