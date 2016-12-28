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
** $PATSHOME/prelude/DATS/CODEGEN/list_vt_mergesort.atxt
** Time of generation: Wed Jun  1 19:08:17 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_mergesort$cmp
  (x1, x2) =
(
  gcompare_ref_ref<a> (x1, x2)
) // end of [list_vt_mergesort$cmp]

(* ****** ****** *)
//
extern
fun{
a:vt0p
} list_vt_insort
  {n:int}(xs: list_vt (a, n)):<!wrt> list_vt (a, n)
//
(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_insort
  (xs) = let
//
fun
insord
{l0,l1,l2:addr}{n:nat} .<n>.
(
  pf1: a @ l1
, pf2: list_vt(a, 0)? @ l2
| xs0: &list_vt(a, n) >> list_vt(a, n+1)
, nx0: list_vt_cons_unfold(l0, l1, l2), p1: ptr(l1), p2: ptr(l2)
) :<!wrt> void = let
in
//
case+ xs0 of
| @list_vt_cons
    (x0, xs1) => let
    val sgn = list_vt_mergesort$cmp<a> (x0, !p1)
  in
    if sgn <= 0
      then let
        val () = insord (pf1, pf2 | xs1, nx0, p1, p2)
        prval () = fold@ (xs0)
      in
        // nothing
      end // end of [then]
      else let
        prval () = fold@ (xs0)
        val () = (!p2 := xs0; xs0 := nx0)
        prval () = fold@ (xs0)
      in
        // nothing
      end // end of [else]
    // end of [if]
  end // end of [list_vt_cons]
| ~list_vt_nil () =>
  {
    val () = xs0 := nx0
    val () = !p2 := list_vt_nil ()
    prval () = fold@ (xs0)
  }
//
end (* end of [insord] *)
//
fun
loop{m,n:nat} .<m>.
(
  xs: list_vt (a, m)
, ys: &list_vt (a, n) >> list_vt (a, m+n)
) :<!wrt> void = let
in
//
case+ xs of
| @list_vt_cons
    (x, xs1) => let
    val xs1_ = xs1
    val ((*void*)) =
      insord (view@x, view@xs1 | ys, xs, addr@x, addr@xs1)
    // end of [val]
  in
    loop (xs1_, ys)
  end // end of [list_vt_cons]
| ~list_vt_nil ((*void*)) => ()
//
end // end of [loop]
//
prval () =
lemma_list_vt_param (xs)
//
var ys = list_vt_nil{a}()
val ((*void*)) = loop (xs, ys)
//
in
  ys
end // end of [list_vt_insort]

(* ****** ****** *)

#define CUTOFF 12

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_mergesort
  {n} (xs) = let
//
fun
split
{n,n1:int |
 n >= n1; n1 >= 0} .<n1>.
(
  xs: &list_vt (a, n) >> list_vt (a, n1)
, n1: int n1, res: &List_vt a? >> list_vt (a, n-n1)
) :<!wrt> void = let
in
//
if n1 > 0 then let
  val+@list_vt_cons (_, xs1) = xs
  val () = split (xs1, n1-1, res)
in
  fold@ (xs)
end else let
  val () = res := xs
  val () = xs := list_vt_nil ()
in
  // nothing
end // end of [if]
//
end // end of [split]
//
fun
merge
{n1,n2:nat} .<n1+n2>.
(
  xs1: list_vt (a, n1)
, xs2: list_vt (a, n2)
, res: &List_vt a? >> list_vt (a, n1+n2)
) :<!wrt> void = let
in
//
case+ xs1 of
| @list_vt_cons
    (x1, xs11) => (
    case+ xs2 of
    | @list_vt_cons
        (x2, xs21) => let
        val sgn =
          list_vt_mergesort$cmp<a> (x1, x2)
        // end of [val]
      in
        if sgn <= 0 then let
            val () = res := xs1
          prval () = fold@{a}(xs2)
            val () = merge (xs11, xs2, xs11)
          prval () = fold@{a}(res)
        in
          // nothing
        end else let
            val () = res := xs2
          prval () = fold@{a}(xs1)
            val () = merge (xs1, xs21, xs21)
          prval () = fold@{a}(res)
        in
          // nothing
        end // end of [if]
      end // end of [list_vt_cons]
    | ~list_vt_nil () => (fold@ (xs1); res := xs1)
  ) // end of [list_vt_cons]
| ~list_vt_nil () => (res := xs2)
//
end // end of [merge]
//
fun
msort{n:nat} .<n>.
(
  xs: list_vt(a, n), n: int(n)
) :<!wrt> list_vt(a, n) =
(
if
n >= CUTOFF
then let
  val n1 = half(n+1)
  val+@list_vt_cons (_, xs1) = xs
  var res: List_vt a? // uninitialized
  val () = split (xs1, n1-1, res)
  prval () = fold@ (xs)
  val xs1 = msort (xs, n1)
  and xs2 = msort (res, n-n1)
  val () = merge (xs1, xs2, res)
in
  res
end // end of [then]
else list_vt_insort<a> (xs)
) (* end of [msort] *)
//
prval () = lemma_list_vt_param (xs)
//
in
  msort (xs, list_vt_length<a> (xs))
end // end of [list_vt_mergesort]

(* ****** ****** *)

implement
{a}(*tmp*)
list_vt_mergesort_fun
  (xs, cmp) = let
//
implement{a2}
list_vt_mergesort$cmp
  (x1, x2) = let
//
val cmp = $UN.cast{cmpref(a2)}(cmp) in cmp (x1, x2)
//
end (* end of [list_vt_mergesort$cmp] *)
//
in
  list_vt_mergesort<a> (xs)
end // end of [list_vt_mergesort_fun]

(* ****** ****** *)

(* end of [list_vt_mergesort.dats] *)
