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
% beg of [integer_cats.js]
%%%%%%
%%

%% ****** ****** %%
%%
%% HX: for signed integers
%%
%% ****** ****** %%

fun
ats2jspre_neg_int0(X) -> ( -X ).
fun
ats2jspre_neg_int1(X) -> ( -X ).

%% ****** ****** %%

fun
ats2jspre_succ_int0(X) -> (X + 1).
fun
ats2jspre_pred_int0(X) -> (X - 1).

%% ****** ****** %%

fun
ats2jspre_succ_int1(X) -> (X + 1).
fun
ats2jspre_pred_int1(X) -> (X - 1).

%% ****** ****** %%

fun
ats2jspre_add_int0_int0(X, Y) -> (X + Y).
fun
ats2jspre_sub_int0_int0(X, Y) -> (X - Y).
fun
ats2jspre_mul_int0_int0(X, Y) -> (X * Y).
fun
ats2jspre_div_int0_int0(X, Y) -> (X / Y).

%% ****** ****** %%

fun
ats2jspre_add_int1_int1(X, Y) -> (X + Y).
fun
ats2jspre_sub_int1_int1(X, Y) -> (X - Y).
fun
ats2jspre_mul_int1_int1(X, Y) -> (X * Y).
fun
ats2jspre_div_int1_int1(X, Y) -> (X / Y).

%% ****** ****** %%

fun
ats2jspre_lt_int0_int0(X, Y) -> (X < Y).
fun
ats2jspre_lte_int0_int0(X, Y) -> (X =< Y).
fun
ats2jspre_gt_int0_int0(X, Y) -> (X > Y).
fun
ats2jspre_gte_int0_int0(X, Y) -> (X >= Y).
fun
ats2jspre_eq_int0_int0(X, Y) -> (X =:= Y).
fun
ats2jspre_neq_int0_int0(X, Y) -> (X =/= Y).

%% ****** ****** %%

fun
ats2jspre_compare_int0_int0(X, Y) ->
%{
  if
    X > Y -> 1; X < Y -> -1; true -> 0
  end.
%}

%% ****** ****** %%

fun
ats2jspre_lt_int1_int1(X, Y) -> (X < Y).
fun
ats2jspre_lte_int1_int1(X, Y) -> (X =< Y).
fun
ats2jspre_gt_int1_int1(X, Y) -> (X > Y).
fun
ats2jspre_gte_int1_int1(X, Y) -> (X >= Y).
fun
ats2jspre_eq_int1_int1(X, Y) -> (X =:= Y).
fun
ats2jspre_neq_int1_int1(X, Y) -> (X =/= Y).

%% ****** ****** %%

%% end of [integer_cats.hrl] %%
