(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-09-09
//
(* ****** ****** *)
//
staload "./basics_js.sats"
staload "./SATS/integer.sats"
staload "./SATS/float.sats"
staload "./SATS/string.sats"
//
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
staload "./SATS/arrayref.sats"
staload "./SATS/matrixref.sats"
staload "./SATS/reference.sats"
//
(* ****** ****** *)
//
staload "./SATS/JSmath.sats"
staload "./SATS/JSdate.sats"
staload "./SATS/JSarray.sats"
staload "./SATS/JSglobal.sats"
//
(* ****** ****** *)

(* end of [staloadall.hats] *)
