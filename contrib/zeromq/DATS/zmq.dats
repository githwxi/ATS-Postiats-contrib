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
** Start Time: December, 2012
** Continue Time: November, 2014
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

staload "./../SATS/zmq.sats"

(* ****** ****** *)

#define nullp the_null_ptr

(* ****** ****** *)

implement
zmq_ctx_new_exn
  () = ctx where
{
  val ctx = zmq_ctx_new ()
  val ((*void*)) = assertloc (zmqctx2ptr(ctx) > 0)
} (* end of [zmq_ctx_new_exn] *)

(* ****** ****** *)

(*
fun zmq_ctx_destroy_exn (ctx: zmqctx1) : void
*)
implement
zmq_ctx_destroy_exn
  (ctx) = () where
{
  val err = zmq_ctx_destroy (ctx)
  val ((*void*)) = assertloc (err >= 0)
  prval _(*ptr*) = zmqctxopt_unnone(ctx)
} // end of [zmq_ctx_destroy_exn]

(* ****** ****** *)

(*
fun zmq_socket_exn
  (ctx: !zmqctx1, type: int): zmqsock1
// end of [zmq_socket_exn]
*)
implement
zmq_socket_exn
  (ctx, type) =
  sock where
{
  val sock = zmq_socket (ctx, type)
  val ((*void*)) = assertloc (zmqsock2ptr(sock) > 0)
} (* end of [zmq_socket_exn] *)

(* ****** ****** *)

(*
fun zmq_bind_exn
(
  sock: !zmqsock1, endpt: NSH(string)
) : void // end of [zmq_bind_exn]
*)
implement
zmq_bind_exn
  (sock, endpt) = () where {
  val ((*void*)) = assertloc (zmq_bind (sock, endpt) >= 0)
} // end of [zmq_bind_exn]

(* ****** ****** *)

(*
fun zmq_connect_exn
(
  sock: !zmqsock1, endpt: NSH(string)
) : void // end of [zmq_connect_exn]
*)
implement
zmq_connect_exn
  (sock, endpt) = () where
{
  val () = assertloc (zmq_connect (sock, endpt) >= 0)
} // end of [zmq_connect_exn]

(* ****** ****** *)

(*
fun zmq_close_exn (sock: zmqsock1) : void
*)
implement
zmq_close_exn
  (sock) = () where
{
  val () = assertloc (zmq_close (sock) >= 0)
} // end of [zmq_close_exn]

(* ****** ****** *)

implement
zmq_send_string
(
  sock, msg, flags
) = res where
{
//
val [n:int] n = g1ofg0(length(msg))
//
val (pf, fpf | p) =
  $UN.ptr0_vtake{array(byte,n)}(string2ptr(msg))
//
val res = zmq_send (sock, !p, n, flags)
//
prval ((*void*)) = fpf (pf)
//
} (* end of [zmq_send_string] *)

(* ****** ****** *)

(*
fun zmq_msg_init_exn
  (msg: &zmqmsg_t? >> _): void
*)
implement
zmq_msg_init_exn
  (msg) = () where
{
  val err = zmq_msg_init (msg)
  val ((*void*)) = assertloc (err >= 0)
  prval ((*void*)) = opt_unsome{zmqmsg_t}(msg)
} // end of [zmq_msg_init_exn]

(* ****** ****** *)

(*
fun zmq_msg_init_size_exn
  (msg: &zmqmsg_t? >> _, n: size_t): void
*)
implement
zmq_msg_init_size_exn
  (msg, size) = () where
{
  val err = zmq_msg_init_size (msg, size)
  val ((*void*)) = assertloc (err >= 0)
  prval ((*void*)) = opt_unsome{zmqmsg_t}(msg)
} // end of [zmq_msg_init_size_exn]

(* ****** ****** *)

(*
fun zmq_msg_close_exn
  (msg: &zmqmsg_t >> zmqmsg_t?): void
*)
implement
zmq_msg_close_exn
  (msg) = () where
{
  val err = zmq_msg_close (msg)
  val ((*void*)) = assertloc (err >= 0)
  prval ((*void*)) = opt_unnone{zmqmsg_t}(msg)
} // end of [zmq_msg_close_exn]

(* ****** ****** *)

(*
fun zmq_msg_send_exn
(
  msg: &zmqmsg, sock: !zmqsock1, flags: int
) : intGte(0) // end of [zmq_msg_send_exn]
*)
implement
zmq_msg_send_exn
(
  msg, sock, flags
) = valerr where {
  val valerr =
    zmq_msg_send (msg, sock, flags)
  val ((*void*)) = assertloc (valerr >= 0)
} // end of [zmq_msg_send_exn]

(* ****** ****** *)

(*
fun zmq_msg_recv_exn
(
  msg: &zmqmsg, sock: !zmqsock1, flags: int
) : intGte(0) // end of [zmq_msg_recv_exn]
*)
implement
zmq_msg_recv_exn
(
  msg, sock, flags
) = valerr where {
  val valerr =
    zmq_msg_recv (msg, sock, flags)
  val ((*void*)) = assertloc (valerr >= 0)
} // end of [zmq_msg_recv_exn]

(* ****** ****** *)

(* end of [zmq.dats] *)
