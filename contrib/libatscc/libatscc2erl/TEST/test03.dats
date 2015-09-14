(* ****** ****** *)
//
// For testing libatscc2js
//
(* ****** ****** *)
//

#define ATS_DYNLOADFLAG 0
//

(* ****** ****** *)
//
#include "./../staloadall.hats"
//
(* ****** ****** *)

staload "./../SATS/Erlang/file.sats"

(* ****** ****** *)

%{^
%%
-module(test03_dats).
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
val-
Some(fname) = ats2get_cwd_opt()
//
val fname = filename2string(fname)
//
val ((*void*)) = println! ("file_get_cwd() = ", fname)
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [test03.dats] *)
