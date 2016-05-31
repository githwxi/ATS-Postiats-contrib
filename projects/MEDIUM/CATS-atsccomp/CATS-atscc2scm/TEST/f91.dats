(* ****** ****** *)
//
// HX-2016-05
// A running example
// from ATS2 to Scheme
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2SCM}/basics_scm.sats"
staload
"{$LIBATSCC2SCM}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern
fun f91 : int -> int = "mac#f91"
//
implement
f91 (x) = if x >= 101 then x - 10 else f91(f91(x+11))
//
(* ****** ****** *)

(* end of [f91.dats] *)
