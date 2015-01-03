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
    Chneg = spawn(session, chneg_transfer, []),
    Chpos = spawn(?MODULE, myservice_primes_fserv, [Chneg]),
    Client ! {myservice_primes, {Chpos, Chneg}},
    myservice_primes()
  end.

%%%%%%

myservice_primes_fserv(Chneg) ->
  %% io:format("myservice_primes_fserv: Chneg = ~p~n", [Chneg]),
  myservice_ints ! self(),
  receive {myservice_ints, Ints} ->
    session:chneg_sslist_cons(Ints), 0 = session:chneg_send(Ints),
    session:chneg_sslist_cons(Ints), 1 = session:chneg_send(Ints),
    myservice_primes_fserv2(Ints, Chneg)
  end.

myservice_primes_fserv2(Ints, Chneg) ->
  %% io:format("myservice_primes_fserv2: Ints = ~p~n", [Ints]),
  %% io:format("myservice_primes_fserv2: Chneg = ~p~n", [Chneg]),
  Opt2 = session:chpos_sslist (Chneg),
  case Opt2 of
    nil ->
      Chneg ! chneg_transfer_close,
      session:chneg_sslist_nil(Ints);
    cons -> 
      myservice_ints_filter ! self(),
      receive
        {myservice_ints_filter, Ints_filter} ->
        session:chneg_recv(Ints_filter, Ints),
        session:chneg_sslist_cons(Ints_filter),
        First = session:chneg_send(Ints_filter),
        session:chpos_send (Chneg, First),
        myservice_primes_fserv2(Ints_filter, Chneg)
      end
  end.

%%%%%%

%%%%%% end of [myservice_primes.erl] ######
