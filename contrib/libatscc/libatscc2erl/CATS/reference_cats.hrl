%%
%%%%%%
%
% HX-2015-07:
% for Erlang code
% translated from ATS
%
%%%%%%
%%

%%
%%%%%%
% beg of [reference_cats.hrl]
%%%%%%
%%

%% ****** ****** %%
%%
%%fun%%
ats2erlpre_ref(X) ->
  ats2erlpre_ref_make_elt(X).
%%fun%%
ats2erlpre_ref_make_elt(X) ->
  spawn(
    ?MODULE, ats2erlpre_ref_make_elt_proc, [X]
  ). %% spawn
ats2erlpre_ref_make_elt_proc(X) ->
  receive
    {Client} ->
      Client ! {self(), X}, ats2erlpre_ref_make_elt_proc(X);
    {Client, X2} ->
      Client ! {self(), X}, ats2erlpre_ref_make_elt_proc(X2)
  end.
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_ref_get_elt(Ref) ->
  Ref ! {self()}, receive {Ref, X} -> X end.
%%fun%%
ats2erlpre_ref_set_elt(Ref, X0) ->
  Ref ! {self(), X0}, receive {Ref, _} -> atscc2erl_void end.
%%
%%fun%%
ats2erlpre_ref_exch_elt(Ref, X0) ->
  Ref ! {self(), X0}, receive {Ref, X1} -> X1 end.
%%
%% ****** ****** %%

%% end of [reference_cats.hrl] %%
