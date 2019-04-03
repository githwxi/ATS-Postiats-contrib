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
** $PATSHOME/prelude/SATS/CODEGEN/arrayref.atxt
** Time of generation: Wed Dec 21 14:53:05 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2012 *)

(* ****** ****** *)

#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)
//
// arrayref:
// reference to an array without size attached 
//
(* ****** ****** *)

#if(0)
//
// HX-2013-06:
// it is declared in [basic_dyn.sats]
//
abstype
arrayref_vt0ype_int_type
  (a: vt@ype(*elt*), n: int(*size*)) = ptr
stadef arrayref = arrayref_vt0ype_int_type
#endif

(* ****** ****** *)

praxi
lemma_arrayref_param
  {a:vt0p}{n:int} (A: arrayref(a, n)): [n >= 0] void
// end of [lemma_arrayref_param]

(* ****** ****** *)

castfn
arrayref2ptr{a:vt0p}{n:int} (A: arrayref(a, n)):<> Ptr0

(* ****** ****** *)
//
(*
** HX-2012-06:
** this function essentially passes the proof of array-view
** to GC (leaks it if GC is unavailable)
*)
//
castfn
arrayptr_refize
  {a:vt0p}
  {l:addr}{n:int}
(
  A: arrayptr(INV(a), l, n)
) :<!wrt> arrayref(a, n) // end of [arrayptr_refize]
//
castfn
arrayref_get_viewptr
  {a:vt0p}{n:int}
  (arrayref(a, n)):<> [l:addr] (vbox(array_v(a, l, n)) | ptr(l))
//
(* ****** ****** *)
//
symintr arrayref
//
fun
arrayref_make_arrpsz
  {a:vt0p}{n:int}
  (arrpsz(INV(a), n)):<!wrt> arrayref(a, n) = "mac#%"
//
overload arrayref with arrayref_make_arrpsz
//
(* ****** ****** *)

fun{a:t0p}
arrayref_make_elt
  {n:int}
  (asz: size_t(n), x0: a):<!wrt> arrayref(a, n)
// end of [arrayref_make_elt]

(* ****** ****** *)

fun{}
arrayref_make_intrange
  {l,r:int | l <= r}
  (l: int l, r: int r):<!wrt> arrayref(int, r-l)
// end of [arrayref_make_intrange]

(* ****** ****** *)

fun{a:t0p}
arrayref_make_list{n:int}
  (asz: int n, xs: list(INV(a), n)):<!wrt> arrayref(a, n)
// end of [arrayref_make_list]

fun{a:t0p}
arrayref_make_rlist{n:int}
  (asz: int n, xs: list(INV(a), n)):<!wrt> arrayref(a, n)
// end of [arrayref_make_rlist]

(* ****** ****** *)
//
// HX-2014-02:
// [A] must survive [arrayref_tail(A)]
// in order to support proper garbage-collection
//
fun{a:t0p}
arrayref_head
  {n:pos} (A: arrayref(a, n)):<!ref> (a) // A[0]
fun{a:t0p}
arrayref_tail
  {n:pos} (A: arrayref(a, n)):<!ref> arrayref(a, n-1)
//
(* ****** ****** *)
//
fun{
a:t0p}{tk:tk
} arrayref_get_at_gint
  {n:int}{i:nat | i < n}
(
  A: arrayref(a, n), i: g1int(tk, i)
) :<!ref> a // end of [arrayref_get_at_gint]
//
fun{
a:t0p}{tk:tk
} arrayref_get_at_guint
  {n:int}{i:nat | i < n}
