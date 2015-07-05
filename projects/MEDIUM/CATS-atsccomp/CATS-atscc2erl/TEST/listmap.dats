(* ****** ****** *)
//
// HX-2015-07:
// A running example
// from ATS2 to Erlang
//
(* ****** ****** *)
//
#define ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
%{^
%%
-module(listlen_dats).
%%
-export([listmap/2,fromto/2]).
%%
-compile(nowarn_unused_function).
%%
-include("./libatscc2erl/libatscc2erl_all.hrl").
%} // end of [%{]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2ERL}/staloadall.hats"
//
(* ****** ****** *)
//
implement
list_map (xs, f) =
(
case+ xs of
| list_nil () => list_nil ()
| list_cons (x, xs) => list_cons (f(x), list_map (xs, f))
) (* end of [list_map] *)
//
(* ****** ****** *)
//
extern
fun
fromto
  : (int, int) -> List0 (int) = "mac#fromto"
//
implement
fromto (m, n) =
if m < n
  then list_cons (m, fromto (m+1, n)) else list_nil ()
// end of [if]
//
(* ****** ****** *)
//
extern
fun
mytest : (int, int) -> List0(int) = "mac#test"
//
implement
mytest (m, n) = let
  val xs = fromto (m, n)
in
  list_map{int}{int} (xs, lam x => m * n * x)
end // end of [mytest]
//
(* ****** ****** *)

extern
fun
main0_erl : () -> void = "mac#"
implement
main0_erl () =
{
//
val () = println! ("mytest(5, 10) = ", mytest(5, 10))
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [listmap.dats] *)
