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
** $PATSHOME/prelude/DATS/CODEGEN/arrayref.atxt
** Time of generation: Sun Nov 20 21:18:28 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: May, 2012 *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_make_elt (asz, x) =
  arrayptr_refize(arrayptr_make_elt<a> (asz, x))
// end of [arrayref_make_elt]

(* ****** ****** *)

implement
{}(*tmp*)
arrayref_make_intrange (l, r) =
  arrayptr_refize{int}(arrayptr_make_intrange (l, r))
// end of [arrayref_make_intrange]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_make_list (asz, xs) =
  arrayptr_refize(arrayptr_make_list<a> (asz, xs))
// end of [arrayref_make_list]

implement
{a}(*tmp*)
arrayref_make_rlist (asz, xs) =
  arrayptr_refize(arrayptr_make_rlist<a> (asz, xs))
// end of [arrayref_make_rlist]

(* ****** ****** *)
//
implement
{a}(*tmp*)
arrayref_head(A) = $UN.ptr0_get<a> (arrayref2ptr(A))
implement
{a}(*tmp*)
arrayref_tail{n}(A) =
  $UN.cast{arrayref(a,n-1)}(ptr_succ<a>(arrayref2ptr(A)))
//
(* ****** ****** *)

implement
{a}{tk}(*tmp*)
arrayref_get_at_gint
  (A, i) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_get_at_gint (!p, i)
end // end of [arrayref_get_at_gint]
implement
{a}{tk}(*tmp*)
arrayref_get_at_guint
  (A, i) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_get_at_guint (!p, i)
end // end of [arrayref_get_at_guint]

(* ****** ****** *)

implement
{a}{tk}(*tmp*)
arrayref_set_at_gint
  (A, i, x) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_set_at_gint (!p, i, x)
//
end // end of [arrayref_set_at_gint]
implement
{a}{tk}(*tmp*)
arrayref_set_at_guint
  (A, i, x) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_set_at_guint (!p, i, x)
//
end // end of [arrayref_set_at_guint]

(* ****** ****** *)

implement
{a}{tk}(*tmp*)
arrayref_exch_at_gint
  (A, i, x) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_exch_at_gint (!p, i, x)
//
end // end of [arrayref_exch_at_gint]
implement
{a}{tk}(*tmp*)
arrayref_exch_at_guint
  (A, i, x) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_exch_at_guint (!p, i, x)
//
end // end of [arrayref_exch_at_guint]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_interchange
  (A, i, j) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_interchange<a> (!p, i, j)
//
end // end of [arrayref_interchange]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_subcirculate
  (A, i, j) = let
//
val (vbox pf | p) =
  arrayref_get_viewptr (A) in array_subcirculate<a> (!p, i, j)
//
end // end of [arrayref_subcirculate]

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_arrayref
  (out, A, n) = let
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
in
  $effmask_ref (fprint_array<a> (out, !p, n))
end // end of [fprint_arrayref]

implement
{a}(*tmp*)
fprint_arrayref_sep
  (out, A, n, sep) = let
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
in
  $effmask_ref (fprint_array_sep<a> (out, !p, n, sep))
end // end of [fprint_arrayref_sep]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_copy
  {n} (A, n) = let
//
val (pf, fpf | p) =
  $UN.ptr0_vtake{array(a,n)}(ptrcast(A))
//
val (pf2, pf2gc | p2) = array_ptr_alloc<a> (n)
val ((*void*)) = array_copy<a> (!p2, !p, n)
//
prval ((*void*)) = fpf (pf)
//
in
  $UN.castvwtp0{arrayptr(a,n)}((pf2, pf2gc | p2))
end // end of [arrayref_copy]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_tabulate
  (asz) = arrayptr_refize (arrayptr_tabulate<a> (asz))
// end of [arrayref_tabulate]

implement
{a}(*tmp*)
arrayref_tabulate_cloref
  (asz, f) = arrayptr_refize (arrayptr_tabulate_cloref<a> (asz, f))
// end of [arrayref_tabulate_cloref]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_foreach
  (A, asz) = let
  var env: void = ()
  in arrayref_foreach_env<a><void> (A, asz, env)
end // end of [arrayref_foreach]

implement
{a}{env}
arrayref_foreach_env
  (A, asz, env) = let
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
in
  $effmask_ref (array_foreach_env<a><env> (!p, asz, env))
end // end of [arrayref_foreach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_iforeach
  (A, asz) = let
  var env: void = () in
  arrayref_iforeach_env<a><void> (A, asz, env)
end // end of [arrayref_iforeach]

