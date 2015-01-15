(*
** Project Euler: P15
** See https://projecteuler.net
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: January 14, 2015
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
dataprop
NPATH (int, int, int) =
  | NPATH00 (0, 0, 1) of ()
  | {m:pos}{r:int}
    NPATHm0 (m, 0, r) of NPATH (m, 0, r)
  | {n:pos}{r:int}
    NPATH0n (0, n, r) of NPATH (0, n, r)
  | {m,n:pos}{r1,r2:int}
    NPATHmn (m, n, r1+r2) of (NPATH (m-1, n, r1), NPATH (m, n-1, r2))
//
(* ****** ****** *)
//
fun
npath{m,n:nat}
  (int(m), int(n)): [r:int] (NPATH(m, n, r) | int(r))
//
(* ****** ****** *)

(* end of [P15.sats] *)
