%%
%% Time of Generation:
%% Tue Jul  7 13:20:03 EDT 2015
%%

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
-define(ATSfunclo_clo(F), (element(1, F))).

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

-define(ATSINScaseof_fail(ERRMSG), exit({'atscc2err_caseof_fail', ERRMSG})).

%% ****** ****** %%

ats2erlpre_cloref0_app(F) -> ?ATSfunclo_clo(F)(F).
ats2erlpre_cloref1_app(F, X1) -> ?ATSfunclo_clo(F)(F, X1).
ats2erlpre_cloref2_app(F, X1, X2) -> ?ATSfunclo_clo(F)(F, X1, X2).
ats2erlpre_cloref3_app(F, X1, X2, X3) -> ?ATSfunclo_clo(F)(F, X1, X2, X3).

%% ****** ****** %%

%% end of [basics_cats.hrl] %%
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
% beg of [integer_cats.hrl]
%%%%%%
%%

%% ****** ****** %%
%%
%% HX: for signed integers
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_abs_int0(X) -> abs(X).
%%fun%%
ats2erlpre_abs_int1(X) -> abs(X).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_neg_int0(X) -> ( -X ).
%%fun%%
ats2erlpre_neg_int1(X) -> ( -X ).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_succ_int0(X) -> (X + 1).
%%fun%%
ats2erlpre_pred_int0(X) -> (X - 1).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_succ_int1(X) -> (X + 1).
%%fun%%
ats2erlpre_pred_int1(X) -> (X - 1).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_half_int0(X) -> (X div 2).
%%fun%%
ats2erlpre_half_int1(X) -> (X div 2).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_add_int0_int0(X, Y) -> (X + Y).
%%fun%%
ats2erlpre_sub_int0_int0(X, Y) -> (X - Y).
%%fun%%
ats2erlpre_mul_int0_int0(X, Y) -> (X * Y).
%%fun%%
ats2erlpre_div_int0_int0(X, Y) -> (X div Y).
%%fun%%
ats2erlpre_mod_int0_int0(X, Y) -> (X rem Y).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_add_int1_int1(X, Y) -> (X + Y).
%%fun%%
ats2erlpre_sub_int1_int1(X, Y) -> (X - Y).
%%fun%%
ats2erlpre_mul_int1_int1(X, Y) -> (X * Y).
%%fun%%
ats2erlpre_div_int1_int1(X, Y) -> (X div Y).
%%fun%%
ats2erlpre_mod_int1_int1(X, Y) -> (X rem Y).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_lt_int0_int0(X, Y) -> (X < Y).
%%fun%%
ats2erlpre_lte_int0_int0(X, Y) -> (X =< Y).
%%fun%%
ats2erlpre_gt_int0_int0(X, Y) -> (X > Y).
%%fun%%
ats2erlpre_gte_int0_int0(X, Y) -> (X >= Y).
%%fun%%
ats2erlpre_eq_int0_int0(X, Y) -> (X =:= Y).
%%fun%%
ats2erlpre_neq_int0_int0(X, Y) -> (X =/= Y).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_compare_int0_int0
  (X, Y) ->
%{
  if X > Y -> 1; X < Y -> -1; true -> 0 end.
%}
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_lt_int1_int1(X, Y) -> (X < Y).
%%fun%%
ats2erlpre_lte_int1_int1(X, Y) -> (X =< Y).
%%fun%%
ats2erlpre_gt_int1_int1(X, Y) -> (X > Y).
%%fun%%
ats2erlpre_gte_int1_int1(X, Y) -> (X >= Y).
%%fun%%
ats2erlpre_eq_int1_int1(X, Y) -> (X =:= Y).
%%fun%%
ats2erlpre_neq_int1_int1(X, Y) -> (X =/= Y).
%%
%% ****** ****** %%

%% end of [integer_cats.hrl] %%
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
% beg of [bool_cats.hrl]
%%%%%%
%%

%% ****** ****** %%
%%
%%fun%%
ats2jspre_neg_bool0(X) -> not(X).
%%fun%%
ats2jspre_neg_bool1(X) -> not(X).
%%
%% ****** ****** %%
%%
%%fun%%
ats2jspre_eq_bool0_bool0(X, Y) -> (X =:= Y).
%%fun%%
ats2jspre_neq_bool0_bool0(X, Y) -> (X =/= Y).
%%
%% ****** ****** %%
%%
%%fun%%
ats2jspre_eq_bool1_bool1(X, Y) -> (X =:= Y).
%%fun%%
ats2jspre_neq_bool1_bool1(X, Y) -> (X =/= Y).
%%
%% ****** ****** %%

%% end of [bool_cats.js] %%
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
% beg of [float_cats.hrl]
%%%%%%
%%

%% ****** ****** %%
%%
%%fun%%
ats2erlpre_neg_double(X) -> ( -X ).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_succ_double(X) -> (X + 1).
%%fun%%
ats2erlpre_pred_double(X) -> (X - 1).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_add_double_double(X, Y) -> (X + Y).
%%fun%%
ats2erlpre_sub_double_double(X, Y) -> (X - Y).
%%fun%%
ats2erlpre_mul_double_double(X, Y) -> (X * Y).
%%fun%%
ats2erlpre_div_double_double(X, Y) -> (X / Y).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_lt_double_double(X, Y) -> (X < Y).
%%fun%%
ats2erlpre_lte_double_double(X, Y) -> (X =< Y).
%%fun%%
ats2erlpre_gt_double_double(X, Y) -> (X > Y).
%%fun%%
ats2erlpre_gte_double_double(X, Y) -> (X >= Y).
%%fun%%
ats2erlpre_eq_double_double(X, Y) -> (X =:= Y).
%%fun%%
ats2erlpre_neq_double_double(X, Y) -> (X =/= Y).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_compare_double_double
  (X, Y) ->
%{
  if X > Y -> 1; X < Y -> -1; true -> 0 end.
%}
%%
%% ****** ****** %%

%% end of [float_cats.hrl] %%
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
% beg of [print_cats.hrl]
%%%%%%
%%

%% ****** ****** %%
%%
%%fun%%
ats2erlpre_print_int(X) -> io:format("~B", [X]).
%%
%%fun%%
ats2erlpre_print_bool(X) ->
  ats2erlpre_print_string(if X->"true"; true->"false" end).
%%
%%fun%%
ats2erlpre_print_double(X) -> io:format("~f", [X]).
%%fun%%
ats2erlpre_print_string(X) -> io:format("~s", [X]).
%%
%%fun%%
ats2erlpre_print_newline() -> io:format("~n", []).
%%
%% ****** ****** %%

%% end of [print_cats.hrl] %%

%% ****** ****** %%

%% end of [libatscc2erl_all.hrl] %%