implement
{a}{env}
arrayref_iforeach_env
  (A, asz, env) = let
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
in
  $effmask_ref (array_iforeach_env<a><env> (!p, asz, env))
end // end of [arrayref_iforeach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_rforeach
  (A, asz) = let
  var env: void = () in
  arrayref_rforeach_env<a><void> (A, asz, env)
end // end of [arrayref_rforeach]

implement
{a}{env}
arrayref_rforeach_env
  (A, asz, env) = let
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
in
  $effmask_ref (array_rforeach_env<a><env> (!p, asz, env))
end // end of [arrayref_rforeach_env]

(* ****** ****** *)

implement
{a}(*tmp*)
arrayref_quicksort
  (A, asz) = let
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
in
  $effmask_ref (array_quicksort<a> (!p, asz))
end // end of [arrayref_quicksort]

(* ****** ****** *)

local

datatype
arrszref
(
  a:viewt@ype
) =
  {n:int}
  ARRSZREF of (arrayref (a, n), size_t (n))
// end of [arrszref]

assume
arrszref_vt0ype_type = arrszref

in (* in of [local] *)

implement
{}(*tmp*)
arrszref_make_arrpsz
  (psz) = let
//
var asz: size_t
val A = arrpsz_get_ptrsize (psz, asz)
val A = arrayptr_refize (A)
//
in
  ARRSZREF(A, asz)
end // end of [arrszref_make_arrpsz]

(* ****** ****** *)
//
implement
{}(*tmp*)
arrszref_make_arrayref
  (A, asz) = ARRSZREF(A, asz)
//
(* ****** ****** *)

implement
{}(*tmp*)
arrszref_get_ref
  (ASZ) = let
//
val+
ARRSZREF(A, _) = ASZ in $UN.cast2Ptr1(A)
//
end // end of [arrszref_get_size]

(* ****** ****** *)

implement
{}(*tmp*)
arrszref_get_size
  (ASZ) = let
//
val+ARRSZREF(_, n) = ASZ in (n)
//
end // end of [arrszref_get_size]

(* ****** ****** *)

implement
{}(*tmp*)
arrszref_get_refsize
  (ASZ, nref) = let
//
val+ARRSZREF(A, n) = ASZ
//
prval () = lemma_arrayref_param (A)
//
in
  nref := n; A(*arrayref*)
end // end of [arrszref_get_refsize]

end // end of [local]

