(*
** Project Euler: P2
** See https://projecteuler.net
*)

(* ****** ****** *)
//
// HX-2015-02-02:
// Please note that
// the solution
// is verified but
// non-tail-recursive
// See P2-hwxi-2.dats
// for a tail-recursive one
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: February 1, 2015
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
staload
"{$LIBATSHWXI}/PEULER/SATS/peuler.sats"
//
(* ****** ****** *)
//
(*
staload "./P2.sats"
*)
staload
"{$LIBATSHWXI}/PEULER/PROJECT/P2/P2.sats"
//
(* ****** ****** *)
//
dataprop
FIB_(int(*n*), int(*r*)) =
| FIB_rule0 (0, 0)
| FIB_rule1 (1, 1)
| {n:nat}{r0,r1:int}
  FIB_rule2 (n+2, r0+r1) of (FIB_(n, r0), FIB_(n+1, r1))
//
(* ****** ****** *)

assume FIB(n:int, r:int) = FIB_(n, r)

(* ****** ****** *)

implement
mysum((*void*)) = let
//
fun
aux
{n:pos}
{r0,r1:nat}
(
  pf0: FIB(n, r0)
, pf1: FIB(n-1, r1)
| n: int(n)
, r0: int(r0), r1: int(r1)
) : [t:int] (MYSUM(n, t) | int(t)) =
(
//
if
r0 > LIMIT
then (MYSUMrule0(pf0) | 0)
else let
  val
  (
    pf_divmod | k0
  ) = nmod2_g1int_int1(r0, 2)
  prval () =
    divmod_mul_elim (pf_divmod)
  // end of [prval]
  val (pfres | res) = 
    aux(FIB_rule2(pf1, pf0), pf0 | n+1, r1+r0, r0)
  // end of [val]
in
  if k0 > 0
    then (MYSUMrule1(pf0, pfres) | res) else (MYSUMrule2(pf0, pfres) | r0 + res)
  // end of [if]
end // end of [else]
//
) (* end of [aux] *)
//
in
  aux (FIB_rule1(), FIB_rule0() | 1, 1, 0)
end // end of [mysum]

(* ****** ****** *)

implement
main0 () =
{
//
val (pf | ans) = mysum()
val () =
(
  println! ("The sum of all the even fibs < ", LIMIT, " equals ", ans)
) (* end of [val] *)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [P2-hwxi.dats] *)