(
  A: arrayref(a, n), i: g1uint(tk, i)
) :<!ref> a // end of [arrayref_get_at_guint]
//
symintr arrayref_get_at
overload arrayref_get_at with arrayref_get_at_gint of 0
overload arrayref_get_at with arrayref_get_at_guint of 0
//
(* ****** ****** *)
//
fun{
a:t0p}{tk:tk
} arrayref_set_at_gint
  {n:int}{i:nat | i < n} (
  A: arrayref(a, n), i: g1int(tk, i), x: a
) :<!refwrt> void // end of [arrayref_set_at_gint]
//
fun{
a:t0p}{tk:tk
} arrayref_set_at_guint
  {n:int}{i:nat | i < n} (
  A: arrayref(a, n), i: g1uint(tk, i), x: a
) :<!refwrt> void // end of [arrayref_set_at_guint]
//
symintr arrayref_set_at
overload arrayref_set_at with arrayref_set_at_gint of 0
overload arrayref_set_at with arrayref_set_at_guint of 0
//
(* ****** ****** *)

fun{
a:vt0p}{tk:tk
} arrayref_exch_at_gint
  {n:int}{i:nat | i < n} (
  A: arrayref(a, n), i: g1int(tk, i), x: &a >> _
) :<!refwrt> void // end of [arrayref_exch_at_gint]

fun{
a:vt0p}{tk:tk
} arrayref_exch_at_guint
  {n:int}{i:nat | i < n} (
  A: arrayref(a, n), i: g1uint(tk, i), x: &a >> _
) :<!refwrt> void // end of [arrayref_exch_at_guint]

symintr arrayref_exch_at
overload arrayref_exch_at with arrayref_exch_at_gint of 0
overload arrayref_exch_at with arrayref_exch_at_guint of 0

(* ****** ****** *)

fun{a:vt0p}
arrayref_interchange
  {n:int}
  (A: arrayref(a, n), i: sizeLt n, j: sizeLt n):<!refwrt> void
// end of [arrayref_interchange]

(* ****** ****** *)

fun{a:vt0p}
arrayref_subcirculate
  {n:int}
  (A: arrayref(a, n), i: sizeLt n, j: sizeLt n):<!refwrt> void
// end of [arrayref_subcirculate]

(* ****** ****** *)

(*
fun{}
fprint_array$sep (out: FILEref): void
*)
fun{a:vt0p}
fprint_arrayref
  {n:int} (
  out: FILEref, A: arrayref(a, n), n: size_t(n)
) : void // end of [fprint_arrayref]
fun{a:vt0p}
fprint_arrayref_sep
  {n:int} (
  out: FILEref
, A: arrayref(a, n), asz: size_t(n), sep: NSH(string)
) : void // end of [fprint_arrayref_sep]

(* ****** ****** *)

fun{a:t0p}
arrayref_copy{n:int}
  (A: arrayref(a, n), n: size_t(n)): arrayptr(a, n)
// end of [arrayref_copy]

(* ****** ****** *)
//
(*
fun{a:vt0p}
array_tabulate$fopr (index: size_t): (a)
*)
fun{a:vt0p}
arrayref_tabulate
  {n:int} (asz: size_t(n)): arrayref(a, n)
//
fun{a:vt0p}
arrayref_tabulate_cloref
  {n:int}
(
  asz: size_t(n), fopr: (sizeLt(n)) -<cloref> a
) : arrayref(a, n) // end-of-function
//
(* ****** ****** *)

(*
fun{a:vt0p}{env:vt0p}
array_foreach$cont (x: &a, env: &env): void
fun{a:vt0p}{env:vt0p}
array_foreach$fwork (x: &a >> a, env: &(env) >> _): void
*)
fun
{a:vt0p}
arrayref_foreach{n:int}
(
  A: arrayref(a, n), asz: size_t(n)
) : sizeLte(n) // end of [arrayref_foreach]
fun
{a:vt0p}
{env:vt0p}
arrayref_foreach_env{n:int}
(
  A: arrayref(a, n), asz: size_t(n), env: &env >> _
) : sizeLte(n) // end of [arrayref_foreach_env]

(* ****** ****** *)

(*
fun
{a:vt0p}
{env:vt0p}
array_iforeach$cont
  (i: size_t, x: &a, env: &env): void
fun
{a:vt0p}
{env:vt0p}
array_iforeach$fwork
  (i: size_t, x: &a >> a, env: &(env) >> _): void
*)
fun
{a:vt0p}
arrayref_iforeach{n:int}
(
  A: arrayref(a, n), asz: size_t(n)
) : sizeLte(n) // end of [arrayref_iforeach]
fun
{a:vt0p}
{env:vt0p}
arrayref_iforeach_env{n:int}
(
  A: arrayref(a, n), asz: size_t(n), env: &(env)>>env
) : sizeLte(n) // end of [arrayref_iforeach_env]

