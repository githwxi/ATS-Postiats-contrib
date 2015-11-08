(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2010-2013 Hongwei Xi, ATS Trustful Software, Inc.
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
** Time of generation: Sat Oct 17 15:19:48 2015
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
// HX: these decls are available in [basic_dyn.sats]
//
stadef option = option_t0ype_bool_type
typedef Option (a:t0p) = [b:bool] option (a, b)
#endif

(* ****** ****** *)

exception NotSomeExn of ()
(*
fun NotSomeExn ():<> exn = "mac#%NotSomeExn_make"
fun isNotSomeExn (x: !exn):<> bool = "mac#%isNotSomeExn"
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
  (opt: option (INV(a), b)):<> option (a, b)
//
(* ****** ****** *)
//
castfn
option_vt2t
  {a:t0p}{b:bool}
  (opt: option_vt (INV(a), b)):<> option (a, b)
castfn
option_of_option_vt
  {a:t0p}{b:bool}
  (opt: option_vt (INV(a), b)):<> option (a, b)
//
(* ****** ****** *)

fun{a:t0p}
option_some (x: a):<> option (a, true)
fun{a:t0p}
option_none ((*void*)):<> option (a, false)

(* ****** ****** *)

fun{}
option_is_some{a:t0p}
  {b:bool} (opt: option (a, b)):<> bool (b)
// end of [option_is_some]

fun{}
option_is_none{a:t0p}
  {b:bool} (opt: option (a, b)):<> bool (~b)
// end of [option_is_none]

(* ****** ****** *)

fun{a:t0p}
option_unsome (opt: option (INV(a), true)):<> a

fun{a:t0p}
option_unsome_exn (opt: Option (INV(a))):<!exn> a

(* ****** ****** *)
//
fun{a:t0p}
option_equal$eqfn (a, a):<> bool
fun{a:t0p}
option_equal
  (opt1: Option(a), opt2: Option(a)):<> bool
//
(* ****** ****** *)
//
fun{a:t0p}
fprint_option
  (out: FILEref, opt: Option (INV(a))): void
//
overload fprint with fprint_option
//
(* ****** ****** *)
//
// overloading for certain symbols
//
(* ****** ****** *)

overload = with option_equal

(* ****** ****** *)

overload iseqz with option_is_none
overload isneqz with option_is_some

(* ****** ****** *)

(* end of [option.sats] *)
