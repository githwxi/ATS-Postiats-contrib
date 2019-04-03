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
** $PATSHOME/prelude/SATS/CODEGEN/strptr.atxt
** Time of generation: Tue Dec 20 20:00:16 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2012 *)

(* ****** ****** *)

(*
** HX-2012:
** a Strptr0 is either the null-pointer or Strptr1
** a Strptr1 is a null-terminated arrayptr of characters
*)

(* ****** ****** *)
//
abst@ype
strbuf_t0ype
  (m:int, n:int) // HX: [m] byte size
//
(* ****** ****** *)
//
stadef
strbuf = strbuf_t0ype
viewdef
strbuf_v
  (l:addr, m:int, n:int) = strbuf (m, n) @ l
//
(* ****** ****** *)
//
praxi
strbuf2bytes
  {m,n:int}
  (buf: &strbuf (m, n) >> b0ytes (m)): void
//
praxi
strbuf2bytes_v
  {l:addr}{m,n:int}
  (pf: strbuf_v (l, m, n)): b0ytes_v (l, m)
//
(* ****** ****** *)

praxi
lemma_strptr_param
  {l:addr} (x: !strptr l): [l>=null] void
// end of [lemma_strptr_param]

praxi
lemma_strnptr_param
  {l:addr}{n:int}
(
  x: !strnptr (l, n)
) : [(l>null&&n>=0) || (l==null&&n==(~1))] void
// end of [lemma_strnptr_param]

(* ****** ****** *)

praxi
lemma_strbuf_param
  {l:addr}{m,n:int}
  (x: &strbuf (m, n)): [m>n] void
// end of [lemma_strbuf_param]

praxi
lemma_strbuf_v_param
  {l:addr}{m,n:int}
  (pf: !strbuf_v (l, m, n)): [l>null;m>n] void
// end of [lemma_strbuf_v_param]

(* ****** ****** *)

castfn
strptr2ptr
  {l:addr} (x: !strptr l):<> ptr (l)
castfn
strnptr2ptr
  {l:addr}{n:int} (x: !strnptr(l, n)):<> ptr(l)
// end of [strnptr2ptr]

(* ****** ****** *)
//
castfn
strnptr2strptr
  {l:addr}{n:int} (x: strnptr(l, n)):<> strptr(l)
// end of [strnptr2strptr]

castfn
strptr2strnptr
  {l:addr} (x: strptr(l)):<> [n:int] strnptr(l, n)
// end of [strptr2strnptr]
//
(* ****** ****** *)
//
castfn
strptr2stropt
  {l:addr}
(
  x: strptr (l)
) :<>
[n:int
|(l==null&&n < 0)||(l>null&&n>=0)
] stropt(n)
//
castfn
strptr2stropt0(x: Strptr0):<> Stropt0
castfn
stropt2stropt1(x: Strptr1):<> Stropt1
//
castfn
strnptr2stropt
  {l:addr}{n:int}
  (x: strnptr(l, n)):<> stropt(n)
//
(* ****** ****** *)
//
castfn
strptr2string(x: Strptr1):<> String
//
castfn
strnptr2string
  {l:addr}{n:nat}(x: strnptr(l, n)):<> string(n)
//
(* ****** ****** *)

fun strptr_null():<> strptr(null) = "mac#%"

(* ****** ****** *)

praxi
strptr_free_null
  {l:addr | l <= null} (x: strptr(l)):<> void
// end of [strptr_free_null]

(* ****** ****** *)

fun{}
strptr_is_null
  {l:addr} (x: !strptr l):<> bool (l==null)
fun{}
strptr_isnot_null
  {l:addr} (x: !strptr l):<> bool (l > null)

(* ****** ****** *)

fun{}
strptr_is_empty(x: !Strptr1):<> bool
fun{}
strptr_isnot_empty(x: !Strptr1):<> bool

