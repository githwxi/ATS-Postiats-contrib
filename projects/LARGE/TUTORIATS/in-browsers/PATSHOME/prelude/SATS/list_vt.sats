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
** $PATSHOME/prelude/SATS/CODEGEN/list_vt.atxt
** Time of generation: Sat Dec  3 10:16:34 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2012 *)

(* ****** ****** *)

vtypedef
RD(a:vt0p) = a // for commenting: read-only
#define NSH (x) x // for commenting: no sharing
#define SHR (x) x // for commenting: it is shared

(* ****** ****** *)

#if(0)
//
// HX: these decls are available in [basic_dyn.sats]
//
datavtype
list_vt0ype_int_vtype
  (a:vt@ype+, int) =
//
// vt@ype+: covariant
//
  | list_vt_nil(a, 0) of ((*void*))
  | {n:int | n >= 0}
    list_vt_cons(a, n+1) of (a, list_vt0ype_int_vtype(a, n))
// end of [list_vt0ype_int_vtype]
//
stadef list_vt = list_vt0ype_int_vtype
vtypedef
List_vt(a:vt0p) = [n:int] list_vt(a, n)
vtypedef
List0_vt(a:vt0p) = [n:int | n >= 0] list_vt(a, n)
vtypedef
List1_vt(a:vt0p) = [n:int | n >= 1] list_vt(a, n)
vtypedef listLt_vt
  (a:vt0p, n:int) = [k:nat | k < n] list_vt(a, k)
vtypedef listLte_vt
  (a:vt0p, n:int) = [k:nat | k <= n] list_vt(a, k)
vtypedef listGt_vt
  (a:vt0p, n:int) = [k:int | k > n] list_vt(a, k)
vtypedef listGte_vt
  (a:vt0p, n:int) = [k:int | k >= n] list_vt(a, k)
vtypedef listBtw_vt
  (a:vt0p, m:int, n:int) = [k:int | m <= k; k < n] list_vt(a, k)
vtypedef listBtwe_vt
  (a:vt0p, m:int, n:int) = [k:int | m <= k; k <= n] list_vt(a, k)
//
#endif

(* ****** ****** *)

#define nil_vt list_vt_nil
#define cons_vt list_vt_cons

(* ****** ****** *)

prfun
lemma_list_vt_param
  {x:vt0p}{n:int}
  (xs: !list_vt(INV(x), n)): [n >= 0] void
// end of [lemma_list_vt_param]

(* ****** ****** *)

castfn
list_vt_cast
  {x:vt0p}{n:int}
  (xs: list_vt(INV(x), n)):<> list_vt(x, n)
// end of [list_vt_cast]

(* ****** ****** *)

#define list_vt_sing(x)
  list_vt_cons(x, list_vt_nil())
#define list_vt_pair(x1, x2)
  list_vt_cons(x1, list_vt_cons (x2, list_vt_nil()))

(* ****** ****** *)

fun{x:vt0p}
list_vt_make_sing (x: x):<!wrt> list_vt(x, 1)
fun{x:vt0p}
list_vt_make_pair (x1: x, x2: x):<!wrt> list_vt(x, 2)

(* ****** ****** *)
//
fun{x:vt0p}
print_list_vt(xs: !List_vt(INV(x))): void
fun{x:vt0p}
prerr_list_vt(xs: !List_vt(INV(x))): void
//
fun{x:vt0p}
fprint_list_vt
  (out: FILEref, xs: !List_vt(INV(x))): void
fun{} fprint_list_vt$sep (out: FILEref): void
//
fun{x:vt0p}
fprint_list_vt_sep
(
  out: FILEref, xs: !List_vt(INV(x)), sep: NSH(string)
) : void // end of [fprint_list_vt_sep]
//
(* ****** ****** *)
//
fun{x:vt0p}
list_vt_is_nil
  {n:int} (xs: !list_vt(INV(x), n)):<> bool (n==0)
//
fun{x:vt0p}
list_vt_is_cons
  {n:int} (xs: !list_vt(INV(x), n)):<> bool (n > 0)
//
(* ****** ****** *)

fun{x:vt0p}
list_vt_is_sing
  {n:int} (xs: !list_vt(INV(x), n)):<> bool (n==1)
// end of [list_vt_is_sing]

