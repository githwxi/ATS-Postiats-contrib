(* ****** ****** *)
//
// HX-2014-08:
// A running example
// from ATS2 to Perl
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PL}/basics_pl.sats"
staload
"{$LIBATSCC2PL}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern
fun fact : int -> int = "mac#fact"
//
implement
fact (n) = if n > 0 then n * fact(n-1) else 1
//
(* ****** ****** *)

(* end of [fact.dats] *)
