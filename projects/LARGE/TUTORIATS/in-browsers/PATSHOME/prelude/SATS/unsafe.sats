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
** $PATSHOME/prelude/SATS/CODEGEN/unsafe.atxt
** Time of generation: Sun Nov 20 21:18:17 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: April, 2012 *)

(* ****** ****** *)

#define
ATS_PACKNAME "ATSLIB.prelude.unsafe"

(* ****** ****** *)

sortdef t0p = t@ype and vt0p = viewt@ype

(* ****** ****** *)
//
praxi
prop_assert{b:bool}((*void*)): [b] void
//
praxi
proof_assert{proof:prop}((*void*)): proof
//
praxi
eqint_assert{i1,i2:int}((*void*)): EQINT(i1,i2)
praxi
eqaddr_assert{l1,l2:addr}((*void*)): EQADDR(l1,l2)
praxi
eqbool_assert{b1,b2:bool}((*void*)): EQBOOL(b1,b2)
//
(* ****** ****** *)
//
castfn
cast{to:t0p}{from:t0p} (x: INV(from)):<> to
//
(* ****** ****** *)
//
castfn
castvwtp0
  {to:vt0p}{from:vt0p} (x: INV(from)):<> to
//
// HX:
// [castvwtp1] is mostly used in a situation
// where a linear value is passed as a read-only value;
// for instance, casting [strptr] to [string] is often
// done for treating a linear string as a nonlinear one
// temporarily.
//
castfn
castvwtp1
  {to:vt0p}{from:vt0p} (x: !INV(from)>>from):<> to
//
(* ****** ****** *)
//
castfn cast2ptr {a:type} (x: INV(a)):<> ptr
castfn cast2Ptr0 {a:type} (x: INV(a)):<> Ptr0
castfn cast2Ptr1 {a:type} (x: INV(a)):<> Ptr1
//
castfn cast2int {a:t0p} (x: INV(a)):<> int
castfn cast2uint {a:t0p} (x: INV(a)):<> uint
//
castfn cast2lint {a:t0p} (x: INV(a)):<> lint
castfn cast2ulint {a:t0p} (x: INV(a)):<> ulint
//
castfn cast2llint {a:t0p} (x: INV(a)):<> llint
castfn cast2ullint {a:t0p} (x: INV(a)):<> ullint
//
castfn cast2size {a:t0p} (x: INV(a)):<> size_t
castfn cast2ssize {a:t0p} (x: INV(a)):<> ssize_t
//
castfn cast2sint {a:t0p} (x: INV(a)):<> sint
castfn cast2usint {a:t0p} (x: INV(a)):<> usint
//
castfn cast2intptr {a:t0p} (x: INV(a)):<> intptr
castfn cast2uintptr {a:t0p} (x: INV(a)):<> uintptr
//
(* ****** ****** *)

praxi cast2void{a:vt0p}(x: INV(a)):<prf> void

(* ****** ****** *)
//
praxi castview0 {to:view}{from:view} (pf: from):<prf> to
praxi castview1 {to:view}{from:view} (pf: !INV(from)):<prf> to
//
(* ****** ****** *)
//
praxi
castview2void
  {to:view}{from:view}(x: !INV(from) >> to):<prf> void
praxi
castvwtp2void
  {to:vt0p}{from:vt0p}(x: !INV(from) >> to):<prf> void
//
praxi
castview2void_at
  {to:vt0p}{from:vt0p}{l:addr}(x: !INV(from@l) >> to@l):<prf> void
//
(* ****** ****** *)

fun{} int2ptr (i: int): ptr and ptr2int (p: ptr): int

(* ****** ****** *)
//
// HX: these are popular ones:
//
castfn list_vt2t
  {a:t0p}{n:int} (xs: !list_vt (INV(a), n)):<> list (a, n)
// end of [list_vt2t]

castfn arrayptr2ref
  {a:vt0p}{n:int} (x: !arrayptr (INV(a), n)):<> arrayref (a, n)
// end of [arrayptr2ref]

castfn strptr2string {l:agz} (x: !strptr l):<> String0
castfn strptr2stropt {l:addr} (x: !strptr l):<> Stropt0
castfn strnptr2string {l:addr}{n:nat} (x: !strnptr (l, n)):<> string (n)

(* ****** ****** *)
//
// HX: only if you know what you are doing ...
//
symintr ptr_vtake
//
castfn
ptr0_vtake
  {a:vt0p}
(
  p0: ptr
) :<> [l:addr] (a@l, a@l -<lin,prf> void | ptr l)
castfn
ptr1_vtake
  {a:vt0p}{l:addr}
  (p0: ptr(l)):<> (a@l, a@l -<lin,prf> void | ptr l) 
//
overload ptr_vtake with ptr0_vtake of 0
overload ptr_vtake with ptr1_vtake of 10
//
(* ****** ****** *)

