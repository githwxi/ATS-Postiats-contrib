(* ****** ****** *)
//
// For testing libatscc2js
//
(* ****** ****** *)
//
#include
"./../staloadall.hats"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

%{^
%%
-module(test01_dats).
%%
-export([main0_erl/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-include("./../libatscc2erl_all.hrl").
%%
%} // end of [%{]

(* ****** ****** *)

extern
fun
main0_erl
(
// argumentless
) : void = "mac#"
//
implement
main0_erl () =
{
//
val () = (3).foreach()(lam(i) =<cloref1> println!(i, ": Hello, world!"))
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [test01.dats] *)
