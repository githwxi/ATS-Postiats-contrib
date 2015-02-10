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
** HX-2014-11-21: ported to ATS2
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

staload "libc/SATS/stdio.sats"
staload "libc/sys/SATS/socket.sats"
staload "libc/arpa/SATS/inet.sats"
staload "libc/netinet/SATS/in.sats"
staload "libc/sys/SATS/socket_in.sats"

(* ****** ****** *)

#define MAXLINE 1024

(* ****** ****** *)

#define TIME_SERVER_PORT_DEFAULT 13
(*
#define TIME_SERVER_NAME_DEFAULT "129.6.15.28"
#define TIME_SERVER_NAME_DEFAULT "129.6.15.29"
*)
#define TIME_SERVER_NAME_DEFAULT "129.6.15.30"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val servname =
(
if argc >= 2
  then argv[1]
  else TIME_SERVER_NAME_DEFAULT
// end of [if]
) : string // end of [val]
//
val servport =
(
if argc >= 3
  then g0string2int(argv[2])
  else TIME_SERVER_PORT_DEFAULT
) : int // end of [servport]
//
val () = println! ("servname = ", servname)
val () = println! ("servport = ", servport)
//
val servport2 = in_port_nbo(servport)
//
var inp: in_addr_struct
val ((*void*)) = assertloc(inet_aton(servname, inp))
prval ((*void*)) = opt_unsome (inp)
//
var servaddr: sockaddr_in_struct
val ((*void*)) =
sockaddr_in_init (servaddr, AF_INET, inp.s_addr, servport2)
//
val (pf | fd) = socket_AF_type_exn (AF_INET, SOCK_STREAM)
//
val () = connect_in_exn (pf | fd, servaddr)
//
var buf = @[byte][MAXLINE]()
prval () = view@buf := b0ytes2bytes_v(view@buf)
val nread = socket_read (pf | fd, buf, i2sz(MAXLINE))
val ((*void*)) = assertloc (nread >= 0)
val ((*void*)) = shutdown_exn (pf | fd, SHUT_RDWR)
//
val () =
(
if
nread > 0
then $extfcall (void, "fwrite", addr@buf, 1, nread, stdout_ref)
else main0 (argc, argv)
) (* end of [val] *)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [tcpclient_daytime.dats] *)
