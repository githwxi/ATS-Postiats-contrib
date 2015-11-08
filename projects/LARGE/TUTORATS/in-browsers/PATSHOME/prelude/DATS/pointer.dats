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
** $PATSHOME/prelude/DATS/CODEGEN/pointer.atxt
** Time of generation: Sat Oct 17 15:19:51 2015
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: March, 2012 *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

primplmnt
lemma_ptr_param
  {l} (p) = lemma_addr_param {l} ()
// end of [lemma_ptr_param]

(* ****** ****** *)

primplmnt
ptr_get_index {l} (p) = eqaddr_make {l, l} ()

(* ****** ****** *)

implement{a}
ptr0_succ (p) = add_ptr_bsz (p, sizeof<a>)
implement{a}
ptr0_pred (p) = sub_ptr_bsz (p, sizeof<a>)

(* ****** ****** *)
//
implement{a}{tk}
ptr0_add_gint (p, i) =
  add_ptr_bsz (p, g0int2uint(i) * sizeof<a>)
implement{a}{tk}
ptr0_sub_gint (p, i) =
  sub_ptr_bsz (p, g0int2uint(i) * sizeof<a>)
//
implement{a}{tk}
ptr0_add_guint (p, i) =
  add_ptr_bsz (p, g0uint2uint(i) * sizeof<a>)
implement{a}{tk}
ptr0_sub_guint (p, i) =
  sub_ptr_bsz (p, g0uint2uint(i) * sizeof<a>)
//
(* ****** ****** *)
//
implement{a}
ptr1_succ {l} (p) =
  $UN.cast{ptr(l+sizeof(a))}(ptr0_succ<a> (p))
implement{a}
ptr1_pred {l} (p) =
  $UN.cast{ptr(l-sizeof(a))}(ptr0_pred<a> (p))
//
(* ****** ****** *)
//
implement{a}{tk}
ptr1_add_gint {l}{i} (p, i) =
  $UN.cast{ptr(l+i*sizeof(a))}(ptr0_add_gint<a><tk> (p, i))
implement{a}{tk}
ptr1_sub_gint {l}{i} (p, i) =
  $UN.cast{ptr(l-i*sizeof(a))}(ptr0_sub_gint<a><tk> (p, i))
//
implement{a}{tk}
ptr1_add_guint {l}{i} (p, i) =
  $UN.cast{ptr(l+i*sizeof(a))}(ptr0_add_guint<a><tk> (p, i))
implement{a}{tk}
ptr1_sub_guint {l}{i} (p, i) =
  $UN.cast{ptr(l-i*sizeof(a))}(ptr0_sub_guint<a><tk> (p, i))
//
(* ****** ****** *)

implement{a} ptr_get (pf | p) = !p

implement{a} ptr_set (pf | p, x) = !p := x

implement{a}
ptr_exch (pf | p, x) =
{
  val tmp = x; val () = x := !p; val () = !p := tmp
} // end of [ptr_exch]

(* ****** ****** *)

implement
{a}(*tmp*)
ptr_nullize
  (pf | x) =
(
  ptr_nullize_tsz{a}(pf | x, sizeof<a>)
) (* ptr_nullize *)

(* ****** ****** *)

implement
{a}(*tmp*)
ptr_alloc () = ptr_alloc_tsz{a}(sizeof<a>)

(* ****** ****** *)

implement
{a}(*tmp*)
aptr_make_elt(x) = let
//
val (pf, fpf | p) = ptr_alloc()
//
in
  !p := x; $UN.castvwtp0{aPtr1(a)}((pf, fpf, p))
end // end of [aptr_make_elt]

(* ****** ****** *)
//
implement
{a}(*tmp*)
aptr_getfree_elt
  {l}(ap) = x where
{
  val p = aptr2ptr(ap)
  val x = $UN.ptr1_get<a>(p)
  prval
  pfat_ = $UN.castview0{(a?)@l}(0)
  prval
  pfgc_ = $UN.castview0{mfree_gc_v(l)}(0)
  val () = ptr_free{a?}{l}(pfgc_, pfat_ | p)
  prval () = $UN.cast2void(ap)
} (* end of [aptr_getfree_elt] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
aptr_get_elt(ap) = $UN.ptr1_get<a>(aptr2ptr(ap))
implement
{a}(*tmp*)
aptr_set_elt(ap, x) = $UN.ptr1_set<a>(aptr2ptr(ap), x)
//
(* ****** ****** *)

implement
fprint_val<ptr> (out, p) = fprint_ptr (out, p)

(* ****** ****** *)

(* end of [pointer.dats] *)
