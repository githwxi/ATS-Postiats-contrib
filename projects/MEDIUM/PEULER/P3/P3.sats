(*
** Project Euler: P3
** See https://projecteuler.net
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: February 2, 2015
//
(* ****** ****** *)
//
#include "share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/PEULER/SATS/peuler.sats"
//
(* ****** ****** *)
//
propdef ISPRIME(p:int) = PRIME(p, true)
//
(* ****** ****** *)
//
datatype
FACTORIZE(n:int) =
  | FACTprime of (ISPRIME(n) | int(n))
  | {p,q:int |
     p >= 2; q >= p; n==p*q}
    FACTcompose of (ISPRIME(p) | int(p), int(q))
//
(* ****** ****** *)
//
fun
factorize{n:int | n >= 2}(int(n)): FACTORIZE(n)
//
(* ****** ****** *)
//
fun
findMaxPrime
{n:int | n >= 2}
  (n: int(n)): [p:int] (MOD(n, p, 0), ISPRIME(p) | int(p))
//
(* ****** ****** *)

(* end of [P3.sats] *)