(* ****** ****** *)

(*
fun{a:vt0p}{env:vt0p}
array_rforeach$cont (x: &a, env: &env): void
fun{a:vt0p}{env:vt0p}
array_rforeach$fwork (x: &a >> a, env: &(env) >> _): void
*)
fun{
a:vt0p
} arrayref_rforeach{n:int}
(
  A: arrayref(a, n), asz: size_t(n)
) : sizeLte(n) // end of [arrayref_rforeach]
fun{
a:vt0p}{env:vt0p
} arrayref_rforeach_env{n:int}
(
  A: arrayref(a, n), asz: size_t(n), env: &(env)>>env
) : sizeLte(n) // end of [arrayref_rforeach_env]

(* ****** ****** *)
//
fun
{a:vt0p}
arrayref_quicksort
  {n:int}(A: arrayref(a, n), asz: size_t(n)): void
//
(* ****** ****** *)
(*
//
// HX: see below
//
fun
{a:t0p}
streamize_arrayref_elt
  {n:int}
  (A: arrayref(a, n), asz: size_t(n)):<!wrt> stream_vt(a)
*)
(* ****** ****** *)
//
// arrszref:
// reference to an array with its size attached
//
(* ****** ****** *)

#if(0)
//
// HX-2013-06:
// it is declared in [basic_dyn.sats]
//
abstype
arrszref_vt0ype_type (a: vt@ype) = ptr
stadef arrszref = arrszref_vt0ype_type
//
#endif

(* ****** ****** *)

symintr arrszref

(* ****** ****** *)

fun{}
arrszref_make_arrpsz
  {a:vt0p}{n:int}
  (arrpsz (INV(a), n)):<!wrt> arrszref(a)
//
overload arrszref with arrszref_make_arrpsz
//
(* ****** ****** *)

fun{}
arrszref_make_arrayref
  {a:vt0p}{n:int}
  (A: SHR(arrayref(a, n)), n: size_t(n)):<!wrt> arrszref(a)
// end of [arrszref_make_arrayref]

(* ****** ****** *)

fun{
} arrszref_get_ref{a:vt0p} (A: arrszref(a)):<> Ptr1
fun{
} arrszref_get_size{a:vt0p} (A: arrszref(a)):<> size_t

(* ****** ****** *)
//
fun{}
arrszref_get_refsize{a:vt0p}
(
  A: arrszref(a), asz: &size_t? >> size_t(n)
) :<!wrt> #[n:nat] arrayref(a, n) // end-of-fun
//
(* ****** ****** *)

fun{a:t0p}
arrszref_make_elt (asz: size_t, x: a):<!wrt> arrszref(a)
// end of [arrszref_make_elt]

(* ****** ****** *)

fun{a:t0p}
arrszref_make_list (xs: List (INV(a))):<!wrt> arrszref(a)
// end of [arrszref_make_list]

fun{a:t0p}
arrszref_make_rlist (xs: List (INV(a))):<!wrt> arrszref(a)
// end of [arrszref_make_rlist]

(* ****** ****** *)

(*
fun{}
fprint_array$sep (out: FILEref): void
*)
fun{a:vt0p}
fprint_arrszref
  (out: FILEref, A: arrszref(a)): void
// end of [fprint_arrszref]
fun{a:vt0p}
fprint_arrszref_sep (
  out: FILEref, A: arrszref(a), sep: NSH(string)
) : void // end of [fprint_arrszref_sep]

(* ****** ****** *)
//
fun{a:t0p}
arrszref_get_at_size
  (A: arrszref(a), i: size_t):<!exnref> a
//
fun{
a:t0p}{tk:tk
} arrszref_get_at_gint
  (A: arrszref(a), i: g0int(tk)):<!exnref> a
