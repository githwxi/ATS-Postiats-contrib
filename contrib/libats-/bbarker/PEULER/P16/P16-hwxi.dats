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
staload "./P16.sats"
(*
staload
"{$LIBATSHWXI}/PEULER/PROJECT/P16/P16.sats"
*)
//
(* ****** ****** *)

implement
add_dlist_dlist
  (ds1, ds2) = let
//
fun
succ
{m:nat}
(
  ds: dlist(m)
) : dlist(m+1) =
(
  case+ ds of
  | dlist_nil () =>
      dlist_cons (1, dlist_nil)
  | dlist_cons
      (d, ds) => let
      val d1 = d + 1
    in
      if d1 < BASE then dlist_cons (d1, ds) else dlist_cons (0, succ(ds))
    end // end of [dlist_cons]
)
//
fun
add0{m,n:nat}
(
  ds1: dlist(m), ds2: dlist(n)
) : dlist(m + n) = (
  case+ ds1 of
  | dlist_nil () => ds2
  | dlist_cons
      (d1, ds1_) => (
      case+ ds2 of
      | dlist_nil () => ds1
      | dlist_cons (d2, ds2_) => let
          val d12 = d1 + d2
        in
          if d12 < BASE
            then dlist_cons (d12, add0 (ds1_, ds2_))
            else dlist_cons (d12-BASE, add1 (ds1_, ds2_))
        end // end of [dlist_cons]
    ) (* end of [dlist_cons] *)
) (* end of [add0] *)

and
add1{m,n:nat}
(
  ds1: dlist(m), ds2: dlist(n)
) : dlist(m + n + 1) = (
  case+ ds1 of
  | dlist_nil () => succ(ds2)
  | dlist_cons
      (d1, ds1_) => (
      case+ ds2 of
      | dlist_nil () => succ(ds1)
      | dlist_cons (d2, ds2_) => let
          val d12 = d1 + d2 + 1
        in
          if d12 < BASE
            then dlist_cons (d12, add0 (ds1_, ds2_))
            else dlist_cons (d12-BASE, add1(ds1_, ds2_))
          // end of [if]
        end // end of [dlist_cons]
    ) (* end of [dlist_cons] *)
) (* end of [add1] *)
//
in
  add0 (ds1, ds2)
end // end of [add_dlist_dlist]

(* ****** ****** *)

implement
dlist_gen_exp2 (n) =
(
if
n > 0
then let
  val (pf | r) = dlist_gen_exp2(n-1)
in
  (EXP2ind(pf) | add_dlist_dlist(r, r))
end // end of [then]
else (EXP2bas () | dlist_cons (1, dlist_nil))
) (* end of [dlist_gen_exp2] *)

(* ****** ****** *)

implement
dlist_tally (ds) =
(
case+ ds of
| dlist_nil () => 0
| dlist_cons (d, ds) => d + dlist_tally (ds)
) (* end of [dlist_tally] *)

(* ****** ****** *)

implement
main0 () =
{
//
val p15 =
  dlist_gen_exp2(15)
//
val sum15 = dlist_tally(p15.1)
val () = assertloc (sum15 = 26)
//
val p1000 =
  dlist_gen_exp2(1000)
//
val sum1000 = dlist_tally(p1000.1)
val () = assertloc (sum1000 = 1366)
val () = (print "the sum of all the digits of 2^1000 is "; print sum1000; print_newline ())
//
} // end of [main]

(* ****** ****** *)

(* end of [P16-hwxi.dats] *)
