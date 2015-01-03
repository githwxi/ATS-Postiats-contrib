%%%%%%
%
-module(session).
%
-export([chpos_send/2]).
-export([chpos_recv/1]).
-export([chpos_recv_close/1]).
%
-export([chneg_send/1]).
-export([chneg_recv/2]).
-export([chneg_recv_close/1]).
%
-export([chneg_transfer/0]).
%
-export([chpos_sslist/1]).
-export([chneg_sslist_nil/1]).
-export([chneg_sslist_cons/1]).
%
%%%%%%
%
% A channel is a pair: {Chpos, Chneg}
%
%%%%%%
%
chpos_send(Chneg, X) -> Chneg ! {self(), X}.
chpos_recv(Chneg) -> receive {Chneg, X} -> X end.
chpos_recv_close(Chneg) -> receive {Chneg, chpos_close} -> 0 end.
%
chneg_send({Chpos, Chneg}) ->
  Chneg ! {self()}, receive {Chpos, X} -> X end.
chneg_recv({Chpos, Chneg}, X) -> Chpos ! {Chneg, X}.
chneg_recv_close({Chpos, Chneg}) ->
  Chpos ! {Chneg, chpos_close}, Chneg ! chneg_transfer_close.
%
%%%%%%
%
chneg_transfer() ->
  receive
    {Client} ->
    receive
      ChposX = {_Chpos, _X} -> Client ! ChposX, chneg_transfer()
    end;
    chneg_transfer_close -> 0
  end.
%
%%%%%%
%
chpos_sslist(Chneg) -> receive {Chneg, X} -> X end.
%
chneg_sslist_nil({Chpos, Chneg}) -> Chpos ! {Chneg, nil}.
chneg_sslist_cons({Chpos, Chneg}) -> Chpos ! {Chneg, cons}.
%
%%%%%%

%%%%%% end of [session.erl] %%%%%%
