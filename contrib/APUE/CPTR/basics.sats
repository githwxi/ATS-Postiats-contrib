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
//
staload
UN = "prelude/SATS/unsafe.sats"
//
overload .get with $UN.cptr_get
overload .set with $UN.cptr_set
overload .exch with $UN.cptr_exch
//
(* ****** ****** *)
//
abst@ype interr = int
//
(* ****** ****** *)
//
typedef
cPPtr00(a:vt0ype) = cPtr0(cPtr0(a))
typedef
cPPtr01(a:vt0ype) = cPtr0(cPtr1(a))
typedef
cPPtr10(a:vt0ype) = cPtr1(cPtr0(a))
typedef
cPPtr11(a:vt0ype) = cPtr1(cPtr1(a))
//
(* ****** ****** *)
//
abstype
captr_vt0ype_addr_int_type
  (a:vt0ype,l:addr,n:int) = ptr(l)
//
typedef
captr(a:vt0ype, l:addr, n:int) =
captr_vt0ype_addr_int_type(a, l, n)
//
typedef
caPtr0(a:vt0ype, n:int) =
[l:agez]
captr_vt0ype_addr_int_type(a, l, n)
typedef
caPtr1(a:vt0ype, n:int) =
[l:addr | l > null]
captr_vt0ype_addr_int_type(a, l, n)
//
(* ****** ****** *)

(* end of [basics.sats] *)
