%%%%%%
%
-module(myservice_primes).
%
-export([myservice_primes/0]).
-export([myservice_primes_fserv/1]).
%
%%%%%%

myservice_primes() ->
  receive
    Client ->
    Chpos = spawn(session, chpos_transfer, []),
    Chneg = spawn(?MODULE, myservice_primes_fserv, [Chpos]),
    Client ! {myservice_primes, {Chpos, Chneg}},
    myservice_primes()
  end.

%%%%%%

myservice_primes_fserv(Chpos) ->
  %% io:format("myservice_primes_fserv: Chpos = ~p~n", [Chpos]),
  myservice_ints ! self(),
  receive {myservice_ints, Ints} ->
    session:chneg_sslist_cons(Ints), 0 = session:chneg_send(Ints),
    session:chneg_sslist_cons(Ints), 1 = session:chneg_send(Ints),
    myservice_primes_fserv2(Ints, Chpos)
  end.

myservice_primes_fserv2(Ints, Chpos) ->
  %% io:format("myservice_primes_fserv2: Ints = ~p~n", [Ints]),
  %% io:format("myservice_primes_fserv2: Chpos = ~p~n", [Chpos]),
  Opt2 = session:chpos_sslist (Chpos),
  case Opt2 of
    nil ->
      session:chneg_sslist_nil(Ints),
      session:chpos_recv_close(Chpos);
    cons -> 
      myservice_ints_filter ! self(),
      receive
        {myservice_ints_filter, Ints_filter} ->
        session:chneg_recv(Ints_filter, Ints),
        session:chneg_sslist_cons(Ints_filter),
        First = session:chneg_send(Ints_filter),
        session:chpos_send(Chpos, First),
        myservice_primes_fserv2(Ints_filter, Chpos)
      end
  end.

%%%%%%

%%%%%% end of [myservice_primes.erl] ######
