(*
** Project Euler: P2
** See https://projecteuler.net
*)

(* ****** ****** *)
//
// HX-2015-02-01:
// Please note that
// the solution is
// verified and tail-recursive
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
//
extern
praxi
FIB_isfun{n:nat}{r1,r2:int}
  (FIB(n, r1), FIB(n, r2)): [r1==r2] void
//
extern
praxi
MYSUM_istot{n:pos}(): [t:int] MYSUM(n, t)
//
(* ****** ****** *)
//
extern
praxi
MYSUM_un_rule0
  {n:nat}
  {r:int | r > LIMIT}
  {t:int}(pf1: FIB(n, r), pf2: MYSUM(n, t)): [t==0] void
//
extern
praxi
MYSUM_un_rule1
  {n:nat}
  {r:int | r <= LIMIT; r mod 2 > 0}
  {t:int}(pf1: FIB(n, r), pf2: MYSUM(n, t)): MYSUM(n+1, t)
extern
praxi
MYSUM_un_rule2
  {n:nat}
  {r:int | r <= LIMIT; r mod 2 == 0}
  {t:int}(pf1: FIB(n, r), pf2: MYSUM(n, t)): MYSUM(n+1, t-r)
//
(* ****** ****** *)

implement
mysum((*void*)) = let
//
prval
[t0:int]
pfres = MYSUM_istot{1}()
//
fun
loop
{n:pos}
{r0,r1:nat}
{res:int}
(
  pf0: FIB(n, r0)
, pf1: FIB(n-1, r1)
, pf2: MYSUM(n, t0-res)
| n: int(n), r0: int(r0), r1: int(r1), res: int(res)
) : int(t0) =
(
if
r0 > LIMIT
then let
  prval () = MYSUM_un_rule0 (pf0, pf2) in res
end // end of [then]
else let
  val
  (
    pf_divmod | k0
  ) = nmod2_g1int_int1(r0, 2)
  prval () =
    divmod_mul_elim (pf_divmod)
  // end of [prval]
in
  if k0 > 0
    then let
      prval pf2 = MYSUM_un_rule1 (pf0, pf2)
    in
      loop (FIB_rule2(pf1, pf0), pf0, pf2 | n+1, r0+r1, r0, res)
    end // end of [then]
    else let
      prval pf2 = MYSUM_un_rule2 (pf0, pf2)
    in
      loop (FIB_rule2(pf1, pf0), pf0, pf2 | n+1, r0+r1, r0, res+r0)
    end // end of [else]
  // end of [if]
end // end of [else]
)
//
in
  (pfres | loop (FIB_rule1(), FIB_rule0(), pfres | 1, 1, 0, 0))
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
