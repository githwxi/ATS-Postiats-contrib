%%%%%%
%
-module(myservice_int2bits).
%
-export([myservice_int2bits/0]).
-export([myservice_int2bits_fserv/1]).
%
%%%%%%

myservice_int2bits() ->
  receive
    Client ->
    Chpos = spawn(session, chpos_transfer, []),
    Chneg = spawn(?MODULE, myservice_int2bits_fserv, [Chpos]),
    Client ! {myservice_int2bits, {Chpos, Chneg}},
    myservice_int2bits()
  end.

%%%%%%

myservice_int2bits_fserv(Chpos) ->
  N = session:chpos_recv(Chpos),
  myservice_int2bits_fserv2(Chpos, N).

myservice_int2bits_fserv2(Chpos, N) ->
  if
    N>0 ->
      N2 = trunc(N/2), Bit = N-2*N2,
      session:chpos_sslist_cons(Chpos),
      session:chpos_send(Chpos, Bit),
      myservice_int2bits_fserv2(Chpos, N2);
    true ->
      session:chpos_sslist_nil(Chpos),
      session:chpos_recv_close(Chpos)
  end.

%%%%%%

%%%%%% end of [myservice_int2bits.erl] %%%%%%
