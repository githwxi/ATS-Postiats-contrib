(*
** For writing ATS code
** that translates into Pythod
*)

(* ****** ****** *)
//
// HX-2014-09-09
//
(* ****** ****** *)
//
staload "./basics_py.sats"
//
(* ****** ****** *)
//
staload "./SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./SATS/bool.sats"
staload "./SATS/char.sats"
staload "./SATS/float.sats"
staload "./SATS/string.sats"
//
(* ****** ****** *)

staload "./SATS/print.sats"
staload _ = "./DATS/print.dats"

(* ****** ****** *)

staload "./SATS/filebas.sats"

(* ****** ****** *)

staload "./SATS/PYlist.sats"

(* ****** ****** *)
//
staload "./SATS/list.sats"
staload _ = "./DATS/list.dats"
//
(* ****** ****** *)
//
staload "./SATS/stream.sats"
staload _ = "./DATS/stream.dats"
//
(* ****** ****** *)
//
staload "./SATS/array.sats"
staload "./SATS/intrange.sats"
staload "./SATS/reference.sats"
//
(* ****** ****** *)

(* end of [staloadall.hats] *)

