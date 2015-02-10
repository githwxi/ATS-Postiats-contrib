(*
** Project Euler: P1
** See https://projecteuler.net
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: January 13, 2015
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

fun
nmod
{n,p:int |
 n >= 0; p > 0}
(
  n: int n, p: int p
) :<> [r:nat] (MOD (n, p, r) | int r)
  = "mac#atspre_g0int_mod_int"
// end of [nmod]

(* ****** ****** *)
//
// SUM35 (n, t) =
// sum of i <= n such that i mod 3 = 0 or i mod 5 = 0
//
dataprop SUM35
(
  int(*n*), int(*t*)
) =
  | SUM35bas (0, 0) of ()
  | {n:pos}{s1:nat}
    SUM35ind1 (n, s1+n) of (SUM35 (n-1, s1), MOD (n, 3, 0))
  | {n:pos}{s1:nat}
    SUM35ind2 (n, s1+n) of (SUM35 (n-1, s1), MOD (n, 5, 0))
  | {n:pos}{s1:nat}{r3,r5:pos}
    SUM35ind3 (n, s1) of (SUM35 (n-1, s1), MOD (n, 3, r3), MOD (n, 5, r5))
// end of [SUM35]
//
(* ****** ****** *)
//
// HX-2015-01-13:
// please implement this one:
//
fun sum35{n:nat}(n: int n): [t:nat] (SUM35 (n, t) | int t)
//
(* ****** ****** *)

(* end of [P1.sats] *)
