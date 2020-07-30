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

sortdef i0 = int
sortdef b0 = bool
sortdef a0 = addr
sortdef tx = type
sortdef vx = vtype
sortdef t0 = t0ype
sortdef vt = vt0ype

(* ****** ****** *)

sortdef
agtz = {l:a0|l> null}
sortdef
agez = {l:a0|l>=null}

(* ****** ****** *)
//
abstflt interr = int
//
(* ****** ****** *)

abstflt fildes_t0 = int
typedef fildes = fildes_t0

(* ****** ****** *)
//
abstype
p0tr_tx = ptr
abstype
p1tr_a0_tx(l:a0) = ptr
abstype
p2tr_vt_a0_tx(a:vt,l:a0) = ptr
abstype
cp2tr_vt_a0_tx(a:vt,l:a0) = ptr
//
(* ****** ****** *)
abstype
ap2tr_vt_i0_a0_tx(a:vt,n:i0,l:a0) = ptr
(* ****** ****** *)
//
sexpdef
p1tr = p1tr_a0_tx
typedef
p1tr0 = [l:agez] p1tr(l)
typedef
p1tr1 = [l:agtz] p1tr(l)
//
(* ****** ****** *)
//
sexpdef
p2tr = p2tr_vt_a0_tx
//
typedef
p2tr0(a:vt) = [l:agez] p2tr(a, l)
typedef
p2tr1(a:vt) = [l:agtz] p2tr(a, l)
//
(* ****** ****** *)
//
sexpdef
cp2tr = cp2tr_vt_a0_tx
//
typedef
cp2tr0(a:vt) = [l:agez] cp2tr(a, l)
typedef
cp2tr1(a:vt) = [l:agtz] cp2tr(a, l)
//
(* ****** ****** *)
//
sexpdef
ptr0 = p1tr0 and ptr1 = p1tr1
sexpdef
ptr0 = p2tr0 and ptr1 = p2tr1
//
sexpdef
cptr0 = cp2tr0 and ptr1 = cp2tr1
//
(* ****** ****** *)

fun
p1tr_eqzq
{l:a0}(p1tr(l)): bool(l==null)
fun
p1tr_neqzq
{l:a0}(p1tr(l)): bool(l > null)

(* ****** ****** *)

fun
p2tr_eqzq
{a:vt}
{l:a0}(p2tr(a, l)): bool(l==null)
fun
p2tr_neqzq
{a:vt}
{l:a0}(p2tr(a, l)): bool(l > null)

(* ****** ****** *)

fun
cp2tr_eqzq
{a:vt}
{l:a0}(cp2tr(a, l)): bool(l==null)
fun
cp2tr_neqzq
{a:vt}
{l:a0}(cp2tr(a, l)): bool(l > null)

(* ****** ****** *)
//
sexpdef
ap2tr = ap2tr_vt_i0_a0_tx
//
typedef
ap2tr(a:vt, n:i0) = [l:a0] ap2tr(a,n,l)
//
(* ****** ****** *)

(* end of [basics.sats] *)
