(*
** Testing some operations on reals
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"libats/SATS/NUMBER/real.sats"
//
staload
"libats/DATS/NUMBER/real_double.dats"
//
(* ****** ****** *)
//
extern
fun
quadratic_solve1
 {A,B,C:real}
(
  A: real(A), B: real(B), C: real(C)
) : [x:real | A*x*x+B*x+C==i2r(0)] real(x)
//
extern
fun
quadratic_solve2
 {A,B,C:real}
(
  A: real(A), B: real(B), C: real(C)
) : [x:real | A*x*x+B*x+C==i2r(0)] real(x)
//
(* ****** ****** *)

#define i2r(x) int2real(x)

(* ****** ****** *)
//
implement
quadratic_solve1
  (A, B, C) = (~B+sqrt(B*B-4*A*C))/(2*A)
//
implement
quadratic_solve2
  (A, B, C) = (~B-sqrt(B*B-4*A*C))/(2*A)
//
(* ****** ****** *)

val root1 =
  quadratic_solve1(i2r(4), i2r(4), i2r(~3))
val root2 =
  quadratic_solve2(i2r(4), i2r(4), i2r(~3))

(* ****** ****** *)

val () = println! ("root1 = ", root1)
val () = println! ("root2 = ", root2)

(* ****** ****** *)

implement
main0() = () where
{
//
val () =
println! ("Hello from [test01]")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)