fun{x:vt0p}
list_vt_is_pair
  {n:int} (xs: !list_vt(INV(x), n)):<> bool (n==2)
// end of [list_vt_is_pair]

(* ****** ****** *)

fun{}
list_vt_unnil{x:vt0p} (xs: list_vt(x, 0)):<> void

(* ****** ****** *)

fun{x:vt0p}
list_vt_uncons{n:pos}
  (xs: &list_vt(INV(x), n) >> list_vt(x, n-1)):<!wrt> x
// end of [list_vt_uncons]

(* ****** ****** *)

fun{x:vt0p}
list_vt_length{n:int} (xs: !list_vt(INV(x), n)):<> int n

(* ****** ****** *)

fun{x:vt0p}
list_vt_getref_at
  {n:int}{i:nat | i <= n}
  (xs: &list_vt(INV(x), n), i: int i):<> cPtr1 (list_vt(x, n-i))
// end of [list_vt_getref_at]

(* ****** ****** *)
//
fun{x:t0p}
list_vt_get_at{n:int}
  (xs: !list_vt(INV(x), n), i: natLt n):<> x
//
fun{x:t0p}
list_vt_set_at{n:int}
  (xs: !list_vt(INV(x), n), i: natLt n, x: x):<!wrt> void
//
(* ****** ****** *)

fun{x:vt0p}
list_vt_exch_at{n:int}
  (xs: !list_vt(INV(x), n), i: natLt n, x: &x >> _):<!wrt> void
// end of [list_vt_exch_at]

(* ****** ****** *)

fun{x:vt0p}
list_vt_insert_at{n:int}
(
  xs: &list_vt(INV(x), n) >> list_vt(x, n+1), i: natLte n, x: x
) :<!wrt> void // end of [list_vt_insert_at]

fun{x:vt0p}
list_vt_takeout_at{n:int}
  (xs: &list_vt(INV(x), n) >> list_vt(x, n-1), i: natLt n):<!wrt> x
// end of [list_vt_takeout_at]

(* ****** ****** *)

fun{x:t0p}
list_vt_copy{n:int}
  (xs: !list_vt(INV(x), n)):<!wrt> list_vt(x, n)
// end of [list_vt_copy]

(* ****** ****** *)
//
fun{x:vt0p}
list_vt_copylin{n:int}
  (xs: !list_vt(INV(x), n)):<!wrt> list_vt(x, n)
fun{x:vt0p}
list_vt_copylin$copy (x: &RD(x)): (x)
//
fun{x:vt0p}
list_vt_copylin_fun{n:int}{fe:eff}
  (xs: !list_vt(INV(x), n), f: (&RD(x)) -<fe> x):<!wrt,fe> list_vt(x, n)
//
(* ****** ****** *)

fun{x:t0p}
list_vt_free (xs: List_vt(INV(x))):<!wrt> void

(* ****** ****** *)
//
fun{x:vt0p}
list_vt_freelin
  (xs: List_vt(INV(x))):<!wrt> void
fun{x:vt0p}
list_vt_freelin$clear (x: &x >> x?):<!wrt> void
//
fun{x:vt0p}
list_vt_freelin_fun{fe:eff}
  (xs: List_vt(INV(x)), f: (&x>>x?) -<fe> void):<!wrt,fe> void
//
(* ****** ****** *)
//
fun{
x:vt0p
} list_vt_uninitize
  {n:int} (
  xs: !list_vt(INV(x), n) >> list_vt(x?, n)
) :<!wrt> void // end of [list_vt_uninitize]
//
fun{x:vt0p}
list_vt_uninitize$clear (x: &(x) >> x?):<!wrt> void
//
fun{
x:vt0p
} list_vt_uninitize_fun
  {n:int}{fe:eff}
(
  xs: !list_vt(INV(x), n) >> list_vt(x?, n), f: (&x>>x?) -<fe> void
) :<!wrt,fe> void // end of [list_vt_uninitize_fun]
//
(* ****** ****** *)

fun{
a:vt0p
} list_vt_append
  {n1,n2:int} (
  xs1: list_vt(INV(a), n1), xs2: list_vt(a, n2)
) :<!wrt> list_vt(a, n1+n2) // endfun

(* ****** ****** *)

