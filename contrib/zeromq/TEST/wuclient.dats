(*
//
// Weather Update client
//
*)

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

staload "libc/SATS/stdlib.sats"

(* ****** ****** *)

staload "{$ZEROMQ}/SATS/zmq.sats"

(* ****** ****** *)
//
extern
fun
my_string0_copy
  (string): Strptr1 = "ext#"
//
implement
my_string0_copy (str) = string0_copy<> (str)
//
(* ****** ****** *)

%{$
static
atstype_ptr
s_recv
(
  void *socket
) {
//
char buf[256];
int size = zmq_recv (socket, &buf[0], 255, 0);
if (size == -1) return NULL;
if (size > 255) size = 255;
//
buf[size] = 0;
//
return my_string0_copy(&buf[0]);
} // end of [s_recv]
%} // end of [s_recv]

(* ****** ****** *)
//
extern
fun s_recv (!zmqsock1): Strptr0 = "sta#"  
//
(* ****** ****** *)

implement
main0 (argc, argv) =
{
val ctx = zmq_ctx_new_exn ()
//
val () =
println! ("Collecting updates from weather server...")
//
val sub = zmq_socket_exn (ctx, ZMQ_SUB)
//
val () = zmq_connect_exn (sub, "tcp://localhost:5556")
//
val filter = (if argc >= 2 then argv[1] else "01810"): string
//
val res =
zmq_setsockopt
(
  sub, ZMQ_SUBSCRIBE, string2ptr(filter), length(filter)
) (* end of [val] *)
val ((*void*)) = assertloc (res = 0)
//
val wu = s_recv (sub)
val () = println! ("wuclient: ", wu)
val () = strptr_free (wu)
//
val ((*void*)) = zmq_close_exn (sub)
val ((*void*)) = zmq_ctx_destroy_exn (ctx)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [wuclient.dats] *)
