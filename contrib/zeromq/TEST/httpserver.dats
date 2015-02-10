(* ****** ****** *)
//
// A minimal HTTP server
//
(* ****** ****** *)
//
// Author: HX-2014-11-28
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "{$ZEROMQ}/SATS/zmq.sats"
staload "{$ZEROMQ}/SATS/czmq.sats"

(* ****** ****** *)

#define NULL the_null_ptr

(* ****** ****** *)

fun
server_loop
(
  router: !zsock1
) : void = let
//
val handle = zframe_recv (router)
(*
val () = println! ("server_loop: handle = ", ptrcast(handle))
*)
//
in
//
if
ptrcast(handle) > 0
then let
  val req = zstr_recv (router)
(*
  val ((*void*)) =
    println! ("server_loop: req = ", $UN.castvwtp1{string}(req))
*)
  val ((*void*)) = zstr_free_val (req)
//
  val err = zframe_send1_val (handle, router, ZFRAME_MORE)
  val ((*void*)) = assertloc (err >= 0)
//
  val err = zstr_send (router, "HTTP/1.0 200 OK\r\nContent-Type: text/plain\r\n\r\nHello, World!")
  val ((*void*)) = assertloc (err >= 0)
//
  val err = zframe_send0_val (handle, router, ZFRAME_MORE)
  val ((*void*)) = assertloc (err >= 0)
//
  val (fpf | router2) = zsock_get_socket (router)
  val err = $extfcall (int, "zmq_send", ptrcast(router2), NULL, 0, 0)
  val ((*void*)) = assertloc (err >= 0)
  prval ((*void*)) = minus_addback (fpf, router2 | router)
//
in
  server_loop (router)
end // end of [then]
else let
  prval () = zframe_free_null (handle)
in
  println! ("server_loop: the server has been interrupted!")
end (* end of [else] *)
//
end // end of [server_loop]

(* ****** ****** *)

implement
main0 () =
{
//
val router = zsock_new (ZMQ_ROUTER)
val ((*void*)) = assertloc (ptrcast(router) > 0)
val ((*void*)) = zsock_set_router_raw (router, 1)
val ((*void*)) = assertloc (zsock_bind (router, "tcp://*:8888") >= 0)
//
val ((*void*)) = server_loop (router)
//
val ((*void*)) = zsock_destroy_val (router)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [httpserver.dats] *)
