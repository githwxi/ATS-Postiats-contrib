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
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

staload
"{$LIBATSCC2JS}/SATS/print.sats"

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)

%{
function
atspre_g0int_mod_int(n, p) { return (n%p); }
%} // end of [%{]

(* ****** ****** *)

%{$
//
ats2jspre_the_print_store_clear();
my_dynload();
alert(ats2jspre_the_print_store_join());
//
%} // end of [%{$]

(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/PEULER/PROJECT/P1/P1.sats"
//
(* ****** ****** *)

implement
sum35 (n) = let
//
fun loop
  {n:nat}{t0:int} .<n>.
(
  n: int n, t0: int t0
) : [t:int | t >= t0] (SUM35 (n, t-t0) | int (t)) =
(
  if n > 0 then let
    val (pf3 | r3) = nmod (n, 3)
  in
    if r3 = 0 then let
      val (pf | t) = loop (n-1, t0+n) in (SUM35ind1 (pf, pf3) | t)
    end else let
      val (pf5 | r5) = nmod (n, 5)
    in
      if r5 = 0 then let
        val (pf | t) = loop (n-1, t0+n) in (SUM35ind2 (pf, pf5) | t)
      end else let
        val (pf | t) = loop (n-1, t0) in (SUM35ind3 (pf, pf3, pf5) | t)
      end // end of [if]
    end // end of [if]
  end else
    (SUM35bas () | t0)
  // end of [if]
) (* end of [loop] *)
//
in
  loop (n, 0)
end // end if [sum35]

(* ****** ****** *)

val () = {
//
#define N 1000
//
val (pf | ans) = sum35 (N-1)
val () = assertloc (ans = 233168)
val () =
(
  println! ("The sum of all the natural numbers < ", N, " that are multiples of 3 or 5 = ", ans)
) (* end of [val] *)
} (* end of [main0] *)

(* ****** ****** *)

(* end of [P1-hwxi.dats] *)
