(*
//
//  Hello World client
//  Connects REQ socket to tcp://localhost:5555
//  Sends "Hello" to server, expects "World" back
//
#include <zmq.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>

int main (void)
{
    void *context = zmq_ctx_new ();

    //  Socket to talk to server
    printf ("Connecting to hello world server...\n");
    void *requester = zmq_socket (context, ZMQ_REQ);
    zmq_connect (requester, "tcp://localhost:5555");

//     int request_nbr;
//     for (request_nbr = 0; request_nbr != 10; request_nbr++) {
//         zmq_msg_t request;
//         zmq_msg_init_size (&request, 5);
//         memcpy (zmq_msg_data (&request), "Hello", 5);
//         printf ("Sending Hello %d...\n", request_nbr);
//         zmq_msg_send (&request, requester, 0);
//         zmq_msg_close (&request);
// 
//         zmq_msg_t reply;
//         zmq_msg_init (&reply);
//         zmq_msg_recv (&reply, requester, 0);
//         printf ("Received World %d\n", request_nbr);
//         zmq_msg_close (&reply);
//     }
    sleep (2);
    zmq_close (requester);
    zmq_ctx_destroy (context);
    return 0;
}
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/zmq.sats"

(* ****** ****** *)

#define nullp the_null_ptr

(* ****** ****** *)

postfix SZ; macdef SZ (i) = g1int2uint (,(i))

(* ****** ****** *)

%{^
extern unsigned int sleep (unsigned int) ;
%} // end of [%{^]

(* ****** ****** *)

implement
main () = (0) where {
//
val
context = zmq_ctx_new ()
val () = assertloc (zmqctx2ptr (context) > nullp)
//
//  Socket to talk to server
//
val () =
println!
  ("Connecting to hello world server...")
//
val
reqer = zmq_socket_exn (context, ZMQ_REQ)
val () = zmq_connect_exn (reqer, "tcp://localhost:5555")
//
#define N 10
var req: zmqmsg_t? and rep: zmqmsg_t?
val () = let
//
fun loop (
  nbr: natLte(N)
, reqer: !zmqsock1
, req: &zmqmsg_t?, rep: &zmqmsg_t?
) : void = let
in
//
if
nbr < N
then let
  val () =
  zmq_msg_init_size_exn(req, 5SZ)
  val () = memcpy
  (
    zmq_msg_data (req), "Hello", 5
  ) where {
    extern fun memcpy : (ptr, string, int) -> void = "mac#"
  } (* end of [val] *)
//
  val () =
  println! ("Sending Hello ", nbr, "...")
  val _(*nbyte*) =
  zmq_msg_send_exn (req, reqer, 0)
  val ((*void*)) = zmq_msg_close_exn (req)
//
  val () = zmq_msg_init_exn (rep)
  val _(*nbyte*) = zmq_msg_recv (rep, reqer, 0);
  val ((*void*)) = println! ("Received World ", nbr)
  val ((*void*)) = zmq_msg_close_exn (rep)
//
in
  loop (nbr+1, reqer, req, rep)
end // end of [if]
//
end // end of [loop]
//
in
  loop (0, reqer, req, rep)
end // end of [val]
//
val _ = $extfcall (uint, "sleep", 2)
//
val () = zmq_close_exn (reqer)
val () = assertloc (zmq_ctx_destroy (context) >= 0)
val ptr = zmqctxopt_unnone (context)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [hwclient.dats] *)