castfn
ref_vtake{a:vt0p}
  {l:addr} (r: ref (a)):<> [l:addr] (a@l, a@l -<lin,prf> void | ptr l)
// end of [ref_vtake]

(* ****** ****** *)

praxi
vtakeout_void {v:view} (pf: !v): vtakeout0 (v)
castfn
vttakeout_void {a:vt0p} (x: !a):<> vttakeout0 (a)

(* ****** ****** *)
//
// HX: only if you know what you are doing ...
//
fun{a:vt0p} ptr0_get (p: ptr):<> a
fun{a:vt0p} ptr1_get (p: Ptr1):<> a
//
fun{a:vt0p} ptr0_set (p: ptr, x: INV(a)):<!wrt> void
fun{a:vt0p} ptr1_set (p: Ptr1, x: INV(a)):<!wrt> void
//
fun{a:vt0p} ptr0_exch (p: ptr, x: &INV(a) >> a):<!wrt> void
fun{a:vt0p} ptr1_exch (p: Ptr1, x: &INV(a) >> a):<!wrt> void
//
fun{a:vt0p} ptr0_intch (p1: ptr, p2: ptr):<!wrt> void
fun{a:vt0p} ptr1_intch (p1: Ptr1, p2: Ptr1):<!wrt> void
//
(* ****** ****** *)
//
fun{a:vt0p}
ptr0_getinc(p: &ptr >> _): a
fun{a:vt0p}
ptr1_getinc{l:addr}(p: &ptr(l) >> ptr(l+sizeof(a))): a
//
fun{a:vt0p}
ptr0_setinc(p: &ptr >> _, x: a): void
fun{a:vt0p}
ptr1_setinc{l:addr}(p: &ptr(l) >> ptr(l+sizeof(a)), x: a): void
//
(* ****** ****** *)
//
fun{a:vt0p}
ptr0_get_at_int (p: ptr, i: int):<> a
fun{a:vt0p}
ptr0_set_at_int (p: ptr, i: int, x: a):<!wrt> void
//
fun{a:vt0p}
ptr0_get_at_size (p: ptr, i: size_t):<> a
fun{a:vt0p}
ptr0_set_at_size (p: ptr, i: size_t, x: a):<!wrt> void
//
symintr ptr0_get_at
symintr ptr0_set_at
//
overload ptr0_get_at with ptr0_get_at_int
overload ptr0_set_at with ptr0_set_at_int
overload ptr0_get_at with ptr0_get_at_size
overload ptr0_set_at with ptr0_set_at_size
//
(* ****** ****** *)
//
// HX-2012-06:
// generic ops on numbers: +=, -=, *=, /=, %=
//
fun{a:t0p}
ptr0_addby (p: ptr, x: a):<!wrt> void // !p += x
fun{a:t0p}
ptr1_addby (p: Ptr1, x: a):<!wrt> void // !p += x
//
fun{a:t0p}
ptr0_subby (p: ptr, x: a):<!wrt> void // !p -= x
fun{a:t0p}
ptr1_subby (p: Ptr1, x: a):<!wrt> void // !p -= x
//
fun{a:t0p}
ptr0_mulby (p: ptr, x: a):<!wrt> void // !p *= x
fun{a:t0p}
ptr1_mulby (p: Ptr1, x: a):<!wrt> void // !p *= x
//
fun{a:t0p}
ptr0_divby (p: ptr, x: a):<!exnwrt> void // !p /= x
fun{a:t0p}
ptr1_divby (p: Ptr1, x: a):<!exnwrt> void // !p /= x
//
fun{a:t0p}
ptr0_modby (p: ptr, x: a):<!exnwrt> void // !p %= x
fun{a:t0p}
ptr1_modby (p: Ptr1, x: a):<!exnwrt> void // !p %= x
//
(* ****** ****** *)

fun
{a:vt0p}
ptr1_list_next(p: Ptr1): Ptr0 // HX: &(p->next)

(* ****** ****** *)
//
// HX: only if you know what you are doing ...
//
castfn
ptr2cptr{a:vt0p}{l:addr}(p: ptr(l)):<> cptr(a, l)
//
(* ****** ****** *)
//
castfn
cptr_vtake
  {a:vt0p}{l:agz}
(
  cp: cptr(INV(a), l)
) :<> (a@l, a@l -<lin,prf> void | ptr l)
// end of [cptr_vtake]
//
fun{a:vt0p}
cptr_get(cp: cPtr1(INV(a))):<> a
fun{a:vt0p}
cptr_set(cp: cPtr1(INV(a)), x: a):<!wrt> void
fun{a:vt0p}
cptr_exch(cp: cPtr1(INV(a)), xr: &a >> a):<!wrt> void
//
(*
overload .get with cptr_get
overload .set with cptr_set
overload .exch with cptr_exch
*)
//
(* ****** ****** *)

(* end of [unsafe.sats] *)
