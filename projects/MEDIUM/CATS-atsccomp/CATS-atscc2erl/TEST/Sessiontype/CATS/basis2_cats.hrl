%%%%%%
%%
%% Session-typed channels
%%
%%%%%%
%%
%% Author: Hongwei Xi
%% Authoremail: gmhwxiATgmailDOTcom
%%
%% Start time: July, 2015
%%
%%%%%%
%%
%% HX: A channel is a pair of pids: {Chpos, Chneg}
%%
%%%%%%

libats2erl_session_channel_get_val
  (Chan) ->
  Chan ! {self()},
  receive {Chan, Chan_val} -> Chan_val.
libats2erl_session_chanpos_set_val
  (Chan) ->
  Chan ! {self()},
  receive {Chan, Chan_val} -> Chan_val.

%%%%%% end of [basis2_cats.hrl] %%%%%%
