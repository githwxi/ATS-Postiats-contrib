(* ****** ****** *)
//
// HX-2014-08:
// A running example
// from ATS2 to PHP
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2PHP}/basics_php.sats"
staload
"{$LIBATSCC2PHP}/SATS/integer.sats"
staload
"{$LIBATSCC2PHP}/SATS/string.sats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "fact_dynload"
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
//
val N = 10
val () = println! ("fact(", N, ") = ", fact(N))
//
(* ****** ****** *)

(* end of [fact.dats] *)
