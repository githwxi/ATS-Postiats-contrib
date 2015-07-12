%%
%% Time of Generation:
%% Sun Jul 12 13:56:45 EDT 2015
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
-define(ATSCKpat_bool(X, I), X =:= I).

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
%%%%%%
%%
%% The Erlang code is generated by atscc2erl
%% The starting compilation time is: 2015-7-12: 13h:56m
%%
%%%%%%
%%%%%%
%%
%% end-of-compilation-unit
%%
%%%%%%
%%%%%%
%%
%% The Erlang code is generated by atscc2erl
%% The starting compilation time is: 2015-7-12: 13h:56m
%%
%%%%%%

%%fun%%
ats2erlpre_list_make_intrange_2(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_make_intrange_2,
  ats2erlpre_list_make_intrange_3(Arg0, Arg1, 1).
%} // end-of-function


%%fun%%
ats2erlpre_list_make_intrange_3(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret1
%% var Tmp12
%% var Tmp13
%% var Tmp14
%% var Tmp15
%% var Tmp16
%% var Tmp17
%% var Tmp18
%% var Tmp19
%% var Tmp20
%% var Tmp21
%% var Tmp22
%% var Tmp23
%% var Tmp24
%% var Tmp25
%% var Tmp26
%% var Tmp27
%% var Tmp28
%% var Tmp29
%% var Tmp30
%% var Tmp31
%% var Tmp32
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_make_intrange_3,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      Tmp12 = ats2erlpre_gt_int0_int0(Arg2, 0),
      if(not(?ATSCKpat_bool(Tmp12, true))) -> Casefun(Casefun, 2); true ->
      Tmp13 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
      if
        Tmp13 ->
          Tmp17 = ats2erlpre_sub_int0_int0(Arg1, Arg0),
          Tmp16 = ats2erlpre_add_int0_int0(Tmp17, Arg2),
          Tmp15 = ats2erlpre_sub_int0_int0(Tmp16, 1),
          Tmp14 = ats2erlpre_div_int0_int0(Tmp15, Arg2),
          Tmp20 = ats2erlpre_sub_int0_int0(Tmp14, 1),
          Tmp19 = ats2erlpre_mul_int0_int0(Tmp20, Arg2),
          Tmp18 = ats2erlpre_add_int0_int0(Arg0, Tmp19),
          Tmp21 = atscc2erl_nil,
          f_ats2erlpre_list_loop1_2(Tmp14, Tmp18, Arg2, Tmp21);
        %% if-then
        true ->
          atscc2erl_nil
        %% if-else
      end
      end;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      2 ->
      Tmp22 = ats2erlpre_lt_int0_int0(Arg2, 0),
      if(not(?ATSCKpat_bool(Tmp22, true))) -> Casefun(Casefun, 3); true ->
      Tmp23 = ats2erlpre_gt_int0_int0(Arg0, Arg1),
      if
        Tmp23 ->
          Tmp24 = ats2erlpre_neg_int0(Arg2),
          Tmp28 = ats2erlpre_sub_int0_int0(Arg0, Arg1),
          Tmp27 = ats2erlpre_add_int0_int0(Tmp28, Tmp24),
          Tmp26 = ats2erlpre_sub_int0_int0(Tmp27, 1),
          Tmp25 = ats2erlpre_div_int0_int0(Tmp26, Tmp24),
          Tmp31 = ats2erlpre_sub_int0_int0(Tmp25, 1),
          Tmp30 = ats2erlpre_mul_int0_int0(Tmp31, Tmp24),
          Tmp29 = ats2erlpre_sub_int0_int0(Arg0, Tmp30),
          Tmp32 = atscc2erl_nil,
          f_ats2erlpre_list_loop2_3(Tmp25, Tmp29, Tmp24, Tmp32);
        %% if-then
        true ->
          atscc2erl_nil
        %% if-else
      end
      end;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      atscc2erl_nil;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop1_2(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret2
%% var Tmp3
%% var Tmp4
%% var Tmp5
%% var Tmp6
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop1_2,
  Tmp3 = ats2erlpre_gt_int0_int0(Arg0, 0),
  if
    Tmp3 ->
      Tmp4 = ats2erlpre_sub_int0_int0(Arg0, 1),
      Tmp5 = ats2erlpre_sub_int0_int0(Arg1, Arg2),
      Tmp6 = {Arg1, Arg3},
      f_ats2erlpre_list_loop1_2(Tmp4, Tmp5, Arg2, Tmp6);
    %% if-then
    true ->
      Arg3
    %% if-else
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop2_3(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret7
%% var Tmp8
%% var Tmp9
%% var Tmp10
%% var Tmp11
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop2_3,
  Tmp8 = ats2erlpre_gt_int0_int0(Arg0, 0),
  if
    Tmp8 ->
      Tmp9 = ats2erlpre_sub_int0_int0(Arg0, 1),
      Tmp10 = ats2erlpre_add_int0_int0(Arg1, Arg2),
      Tmp11 = {Arg1, Arg3},
      f_ats2erlpre_list_loop2_3(Tmp9, Tmp10, Arg2, Tmp11);
    %% if-then
    true ->
      Arg3
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_length(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret44
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_length,
  f_ats2erlpre_list_loop_10(Arg0, 0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_10(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret45
%% var Tmp47
%% var Tmp48
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_10,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg1;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp47 = ?ATSSELcon(Arg0, 1),
      Tmp48 = ats2erlpre_add_int1_int1(Arg1, 1),
      f_ats2erlpre_list_loop_10(Tmp47, Tmp48);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_get_at(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret49
%% var Tmp50
%% var Tmp51
%% var Tmp52
%% var Tmp53
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_get_at,
  Tmp50 = ats2erlpre_eq_int1_int1(Arg1, 0),
  if
    Tmp50 ->
      Tmp51 = ?ATSSELcon(Arg0, 0),
      Tmp51;
    %% if-then
    true ->
      Tmp52 = ?ATSSELcon(Arg0, 1),
      Tmp53 = ats2erlpre_sub_int1_int1(Arg1, 1),
      ats2erlpre_list_get_at(Tmp52, Tmp53)
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_append(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret54
%% var Tmp55
%% var Tmp56
%% var Tmp57
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_append,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg1;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp55 = ?ATSSELcon(Arg0, 0),
      Tmp56 = ?ATSSELcon(Arg0, 1),
      Tmp57 = ats2erlpre_list_append(Tmp56, Arg1),
      {Tmp55, Tmp57};
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_reverse(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret58
%% var Tmp59
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_reverse,
  Tmp59 = atscc2erl_nil,
  ats2erlpre_list_reverse_append(Arg0, Tmp59).
%} // end-of-function


%%fun%%
ats2erlpre_list_reverse_append(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret60
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_reverse_append,
  f_ats2erlpre_list_loop_15(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_15(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret61
%% var Tmp62
%% var Tmp63
%% var Tmp64
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_15,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg1;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp62 = ?ATSSELcon(Arg0, 0),
      Tmp63 = ?ATSSELcon(Arg0, 1),
      Tmp64 = {Tmp62, Arg1},
      f_ats2erlpre_list_loop_15(Tmp63, Tmp64);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_take(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret65
%% var Tmp66
%% var Tmp67
%% var Tmp68
%% var Tmp69
%% var Tmp70
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_take,
  Tmp66 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp66 ->
      Tmp67 = ?ATSSELcon(Arg0, 0),
      Tmp68 = ?ATSSELcon(Arg0, 1),
      Tmp70 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp69 = ats2erlpre_list_take(Tmp68, Tmp70),
      {Tmp67, Tmp69};
    %% if-then
    true ->
      atscc2erl_nil
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_drop(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret71
%% var Tmp72
%% var Tmp73
%% var Tmp74
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_drop,
  Tmp72 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp72 ->
      Tmp73 = ?ATSSELcon(Arg0, 1),
      Tmp74 = ats2erlpre_sub_int1_int1(Arg1, 1),
      ats2erlpre_list_drop(Tmp73, Tmp74);
    %% if-then
    true ->
      Arg0
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_split_at(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret75
%% var Tmp76
%% var Tmp77
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_split_at,
  Tmp76 = ats2erlpre_list_take(Arg0, Arg1),
  Tmp77 = ats2erlpre_list_drop(Arg0, Arg1),
  {Tmp76, Tmp77}.
%} // end-of-function


%%fun%%
ats2erlpre_list_insert_at(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret78
%% var Tmp79
%% var Tmp80
%% var Tmp81
%% var Tmp82
%% var Tmp83
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_insert_at,
  Tmp79 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp79 ->
      Tmp80 = ?ATSSELcon(Arg0, 0),
      Tmp81 = ?ATSSELcon(Arg0, 1),
      Tmp83 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp82 = ats2erlpre_list_insert_at(Tmp81, Tmp83, Arg2),
      {Tmp80, Tmp82};
    %% if-then
    true ->
      {Arg2, Arg0}
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_remove_at(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret84
%% var Tmp85
%% var Tmp86
%% var Tmp87
%% var Tmp88
%% var Tmp89
%% var Tmp90
%% var Tmp91
%% var Tmp92
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_remove_at,
  Tmp85 = ?ATSSELcon(Arg0, 0),
  Tmp86 = ?ATSSELcon(Arg0, 1),
  Tmp87 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp87 ->
      Tmp89 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp88 = ats2erlpre_list_remove_at(Tmp86, Tmp89),
      Tmp90 = ?ATSSELboxrec(Tmp88, 0),
      Tmp91 = ?ATSSELboxrec(Tmp88, 1),
      Tmp92 = {Tmp85, Tmp91},
      {Tmp90, Tmp92};
    %% if-then
    true ->
      {Tmp85, Tmp86}
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_app(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_app,
  ats2erlpre_list_foreach(Arg0, Arg1).
%} // end-of-function


%%fun%%
ats2erlpre_list_foreach(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmp95
%% var Tmp96
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_foreach,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      ?ATSINSmove_void();
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp95 = ?ATSSELcon(Arg0, 0),
      Tmp96 = ?ATSSELcon(Arg0, 1),
      ?ATSfunclo_clo(Arg1)(Arg1, Tmp95),
      ats2erlpre_list_foreach(Tmp96, Arg1);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_map(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret98
%% var Tmp99
%% var Tmp100
%% var Tmp101
%% var Tmp102
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_map,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      atscc2erl_nil;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp99 = ?ATSSELcon(Arg0, 0),
      Tmp100 = ?ATSSELcon(Arg0, 1),
      Tmp101 = ?ATSfunclo_clo(Arg1)(Arg1, Tmp99),
      Tmp102 = ats2erlpre_list_map(Tmp100, Arg1),
      {Tmp101, Tmp102};
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function

%%%%%%
%%
%% end-of-compilation-unit
%%
%%%%%%
%%%%%%
%%
%% The Erlang code is generated by atscc2erl
%% The starting compilation time is: 2015-7-12: 13h:56m
%%
%%%%%%

%%fun%%
ats2erlpre_list_make_intrange_2(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_make_intrange_2,
  ats2erlpre_list_make_intrange_3(Arg0, Arg1, 1).
%} // end-of-function


%%fun%%
ats2erlpre_list_make_intrange_3(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret1
%% var Tmp12
%% var Tmp13
%% var Tmp14
%% var Tmp15
%% var Tmp16
%% var Tmp17
%% var Tmp18
%% var Tmp19
%% var Tmp20
%% var Tmp21
%% var Tmp22
%% var Tmp23
%% var Tmp24
%% var Tmp25
%% var Tmp26
%% var Tmp27
%% var Tmp28
%% var Tmp29
%% var Tmp30
%% var Tmp31
%% var Tmp32
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_make_intrange_3,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      Tmp12 = ats2erlpre_gt_int0_int0(Arg2, 0),
      if(not(?ATSCKpat_bool(Tmp12, true))) -> Casefun(Casefun, 2); true ->
      Tmp13 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
      if
        Tmp13 ->
          Tmp17 = ats2erlpre_sub_int0_int0(Arg1, Arg0),
          Tmp16 = ats2erlpre_add_int0_int0(Tmp17, Arg2),
          Tmp15 = ats2erlpre_sub_int0_int0(Tmp16, 1),
          Tmp14 = ats2erlpre_div_int0_int0(Tmp15, Arg2),
          Tmp20 = ats2erlpre_sub_int0_int0(Tmp14, 1),
          Tmp19 = ats2erlpre_mul_int0_int0(Tmp20, Arg2),
          Tmp18 = ats2erlpre_add_int0_int0(Arg0, Tmp19),
          Tmp21 = atscc2erl_nil,
          f_ats2erlpre_list_loop1_2(Tmp14, Tmp18, Arg2, Tmp21);
        %% if-then
        true ->
          atscc2erl_nil
        %% if-else
      end
      end;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      2 ->
      Tmp22 = ats2erlpre_lt_int0_int0(Arg2, 0),
      if(not(?ATSCKpat_bool(Tmp22, true))) -> Casefun(Casefun, 3); true ->
      Tmp23 = ats2erlpre_gt_int0_int0(Arg0, Arg1),
      if
        Tmp23 ->
          Tmp24 = ats2erlpre_neg_int0(Arg2),
          Tmp28 = ats2erlpre_sub_int0_int0(Arg0, Arg1),
          Tmp27 = ats2erlpre_add_int0_int0(Tmp28, Tmp24),
          Tmp26 = ats2erlpre_sub_int0_int0(Tmp27, 1),
          Tmp25 = ats2erlpre_div_int0_int0(Tmp26, Tmp24),
          Tmp31 = ats2erlpre_sub_int0_int0(Tmp25, 1),
          Tmp30 = ats2erlpre_mul_int0_int0(Tmp31, Tmp24),
          Tmp29 = ats2erlpre_sub_int0_int0(Arg0, Tmp30),
          Tmp32 = atscc2erl_nil,
          f_ats2erlpre_list_loop2_3(Tmp25, Tmp29, Tmp24, Tmp32);
        %% if-then
        true ->
          atscc2erl_nil
        %% if-else
      end
      end;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      atscc2erl_nil;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop1_2(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret2
%% var Tmp3
%% var Tmp4
%% var Tmp5
%% var Tmp6
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop1_2,
  Tmp3 = ats2erlpre_gt_int0_int0(Arg0, 0),
  if
    Tmp3 ->
      Tmp4 = ats2erlpre_sub_int0_int0(Arg0, 1),
      Tmp5 = ats2erlpre_sub_int0_int0(Arg1, Arg2),
      Tmp6 = {Arg1, Arg3},
      f_ats2erlpre_list_loop1_2(Tmp4, Tmp5, Arg2, Tmp6);
    %% if-then
    true ->
      Arg3
    %% if-else
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop2_3(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret7
%% var Tmp8
%% var Tmp9
%% var Tmp10
%% var Tmp11
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop2_3,
  Tmp8 = ats2erlpre_gt_int0_int0(Arg0, 0),
  if
    Tmp8 ->
      Tmp9 = ats2erlpre_sub_int0_int0(Arg0, 1),
      Tmp10 = ats2erlpre_add_int0_int0(Arg1, Arg2),
      Tmp11 = {Arg1, Arg3},
      f_ats2erlpre_list_loop2_3(Tmp9, Tmp10, Arg2, Tmp11);
    %% if-then
    true ->
      Arg3
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_length(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret44
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_length,
  f_ats2erlpre_list_loop_10(Arg0, 0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_10(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret45
%% var Tmp47
%% var Tmp48
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_10,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg1;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp47 = ?ATSSELcon(Arg0, 1),
      Tmp48 = ats2erlpre_add_int1_int1(Arg1, 1),
      f_ats2erlpre_list_loop_10(Tmp47, Tmp48);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_get_at(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret49
%% var Tmp50
%% var Tmp51
%% var Tmp52
%% var Tmp53
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_get_at,
  Tmp50 = ats2erlpre_eq_int1_int1(Arg1, 0),
  if
    Tmp50 ->
      Tmp51 = ?ATSSELcon(Arg0, 0),
      Tmp51;
    %% if-then
    true ->
      Tmp52 = ?ATSSELcon(Arg0, 1),
      Tmp53 = ats2erlpre_sub_int1_int1(Arg1, 1),
      ats2erlpre_list_get_at(Tmp52, Tmp53)
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_append(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret54
%% var Tmp55
%% var Tmp56
%% var Tmp57
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_append,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg1;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp55 = ?ATSSELcon(Arg0, 0),
      Tmp56 = ?ATSSELcon(Arg0, 1),
      Tmp57 = ats2erlpre_list_append(Tmp56, Arg1),
      {Tmp55, Tmp57};
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_reverse(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret58
%% var Tmp59
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_reverse,
  Tmp59 = atscc2erl_nil,
  ats2erlpre_list_reverse_append(Arg0, Tmp59).
%} // end-of-function


%%fun%%
ats2erlpre_list_reverse_append(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret60
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_reverse_append,
  f_ats2erlpre_list_loop_15(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_15(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret61
%% var Tmp62
%% var Tmp63
%% var Tmp64
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_15,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg1;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp62 = ?ATSSELcon(Arg0, 0),
      Tmp63 = ?ATSSELcon(Arg0, 1),
      Tmp64 = {Tmp62, Arg1},
      f_ats2erlpre_list_loop_15(Tmp63, Tmp64);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_take(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret65
%% var Tmp66
%% var Tmp67
%% var Tmp68
%% var Tmp69
%% var Tmp70
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_take,
  Tmp66 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp66 ->
      Tmp67 = ?ATSSELcon(Arg0, 0),
      Tmp68 = ?ATSSELcon(Arg0, 1),
      Tmp70 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp69 = ats2erlpre_list_take(Tmp68, Tmp70),
      {Tmp67, Tmp69};
    %% if-then
    true ->
      atscc2erl_nil
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_drop(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret71
%% var Tmp72
%% var Tmp73
%% var Tmp74
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_drop,
  Tmp72 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp72 ->
      Tmp73 = ?ATSSELcon(Arg0, 1),
      Tmp74 = ats2erlpre_sub_int1_int1(Arg1, 1),
      ats2erlpre_list_drop(Tmp73, Tmp74);
    %% if-then
    true ->
      Arg0
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_split_at(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret75
%% var Tmp76
%% var Tmp77
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_split_at,
  Tmp76 = ats2erlpre_list_take(Arg0, Arg1),
  Tmp77 = ats2erlpre_list_drop(Arg0, Arg1),
  {Tmp76, Tmp77}.
%} // end-of-function


%%fun%%
ats2erlpre_list_insert_at(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret78
%% var Tmp79
%% var Tmp80
%% var Tmp81
%% var Tmp82
%% var Tmp83
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_insert_at,
  Tmp79 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp79 ->
      Tmp80 = ?ATSSELcon(Arg0, 0),
      Tmp81 = ?ATSSELcon(Arg0, 1),
      Tmp83 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp82 = ats2erlpre_list_insert_at(Tmp81, Tmp83, Arg2),
      {Tmp80, Tmp82};
    %% if-then
    true ->
      {Arg2, Arg0}
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_remove_at(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret84
%% var Tmp85
%% var Tmp86
%% var Tmp87
%% var Tmp88
%% var Tmp89
%% var Tmp90
%% var Tmp91
%% var Tmp92
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_remove_at,
  Tmp85 = ?ATSSELcon(Arg0, 0),
  Tmp86 = ?ATSSELcon(Arg0, 1),
  Tmp87 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp87 ->
      Tmp89 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp88 = ats2erlpre_list_remove_at(Tmp86, Tmp89),
      Tmp90 = ?ATSSELboxrec(Tmp88, 0),
      Tmp91 = ?ATSSELboxrec(Tmp88, 1),
      Tmp92 = {Tmp85, Tmp91},
      {Tmp90, Tmp92};
    %% if-then
    true ->
      {Tmp85, Tmp86}
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_app(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_app,
  ats2erlpre_list_foreach(Arg0, Arg1).
%} // end-of-function


%%fun%%
ats2erlpre_list_foreach(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmp95
%% var Tmp96
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_foreach,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      ?ATSINSmove_void();
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp95 = ?ATSSELcon(Arg0, 0),
      Tmp96 = ?ATSSELcon(Arg0, 1),
      ?ATSfunclo_clo(Arg1)(Arg1, Tmp95),
      ats2erlpre_list_foreach(Tmp96, Arg1);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_map(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret98
%% var Tmp99
%% var Tmp100
%% var Tmp101
%% var Tmp102
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_map,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      atscc2erl_nil;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp99 = ?ATSSELcon(Arg0, 0),
      Tmp100 = ?ATSSELcon(Arg0, 1),
      Tmp101 = ?ATSfunclo_clo(Arg1)(Arg1, Tmp99),
      Tmp102 = ats2erlpre_list_map(Tmp100, Arg1),
      {Tmp101, Tmp102};
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function

%%%%%%
%%
%% end-of-compilation-unit
%%
%%%%%%
%%%%%%
%%
%% The Erlang code is generated by atscc2erl
%% The starting compilation time is: 2015-7-12: 13h:56m
%%
%%%%%%

%%fun%%
f_ats2erlpre_intrange_patsfun_7__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_7(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_9__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_9(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_11__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_11(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_14__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0, XArg1) -> f_ats2erlpre_intrange_patsfun_14(Cenv1, XArg0, XArg1) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_18__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_18(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_31__closurerize(XEnv0, XEnv1) -> 
%{
  {fun({_, Cenv1, Cenv2}, XArg0, XArg1) -> f_ats2erlpre_intrange_patsfun_31(Cenv1, Cenv2, XArg0, XArg1) end, XEnv0, XEnv1}.
%}


%%fun%%
ats2erlpre_int_repeat_lazy(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmp1
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_repeat_lazy,
  Tmp1 = atspre_lazy2cloref(Arg1),
  ats2erlpre_int_repeat_cloref(Arg0, Tmp1).
%} // end-of-function


%%fun%%
ats2erlpre_int_repeat_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_repeat_cloref,
  f_ats2erlpre_intrange_loop_2(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_2(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmp4
%% var Tmp6
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_2,
  Tmp4 = ats2erlpre_gt_int0_int0(Arg0, 0),
  if
    Tmp4 ->
      ?ATSfunclo_clo(Arg1)(Arg1),
      Tmp6 = ats2erlpre_sub_int0_int0(Arg0, 1),
      f_ats2erlpre_intrange_loop_2(Tmp6, Arg1);
    %% if-then
    true ->
      ?ATSINSmove_void()
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_int_exists_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret7
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_exists_cloref,
  ats2erlpre_intrange_exists_cloref(0, Arg0, Arg1).
%} // end-of-function


%%fun%%
ats2erlpre_int_forall_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret8
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_forall_cloref,
  ats2erlpre_intrange_forall_cloref(0, Arg0, Arg1).
%} // end-of-function


%%fun%%
ats2erlpre_int_foreach_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_foreach_cloref,
  ats2erlpre_intrange_foreach_cloref(0, Arg0, Arg1).
%} // end-of-function


%%fun%%
ats2erlpre_int_exists_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret10
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_exists_method,
  f_ats2erlpre_intrange_patsfun_7__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_7(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret11
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_7,
  ats2erlpre_int_exists_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_forall_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret12
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_forall_method,
  f_ats2erlpre_intrange_patsfun_9__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_9(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret13
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_9,
  ats2erlpre_int_forall_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_foreach_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret14
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_foreach_method,
  f_ats2erlpre_intrange_patsfun_11__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_11(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_11,
  ats2erlpre_int_foreach_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_foldleft_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret16
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_foldleft_cloref,
  ats2erlpre_intrange_foldleft_cloref(0, Arg0, Arg1, Arg2).
%} // end-of-function


%%fun%%
ats2erlpre_int_foldleft_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret17
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_foldleft_method,
  f_ats2erlpre_intrange_patsfun_14__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_14(Env0, Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret18
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_14,
  ats2erlpre_int_foldleft_cloref(Env0, Arg0, Arg1).
%} // end-of-function


%%fun%%
f_057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2erl_057_SATS_057_intrange_056_sats__int_list_map_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret19
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_list_map_cloref,
  f_ats2erlpre_intrange_aux_16(Arg0, Arg1, 0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_aux_16(Env0, Env1, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret20
%% var Tmp21
%% var Tmp22
%% var Tmp23
%% var Tmp24
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_aux_16,
  Tmp21 = ats2erlpre_lt_int1_int1(Arg0, Env0),
  if
    Tmp21 ->
      Tmp22 = ?ATSfunclo_clo(Env1)(Env1, Arg0),
      Tmp24 = ats2erlpre_add_int1_int1(Arg0, 1),
      Tmp23 = f_ats2erlpre_intrange_aux_16(Env0, Env1, Tmp24),
      {Tmp22, Tmp23};
    %% if-then
    true ->
      atscc2erl_nil
    %% if-else
  end.
%} // end-of-function


%%fun%%
f_057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2erl_057_SATS_057_intrange_056_sats__int_list_map_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret25
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_list_map_method,
  f_ats2erlpre_intrange_patsfun_18__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_18(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret26
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_18,
  f_057_home_057_hwxi_057_research_057_Postiats_055_contrib_057_git_057_contrib_057_libatscc_057_libatscc2erl_057_SATS_057_intrange_056_sats__int_list_map_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int2_exists_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret27
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int2_exists_cloref,
  ats2erlpre_intrange2_exists_cloref(0, Arg0, 0, Arg1, Arg2).
%} // end-of-function


%%fun%%
ats2erlpre_int2_forall_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret28
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int2_forall_cloref,
  ats2erlpre_intrange2_forall_cloref(0, Arg0, 0, Arg1, Arg2).
%} // end-of-function


%%fun%%
ats2erlpre_int2_foreach_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int2_foreach_cloref,
  ats2erlpre_intrange2_foreach_cloref(0, Arg0, 0, Arg1, Arg2).
%} // end-of-function


%%fun%%
ats2erlpre_intrange_exists_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret30
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_exists_cloref,
  f_ats2erlpre_intrange_loop_23(Arg0, Arg1, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_23(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret31
%% var Tmp32
%% var Tmp33
%% var Tmp34
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_23,
  Tmp32 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp32 ->
      Tmp33 = ?ATSfunclo_clo(Arg2)(Arg2, Arg0),
      if
        Tmp33 ->
          true;
        %% if-then
        true ->
          Tmp34 = ats2erlpre_add_int0_int0(Arg0, 1),
          f_ats2erlpre_intrange_loop_23(Tmp34, Arg1, Arg2)
        %% if-else
      end;
    %% if-then
    true ->
      false
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange_forall_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret35
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_forall_cloref,
  f_ats2erlpre_intrange_loop_25(Arg0, Arg1, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_25(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret36
%% var Tmp37
%% var Tmp38
%% var Tmp39
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_25,
  Tmp37 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp37 ->
      Tmp38 = ?ATSfunclo_clo(Arg2)(Arg2, Arg0),
      if
        Tmp38 ->
          Tmp39 = ats2erlpre_add_int0_int0(Arg0, 1),
          f_ats2erlpre_intrange_loop_25(Tmp39, Arg1, Arg2);
        %% if-then
        true ->
          false
        %% if-else
      end;
    %% if-then
    true ->
      true
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange_foreach_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_foreach_cloref,
  f_ats2erlpre_intrange_loop_27(Arg0, Arg1, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_27(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmp42
%% var Tmp44
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_27,
  Tmp42 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp42 ->
      ?ATSfunclo_clo(Arg2)(Arg2, Arg0),
      Tmp44 = ats2erlpre_add_int0_int0(Arg0, 1),
      f_ats2erlpre_intrange_loop_27(Tmp44, Arg1, Arg2);
    %% if-then
    true ->
      ?ATSINSmove_void()
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange_foldleft_cloref(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret45
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_foldleft_cloref,
  f_ats2erlpre_intrange_loop_29(Arg0, Arg1, Arg2, Arg3).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_29(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret46
%% var Tmp47
%% var Tmp48
%% var Tmp49
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_29,
  Tmp47 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp47 ->
      Tmp48 = ats2erlpre_add_int0_int0(Arg0, 1),
      Tmp49 = ?ATSfunclo_clo(Arg3)(Arg3, Arg2, Arg0),
      f_ats2erlpre_intrange_loop_29(Tmp48, Arg1, Tmp49, Arg3);
    %% if-then
    true ->
      Arg2
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange_foldleft_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmp50
%% var Tmp51
%% var Tmpret52
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_foldleft_method,
  Tmp50 = ?ATSSELboxrec(Arg0, 0),
  Tmp51 = ?ATSSELboxrec(Arg0, 1),
  f_ats2erlpre_intrange_patsfun_31__closurerize(Tmp50, Tmp51).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_31(Env0, Env1, Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret53
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_31,
  ats2erlpre_intrange_foldleft_cloref(Env0, Env1, Arg0, Arg1).
%} // end-of-function


%%fun%%
ats2erlpre_intrange2_exists_cloref(Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret54
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange2_exists_cloref,
  f_ats2erlpre_intrange_loop1_33(Arg2, Arg3, Arg0, Arg1, Arg4).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop1_33(Env0, Env1, Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 2
%% var Apy0
%% var Apy1
%% var Apy2
%% var Tmpret55
%% var Tmp56
%% var A2rg0
%% var A2rg1
%% var A2rg2
%% var A2rg3
%% var A2rg4
%% var A2py0
%% var A2py1
%% var A2py2
%% var A2py3
%% var A2py4
%% var Tmpret57
%% var Tmp58
%% var Tmp59
%% var Tmp60
%% var Tmp61
%% var Funlab_erl
%% var Tmplab, Tmplab_erl
%%
  %% Funlab_erl = 1;
  %while(true) {
    %switch(Funlab_erl) {
      %case 1: {
        %% Funlab_erl = 0;
        Tmp56 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
        if
          Tmp56 ->
            f_ats2erlpre_intrange_loop2_34(Env0, Env1, Arg0, Arg1, Env0, Env1, Arg2);
          %% if-then
          true ->
            false
          %% if-else
        end;
        %% if (Funlab_erl > 0) continue; else %% return Tmpret55;
      %} // end-of-case
      %case 2: {
        %% Funlab_erl = 0;
        Tmp58 = ats2erlpre_lt_int0_int0(A2rg2, A2rg3),
        if
          Tmp58 ->
            Tmp59 = ?ATSfunclo_clo(A2rg4)(A2rg4, A2rg0, A2rg2),
            if
              Tmp59 ->
                true;
              %% if-then
              true ->
                Tmp60 = ats2erlpre_add_int0_int0(A2rg2, 1),
                f_ats2erlpre_intrange_loop2_34(Env0, Env1, A2rg0, A2rg1, Tmp60, A2rg3, A2rg4)
              %% if-else
            end;
          %% if-then
          true ->
            Tmp61 = ats2erlpre_add_int0_int0(A2rg0, 1),
            f_ats2erlpre_intrange_loop1_33(Env0, Env1, Tmp61, A2rg1, A2rg4)
          %% if-else
        end;
        %% if (Funlab_erl > 0) continue; else %% return Tmpret57;
      %} // end-of-case
    %} // end-of-switch
  %} // endwhile-fun
%} // end-of-function


%%fun%%
ats2erlpre_intrange2_forall_cloref(Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret62
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange2_forall_cloref,
  f_ats2erlpre_intrange_loop1_36(Arg2, Arg3, Arg0, Arg1, Arg4).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop1_36(Env0, Env1, Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 2
%% var Apy0
%% var Apy1
%% var Apy2
%% var Tmpret63
%% var Tmp64
%% var A2rg0
%% var A2rg1
%% var A2rg2
%% var A2rg3
%% var A2rg4
%% var A2py0
%% var A2py1
%% var A2py2
%% var A2py3
%% var A2py4
%% var Tmpret65
%% var Tmp66
%% var Tmp67
%% var Tmp68
%% var Tmp69
%% var Funlab_erl
%% var Tmplab, Tmplab_erl
%%
  %% Funlab_erl = 1;
  %while(true) {
    %switch(Funlab_erl) {
      %case 1: {
        %% Funlab_erl = 0;
        Tmp64 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
        if
          Tmp64 ->
            f_ats2erlpre_intrange_loop2_37(Env0, Env1, Arg0, Arg1, Env0, Env1, Arg2);
          %% if-then
          true ->
            true
          %% if-else
        end;
        %% if (Funlab_erl > 0) continue; else %% return Tmpret63;
      %} // end-of-case
      %case 2: {
        %% Funlab_erl = 0;
        Tmp66 = ats2erlpre_lt_int0_int0(A2rg2, A2rg3),
        if
          Tmp66 ->
            Tmp67 = ?ATSfunclo_clo(A2rg4)(A2rg4, A2rg0, A2rg2),
            if
              Tmp67 ->
                Tmp68 = ats2erlpre_add_int0_int0(A2rg2, 1),
                f_ats2erlpre_intrange_loop2_37(Env0, Env1, A2rg0, A2rg1, Tmp68, A2rg3, A2rg4);
              %% if-then
              true ->
                false
              %% if-else
            end;
          %% if-then
          true ->
            Tmp69 = ats2erlpre_add_int0_int0(A2rg0, 1),
            f_ats2erlpre_intrange_loop1_36(Env0, Env1, Tmp69, A2rg1, A2rg4)
          %% if-else
        end;
        %% if (Funlab_erl > 0) continue; else %% return Tmpret65;
      %} // end-of-case
    %} // end-of-switch
  %} // endwhile-fun
%} // end-of-function


%%fun%%
ats2erlpre_intrange2_foreach_cloref(Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange2_foreach_cloref,
  f_ats2erlpre_intrange_loop1_39(Arg2, Arg3, Arg0, Arg1, Arg4).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop1_39(Env0, Env1, Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 2
%% var Apy0
%% var Apy1
%% var Apy2
%% var Tmp72
%% var A2rg0
%% var A2rg1
%% var A2rg2
%% var A2rg3
%% var A2rg4
%% var A2py0
%% var A2py1
%% var A2py2
%% var A2py3
%% var A2py4
%% var Tmp74
%% var Tmp76
%% var Tmp77
%% var Funlab_erl
%% var Tmplab, Tmplab_erl
%%
  %% Funlab_erl = 1;
  %while(true) {
    %switch(Funlab_erl) {
      %case 1: {
        %% Funlab_erl = 0;
        Tmp72 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
        if
          Tmp72 ->
            f_ats2erlpre_intrange_loop2_40(Env0, Env1, Arg0, Arg1, Env0, Env1, Arg2);
          %% if-then
          true ->
            ?ATSINSmove_void()
          %% if-else
        end;
        %% if (Funlab_erl > 0) continue; else %% return/*_void*/;
      %} // end-of-case
      %case 2: {
        %% Funlab_erl = 0;
        Tmp74 = ats2erlpre_lt_int0_int0(A2rg2, A2rg3),
        if
          Tmp74 ->
            ?ATSfunclo_clo(A2rg4)(A2rg4, A2rg0, A2rg2),
            Tmp76 = ats2erlpre_add_int0_int0(A2rg2, 1),
            f_ats2erlpre_intrange_loop2_40(Env0, Env1, A2rg0, A2rg1, Tmp76, A2rg3, A2rg4);
          %% if-then
          true ->
            Tmp77 = ats2erlpre_add_int0_int0(A2rg0, 1),
            f_ats2erlpre_intrange_loop1_39(Env0, Env1, Tmp77, A2rg1, A2rg4)
          %% if-else
        end;
        %% if (Funlab_erl > 0) continue; else %% return/*_void*/;
      %} // end-of-case
    %} // end-of-switch
  %} // endwhile-fun
%} // end-of-function

%%%%%%
%%
%% end-of-compilation-unit
%%
%%%%%%

%% ****** ****** %%

%% end of [libatscc2erl_all.hrl] %%