fun{
x:vt0p
} list_vt_extend{n:int}
  (xs1: list_vt(INV(x), n), x2: x):<!wrt> list_vt(x, n+1)
// end of [list_vt_extend]

fun{x:vt0p}
list_vt_unextend{n:pos}
  (xs: &list_vt(INV(x), n) >> list_vt(x, n-1)):<!wrt> (x)
// end of [list_vt_unextend]

(* ****** ****** *)

macdef list_vt_snoc = list_vt_extend
macdef list_vt_unsnoc = list_vt_unextend

(* ****** ****** *)

fun{x:vt0p}
list_vt_reverse{n:int}
  (xs: list_vt(INV(x), n)):<!wrt> list_vt(x, n)
// end of [list_vt_reverse]

fun{a:vt0p}
list_vt_reverse_append{m,n:int}
  (list_vt(INV(a), m), list_vt(a, n)):<!wrt> list_vt(a, m+n)
// end of [list_vt_reverse_append]

(* ****** ****** *)

fun{x:vt0p}
list_vt_split_at
  {n:int}{i:nat | i <= n}
  (list_vt(INV(x), n), int i):<!wrt> (list_vt(x, i), list_vt(x, n-i))
// end of [list_vt_split_at]

(* ****** ****** *)

fun{x:vt0p}
list_vt_concat
  (xss: List_vt(List_vt(INV(x)))):<!wrt> List0_vt(x)
// end of [list_vt_concat]

(* ****** ****** *)

fun{x:vt0p}
list_vt_separate{n:int}
(
  xs: &list_vt(INV(x), n) >> list_vt(x, n1)
) : #[n1:nat|n1 <= n] list_vt(x, n-n1)

fun{x:vt0p}
list_vt_separate$pred (x: &RD(x)): bool

(* ****** ****** *)
//
fun{x:t0p}
list_vt_filter{n:int}
  (list_vt(INV(x), n)):<!wrt> listLte_vt(x, n)
// end of [list_vt_filter]
//
fun{x:t0p}
list_vt_filter$pred (x: &RD(x)):<> bool
//
(* ****** ****** *)
//
fun{x:vt0p}
list_vt_filterlin{n:int}
  (list_vt(INV(x), n)):<!wrt> listLte_vt(x, n)
//
fun{x:vt0p}
list_vt_filterlin$pred (x: &RD(x)):<> bool
fun{x:vt0p}
list_vt_filterlin$clear (x: &x >> x?):<!wrt> void
//
(* ****** ****** *)

fun{x:vt0p}
list_vt_app (xs: !List_vt(INV(x))): void
fun{x:vt0p}
list_vt_app$fwork (x: &x >> _): void

(* ****** ****** *)
//
fun{x:vt0p}
list_vt_appfree
  (xs: List_vt(INV(x))): void
//
fun{x:vt0p}
list_vt_appfree$fwork (x: &x >> x?): void
//
(* ****** ****** *)
//
fun{
x:vt0p}{y:vt0p
} list_vt_map$fopr(x: &x >> _): (y)
//
fun{
x:vt0p}{y:vt0p
} list_vt_map{n:int}
  (xs: !list_vt(INV(x), n)): list_vt(y, n)
//
(* ****** ****** *)

fun{
x:vt0p}{y:vt0p
} list_vt_map_fun{n:int}
  (xs: !list_vt(INV(x), n), f: (&x) -<fun1> y): list_vt(y, n)
fun{
x:vt0p}{y:vt0p
} list_vt_map_clo{n:int}
  (xs: !list_vt(INV(x), n), f: &(&x) -<clo1> y): list_vt(y, n)
fun{
x:vt0p}{y:vt0p
} list_vt_map_cloref{n:int}
  (xs: !list_vt(INV(x), n), f: (&x) -<cloref1> y): list_vt(y, n)

(* ****** ****** *)
//
fun{
x:vt0p}{y:vt0p
} list_vt_mapfree$fopr(x: &(x) >> x?): (y)
//
fun{
x:vt0p}{y:vt0p
} list_vt_mapfree{n:int}
  (xs: list_vt(INV(x), n)) : list_vt(y, n)
//
(* ****** ****** *)

fun{
x:vt0p}{y:vt0p
} list_vt_mapfree_fun{n:int}
  (xs: list_vt(INV(x), n), f: (&x>>_?) -<fun1> y): list_vt(y, n)
