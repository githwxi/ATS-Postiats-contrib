(*
// Lazy-evaluation:
// Erathosthene's sieve for primes
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: September, 2007
//
(* ****** ****** *)

(*
** Ported to ATS2 by HX-2013-09
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#define :: stream_cons
#define cons stream_cons
#define nil stream_nil

(* ****** ****** *)
//
fun
from
{n:int}
(
  n: int n
) : stream (int) = $delay(cons(n, from(n+1)))
//
(* ****** ****** *)

fun sieve
(
  ns: stream int
) :<!laz>
  stream (int) = $delay
(
let
  val-cons(n, ns) = !ns
in
  cons(n, sieve (stream_filter_cloref<int> (ns, lam x => x % n > 0)))
end : stream_con (int)
) (* end of [sieve] *)

(* ****** ****** *)
//
val primes: stream (int) = sieve (from(2))
//
(* ****** ****** *)

(* end of [sieve_lazy.dats] *)
