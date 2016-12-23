(* ****** ****** *)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2016 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)

(* ****** ****** *)

%{#
//
#include \
"libatsext/libc/CATS/basics.cats"
//
%} (* end of [%{#] *)

(* ****** ****** *)
//
abst0ype
interr_t0ype(i:int) = int
//
stadef interr = interr_t0ype
typedef interr = [i:int] interr(i)
//
(* ****** ****** *)
//
abstype
ptr_addr_type(l:addr) = ptr
abstype
ptr_vt0ype_addr_type(a:vt@ype, l:addr, rw:int) = ptr
abstype
ptrn_vt0ype_addr_int_type(a:vt@ype, l:addr, n:int, rw:int) = ptr
//
typedef
ptr(l:addr) = ptr_addr_type(l)
typedef
ptr(a:vt0p, l:addr, rw:int) = ptr_vt0ype_addr_type(a, l, rw)
typedef
ptrn(a:vt0p, l:addr, n:int, rw:int) = ptrn_vt0ype_addr_int_type(a, l, n, rw)
//
(* ****** ****** *)
//
typedef ptr0 = [l:agez] ptr(l)
typedef ptr1 = [l:addr | l > null] ptr(l)
//
typedef rptr0(a:vt0p) = [l:agez] ptr(a, l, 0)
typedef wptr0(a:vt0p) = [l:agez] ptr(a, l, 1)
typedef rptr1(a:vt0p) = [l:addr | l > null] ptr(a, l, 0)
typedef wptr1(a:vt0p) = [l:addr | l > null] ptr(a, l, 1)
//
typedef rptrn0(a:vt0p, n:int) = [l:agez] ptrn(a, l, n, 0)
typedef wptrn0(a:vt0p, n:int) = [l:agez] ptrn(a, l, n, 1)
typedef rptrn1(a:vt0p, n:int) = [l:addr | l > null] ptrn(a, l, n, 0)
typedef wptrn1(a:vt0p, n:int) = [l:addr | l > null] ptrn(a, l, n, 1)
//
typedef cstring = [l:agez;n:nat] ptrn(char, l, n, 0)
typedef cstring(n:int) = [l:agez] ptrn(char, l, n, 0)
//
typedef cstrptr = [l:agez;n:nat] ptrn(char, l, n, 1)
typedef cstrptr(n:int) = [l:agez] ptrn(char, l, n, 1)
//
(* ****** ****** *)
//
fun{}
interr_get_int
  {i:int}(interr(i)): int(i)
//
overload int with interr_get_int
//
fun{}
interr_is_err
  {i:int}(interr(i)): bool(i < 0)
fun{}
interr_isnot_err
  {i:int}(interr(i)): bool(i >= 0)
//
overload is_err with interr_is_err
overload isnot_err with interr_isnot_err
//
(* ****** ****** *)
//
fun
gt_ptr_intz
{a:vt0p}
{l:addr}
{rw:int}
(
 ptr(a, l, rw), int(0)
) : bool(l > null) = "mac#libcats_gt_ptr_intz"
//
fun
eq_ptr_intz
{a:vt0p}
{l:addr}
{rw:int}
(
 ptr(a, l, rw), int(0)
) : bool(l == null) = "mac#libcats_eq_ptr_intz"
//
fun
neq_ptr_intz
{a:vt0p}
{l:addr}
{rw:int}
(
 ptr(a, l, rw), int(0)
) : bool(l != null) = "mac#libcats_neq_ptr_intz"
//
overload > with gt_ptr_intz
overload = with eq_ptr_intz
overload != with neq_ptr_intz
//
(* ****** ****** *)
//
fun
{a:t0p}
ptr1_get{l:agz}
  {rw:int|rw >= 0}(p: ptr(a, l, rw)): (a)
fun
{a:t0p}
ptr1_set{l:agz}
  {rw:int|rw >= 1}(p: ptr(a, l, rw), x: a): void
fun
{a:vt0p}
ptr1_exch{l:agz}
  {rw:int|rw >= 1}(p: ptr(a, l, rw), x: &a >> _): (a)
//
(*
overload ! with ptr1_get
overload ! with ptr1_set
*)
overload .get with ptr1_get
overload .set with ptr1_set
overload .exch with ptr1_exch
//
(* ****** ****** *)

(* end of [basics.sats] *)
