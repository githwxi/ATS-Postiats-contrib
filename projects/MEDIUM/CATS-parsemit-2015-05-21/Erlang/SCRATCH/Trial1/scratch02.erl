%%%%%%
%
-module(scratch02).
-export([scratch02_init/0]).
-export([scratch02_test1/0]).
-export([scratch02_test2/0]).
-export([server/0, server_session/1]).
%
%%%%%%

scratch02_init() ->
  register(server, spawn(?MODULE, server, [])).

%%%%%%

scratch02_test1() -> client1().
scratch02_test2() -> client2().

%%%%%%

server() ->
  receive
    Client ->
    Chpos = spawn(session, chpos_transfer, []),
    Chneg = spawn(?MODULE, server_session, [Chpos]),
    Client ! {server, {Chpos, Chneg}},
    server()
  end.

%%%%%%

server_session(Chpos) ->
  X = session:chpos_recv(Chpos),
  CC = session:chpos_recv(Chpos),
  io:format("X = ~p~n", [X]),
  io:format("CC = ~p~n", [CC]),
  session:chpos_send(Chpos, receipt),
  session:chpos_recv_close(Chpos),
  io:format("~p~n", ["server_session terminates!"]).

%%%%%%

client1() ->
  server ! self(),
  receive
    {server, Chposneg} -> client1_session(Chposneg)
  end.

client1_session(Chposneg) ->
  session:chneg_recv(Chposneg, candy),
  session:chneg_recv(Chposneg, 1357902468),
  X = session:chneg_send(Chposneg),
  io:format("X = ~p~n", [X]),
  session:chneg_recv_close(Chposneg),
  io:format("~p~n", ["client1_session terminates!"]).

%%%%%%

client2() ->
  server ! self(),
  receive
    {server, Chposneg} -> client2_session(Chposneg)
  end.

client2_session(Chposneg) ->
  session:chneg_recv(Chposneg, candy2),
  session:chneg_recv(Chposneg, 1357902468),
  X = session:chneg_send(Chposneg),
  io:format("X = ~p~n", [X]),
  session:chneg_recv_close(Chposneg),
  io:format("~p~n", ["client2_session terminates!"]).

%%%%%% end of [scratch02.erl] ######
