(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
extern fun fib : double -> double
//
implement
fib (n: double): double =
  if n >= 2.0 then fib(n-1.0) + fib(n-2.0) else n
//
(* ****** ****** *)

(* end of [fib.dats] *)
