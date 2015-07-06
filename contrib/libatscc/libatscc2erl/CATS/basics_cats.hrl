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
% beg of [basics_cats.hrl]
%%%%%%
%%

%% ****** ****** %%

-define(ATSCKiseqz(X), X =:= 0).
-define(ATSCKisneqz(X), X =/= 0).

%% ****** ****** %%

-define(ATSCKpat_int(X, I), X =:= I).

%% ****** ****** %%

-define(ATSCKpat_con0(X, I), X =:= I).

%% ****** ****** %%

-define(ATSCKptrisnil(X), X =:= atscc2erl_nil).
-define(ATSCKptriscons(X), X =/= atscc2erl_nil).

%% ****** ****** %%

-define(ATSSELcon(P, I), element(I+1, P)).
-define(ATSSELboxrec(P, I), element(I+1, P)).

%% ****** ****** %%

-define(ATSfunclo_fun(F), (F)).
-define(ATSfunclo_clo(X), (element(1, X))).

%% ****** ****** %%
%%
-define(ATSINSmove_void(), atscc2erl_void).
%%
%% ****** ****** %%
%%
%%fun%%
atscc2erl_caseof_deadcode
  (_FILE, _LINE) -> exit('atscc2erl_caseof_deadcode').
%%
%% ****** ****** %%

%% end of [basics_cats.hrl] %%
