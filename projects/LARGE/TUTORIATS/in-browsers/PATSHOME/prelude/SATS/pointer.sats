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
** $PATSHOME/prelude/SATS/CODEGEN/pointer.atxt
** Time of generation: Sun Nov 20 21:18:14 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2012 *)

(* ****** ****** *)

sortdef tk = tkind

(* ****** ****** *)
//
sortdef
t0p = t@ype and vt0p = viewt@ype
//
(* ****** ****** *)

stadef ptrknd = ptr_kind

(* ****** ****** *)

absprop is_word_aligned_p (l:addr)

(* ****** ****** *)
//
castfn
g0ofg1_ptr (p: Ptr):<> ptr
castfn
g1ofg0_ptr (p: ptr):<> Ptr0
//
overload g0ofg1 with g0ofg1_ptr
overload g1ofg0 with g1ofg0_ptr
//
(* ****** ****** *)
//
prfun
lemma_ptr_param
  {l:addr} (p: ptr l): [l >= null] void
//
(* ****** ****** *)

prfun
ptr_get_index
  {l1:addr} (p: ptr l1): [l2:addr] EQADDR(l1, l2)
// end of [ptr_get_index]

(* ****** ****** *)
//
symintr ptr_is_null
symintr ptr_isnot_null
//
(* ****** ****** *)
//
symintr add_ptr_bsz
symintr sub_ptr_bsz
//
// add_ptr_bsz (p, ofs) = p + ofs
// sub_ptr_bsz (p, ofs) = p - ofs
//
(* ****** ****** *)
//
symintr ptr_succ
symintr ptr_pred
//
// ptr_succ<a>(p) = p + sizeof<a>
// ptr_pred<a>(p) = p - sizeof<a>
//
(* ****** ****** *)
//
symintr ptr_add ptr_sub
//
// ptr_add<a> (p, ofs) = p + ofs*sizeof<a>
// ptr_sub<a> (p, ofs) = p - ofs*sizeof<a>
//
(* ****** ****** *)

fun ptr0_is_null (p: ptr):<> bool = "mac#%"
overload ptr_is_null with ptr0_is_null of 0
fun ptr0_isnot_null (p: ptr):<> bool = "mac#%"
overload ptr_isnot_null with ptr0_isnot_null of 0

(* ****** ****** *)
//
fun add_ptr0_bsz
  (p: ptr, ofs: size_t):<> ptr = "mac#%"
fun sub_ptr0_bsz
  (p: ptr, ofs: size_t):<> ptr = "mac#%"
//
overload add_ptr_bsz with add_ptr0_bsz of 0
overload sub_ptr_bsz with sub_ptr0_bsz of 0
//
(* ****** ****** *)

fun sub_ptr0_ptr0
  (p1: ptr, p2: ptr):<> ssize_t = "mac#%"
overload - with sub_ptr0_ptr0 of 0

(* ****** ****** *)
//
fun{a:vt0p} ptr0_succ (p: ptr):<> ptr
fun{a:vt0p} ptr0_pred (p: ptr):<> ptr
//
overload ptr_succ with ptr0_succ of 0
overload ptr_pred with ptr0_pred of 0
//
(* ****** ****** *)
//
fun{
a:vt0p}{tk:tk
} ptr0_add_gint (p: ptr, ofs: g0int (tk)):<> ptr
fun{
a:vt0p}{tk:tk
} ptr0_add_guint (p: ptr, ofs: g0uint (tk)):<> ptr
//
overload ptr_add with ptr0_add_gint of 0
overload ptr_add with ptr0_add_guint of 0
//
fun{
a:vt0p}{tk:tk
} ptr0_sub_gint (p: ptr, ofs: g0int (tk)):<> ptr
fun{
a:vt0p}{tk:tk
} ptr0_sub_guint (p: ptr, ofs: g0uint (tk)):<> ptr
//
overload ptr_sub with ptr0_sub_gint of 0
overload ptr_sub with ptr0_sub_guint of 0
//
(* ****** ****** *)

