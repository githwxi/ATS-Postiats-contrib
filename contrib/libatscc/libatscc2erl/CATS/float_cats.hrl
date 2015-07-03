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
% beg of [float_cats.js]
%%%%%%
%%

%% ****** ****** %%

fun
ats2jspre_neg_double(X) -> ( -X ).

%% ****** ****** %%

fun
ats2jspre_succ_double(X) -> (X + 1).
fun
ats2jspre_pred_double(X) -> (X - 1).

%% ****** ****** %%

fun
ats2jspre_add_double_double(X, Y) -> (X + Y).
fun
ats2jspre_sub_double_double(X, Y) -> (X - Y).
fun
ats2jspre_mul_double_double(X, Y) -> (X * Y).
fun
ats2jspre_div_double_double(X, Y) -> (X / Y).

%% ****** ****** %%

fun
ats2jspre_lt_double_double(X, Y) -> (X < Y).
fun
ats2jspre_lte_double_double(X, Y) -> (X =< Y).
fun
ats2jspre_gt_double_double(X, Y) -> (X > Y).
fun
ats2jspre_gte_double_double(X, Y) -> (X >= Y).
fun
ats2jspre_eq_double_double(X, Y) -> (X =:= Y).
fun
ats2jspre_neq_double_double(X, Y) -> (X =/= Y).

%% ****** ****** %%

fun
ats2jspre_compare_double_double(X, Y) ->
%{
  if
    X > Y -> 1; X < Y -> -1; true -> 0
  end.
%}

%% ****** ****** %%

%% end of [float_cats.hrl] %%
