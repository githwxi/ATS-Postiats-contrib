%%%%%%
%
-module(myservice_ints).
%
-export([myservice_ints/0]).
-export([myservice_ints_fserv/2]).
%
%%%%%%

myservice_ints() ->
  receive
    Client ->
    Chpos = spawn(session, chpos_transfer, []),
    Chneg = spawn(?MODULE, myservice_ints_fserv, [Chpos, 0]),
    Client ! {myservice_ints, {Chpos, Chneg}},
    myservice_ints()
  end.

%%%%%%

myservice_ints_fserv(Chpos, N) ->
  %% io:format("myservice_ints_fserv: ~p~n", [self()]),
  %% io:format("myservice_ints_fserv: Chpos = ~p~n", [Chpos]),
  Opt2 = session:chpos_sslist(Chpos),
  %% io:format("myservice_ints_fserv: Opt2 = ~p~n", [Opt2]),
  case Opt2 of
    nil -> session:chpos_recv_close(Chpos);
    cons -> session:chpos_send(Chpos, N), myservice_ints_fserv(Chpos, N+1)
  end.

%%%%%%

%%%%%% end of [myservice_ints.erl] ######
