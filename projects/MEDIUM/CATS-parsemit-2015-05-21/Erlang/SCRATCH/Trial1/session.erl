%%%%%%
%
-module(session).
%
-export([chpos_send/2]).
-export([chpos_recv/1]).
%
-export([chneg_send/1]).
-export([chneg_recv/2]).
%
-export([chpos_recv_close/1]).
-export([chneg_recv_close/1]).
%
-export([chpos_transfer/0]).
%
-export([chpos_chneg_connect/2]).
-export([chpos_chneg_connect_pn/2]).
-export([chpos_chneg_connect_np/3]).
%
-export([chpos_sslist/1]).
-export([chpos_sslist_nil/1]).
-export([chpos_sslist_cons/1]).
%
-export([chneg_sslist/1]).
-export([chneg_sslist_nil/1]).
-export([chneg_sslist_cons/1]).
%
%%%%%%
%
% A positive channel is {Chpos}
% A negative channel is a pair {Chpos, Chneg}
%
%%%%%%
%
chpos_send(Chpos, X) -> Chpos ! {self(), X}.
chpos_recv(Chpos) -> receive {Chpos, X} -> X end.
chpos_recv_close(Chpos) ->
  receive {Chpos, chneg_close} -> chneg_close end.
%
chneg_send({Chpos, Chneg}) ->
  Chpos ! {self()}, receive {Chneg, X} -> X end.
chneg_recv({Chpos, Chneg}, X) -> Chneg ! {Chpos, X}.
chneg_recv_close({Chpos, Chneg}) ->
  Chneg ! {Chpos, chneg_close}, Chpos ! chpos_transfer_close.
%
%%%%%%
%
chpos_transfer() ->
  receive
    {Client} ->
    receive
      ChposX = {_Chpos, _X} -> Client ! ChposX, chpos_transfer()
    end;
    chpos_transfer_close -> 0
  end.
%
%%%%%%
%
chpos_chneg_connect
  (Chpos1, Chposneg2) ->
  Chneg1 = self(),
  spawn(?MODULE, chpos_chneg_connect_np, [Chpos1, Chneg1, Chposneg2]),
  chpos_chneg_connect_pn(Chpos1, Chposneg2).
%
chpos_chneg_connect_pn
  (Chpos1, Chposneg2) ->
  %% io:format("chpos_chneg_connect_pn: Chpos1 = ~p~n", [Chpos1]),
  %% io:format("chpos_chneg_connect_pn: Chposneg2 = ~p~n", [Chposneg2]),
  {Chpos2, Chneg2} = Chposneg2,
  X = chpos_recv(Chpos1), Chpos2 ! {Chneg2, X},
  %% io:format("chpos_chneg_connect_pn: X = ~p~n", [X]),
  if
    (X==chneg_close) ->
      Chpos1 ! chpos_transfer_close;
    true ->
      chpos_chneg_connect_pn(Chpos1, Chposneg2)
  end.
%
chpos_chneg_connect_np
  (Chpos1, Chneg1, Chposneg2) ->
  %% io:format("chpos_chneg_connect_np: Chpos1 = ~p~n", [Chpos1]),
  %% io:format("chpos_chneg_connect_np: Chneg1 = ~p~n", [Chneg1]),
  %% io:format("chpos_chneg_connect_np: Chposneg2 = ~p~n", [Chposneg2]),
  X = chneg_send(Chposneg2),
  %% io:format("chpos_chneg_connect_np: X = ~p~n", [X]),
  if
    (X==chneg_close) ->
      chneg_recv_close(Chposneg2);
    true ->
      Chpos1 ! {Chneg1, X},
      chpos_chneg_connect_np(Chpos1, Chneg1, Chposneg2)
  end.
%
%%%%%%
%
chpos_sslist(Chpos) -> receive {Chpos, X} -> X end.
%
chpos_sslist_nil(Chpos) -> Chpos ! {self(), nil}.
%
chpos_sslist_cons(Chpos) -> Chpos ! {self(), cons}.
%
%%%%%%
%
chneg_sslist(Chposneg) ->
  {Chpos, Chneg} = Chposneg,
  Chpos ! {self()}, receive {Chneg, X} -> X end.
%
chneg_sslist_nil(Chposneg) ->
  {Chpos, Chneg} = Chposneg,
  Chneg ! {Chpos, nil}, chneg_recv_close(Chposneg).
%
chneg_sslist_cons(Chposneg) ->
  {Chpos, Chneg} = Chposneg, Chneg ! {Chpos, cons}.
%
%%%%%%

%%%%%% end of [session.erl] %%%%%%
