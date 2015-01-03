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
    Chneg = spawn(session, chneg_transfer, []),
    Chpos = spawn(?MODULE, myservice_ints_fserv, [Chneg, 0]),
    Client ! {myservice_ints, {Chpos, Chneg}},
    myservice_ints()
  end.

%%%%%%

myservice_ints_fserv(Chneg, N) ->
  %% io:format("myservice_ints_fserv: ~p~n", [self()]),
  %% io:format("myservice_ints_fserv: Chneg = ~p~n", [Chneg]),
  Opt2 = session:chpos_sslist(Chneg),
  %% io:format("myservice_ints_fserv: Opt2 = ~p~n", [Opt2]),
  case Opt2 of
    nil -> Chneg ! chneg_transfer_close;
    cons -> session:chpos_send(Chneg, N), myservice_ints_fserv(Chneg, N+1)
  end.

%%%%%%

%%%%%% end of [myservice_ints.erl] ######
