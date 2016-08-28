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

%{#
#include "zeromq/CATS/czmq.cats"
%} // end of [%{#]

(* ****** ****** *)

#define ATS_PACKNAME "ATSCNTRB.zeromq"
#define ATS_EXTERN_PREFIX "atscntrb_zeromq_"

(* ****** ****** *)

staload "./zmq.sats"

(* ****** ****** *)

macdef
CZMQ_VERSION = $extval(int, "CZMQ_VERSION")
  
(* ****** ****** *)
//
absvtype zsock_vtype (l:addr) = ptr(l)
vtypedef zsock (l:addr) = zsock_vtype(l)
vtypedef zsock = [l:addr] zsock_vtype(l)
vtypedef zsock0 = [l:agez] zsock_vtype(l)
vtypedef zsock1 = [l:addr | l > null] zsock_vtype(l)
//
castfn
zsock2ptr
  {l:addr}(!zsock(l)):<> ptr(l)
//
overload ptrcast with zsock2ptr
//
(* ****** ****** *)
//
absvtype zstr_vtype (l:addr) = ptr(l)
vtypedef zstr (l:addr) = zstr_vtype(l)
vtypedef zstr = [l:addr] zstr_vtype(l)
vtypedef zstr0 = [l:agez] zstr_vtype(l)
vtypedef zstr1 = [l:addr | l > null] zstr_vtype(l)
//
castfn
zstr2ptr
  {l:addr}(!zstr(l)):<> ptr(l)
//
overload ptrcast with zstr2ptr
//
castfn
zstr2strptr{l:addr}
  (!zstr(l)):<> (strptr(l) -<lin,prf> zstr(l) | strptr(l))
//
(* ****** ****** *)
//
absvtype zframe_vtype (l:addr) = ptr(l)
vtypedef zframe (l:addr) = zframe_vtype(l)
vtypedef zframe = [l:addr] zframe_vtype(l)
vtypedef zframe0 = [l:agez] zframe_vtype(l)
vtypedef zframe1 = [l:addr | l > null] zframe_vtype(l)
//
castfn
zframe2ptr
  {l:addr}(!zframe(l)):<> ptr(l)
//
overload ptrcast with zframe2ptr
//
prfun zframe_free_null (zframe0): void
//
(* ****** ****** *)
//
// ZSOCK
//
(* ****** ****** *)
//
fun
zsock_new (type: int): zsock0 = "mac#%"
fun
zsock_new_exn (type: int): zsock1 = "ext#%"
//
(* ****** ****** *)
//
fun
zsock_new_pair (name: string): zsock0 = "mac#%"
//
(* ****** ****** *)
//
fun
zsock_get_socket
  {l:agz}
  (sock: !zsock(l))
: [l2:agz]
  vtget1(zsock(l), zmqsock(l2)) = "mac#%"
//
(* ****** ****** *)
//
fun
zsock_bind
  (sock: !zsock1, endpt: string): interr = "mac#%"
//
(* ****** ****** *)

fun zsock_destroy (&zsock0 >> _?): void = "mac#%"  
fun zsock_destroy_val (sock: zsock0): void = "mac#%"
  
(* ****** ****** *)
//
fun
zsock_set_router_raw (!zsock1, int): void = "mac#%"
//
(* ****** ****** *)
//
// ZSTR
//
(* ****** ****** *)

fun zstr_recv (!zsock1): zstr0 = "mac#%"
fun zmqstr_recv (!zmqsock1): zstr0 = "mac#%"

(* ****** ****** *)

fun zstr_send (!zsock1, msg: string): interr = "mac#%"

(* ****** ****** *)

fun zstr_free (&zstr >> _?): void = "mac#%"
fun zstr_free_val (str: zstr0): void = "mac#%"

(* ****** ****** *)
//
// ZFRAME
//
(* ****** ****** *)
//
macdef
ZFRAME_MORE = $extval(int, "ZFRAME_MORE") // = 1
macdef
ZFRAME_REUSE = $extval(int, "ZFRAME_REUSE") // = 2
macdef
ZFRAME_DONTWAIT = $extval(int, "ZFRAME_DONTWAIT") // = 4
//
(* ****** ****** *)
//
fun
zframe_new
  {n1,n2:int | n1 >= n2}
(
  buf: &(@[byte][n1]), bsz: size_t(n2)
) : zframe0 = "mac#%" // endfun
//
fun zframe_new_empty (): zframe0 = "mac#%"
//
(* ****** ****** *)

fun zframe_recv (!zsock1): zframe0 = "mac#%"
fun zmqframe_recv (!zmqsock1): zframe0 = "mac#%"

(* ****** ****** *)
//
fun
zframe_send1
(
  &zframe1, !zsock1, int(*flags*)
) : int = "mac#%" // end-of-function
fun
zframe_send1_val
(
  !zframe1, !zsock1, int(*flags*)
) : int = "mac#%" // end-of-function
//
fun
zframe_send0
(
  &zframe1 >> _?, !zsock1, int(*flags*)
) : int = "mac#%" // end-of-function
fun
zframe_send0_val
  (zframe1, !zsock1, int(*flags*)): int = "mac#%"
//
(* ****** ****** *)

fun zframe_destroy (&zframe0 >> _?): void = "mac#%"  
fun zframe_destroy_val (frame: zframe0): void = "mac#%"
  
(* ****** ****** *)

fun zframe_more (!zframe1): int = "mac#%"

(* ****** ****** *)

fun zframe_size (!zframe1): size_t = "mac#%"
fun zframe_data (!zframe1): cPtr0(byte) = "mac#%"

(* ****** ****** *)

fun zframe_eq (!zframe0, !zframe0): bool = "mac#%"
fun zframe_streq (!zframe0, string): bool = "mac#%"

(* ****** ****** *)

fun zframe_print (!zframe0, prfx: stropt): void = "mac#%"

(* ****** ****** *)

(* end of [czmq.sats] *)
