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
** $PATSHOME/prelude/DATS/CODEGEN/memory.atxt
** Time of generation: Sun Nov 20 21:18:25 2016
*)

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

implement
{}(*tmp*)
memory$free{l}
  (pfat, pfmf | p) = let
//
prval pfgc = $UN.castview0{mfree_gc_v(l)}(pfmf)
//
in
  mfree_gc (pfat, pfgc | p)
end // end of [memory$free]

(* ****** ****** *)

implement
{}(*tmp*)
memory$alloc
  {n} (bsz) = let
//
val [l:addr]
  (pfat, pfgc | p) = malloc_gc (bsz)
prval pfmf = $UN.castview0{memory$free_v(l)}(pfgc)
//
in
  (pfat, pfmf | p)
end // end of [memory$alloc]

(* ****** ****** *)

(* end of [memory.dats] *)
