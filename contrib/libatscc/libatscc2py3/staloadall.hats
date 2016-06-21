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
staload "./SATS/intrange.sats"
//
(* ****** ****** *)
//
staload "./SATS/arrayref.sats"
staload "./SATS/matrixref.sats"
staload "./SATS/reference.sats"
//
staload "./SATS/slistref.sats"
staload "./SATS/qlistref.sats"
//
(* ****** ****** *)

staload "./SATS/ML/list0.sats"
staload "./SATS/ML/array0.sats"

(* ****** ****** *)

(* end of [staloadall.hats] *)

