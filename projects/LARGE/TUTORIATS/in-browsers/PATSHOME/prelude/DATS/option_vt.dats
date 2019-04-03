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
** $PATSHOME/prelude/DATS/CODEGEN/option_vt.atxt
** Time of generation: Sun Nov 20 22:16:42 2016
*)

(* ****** ****** *)

(* Author: Hongwei Xi *)
(* Authoremail: hwxi AT cs DOT bu DOT edu *)
(* Start time: Feburary, 2012 *)

(* ****** ****** *)

implement{a} option_vt_some (x) = Some_vt (x)
implement{a} option_vt_none ( ) = None_vt ( )

(* ****** ****** *)

implement
{a}(*tmp*)
option_vt_make_opt
  (b, x) = (
  if b then let
    prval () = opt_unsome{a}(x) in Some_vt{a}(x)
  end else let
    prval () = opt_unnone{a}(x) in None_vt{a}( )
  end // end of [if]
) (* end of [option_vt_make_opt] *)

(* ****** ****** *)

implement
{}(*tmp*)
option_vt_is_some
  (opt) = case+ opt of
  | Some_vt _ => true | None_vt _ => false
// end of [option_is_some]

implement{}
option_vt_is_none
  (opt) = case+ opt of
  | Some_vt _ => false | None_vt _ => true
// end of [option_is_none]

(* ****** ****** *)

implement
{a}(*tmp*)
option_vt_unsome
  (opt) = x where { val+ ~Some_vt(x) = opt }
// end of [option_unsome]

implement
{a}(*tmp*)
option_vt_unnone
  (opt) = () where { val+ ~None_vt() = opt }
// end of [option_unnone]

(* ****** ****** *)

implement
{a}(*tmp*)
option_vt_free(opt) =
(
case+ opt of ~Some_vt _ => () | ~None_vt _ => ()
) // end of [option_vt_free]

implement
{a}(*tmp*)
option2bool_vt(opt) =
(
case+ opt of ~Some_vt _ => true | ~None_vt _ => false
) // end of [option2bool_vt]

(* ****** ****** *)

implement
{a}(*tmp*)
fprint_option_vt
  (out, opt) = let
in
//
case+ opt of
| @Some_vt (x) => {
    val (
    ) = fprint_string (out, "Some_vt(")
    val () = fprint_ref<a> (out, x)
    val () = fprint_string (out, ")")
    prval () = fold@ (opt)
  } (* end of [Some_vt] *)
| None_vt () => {
    val () = fprint_string (out, "None_vt()")
  } (* end of [None_vt] *)
//
end // end of [fprint_option_vt]

(* ****** ****** *)

(* end of [option_vt.dats] *)
