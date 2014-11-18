(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)
//
// HX-2014-09-09
//
(* ****** ****** *)
//
staload "./basics_pl.sats"
//
(* ****** ****** *)
//
staload "./SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./SATS/bool.sats"
staload "./SATS/float.sats"
staload "./SATS/string.sats"
//
(* ****** ****** *)
//
staload "./SATS/print.sats"
staload _ = "./DATS/print.dats"
//
(* ****** ****** *)
//
staload "./SATS/filebas.sats"
//
(* ****** ****** *)

staload "./SATS/PLarray.sats"

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

(* end of [staloadall.hats] *)
