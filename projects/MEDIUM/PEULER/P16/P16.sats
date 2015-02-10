(*
** Project Euler: P16
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

#define BASE 10

(* ****** ****** *)
//
datatype
dlist(int) =
  | dlist_nil(0) of ()
  | {d:nat | d < BASE}{n:nat}
    dlist_cons(d+n*BASE) of (int(d), dlist(n))
//
(* ****** ****** *)
//
fun
add_dlist_dlist
  {m,n:nat}(ds1: dlist(m), ds2: dlist(n)): dlist(m+n)
//
(* ****** ****** *)
//
fun
dlist_gen_exp2
  {n:nat}(n: int(n)): [r:nat] (EXP2(n, r) | dlist(r))
//
(* ****** ****** *)

fun dlist_tally{n:nat}(ds: dlist(n)): intGte(0)

(* ****** ****** *)

(* end of [P16.sats] *)