fun lt_ptr0_ptr0
  (p1: ptr, p2: ptr):<> bool = "mac#%"
overload < with lt_ptr0_ptr0 of 0
fun lte_ptr0_ptr0
  (p1: ptr, p2: ptr):<> bool = "mac#%"
overload <= with lte_ptr0_ptr0 of 0
fun gt_ptr0_ptr0
  (p1: ptr, p2: ptr):<> bool = "mac#%"
overload > with gt_ptr0_ptr0 of 0
fun gte_ptr0_ptr0
  (p1: ptr, p2: ptr):<> bool = "mac#%"
overload >= with gte_ptr0_ptr0 of 0
fun eq_ptr0_ptr0
  (p1: ptr, p2: ptr):<> bool = "mac#%"
overload = with eq_ptr0_ptr0 of 0
fun neq_ptr0_ptr0
  (p1: ptr, p2: ptr):<> bool = "mac#%"
overload != with neq_ptr0_ptr0 of 0
overload <> with neq_ptr0_ptr0 of 0

(* ****** ****** *)
//
fun
compare_ptr0_ptr0
  (p1: ptr, p2: ptr):<> int = "mac#%"
//
overload compare with compare_ptr0_ptr0 of 0
//
(* ****** ****** *)
//
fun
gt_ptr0_intz
  (p: ptr, i: int(0)):<> bool = "mac#%"
//
fun
eq_ptr0_intz
  (p: ptr, i: int(0)):<> bool = "mac#%"
fun
neq_ptr0_intz
  (p: ptr, i: int(0)):<> bool = "mac#%"
//
overload > with gt_ptr0_intz of 0
overload = with eq_ptr0_intz of 0
overload != with neq_ptr0_intz of 0
overload <> with neq_ptr0_intz of 0
//
(* ****** ****** *)

(*
fun{a:vt0p}
ptr0_add_int (p: ptr, i: int): ptr
fun{a:vt0p}
ptr0_add_lint (p: ptr, i: lint): ptr
fun{a:vt0p}
ptr0_add_ssize (p: ptr, i: ssize): ptr
fun{a:vt0p}
ptr0_add_uint (p: ptr, u: uint): ptr
fun{a:vt0p}
ptr0_add_ulint (p: ptr, u: ulint): ptr
fun{a:vt0p}
ptr0_add_size (p: ptr, u: size): ptr
*)

(*
fun{a:vt0p}
ptr0_sub_int (p: ptr, i: int): ptr
fun{a:vt0p}
ptr0_sub_lint (p: ptr, i: lint): ptr
fun{a:vt0p}
ptr0_sub_ssize (p: ptr, i: ssize): ptr
fun{a:vt0p}
ptr0_sub_uint (p: ptr, u: uint): ptr
fun{a:vt0p}
ptr0_sub_ulint (p: ptr, u: ulint): ptr
fun{a:vt0p}
ptr0_sub_size (p: ptr, u: size): ptr
*)

(* ****** ****** *)
//
fun
print_ptr (p: ptr): void = "mac#%"
fun
prerr_ptr (p: ptr): void = "mac#%"
fun
fprint_ptr : fprint_type (ptr) = "mac#%"
//
overload print with print_ptr
overload prerr with prerr_ptr
overload fprint with fprint_ptr
//
(* ****** ****** *)
//
praxi
ptr1_is_gtez
  {l:addr}(p: ptr l): [l >= null] void
//
(* ****** ****** *)
//
fun
ptr1_is_null
  {l:addr}(p: ptr l):<> bool (l==null) = "mac#%"
fun
ptr1_isnot_null
  {l:addr}(p: ptr l):<> bool (l > null) = "mac#%"
//
overload ptr_is_null with ptr1_is_null of 10
overload ptr_isnot_null with ptr1_isnot_null of 10
//
(* ****** ****** *)
//
fun
add_ptr1_bsz{l:addr}{i:int}
  (p: ptr l, ofs: size_t (i)):<> ptr (l+i) = "mac#%"
