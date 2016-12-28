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
** $PATSHOME/prelude/DATS/CODEGEN/array_prf.atxt
** Time of generation: Sun Nov 20 21:18:28 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

primplmnt
array_v_unnil_nil
  {a1,a2}(pf) = let
//
prval () =
  array_v_unnil{a1}(pf)
//
in
  array_v_nil{a2}((*void*))
//
end // end of [array_v_unnil]

(* ****** ****** *)

primplmnt
array_v_sing
  (pfat) =
(
//
array_v_cons(pfat, array_v_nil())
//
) (* end of [array_v_sing] *)

primplmnt
array_v_unsing
  (pfarr) = let
//
prval
(
  pf1at, pf2arr
) = array_v_uncons (pfarr)
//
prval () = array_v_unnil (pf2arr)
//
in
  pf1at
end // end of [array_v_unsing]

(* ****** ****** *)

primplmnt
array_v_split
  {a}(pf_arr) =
  split (pf_arr) where
{
//
prfun
split
  {l:addr} 
  {n,i:nat | i <= n} .<i>.
(
  pf_arr: array_v (a, l, n)
) : (
  array_v (a, l, i), array_v (a, l+i*sizeof(a), n-i)
) = (
//
sif
i > 0
then let
  prval (pf1elt, pf2arr) = array_v_uncons(pf_arr)
  prval (pf1arr_res, pf2arr_res) = split{..}{n-1,i-1}(pf2arr)
in
  (array_v_cons (pf1elt, pf1arr_res), pf2arr_res)
end // end of [then]
else let
  prval EQINT () =
    eqint_make{i,0}() in (array_v_nil{a}{l}((*void*)), pf_arr)
  // end of [prval]
end // end of [else]
//
) (* end of [split] *)
//
} (* end of [array_v_split] *)

(* ****** ****** *)

primplmnt
array_v_split_at
  {a}{l}{n}{i}(pf | i) = array_v_split{a}{l}{n}{i}(pf)
// end of [array_v_split_at]

(* ****** ****** *)

primplmnt
array_v_unsplit
  {a}(pf1arr, pf2arr) =
  unsplit (pf1arr, pf2arr) where
{
//
prval () = lemma_array_v_param (pf1arr)
prval () = lemma_array_v_param (pf2arr) 
//
prfun
unsplit
  {l:addr}
  {n1,n2:nat} .<n1>.
(
  pf1arr: array_v (a, l, n1)
, pf2arr: array_v (a, l+n1*sizeof(a), n2)
) : array_v (a, l, n1+n2) =
(
//
sif
n1 > 0
then let
  prval @(
    pf11elt, pf12arr
  ) = array_v_uncons (pf1arr)
  prval pf_arr_res = unsplit (pf12arr, pf2arr)
in
  array_v_cons (pf11elt, pf_arr_res)
end // end of [then]
else let
  prval
  EQINT () = eqint_make {n1,0} ()
  prval () = array_v_unnil (pf1arr) in pf2arr
end // end of [sif]
//
) (* end of [unsplit] *)
//
} (* end of [array_v_unsplit] *)

(* ****** ****** *)

primplmnt
array_v_extend
  {a}(pf1arr, pf2at) =
(
//
array_v_unsplit
(
  pf1arr, array_v_sing{a}(pf2at)
) // end of [array_v_unsplit]
//
) (* end of [array_v_extend] *)

primplmnt
array_v_unextend
  {a}{l}{n} (pfarr) = let
//
prval (pf1arr, pf2arr) =
  array_v_split{a}{l}{n}{n-1}(pfarr)
//
in
  (pf1arr, array_v_unsing{a}(pf2arr))
end // end of [array_v_unextend]

(* ****** ****** *)

primplmnt
array_v_takeout
  {a}{l}{n}{i} (pfarr) =
  takeout{..}{n}{i}(pfarr) where
{
//
prfun
takeout
  {l:addr}{n:int}
  {i:nat | i < n} .<i>.
(
  pfarr: array_v (a, l, n)
) : vtakeout (
  array_v (a, l, n), a@l+i*sizeof(a)
) = let
  prval @(pf1at, pf2arr) = array_v_uncons(pfarr)
in
  sif i > 0 then let
    prval (pfat, fpf) = takeout{..}{n-1}{i-1}(pf2arr)
  in
    (pfat, llam pfat =<prf> array_v_cons{a}(pf1at, fpf(pfat)))
  end else let
    prval EQINT () = eqint_make{i,0}((*void*))
  in
    (pf1at, llam pf1at =<prf> array_v_cons{a}(pf1at, pf2arr))
  end // end of [sif]
end // end of takeout]
//
} // end of [array_v_takeout]

(* ****** ****** *)

(* end of [array_prf.dats] *)
