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
** $PATSHOME/prelude/SATS/CODEGEN/option.atxt
** Time of generation: Thu Dec 22 00:36:39 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: February, 2012 *)

(* ****** ****** *)

sortdef t0p = t@ype

(* ****** ****** *)

#if(0)
//
// HX:
// these declarations
// are available in [basic_dyn.sats]
//
stadef
option = option_t0ype_bool_type
typedef
Option (a:t0p) = [b:bool] option(a, b)
#endif

(* ****** ****** *)

exception NotSomeExn of ()
(*
fun
NotSomeExn
  ():<> exn = "mac#%NotSomeExn_make"
fun
isNotSomeExn
  (x: !exn):<> bool = "mac#%isNotSomeExn"
macdef
ifNotSomeExn
  {tres}(exn, body) =
(
let val x = ,(exn) in
(
if isNotSomeExn(x)
  then
    let prval () = __vfree_exn (x) in ,(body) end
  else $raise (x)
) : tres // end of [if]
end (* end of [let] *)
) // end of [ifNotSomeExn]
*)

(* ****** ****** *)
//
castfn
option_cast
  {a:t0p}{b:bool}
(
  opt: option(INV(a), b)
) :<> option(a, b) // end-of-fun
//
(* ****** ****** *)
//
castfn
option_vt2t
  {a:t0p}{b:bool}
(
  opt: option_vt(INV(a), b)
) :<> option(a, b) // end-of-fun
castfn
option_of_option_vt
  {a:t0p}{b:bool}
(
  opt: option_vt(INV(a), b)
) :<> option(a, b) // end-of-fun
//
(* ****** ****** *)
//
fun{a:t0p}
option_some
  (x0: a):<> option(a, true)
//
fun{a:t0p}
option_none
  ((*void*)):<> option(a, false)
//
(* ****** ****** *)
//
fun{}
option2bool
  {a:t0p}{b:bool}
  (opt: option(a, b)):<> bool(b)
//
(* ****** ****** *)

fun{}
option_is_some
  {a:t0p}{b:bool}
  (opt: option(a, b)):<> bool(b)

fun{}
option_is_none
  {a:t0p}{b:bool}
  (opt: option(a, b)):<> bool(~b)

(* ****** ****** *)
//
fun{a:t0p}
option_unsome
  (option(INV(a), true)):<> (a)
//
fun{a:t0p}
option_unsome_exn
  (opt: Option(INV(a))):<!exn> (a)
//
(* ****** ****** *)
//
fun{a:t0p}
option_equal
(
  opt1: Option(a), opt2: Option(a)
) :<> bool // end of [option_equal]
//
fun{a:t0p}
option_equal$eqfn(x1: a, x2: a):<> bool
//
(* ****** ****** *)
//
fun{a:t0p}
print_option(opt: Option(INV(a))): void
fun{a:t0p}
prerr_option(opt: Option(INV(a))): void
fun{a:t0p}
fprint_option(FILEref, Option(INV(a))): void
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)

overload = with option_equal

(* ****** ****** *)
//
overload unsome with option_unsome
//
overload iseqz with option_is_none
overload isneqz with option_is_some
//
overload print with print_option of 0
overload prerr with prerr_option of 0
overload fprint with fprint_option of 0
//
(* ****** ****** *)

(* end of [option.sats] *)
