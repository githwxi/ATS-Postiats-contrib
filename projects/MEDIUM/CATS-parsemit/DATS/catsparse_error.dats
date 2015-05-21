(* ****** ****** *)
//
// CATS-parsemit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
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

staload "./../SATS/catsparse.sats"
staload "./../SATS/catsparse_parsing.sats"

(* ****** ****** *)

implement abort() = $raise(FatalErrorExn())

(* ****** ****** *)

(* end of [catsparse_error.dats] *)
