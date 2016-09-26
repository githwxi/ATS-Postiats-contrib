(*
** For writing ATS code
** that translates into Scheme
*)

(* ****** ****** *)
//
// HX-2014-07
//
(* ****** ****** *)
//
staload "./basics_scm.sats"
//
(* ****** ****** *)
//
staload "./SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./SATS/bool.sats"
staload "./SATS/float.sats"
//
(* ****** ****** *)
//
staload "./SATS/print.sats"
staload "./SATS/filebas.sats"
//
staload _(*anon*) = "./DATS/print.dats"
//
(* ****** ****** *)
//
(*
staload "./SATS/intrange.sats"
staload _(*anon*) = "./DATS/intrange.dats"
*)
//
(* ****** ****** *)
//
staload "./SATS/list.sats"
//
staload "./SATS/stream.sats"
staload "./SATS/stream_vt.sats"
//
staload "./SATS/reference.sats"
//
(* ****** ****** *)
//
staload _(*anon*) = "./DATS/list.dats"
//
staload _(*anon*) = "./DATS/stream.dats"
staload _(*anon*) = "./DATS/stream_vt.dats"
//
(* ****** ****** *)
//
staload "./SATS/slistref.sats" // list-based stack
staload "./SATS/qlistref.sats" // list-based queue
//
(* ****** ****** *)

(* end of [staloadall.hats] *)
