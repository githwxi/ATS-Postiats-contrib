(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
extern
fun
fib : int -> int
//
implement
fib (n) = let
//
fun aux (ff: @(int, int), n: int): int =
  if n > 0 then aux (@(ff.1, ff.0 + ff.1), n-1) else ff.0
//
in
  aux (@(0, 1), n)
end // end of [fib2]
//
(* ****** ****** *)

(* end of [fib.dats] *)
