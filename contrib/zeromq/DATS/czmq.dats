(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2014 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
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
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start Time: November, 2014
*)

(* ****** ****** *)
//
// HX: no dynloading
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
staload UN =
  "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

staload "./../SATS/czmq.sats"

(* ****** ****** *)

#define nullp the_null_ptr

(* ****** ****** *)

implement
zsock_new_exn
  (e) = sock where
{
  val sock = zsock_new (e)
  val ((*void*)) = assertloc (zsock2ptr(sock) > 0)
} (* end of [zsock_new_exn] *)

(* ****** ****** *)

(* end of [czmq.dats] *)
