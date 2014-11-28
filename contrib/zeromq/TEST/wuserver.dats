(*
//
// Weather Update server
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

staload "libc/SATS/time.sats"
staload "libc/SATS/stdlib.sats"

(* ****** ****** *)

staload "{$ZEROMQ}/SATS/zmq.sats"

(* ****** ****** *)
//
%{^
char theWeather[128];
typedef char *charptr;
%} // end of [%{^]
//
typedef charptr = $extype"charptr"
//
macdef
theWeather = $extval(charptr, "&theWeather[0]")
macdef
theWeather_size = 128
//
fun
randof
(
  n: intGte(0)
) : int =
  $UN.cast{int}(random() % ($UN.cast2lint(n)))
//
extern
fun
theWeather_get (): vStrptr1
//
implement
theWeather_get () = let
//
val zip = randof(100000)
val temp = randof(250) - 80
val humidity = randof(50) + 10
//
val ntot = $extfcall (size_t, "snprintf", theWeather, theWeather_size, "%05d %d %d", zip, temp, humidity)
//
in
  $UN.castvwtp0(theWeather)
end // end of [theWeather_get]
//
(* ****** ****** *)
//
extern
fun
theWeather_pub_loop(sock: !zmqsock1): void
//
implement
theWeather_pub_loop
  (sock) = () where
{
  val (fpf | str) = theWeather_get()
  val () = println! ("theWeather_pub_loop: ", str)
  val res = zmq_send_string (sock, $UN.strptr2string(str), 0)
  prval ((*void*)) = fpf (str)
  val ((*void*)) = theWeather_pub_loop (sock)
} (* end of [theWeather_pub] *)
//
(* ****** ****** *)

implement
main0 () =
{
//
val () =
srandom($UN.cast2uint(time_get()))
//
val ctx = zmq_ctx_new ()
val () = assertloc (ptrcast(ctx) > 0)
//
val pub = zmq_socket_exn (ctx, ZMQ_PUB)
//
val () = zmq_bind_exn (pub, "tcp://*:5556");
val () = zmq_bind_exn (pub, "ipc://weather.ipc");
//
val ((*void*)) = theWeather_pub_loop (pub)
//
val () = zmq_close_exn (pub)
val () = zmq_ctx_destroy_exn (ctx)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [wuserver.dats] *)
