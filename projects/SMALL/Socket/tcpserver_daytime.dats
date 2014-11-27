(*
**
** A simple example of
** BSD socket programming
** Author: Hongwei Xi (hwxiATcsDOTbuDOTedu)
** Time: November, 2008
**
*)

(* ****** ****** *)

(*
** HX-2014-11-25: ported to ATS2
*)

(* ****** ****** *)

#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libc/SATS/time.sats"
staload "libc/SATS/stdio.sats"
staload "libc/sys/SATS/socket.sats"
staload "libc/arpa/SATS/inet.sats"
staload "libc/netinet/SATS/in.sats"
staload "libc/sys/SATS/socket_in.sats"

(* ****** ****** *)

#define MAXLINE 1024

(* ****** ****** *)

#define LISTENQ 5 // HX: tradition
#define TIME_SERVER_PORT_DEFAULT 13000

(* ****** ****** *)

fun
listen_loop{fd:nat}
(
  pf: !socket_v(fd, listen) | fd: int(fd)
) : void = let
//
val (pf2opt | fd2) = accept_null_err (pf | fd)
//
in
//
if
(fd2 >= 0)
then let
  prval Some_v(pf2) = pf2opt
  var tm = time_get()
  val (fpf | str) = ctime (tm)
  val () = assertloc (ptrcast(str) > 0)
  val nwrit = $extfcall (ssize_t, "write", fd2, ptrcast(str), length(str))
  prval ((*void*)) = fpf (str)
  val () = socket_close_exn (pf2 | fd2)
in
  listen_loop (pf | fd)
end // end of [then]
else let
  prval None_v((*void*)) = pf2opt in listen_loop (pf | fd)
end // end of [else]
//
end // end of [listen_loop]

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val servport =
(
if argc >= 2
  then g0string2int(argv[1])
  else TIME_SERVER_PORT_DEFAULT
) : int // end of [servport]
//
val () = println! ("servport = ", servport)
//
val servport2 = in_port_nbo(servport)
//
val in4addr_any = in_addr_hbo2nbo (INADDR_ANY)
//
var servaddr
  : sockaddr_in_struct
val ((*void*)) =
sockaddr_in_init
  (servaddr, AF_INET, in4addr_any, servport2)
//
val (pf | fd) =
  socket_AF_type_exn (AF_INET, SOCK_STREAM)
//
val () =
  bind_in_exn (pf | fd, servaddr)
//
val () = listen_exn (pf | fd, LISTENQ) 
//
val ((*void*)) = listen_loop (pf | fd)
//
val ((*void*)) = socket_close_exn (pf | fd)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [tcpserver_daytime.dats] *)