(* ****** ****** *)
//
fun{}
strnptr_is_null
  {l:addr}{n:int}
  (x: !strnptr(l, n)):<> bool(l==null)
fun{}
strnptr_isnot_null
  {l:addr}{n:int}
  (x: !strnptr(l, n)):<> bool(l > null)
//
(* ****** ****** *)
//
praxi
strnptr_free_null
  {l:addr|l <= null}{n:int} (x: strnptr(l, n)):<> void
// end of [strnptr_free_null]
//
(* ****** ****** *)

fun lt_strptr_strptr
  (x1: !Strptr0, x2: !Strptr0):<> bool = "mac#%"
overload < with lt_strptr_strptr
fun lte_strptr_strptr
  (x1: !Strptr0, x2: !Strptr0):<> bool = "mac#%"
overload <= with lte_strptr_strptr

fun gt_strptr_strptr
  (x1: !Strptr0, x2: !Strptr0):<> bool = "mac#%"
overload > with gt_strptr_strptr
fun gte_strptr_strptr
  (x1: !Strptr0, x2: !Strptr0):<> bool = "mac#%"
overload >= with gte_strptr_strptr

fun eq_strptr_strptr
  (x1: !Strptr0, x2: !Strptr0):<> bool = "mac#%"
overload = with eq_strptr_strptr
fun neq_strptr_strptr
  (x1: !Strptr0, x2: !Strptr0):<> bool = "mac#%"
overload != with neq_strptr_strptr
overload <> with neq_strptr_strptr

(* ****** ****** *)
//
fun compare_strptr_strptr
  (x1: !Strptr0, x2: !Strptr0):<> Sgn = "mac#%"
//
(* ****** ****** *)

fun eq_strptr_string
  (x1: !Strptr1, x2: string):<> bool = "mac#%"
overload = with eq_strptr_string

fun neq_strptr_string
  (x1: !Strptr1, x2: string):<> bool = "mac#%"
overload != with neq_strptr_string
overload <> with neq_strptr_string

(* ****** ****** *)
//
fun compare_strptr_string
  (x1: !Strptr1, x2: string):<> Sgn = "mac#%"
//
(* ****** ****** *)

fun strptr_free (x: Strptr0):<!wrt> void = "mac#%"
fun strnptr_free (x: Strnptr0):<!wrt> void = "mac#%"

(* ****** ****** *)
//
fun
fprint_strptr
(
  out: FILEref, x: !Strptr0
) : void = "mac#%"
//
fun print_strptr (x: !Strptr0): void = "mac#%"
fun prerr_strptr (x: !Strptr0): void = "mac#%"
//
(* ****** ****** *)
//
fun
print_strbuf
  {m,n:int}(buf: &strbuf(m, n)): void = "mac#%"
fun
prerr_strbuf
  {m,n:int}(buf: &strbuf(m, n)): void = "mac#%"
//
fun
fprint_strbuf{m,n:int}
  (out: FILEref, buf: &strbuf (m, n)): void = "mac#%"
//
(* ****** ****** *)
//
fun{}
strnptr_get_at_size
  {n:int}
  (str: !strnptr (n), i: sizeLt n):<> charNZ
//
fun{tk:tk}
strnptr_get_at_gint
  {n:int}{i:nat | i < n}
  (str: !strnptr(n), i: g1int(tk, i)):<> charNZ
fun{tk:tk}
strnptr_get_at_guint
  {n:int}{i:nat | i < n}
  (str: !strnptr(n), i: g1uint(tk, i)):<> charNZ
//
symintr strnptr_get_at
overload strnptr_get_at with strnptr_get_at_size of 1
overload strnptr_get_at with strnptr_get_at_gint of 0
overload strnptr_get_at with strnptr_get_at_guint of 0
//
(* ****** ****** *)
//
fun{}
strnptr_set_at_size
  {n:int}
  (str: !strnptr(n), i: sizeLt n, c: charNZ):<!wrt> void