fun
sub_ptr1_bsz{l:addr}{i:int}
  (p: ptr l, ofs: size_t (i)):<> ptr (l-i) = "mac#%"
//
overload add_ptr_bsz with add_ptr1_bsz of 20
overload sub_ptr_bsz with sub_ptr1_bsz of 20
//
(* ****** ****** *)
//
fun
sub_ptr1_ptr1{l1,l2:addr}
  (p1: ptr l1, p2: ptr l2):<> ssize_t (l1-l2) = "mac#%"
//
overload - with sub_ptr1_ptr1 of 20
//
(* ****** ****** *)
//
fun{
a:vt0p
} ptr1_succ{l:addr} (p: ptr l):<> ptr (l+sizeof(a))
fun{
a:vt0p
} ptr1_pred{l:addr} (p: ptr l):<> ptr (l-sizeof(a))
//
overload ptr_succ with ptr1_succ of 10
overload ptr_pred with ptr1_pred of 10
//
(* ****** ****** *)
//
fun{
a:vt0p}{tk:tk
} ptr1_add_gint
  {l:addr}{i:int}
  (p: ptr l, ofs: g1int (tk, i)):<> ptr(l+i*sizeof(a))
fun{
a:vt0p}{tk:tk
} ptr1_add_guint
  {l:addr}{i:int}
  (p: ptr l, ofs: g1uint (tk, i)):<> ptr(l+i*sizeof(a))
//
overload ptr_add with ptr1_add_gint of 20
overload ptr_add with ptr1_add_guint of 20
//
(* ****** ****** *)
//
fun{
a:vt0p}{tk:tk
} ptr1_sub_gint
  {l:addr}{i:int}
  (p: ptr l, ofs: g1int (tk, i)):<> ptr(l-i*sizeof(a))
fun{
a:vt0p}{tk:tk
} ptr1_sub_guint
  {l:addr}{i:int}
  (p: ptr l, ofs: g1uint (tk, i)):<> ptr(l-i*sizeof(a))
//
overload ptr_sub with ptr1_sub_gint of 20
overload ptr_sub with ptr1_sub_guint of 20
//
(* ****** ****** *)

fun lt_ptr1_ptr1
  {l1,l2:addr} (
  p1: ptr (l1), p2: ptr (l2)
) :<> bool (l1 < l2) = "mac#%"
overload < with lt_ptr1_ptr1 of 20
fun lte_ptr1_ptr1
  {l1,l2:addr} (
  p1: ptr (l1), p2: ptr (l2)
) :<> bool (l1 <= l2) = "mac#%"
overload <= with lte_ptr1_ptr1 of 20
fun gt_ptr1_ptr1
  {l1,l2:addr} (
  p1: ptr (l1), p2: ptr (l2)
) :<> bool (l1 > l2) = "mac#%"
overload > with gt_ptr1_ptr1 of 20
fun gte_ptr1_ptr1
  {l1,l2:addr} (
  p1: ptr (l1), p2: ptr (l2)
) :<> bool (l1 >= l2) = "mac#%"
overload >= with gte_ptr1_ptr1 of 20
fun eq_ptr1_ptr1
  {l1,l2:addr} (
  p1: ptr (l1), p2: ptr (l2)
) :<> bool (l1 == l2) = "mac#%"
overload = with eq_ptr1_ptr1 of 20
fun neq_ptr1_ptr1
  {l1,l2:addr} (
  p1: ptr (l1), p2: ptr (l2)
) :<> bool (l1 != l2) = "mac#%"
overload != with neq_ptr1_ptr1 of 20
overload <> with neq_ptr1_ptr1 of 20

fun compare_ptr1_ptr1
  {l1,l2:addr} (p1: ptr l1, p2: ptr l2) :<> int = "mac#%"
overload compare with compare_ptr1_ptr1 of 20

(* ****** ****** *)
//
fun
gt_ptr1_intz{l:addr}
  (p: ptr(l), i: int(0)):<> bool(l > null) = "mac#%"
fun
eq_ptr1_intz{l:addr}
  (p: ptr(l), i: int(0)):<> bool(l== null) = "mac#%"