(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_make_elt
  (n, x) = let
//
val n = g1ofg0_uint (n)
val A = arrayref_make_elt<a> (n, x)
//
in
  arrszref_make_arrayref (A, n)
end // end of [arrszref_make_elt]

(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_make_list
  (xs) = let
//
val n = list_length<a> (xs)
val A = arrayref_make_list (n, xs)
//
prval () = lemma_list_param (xs)
//
in
  arrszref_make_arrayref (A, i2sz(n))
end // end of [arrszref_make_list]

implement
{a}(*tmp*)
arrszref_make_rlist
  (xs) = let
//
prval () = lemma_list_param (xs)
//
val n = list_length<a> (xs)
val A = arrayref_make_rlist (n, xs)
//
in
  arrszref_make_arrayref (A, i2sz(n))
end // end of [arrszref_make_rlist]

(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_get_at_size
  (ASZ, i) = $effmask_wrt let
//
var n: size_t
val A = arrszref_get_refsize (ASZ, n)
val i = g1ofg0_uint (i)
//
in
//
if n > i
then arrayref_get_at_guint (A, i)
else $raise ArraySubscriptExn((*void*))
//
end // end of [arrszref_get_at_size]

implement
{a}{tk}
arrszref_get_at_gint
  (ASZ, i) = let
in
//
if (
i >= 0
) then (
  arrszref_get_at_size (ASZ, g0i2u(i))
) else (
  $raise ArraySubscriptExn((* i < 0 *))
) // end of [if]
end // end of [arrszref_get_at_gint]

implement
{a}{tk}
arrszref_get_at_guint
  (ASZ, i) = let
in
  arrszref_get_at_size (ASZ, g0u2u(i))
end // end of [arrszref_get_at_guint]

(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_set_at_size
  (ASZ, i, x) = $effmask_wrt let
//
var n: size_t
val A = arrszref_get_refsize (ASZ, n)
val i = g1ofg0_uint (i)
//
in
//
if n > i
then arrayref_set_at_guint (A, i, x)
else $raise ArraySubscriptExn((*void*))
//
end // end of [arrszref_set_at_size]

implement
{a}{tk}
arrszref_set_at_gint
  (ASZ, i, x) = let
in
//
if (
i >= 0
) then (
  arrszref_set_at_size (ASZ, g0i2u(i), x)
) else $raise ArraySubscriptExn((*i < 0*))
//
end // end of [arrszref_set_at_gint]

implement
{a}{tk}
arrszref_set_at_guint
  (ASZ, i, x) = let
in
  arrszref_set_at_size (ASZ, g0u2u(i), x)
end // end of [arrszref_set_at_guint]

(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_exch_at_size
  (ASZ, i, x) = $effmask_wrt let
//
var n: size_t
val A = arrszref_get_refsize (ASZ, n)
val i = g1ofg0_uint (i)
//
in
//
if n > i
then arrayref_exch_at_guint (A, i, x)
else $raise ArraySubscriptExn((*void*))
// end of [if]
//
end // end of [arrszref_exch_at_size]

implement
{a}{tk}
arrszref_exch_at_gint
  (ASZ, i, x) = let
in
//
if (
i >= 0
) then (
  arrszref_exch_at_size (ASZ, g0i2u(i), x)
) else $raise ArraySubscriptExn((*i < 0*))
//
end // end of [arrszref_exch_at_gint]

implement
{a}{tk}
arrszref_exch_at_guint
  (ASZ, i, x) = let
in
  arrszref_exch_at_size (ASZ, g0u2u(i), x)
end // end of [arrszref_exch_at_guint]

(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_interchange
(
  ASZ, i, j
) = $effmask_wrt let
//
var n: size_t
val A = arrszref_get_refsize (ASZ, n)
val i = g1ofg0_uint (i)
val j = g1ofg0_uint (j)
//
in
//
if n > i
then (
  if n > j
  then arrayref_interchange (A, i, j)
  else $raise ArraySubscriptExn((*void*))
) else $raise ArraySubscriptExn((*void*))
//
end // end of [arrszref_interchange]

(* ****** ****** *)

implement
{a}(*tmp*)
arrszref_subcirculate
(
  ASZ, i, j
) = $effmask_wrt let
//
var n: size_t
val A = arrszref_get_refsize (ASZ, n)
val i = g1ofg0_uint (i)
val j = g1ofg0_uint (j)
//
in
//
if n > i
then (
  if n > j
  then arrayref_subcirculate (A, i, j)
  else $raise ArraySubscriptExn((*void*))
) else $raise ArraySubscriptExn((*void*))
//
end // end of [arrszref_subcirculate]

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_arrszref
  (out, ASZ) = let
//
var asz: size_t
val A = arrszref_get_refsize (ASZ, asz)
//
in
  fprint_arrayref (out, A, asz)
end // end of [fprint_arrszref]

implement
{a}(*tmp*)
fprint_arrszref_sep
  (out, ASZ, sep) = let
//
var
asz: size_t
val A = arrszref_get_refsize (ASZ, asz)
//
in
  fprint_arrayref_sep (out, A, asz, sep)
end // end of [fprint_arrszref_sep]

(* ****** ****** *)
//
implement
{a}(*tmp*)
arrszref_tabulate (asz) = let
//
val
asz = g1ofg0_uint (asz)
val A = arrayref_tabulate<a> (asz) in arrszref_make_arrayref(A, asz)
//
end // end of [arrszref_tabulate]
//
implement
{a}(*tmp*)
arrszref_tabulate_cloref (asz, f) = let
  val A = arrayref_tabulate_cloref<a> (asz, f) in arrszref_make_arrayref(A, asz)
end // end of [arrszref_tabulate_cloref]
//
(* ****** ****** *)

implement
{a}(*tmp*)
streamize_arrszref_elt
  (ASZ) = let
//
var
asz: size_t
val A0 =
  arrszref_get_refsize{a}(ASZ, asz)
//
in
  streamize_arrayref_elt<a>(A0, asz)
end // end of [streamize_arrszref_elt]

(* ****** ****** *)

implement
{a}(*tmp*)
streamize_arrayref_elt
  (A0, asz) =
  auxmain(pa) where
{
//
val pa = arrayref2ptr(A0)
val pz = ptr_add<a>(pa, asz)
//
fun
auxmain
(
  pa: ptr
) : stream_vt(a) = $ldelay
(
if
(pa < pz)
then
stream_vt_cons
  ($UN.ptr0_get<a>(pa), auxmain(ptr_succ<a>(pa)))
else stream_vt_nil(*void*)
) (* end of [auxmain] *)
//
} (* end of [streamize_arrayref_elt] *)

(* ****** ****** *)

(* end of [arrayref.dats] *)
