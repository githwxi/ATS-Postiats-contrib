%%%%%%
%
-module(echo).
-export([go/0, loop/0]).
%
%%%%%%

go() ->
  Pid = spawn(echo, loop, []),
  Pid ! {self(), "Hello for [go]!"},
  receive {Pid, Msg} -> io:format("~p~n",[Msg]) end,
  go2(Pid).

go2(Pid) ->
  Pid ! {self(), "Hello for [go2]!"},
  receive {Pid, Msg} -> io:format("~p~n",[Msg]) end,
  Pid ! stop.

%%%%%%

loop() ->
  receive
    {From, Msg} -> From ! {self(), Msg}, loop();
    stop -> io:format("~p~n", ["loop terminates!"]), true
  end.

%%%%%% end of [echo.erl] %%%%%%