fun
neq_ptr1_intz{l:addr}
  (p: ptr(l), i: int(0)):<> bool(l > null) = "mac#%"
//
overload > with gt_ptr1_intz of 10
overload = with eq_ptr1_intz of 10
overload != with neq_ptr1_intz of 10
overload <> with neq_ptr1_intz of 10
//
(* ****** ****** *)
//
// HX: implemented in [prelude/DATS/pointer.dats]
//
fun{a:vt0p}
ptr_get{l:addr}
  (pf: !INV(a) @ l >> a?! @ l | p: ptr l):<> a
// end of [ptr_get]

fun{a:vt0p}
ptr_set{l:addr}
  (pf: !a? @ l >> a @ l | p: ptr l, x: INV(a)):<!wrt> void
// end of [ptr_set]

fun{a:vt0p}
ptr_exch{l:addr}
  (pf: !INV(a) @ l | p: ptr l, x: &a >> a):<!wrt> void
// end of [ptr_exch]

(* ****** ****** *)
//
abstype
cptr_vt0ype_addr_type
  (a:vt@ype+, addr) = ptr // HX: for simulating C pointers
//
stadef cptr = cptr_vt0ype_addr_type
stadef cPtr0 (a:vt0p) = [l:addr] cptr (a, l)
stadef cPtr1 (a:vt0p) = [l:addr | l > null] cptr(a, l)
//
castfn
cptr2ptr{a:vt0p}{l:addr} (cp: cptr(a, l)):<> ptr(l)
//
(* ****** ****** *)
//
fun cptr_null{a:vt0p} ():<> cptr(a, null) = "mac#%"
//
castfn cptr_rvar{a:vt0p} (x: &INV(a)):<> cPtr1(a) // read
castfn cptr_wvar{a:vt0p} (x: &a? >> a):<> cPtr1(a) // write
//
(* ****** ****** *)
//
fun
{a:vt0p}
cptr_succ{l:addr}(cp: cptr(a, l)):<> cptr(a, l+sizeof(a))
fun
{a:vt0p}
cptr_pred{l:addr}(cp: cptr(a, l)):<> cptr(a, l-sizeof(a))
//
(* ****** ****** *)
//
fun
cptr_is_null
  {a:vt0p}{l:addr}(cp: cptr(a, l)):<> bool(l==null) = "mac#%"
fun
cptr_isnot_null
  {a:vt0p}{l:addr}(cp: cptr(a, l)):<> bool(l > null) = "mac#%"
//
(* ****** ****** *)
//
fun
gt_cptr_intz
  {a:vt0p}{l:addr}
  (cp: cptr(a, l), i: int(0)):<> bool(l > null) = "mac#%"
//
fun
eq_cptr_intz
  {a:vt0p}{l:addr}
  (cp: cptr(a, l), i: int(0)):<> bool(l== null) = "mac#%"
fun
neq_cptr_intz
  {a:vt0p}{l:addr}
  (cp: cptr(a, l), i: int(0)):<> bool(l > null) = "mac#%"
//
overload > with gt_cptr_intz of 0
overload = with eq_cptr_intz of 0
overload != with neq_cptr_intz of 0
overload <> with neq_cptr_intz of 0
//
(* ****** ****** *)

typedef voidptr (l:addr) = cptr (void, l)
typedef voidptr0 = [l:addr] voidptr (l)
typedef voidptr1 = [l:addr | l > null] voidptr (l)

typedef charptr (l:addr) = cptr (char, l)
typedef charptr0 = [l:addr] charptr (l)
typedef charptr1 = [l:addr | l > null] charptr (l)

typedef constcharptr (l:addr) = charptr (l) // HX: commenting
typedef constcharptr0 = charptr0 // HX: for commenting purpose
typedef constcharptr1 = charptr1 // HX: for commenting purpose

(* ****** ****** *)
//
absprop
is_nullable (a: vt@ype+) // covariant
//
fun{a:vt0p}
ptr_nullize
  (pf: is_nullable (a) | x: &a? >> a):<!wrt> void
