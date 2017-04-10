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
-module(test02_dats).
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

#define :: list_cons

(* ****** ****** *)

implement
{a}(*tmp*)
print_list(xs) = let
//
val sep = ", "
//
fun
loop
(
  i: int, xs: List(a)
) : void =
(
case+ xs of
| list_nil() => ()
| list_cons(x, xs) => let
    val () =
    if i > 0 then print(sep)
    val () = print_val<a> (x)
  in
    loop (i+1, xs)
  end // end of [list_cons]
)
//
in
  loop (0, xs)
end // end of [print_list]

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
val xs =
(
  0 :: 1 :: 2 :: 3 :: 4 :: 5 :: 6 :: 7 :: 8 :: 9 :: nil()
) : List0 (int)
//
val () = println! ("xs = ", xs)
val () = println! ("xs + xs = ", xs + xs)
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [test02.dats] *)
