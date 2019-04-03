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
** $PATSHOME/prelude/SATS/CODEGEN/memory.atxt
** Time of generation: Sun Nov 20 21:18:17 2016
*)

(* ****** ****** *)

typedef bytes (n:int) = @[byte][n]
typedef b0ytes (n:int) = @[byte?][n]

(* ****** ****** *)

viewdef bytes_v (l:addr, n:int) = bytes (n) @ l
viewdef b0ytes_v (l:addr, n:int) = b0ytes (n) @ l

(* ****** ****** *)

praxi
b0ytes2bytes
  {l:addr}{n:int} (&b0ytes(n) >> bytes(n)): void
// end of [b0ytes2bytes]
praxi
b0ytes2bytes_v
  {l:addr}{n:int} (pf: b0ytes_v (l, n)): bytes_v (l, n)
// end of [b0ytes2bytes_v]

(* ****** ****** *)

prfun
bytes_v_split
  {l:addr}
  {n:int}{i:nat | i <= n}
  (pf: bytes_v (l, n)): (bytes_v (l, i), bytes_v (l+i, n-i))
// end of [bytes_v_split]

prfun
bytes_v_split_at
  {l:addr}
  {n:int}{i:nat | i <= n}
  (pf: bytes_v (l, n) | i: size_t (i)): (bytes_v (l, i), bytes_v (l+i, n-i))
// end of [bytes_v_split_at]

(* ****** ****** *)

prfun
bytes_v_unsplit
  {l:addr}{n1,n2:int}
  (pf1: bytes_v (l, n1), pf2: bytes_v (l+n1, n2)): bytes_v (l, n1+n2)
// end of [bytes_v_unsplit]

(* ****** ****** *)
//
// HX-2013-08:
// for memory initialization
//
fun minit_gc (): void = "mac#%"
//
(* ****** ****** *)

fun
mfree_gc
  {l:addr}{n:int}
(
  pfat: b0ytes n @ l
, pfgc: mfree_gc_v (l) | ptr l
) :<!wrt> void = "mac#%"

fun
malloc_gc
  {n:int}
(
  bsz: size_t (n)
) :<!wrt>
  [l:agz]
(
  b0ytes n @ l, mfree_gc_v (l) | ptr l
) = "mac#%" // endfun

(* ****** ****** *)

absview memory$free_v (l:addr)

(* ****** ****** *)

fun{
} memory$free
  {l:addr}{n:int}
(
  pfat: b0ytes n @ l
, pfmf: memory$free_v (l) | ptr l
) :<!wrt> void // end-of-fun

fun{
} memory$alloc
  {n:int}
(
  bsz: size_t (n)
) :<!wrt>
  [l:agz]
(
  b0ytes n @ l, memory$free_v (l) | ptr l
) (* end of [memory$alloc] *)

(* ****** ****** *)

(* end of [memory.sats] *)
