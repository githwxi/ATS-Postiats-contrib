(*
** For testing atscc2java
*)

(* ****** ****** *)
//
fun
fact(n: int): int =
  if n > 0 then n * fact(n-1) else 1  
//
(* ****** ****** *)
//
implement
main0() = println! ("fact(10) = ", fact(10))
//
(* ****** ****** *)

(* end of [test01.dats] *)