//
fun{tk:tk}
strnptr_set_at_gint
  {n:int}{i:nat | i < n}
  (str: !strnptr(n), i: g1int(tk, i), c: charNZ):<!wrt> void
fun{tk:tk}
strnptr_set_at_guint
  {n:int}{i:nat | i < n}
  (str: !strnptr(n), i: g1uint(tk, i), c: charNZ):<!wrt> void
//
symintr strnptr_set_at
overload strnptr_set_at with strnptr_set_at_size of 1
overload strnptr_set_at with strnptr_set_at_gint of 0
overload strnptr_set_at with strnptr_set_at_guint of 0
//
(* ****** ****** *)

fun{}
strptr_length (x: !Strptr0):<> ssize_t
fun{}
strnptr_length {n:int} (x: !strnptr n):<> ssize_t (n)

(* ****** ****** *)
//
fun{}
strptr0_copy (x: !Strptr0):<!wrt> Strptr0
fun{}
strptr1_copy (x: !Strptr1):<!wrt> Strptr1
fun{}
strnptr_copy
  {n:int} (x: !strnptr (n)):<!wrt> strnptr (n)
//
(* ****** ****** *)
//
fun{}
strptr_append
  (x1: !Strptr0, x2: !Strptr0):<!wrt> Strptr0
fun{}
strnptr_append{n1,n2:nat}
  (x1: !strnptr n1, x2: !strnptr n2):<!wrt> strnptr(n1+n2)
//
(* ****** ****** *)

fun{}
strptrlst_free (xs: List_vt(Strptr0)):<!wrt> void

(* ****** ****** *)

fun{}
strptrlst_concat (xs: List_vt(Strptr0)):<!wrt> Strptr0

(* ****** ****** *)

fun{
env:vt0p
} strnptr_foreach$cont (c: &charNZ, env: &env): bool
fun{
env:vt0p
} strnptr_foreach$fwork (c: &charNZ >> _, env: &env): void
fun{}
strnptr_foreach {n:nat} (str: !strnptr n): sizeLte(n)
fun{
env:vt0p
} strnptr_foreach_env
  {n:nat} (str: !strnptr n, env: &(env) >> _): sizeLte(n)
// end of [strnptr_foreach_env]

(* ****** ****** *)

fun{
env:vt0p
} strnptr_rforeach$cont (c: &charNZ, env: &env): bool
fun{
env:vt0p
} strnptr_rforeach$fwork (c: &charNZ >> _, env: &env): void
fun{}
strnptr_rforeach {n:nat} (str: !strnptr n): sizeLte(n)
fun{
env:vt0p
} strnptr_rforeach_env
  {n:nat} (str: !strnptr n, env: &(env) >> _): sizeLte(n)
// end of [strnptr_rforeach_env]

(* ****** ****** *)
//
// overloading for certain symbols
//
overload
[] with strnptr_get_at_size of 1
overload
[] with strnptr_get_at_gint of 0
overload
[] with strnptr_get_at_guint of 0
//
overload
[] with strnptr_set_at_size of 1
overload
[] with strnptr_set_at_gint of 0
overload
[] with strnptr_set_at_guint of 0
//
overload iseqz with strptr_is_null
overload iseqz with strnptr_is_null
overload isneqz with strptr_isnot_null
overload isneqz with strnptr_isnot_null
//
overload
compare with compare_strptr_strptr
overload
compare with compare_strptr_string
//
overload length with strptr_length
overload length with strnptr_length
//
overload copy with strptr0_copy of 0
overload copy with strptr1_copy of 10
//
overload free with strptr_free
overload free with strnptr_free
//
overload print with print_strptr
overload prerr with prerr_strptr
overload fprint with fprint_strptr
//
overload print with print_strbuf
overload prerr with prerr_strbuf
overload fprint with fprint_strbuf
//
overload ptrcast with strptr2ptr
overload ptrcast with strnptr2ptr
//
(* ****** ****** *)

(* end of [strptr.sats] *)
