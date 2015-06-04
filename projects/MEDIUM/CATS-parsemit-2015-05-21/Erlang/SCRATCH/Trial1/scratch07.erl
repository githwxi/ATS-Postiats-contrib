%%%%%%
%
-module(scratch07).
-export([scratch07_init/0]).
-export([scratch07_test/1]).
%
%%%%%%

scratch07_init() ->
  register(myservice_ints, spawn(myservice_ints, myservice_ints, [])),
  register(myservice_ints_filter, spawn(myservice_ints_filter, myservice_ints_filter, [])),
  register(myservice_primes, spawn(myservice_primes, myservice_primes, [])).

%%%%%%

scratch07_test(N) ->
  myservice_primes ! self(),
  Chposneg_primes =
    receive {myservice_primes, Chposneg} -> Chposneg end,
  scratch07_test_loop(Chposneg_primes, 0, N).

scratch07_test_loop(Chposneg, I, N) ->
  %% io:format("scratch07_test_loop:~p~n", [self()]),
  if
    I < N ->
      session:chneg_sslist_cons(Chposneg),
      First = session:chneg_send(Chposneg),
      io:format("scratch07_test_loop: prime(~p) = ~p~n", [I,First]),
      scratch07_test_loop(Chposneg, I+1, N);
    true -> session:chneg_sslist_nil(Chposneg)
  end.

%%%%%%

%%%%%% end of [scratch07.erl] ######
