(*
** For supporting
** multi-threaded programming
*)

(* ****** ****** *)
//
// HX-2015-03-19
//
(* ****** ****** *)
//
staload _ =
"libats/DATS/deqarray.dats"
//
(* ****** ****** *)
//
staload _ =
"libats/DATS/athread.dats"
staload _ =
"libats/DATS/athread_posix.dats"
//
(* ****** ****** *)
//
staload
SPINVAR = "./SATS/spinvar.sats"
staload
SPINREF = "./SATS/spinref.sats"
//
staload _ = "./DATS/spinvar.dats"
staload _ = "./DATS/spinref.dats"
//
(* ****** ****** *)
//
staload
NWAITER = "./SATS/nwaiter.sats"
staload _ = "./DATS/nwaiter.dats"
//
(* ****** ****** *)
//
staload
CHANNEL = "./SATS/channel.sats"
staload
CHANNEL_VT = "./SATS/channel_vt.sats"
//
staload _ = "./DATS/channel.dats"
staload _ = "./DATS/channel_vt.dats"
//
(* ****** ****** *)

(* end of [staloadall.hats] *)
