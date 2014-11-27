(*
**
** A simple ZeroMQ example
**
** Author: Hongwei Xi (hwxiATgmailDOTcom)
** Start time: November, 2014
**
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/zmq.sats"

(* ****** ****** *)

implement
main0 () =
{
//
var major: int
and minor: int
and patch: int
val () = zmq_version(major, minor, patch)
//
val () = println! ("Installed ZeroMQ version: ", major, ".", minor, ".", patch)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test00.dats] *)
