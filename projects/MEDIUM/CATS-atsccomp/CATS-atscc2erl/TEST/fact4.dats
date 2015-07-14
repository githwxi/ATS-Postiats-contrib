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
-module(fact4_dats).
%%
-export([fact/1]).
-export([mytest/0]).
%%
-export([ats2erlpre_ref_make_elt_proc/1]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-include("./libatscc2erl/libatscc2erl_all.hrl").
%%
%} // end of [%{]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2ERL}/SATS/integer.sats"
staload
"{$LIBATSCC2ERL}/SATS/reference.sats"
//
(* ****** ****** *)
//
extern
fun
fact : int -> int = "mac#fact"
//
implement
fact (n) = let
//
fun
loop(n: int, res: ref(int)): void =
if n > 0
  then (res[] := n * res[]; loop(n-1, res)) else ()
//
val res = ref{int}(1)
//
in
  loop (n, res); res[]
end // end of [fact]

(* ****** ****** *)

%{$
mytest() ->
  N = 12
, io:format("fact(~p) = ~p~n", [N, fact(N)])
. %% mytest()
%} // end of [%{$]

(* ****** ****** *)

(* end of [fact4.dats] *)
