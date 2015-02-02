(*
** Project Euler
*)

(* ****** ****** *)
//
absprop
MOD_prop(n:int, p:int, r:int)
//
propdef
MOD(n:int, p:int, r:int) = MOD_prop (n, p, r)
//
(* ****** ****** *)
//
absprop
PRIME_prop(p:int, b:bool)
propdef PRIME(p:int, b:bool) = PRIME_prop(p, b)
//
(* ****** ****** *)

(* end of [peuler.sats] *)
