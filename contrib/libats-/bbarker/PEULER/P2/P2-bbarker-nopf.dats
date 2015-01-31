(*
** Project Euler: P2
** See https://projecteuler.net
*)
(* ****** ****** *)
//
// Author: Brandon Barker
// Authoremail: brandonDOTbarkerATgmailDOTcom
// Start time: January 31, 2015
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "../SATS/peuler.sats"
//
(* ****** ****** *)
//
#define LIMIT 4000000
//
(* ****** ****** *)

extern
fun mysum (): [t:int] int t


implement
mysum () = let

fun loop {n1,n2,t:nat} (x_n1: int n1, x_n2: int n2, t: int t) = let
//
val x_n = x_n1 + x_n2
//val () =   println! (x_n, ", ", x_n1, ", ", x_n2, ", ", t)
//
in
  if x_n > LIMIT then t
  else
    if nmod(x_n, 2) = 0 then loop(x_n, x_n1, t + x_n)
    else loop(x_n, x_n1, t)
end
//
in
  loop(2 (*x_n1)*), 1 (* x_n2 *), 2 (* t *))
end
// Note: loop() could recall if prior two terms were even or odd
// but this doesn't really seem worthwhile

implement main0 () =
{
val t = mysum()
val () =
(
  println! ("The sum of all even fibonacci numbers starting with 1,2 and no greater than 4 million is:");
  println! (t)
)
}