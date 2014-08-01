(* ****** ****** *)
//
// ATS-parse-emit
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

staload "./atsparemit.sats"
staload "./atsparemit_parsing.sats"

(* ****** ****** *)

implement abort() = $raise(FatalErrorExn())

(* ****** ****** *)

(* end of [atsparemit_error.dats] *)
