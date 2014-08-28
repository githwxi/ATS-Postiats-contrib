(* ****** ****** *)
//
// HX-2014-08:
// A running example:
// from ATS2 to PHP
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
"{$LIBATSCC2PHP}/basics_php.sats"
staload
"{$LIBATSCC2PHP}/SATS/integer.sats"
//
(* ****** ****** *)
//
extern
fun fact : int -> int = "mac#fact"
//
implement
fact (n) = let
//
fun loop (n: int, res: int): int =
  if n > 0 then loop (n-1, n*res) else res
//
in
  loop (n, 1)
end // end of [fact]

(* ****** ****** *)

(* end of [fact2.dats] *)
