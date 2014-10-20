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
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
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
  cons(n, sieve (stream_filter_cloref(ns, lam x => x % n > 0)))
end : stream_con (int)
) (* end of [sieve] *)

(* ****** ****** *)

fun
nth{a:t@ype}
(
  xs: stream(INV(a)), n: int
) : a = let
//
val-stream_cons (x, xs) = !xs
//
in
  if n > 0 then nth (xs, n-1) else x
end // end of [nth]

(* ****** ****** *)
//
extern 
fun
main_js (): void = "mac#"
//
implement
main_js ((*void*)) =
{
  val primes = sieve (from(2))
  val () = println! ("primes[0] = ", nth(primes, 0))
  val () = println! ("primes[1] = ", nth(primes, 1))
  val () = println! ("primes[2] = ", nth(primes, 2))
  val () = println! ("primes[3] = ", nth(primes, 3))
  val () = println! ("primes[4] = ", nth(primes, 4))
  val () = println! ("primes[5] = ", nth(primes, 5))
  val () = println! ("primes[6] = ", nth(primes, 6))
  val () = println! ("primes[7] = ", nth(primes, 7))
  val () = println! ("primes[8] = ", nth(primes, 8))
  val () = println! ("primes[9] = ", nth(primes, 9))
  val () = println! ("primes[100] = ", nth(primes, 100))
  val () = println! ("primes[1000] = ", nth(primes, 1000))
} (* end of [main_js] *)
//
(* ****** ****** *)

%{^
//
// file inclusion
//
var fs = require('fs');
//
eval(fs.readFileSync('./libatscc2js/CATS/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/integer_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/string_cats.js').toString());
//
eval(fs.readFileSync('./libatscc2js/CATS/Node.js/basics_cats.js').toString());
eval(fs.readFileSync('./libatscc2js/CATS/Node.js/fprint_cats.js').toString());
//
eval(fs.readFileSync('./libatscc2js/DATS/stream_dats.js').toString());
//
%} // end of [%{^]

(* ****** ****** *)

%{$
//
main_js()
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [sieve_lazy.dats] *)