//
fun{
a:t0p}{tk:tk
} arrszref_get_at_guint
  (A: arrszref(a), i: g0uint(tk)):<!exnref> a
//
symintr arrszref_get_at
overload arrszref_get_at with arrszref_get_at_gint of 0
overload arrszref_get_at with arrszref_get_at_guint of 0
//
(* ****** ****** *)
//
fun{a:t0p}
arrszref_set_at_size
  (A: arrszref(a), i: size_t, x: a):<!exnrefwrt> void
//
fun{
a:t0p}{tk:tk
} arrszref_set_at_gint
  (A: arrszref(a), i: g0int(tk), x: a):<!exnrefwrt> void
//
fun{
a:t0p}{tk:tk
} arrszref_set_at_guint
  (A: arrszref(a), i: g0uint(tk), x: a):<!exnrefwrt> void
//
symintr arrszref_set_at
overload arrszref_set_at with arrszref_set_at_gint of 0
overload arrszref_set_at with arrszref_set_at_guint of 0
//
(* ****** ****** *)

fun{a:vt0p}
arrszref_exch_at_size
  (A: arrszref(a), i: size_t, x: &a >> _):<!exnrefwrt> void
// end of [arrszref_exch_at_size]

fun{
a:vt0p}{tk:tk
} arrszref_exch_at_gint
  (A: arrszref(a), i: g0int(tk), x: &a >> _):<!exnrefwrt> void
// end of [arrszref_exch_at_gint]

fun{
a:vt0p}{tk:tk
} arrszref_exch_at_guint
  (A: arrszref(a), i: g0uint(tk), x: &a >> _):<!exnrefwrt> void
// end of [arrszref_exch_at_guint]

symintr arrszref_exch_at
overload arrszref_exch_at with arrszref_exch_at_gint of 0
overload arrszref_exch_at with arrszref_exch_at_guint of 0

(* ****** ****** *)

fun{a:vt0p}
arrszref_interchange
  (A: arrszref(a), i: size_t, j: size_t):<!exnrefwrt> void
// end of [arrszref_interchange]

(* ****** ****** *)

fun{a:vt0p}
arrszref_subcirculate
  (A: arrszref(a), i: size_t, j: size_t):<!exnrefwrt> void
// end of [arrszref_subcirculate]

(* ****** ****** *)
//
(*
fun{a:vt0p}
array_tabulate$fopr(size_t): (a)
*)
fun{a:vt0p}
arrszref_tabulate(asz: size_t): arrszref(a)
//
fun{a:vt0p}
arrszref_tabulate_cloref
  {n:int}
  (size_t(n), (sizeLt(n)) -<cloref> a): arrszref(a)
//
(* ****** ****** *)
//
// HX: for streamization of arrays
//
(* ****** ****** *)
//
fun{a:t0p}
streamize_arrszref_elt
  (ASZ: arrszref(a)): stream_vt(a)
fun{a:t0p}
streamize_arrayref_elt
  {n:int}(A: arrayref(a, n), n: size_t(n)): stream_vt(a)
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)
//
overload [] with arrayref_get_at_gint of 0
overload [] with arrayref_set_at_gint of 0
overload [] with arrszref_get_at_gint of 0
overload [] with arrszref_set_at_gint of 0
//
overload [] with arrayref_get_at_guint of 0
overload [] with arrayref_set_at_guint of 0
overload [] with arrszref_get_at_guint of 0
overload [] with arrszref_set_at_guint of 0
//
(* ****** ****** *)

overload .head with arrayref_head
overload .tail with arrayref_tail

(* ****** ****** *)

overload size with arrszref_get_size
overload .size with arrszref_get_size

(* ****** ****** *)

overload fprint with fprint_arrayref
overload fprint with fprint_arrayref_sep
overload fprint with fprint_arrszref
overload fprint with fprint_arrszref_sep

(* ****** ****** *)

overload ptrcast with arrayref2ptr

(* ****** ****** *)

(* end of [arrayref.sats] *)