fun
ptr_nullize_tsz
  {a:vt0p} (
  pf: is_nullable (a) | x: &a? >> a, tsz: sizeof_t (a)
) :<!wrt> void = "mac#%" // end of [ptr_nullize_tsz]
//
(* ****** ****** *)

fun{
a:vt0p
} ptr_alloc ()
  :<> [l:agz] (a? @ l, mfree_gc_v (l) | ptr l)
// end of [ptr_alloc]

fun ptr_alloc_tsz
  {a:vt0p} (tsz: sizeof_t a)
  :<> [l:agz] (a? @ l, mfree_gc_v (l) | ptr l) = "mac#%"
// end of [ptr_alloc_tsz]

fun ptr_free
  {a:t@ype}{l:addr}
  (pfgc: mfree_gc_v (l), pfat: a @ l | p: ptr l):<> void = "mac#%"
// end of [ptr_free]

(* ****** ****** *)
//
absvtype ptrlin (l:addr) = ptr
//
praxi ptrlin_free{l:addr} (p: ptrlin (l)): void
//
castfn ptr2ptrlin{l:addr} (p: ptr l):<> ptrlin (l)
castfn ptrlin2ptr{l:addr} (p: ptrlin l):<> ptr (l)
//
(* ****** ****** *)
//
// HX-2015-03-24:
// singleton linear arrayptr
//
absvtype
aptr_vt0ype_addr_type
  (a:vt@ype+, addr) = ptr // HX: for safe ATS pointers
//
stadef aptr = aptr_vt0ype_addr_type
stadef aPtr0 (a:vt0p) = [l:addr] aptr (a, l)
stadef aPtr1 (a:vt0p) = [l:addr | l > null] aptr (a, l)
//
castfn
aptr2ptr{a:vt0p}{l:addr}(ap: !aptr(INV(a), l)):<> ptr(l)
//
(* ****** ****** *)
//
fun
{a:vt0p}
aptr_make_elt(x: a):<!wrt> aPtr1(a)
fun
{a:vt0p}
aptr_getfree_elt{l:agz}(aptr(a, l)):<!wrt> (a)
//
fun
{a:t0p}
aptr_get_elt{l:agz}(ap: !aptr(INV(a), l)):<!wrt> (a)
fun
{a:t0p}
aptr_set_elt
  {l:agz}(ap: !aptr(INV(a), l) >> _, x: a):<!wrt> void
fun
{a:t0p}
aptr_exch_elt
  {l:agz}(ap: !aptr(INV(a), l) >> _, x: &(a)>>_):<!wrt> void
//
overload [] with aptr_get_elt
overload [] with aptr_set_elt
//
(* ****** ****** *)
//
fun aptr_null{a:vt0p}():<> aptr(a, null) = "mac#%"
//
fun aptr_is_null
  {a:vt0p}{l:addr}(ap: !aptr(INV(a), l)):<> bool(l==null) = "mac#%"
fun aptr_isnot_null
  {a:vt0p}{l:addr}(ap: !aptr(INV(a), l)):<> bool(l > null) = "mac#%"
//
overload iseqz with aptr_is_null
overload isneqz with aptr_isnot_null
//
(* ****** ****** *)
//
// HX-2014-05-16:
// A hack to stop buggy compilation
//
fun ptr_as_volatile (p: ptr): void
//
(* ****** ****** *)
//
// overloading for certain symbols
//
overload succ with ptr0_succ
overload succ with ptr1_succ
overload succ with cptr_succ
//
overload pred with ptr0_pred
overload pred with ptr1_pred
overload pred with cptr_pred
//
overload iseqz with ptr0_is_null of 0
overload isneqz with ptr0_isnot_null of 0
//
overload iseqz with ptr1_is_null of 10
overload isneqz with ptr1_isnot_null of 10
//
overload iseqz with cptr_is_null of 10
overload isneqz with cptr_isnot_null of 10
//
(* ****** ****** *)

(* end of [pointer.sats] *)