fun{
x:vt0p}{y:vt0p
} list_vt_mapfree_clo{n:int}
  (xs: list_vt(INV(x), n), f: &(&x>>_?) -<clo1> y): list_vt(y, n)
fun{
x:vt0p}{y:vt0p
} list_vt_mapfree_cloref{n:int}
  (xs: list_vt(INV(x), n), f: ( &x>>_? ) -<cloref1> y): list_vt(y, n)

(* ****** ****** *)
//
fun{
x:vt0p
} list_vt_foreach (xs: !List_vt(INV(x))): void
//
fun{
x:vt0p}{env:vt0p
} list_vt_foreach_env (xs: !List_vt(INV(x)), env: &(env) >> _): void
//
fun{
x:vt0p}{env:vt0p
} list_vt_foreach$cont (x: &x, env: &env): bool
fun{
x:vt0p}{env:vt0p
} list_vt_foreach$fwork (x: &x >> _, env: &(env) >> _): void
//
(* ****** ****** *)

fun{
x:vt0p
} list_vt_foreach_fun
  {fe:eff} (
  xs: !List_vt(INV(x)), f: (&x) -<fe> void
) :<fe> void // end of [list_vt_foreach_fun]
fun{
x:vt0p
} list_vt_foreach_cloref
  {fe:eff} (
  xs: !List_vt(INV(x)), f: (&x) -<cloref,fe> void
) :<fe> void // end of [list_vt_foreach_cloref]
fun{
x:vt0p
} list_vt_foreach_funenv
  {v:view}{vt:viewtype}{fe:eff} (
  pfv: !v
| xs: !List_vt(INV(x)), f: (!v | &x, !vt) -<fe> void, env: !vt
) :<fe> void // end of [list_vt_foreach_funenv]

(* ****** ****** *)
//
fun{
x:vt0p
} list_vt_iforeach
  {n:int} (xs: !list_vt(INV(x), n)): natLte(n)
//
fun{
x:vt0p}{env:vt0p
} list_vt_iforeach_env
  {n:int} (xs: !list_vt(INV(x), n), env: &(env) >> _): natLte(n)
//
fun{
x:vt0p}{env:vt0p
} list_vt_iforeach$cont
  (i: intGte(0), x: &x, env: &env): bool
fun{
x:vt0p}{env:vt0p
} list_vt_iforeach$fwork
  (i: intGte(0), x: &x >> _, env: &(env) >> _): void
//
(* ****** ****** *)
//
fun{
a:vt0p
} list_vt_mergesort
  {n:int} (xs: list_vt(INV(a), n)):<!wrt> list_vt(a, n)
fun{
a:vt0p
} list_vt_mergesort$cmp(x1: &RD(a), x2: &RD(a)):<> int(*sgn*)
//
fun{
a:vt0p
} list_vt_mergesort_fun
  {n:int} (
  xs: list_vt(INV(a), n), cmp: cmpref (a)
) :<!wrt> list_vt(a, n) // end of [list_vt_mergesort_fun]
//
(* ****** ****** *)
//
fun{
a:vt0p
} list_vt_quicksort
  {n:int} (xs: list_vt(INV(a), n)):<!wrt> list_vt(a, n)
fun{
a:vt0p
} list_vt_quicksort$cmp(x1: &RD(a), x2: &RD(a)):<> int(*sgn*)
//
fun{
a:vt0p
} list_vt_quicksort_fun
  {n:int} (
  xs: list_vt(INV(a), n), cmp: cmpref (a)
) :<!wrt> list_vt(a, n) // end of [list_vt_quicksort_fun]
//
(* ****** ****** *)
//
fun{a:vt0p}
streamize_list_vt_elt(List_vt(INV(a))):<!wrt> stream_vt(a)
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)
//
overload [] with list_vt_get_at
overload [] with list_vt_set_at
//
overload iseqz with list_vt_is_nil
overload isneqz with list_vt_is_cons
//
overload length with list_vt_length
//
overload copy with list_vt_copy
overload free with list_vt_free
//
overload print with print_list_vt
overload prerr with prerr_list_vt
overload fprint with fprint_list_vt
overload fprint with fprint_list_vt_sep
//
(* ****** ****** *)

(* end of [list_vt.sats] *)
