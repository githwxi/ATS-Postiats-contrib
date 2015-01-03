%%%%%%
%
%
-module(test01).
-export([double/1]).
%
%
%%%%%%

% This is a comment.
% Everything on a line after % is ignored.

times(X,Y) -> X*Y.
double(Value) -> times(Value, 2).

%%%%%% end of [test01.erl] %%%%%%
