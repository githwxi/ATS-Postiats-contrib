%%%%%%
%
-module(test02).
-export([mytest/0]).
%
%%%%%%

mytest() ->
    io:format("even(10) = ~p~n", [even(10)]),
    io:format("even(11) = ~p~n", [even(11)]),
    io:format("number(1) = ~p~n", [number(1)]),
    io:format("number(1.0) = ~p~n", [number(1.0)]).

%%%%%%

even(Int) when Int rem 2 == 0 -> true;
even(Int) when Int rem 2 == 1 -> false.

%%%%%%

number(Num) when is_float(Num) -> float;
number(Num) when is_integer(Num) -> integer;
number(_Other) -> false.

%%%%%% end of [test02.erl] %%%%%%
