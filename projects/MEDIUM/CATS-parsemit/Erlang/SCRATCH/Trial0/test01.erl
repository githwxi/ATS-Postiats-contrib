%%%%%%
%
-module(test01).
-export([mytest/0]).
%
%%%%%%

mytest() ->
  X1 = double(10),
  io:format("double(10) = ~p~n", [X1]),
  X2 = square(10),
  io:format("square(10) = ~p~n", [X2]).

%%%%%%

times(X,Y) -> X*Y.
double(Value) -> times(Value, 2).
square(Value) -> times(Value, Value).

%%%%%% end of [test01.erl] %%%%%%
