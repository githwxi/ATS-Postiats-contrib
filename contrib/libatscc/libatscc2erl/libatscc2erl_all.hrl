-en
-en %%
-en \n%% 
-en Time of Generation:
-en \n%% 
Sun Dec 25 17:43:01 EST 2016
-en %%\n\n
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
-define(ATSCKpat_bool(X, B), X =:= B).

%% ****** ****** %%

-define(ATSCKpat_string(X, S), X =:= S).

%% ****** ****** %%

-define(ATSCKpat_con0(X, TAG), X =:= TAG).
-define(ATSCKpat_con1(X, TAG), (is_tuple(X) andalso (element(1, X) =:= TAG))).

%% ****** ****** %%

-define(ATSCKptrisnull(X), X =:= atscc2erl_null).
-define(ATSCKptriscons(X), X =/= atscc2erl_null).

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

-define(ATSINScaseof_fail(ERRMSG), exit({'atscc2erl_caseof_fail', ERRMSG})).

%% ****** ****** %%

%%fun%%
ats2erlpre_string2atom(S) -> list_to_atom(S).
%%fun%%
ats2erlpre_atom2string(S) -> atom_to_list(S).

%% ****** ****** %%
%%
%%fun%%
atspre_lazy2cloref(Arg) -> exit('atspre_lazy2cloref').
%%
%% ****** ****** %%

%%
%% HX-2015-10-25:
%% Commenting out
%% implementation in basics.dats
%%
ats2erlpre_cloref0_app
  (F) -> ?ATSfunclo_clo(F)(F).
ats2erlpre_cloref1_app
  (F, X1) -> ?ATSfunclo_clo(F)(F, X1).
ats2erlpre_cloref2_app
  (F, X1, X2) -> ?ATSfunclo_clo(F)(F, X1, X2).
ats2erlpre_cloref3_app
  (F, X1, X2, X3) -> ?ATSfunclo_clo(F)(F, X1, X2, X3).
%%

%% ****** ****** %%
%%
ats2erlpre_cloref2fun0(F) ->
  fun() -> ats2erlpre_cloref0_app(F) end.
ats2erlpre_cloref2fun1(F) ->
  fun(X1) -> ats2erlpre_cloref1_app(F, X1) end.
ats2erlpre_cloref2fun2(F) ->
  fun(X1, X2) -> ats2erlpre_cloref2_app(F, X1, X2) end.
ats2erlpre_cloref2fun3(F) ->
  fun(X1, X2, X3) -> ats2erlpre_cloref3_app(F, X1, X2, X3) end.
%%
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
ats2erlpre_neg_bool0(X) -> not(X).
%%fun%%
ats2erlpre_neg_bool1(X) -> not(X).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_eq_bool0_bool0(X, Y) -> (X =:= Y).
%%fun%%
ats2erlpre_neq_bool0_bool0(X, Y) -> (X =/= Y).
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_eq_bool1_bool1(X, Y) -> (X =:= Y).
%%fun%%
ats2erlpre_neq_bool1_bool1(X, Y) -> (X =/= Y).
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
ats2erlpre_print_ERLval(X) -> io:format("~p", [X]).
%%
%%fun%%
ats2erlpre_print_newline() -> io:format("~n", []).
%%
%% ****** ****** %%

%% end of [print_cats.hrl] %%
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
  spawn(
    ?MODULE, ats2erlpre_ref_server_proc, [X]
  ). %% spawn
%%fun%%
ats2erlpre_ref_make_elt(X) ->
  spawn(
    ?MODULE, ats2erlpre_ref_server_proc, [X]
  ). %% spawn
%%
ats2erlpre_ref_server_proc(X) ->
  receive
    {Client, get_elt} ->
      Client ! {self(), X}, ats2erlpre_ref_server_proc(X);
    {Client, set_elt, Y} ->
      Client ! {self(), atscc2erl_void}, ats2erlpre_ref_server_proc(Y);
    {Client, exch_elt, Y} ->
      Client ! {self(), X}, ats2erlpre_ref_server_proc(Y);
    {Client, takeout} ->
      Client ! {self(), X}, ats2erlpre_ref_server_proc2()
  end.
ats2erlpre_ref_server_proc2() ->
  receive
    {Client, addback, X} -> 
      Client ! {self(), atscc2erl_void}, ats2erlpre_ref_server_proc(X)
  end.
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_ref_get_elt(Server) ->
  Server ! {self(), get_elt}, receive {Server, Res} -> Res end.
%%fun%%
ats2erlpre_ref_set_elt(Server, Y) ->
  Server ! {self(), set_elt, Y}, receive {Server, Res} -> Res end.
%%fun%%
ats2erlpre_ref_exch_elt(Server, Y) ->
  Server ! {self(), exch_elt, Y}, receive {Server, Res} -> Res end.
%%
%%fun%%
ats2erlpre_ref_takeout(Server) ->
  Server ! {self(), takeout}, receive {Server, Res} -> Res end.
ats2erlpre_ref_addback(Server, Y) ->
  Server ! {self(), addback, Y}, receive {Server, Res} -> Res end.
%%
%% ****** ****** %%
%%
%% HX: linear references
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_ref_vt(X) ->
  spawn(
    ?MODULE, ats2erlpre_ref_vt_server_proc, [X]
  ). %% spawn
%%fun%%
ats2erlpre_ref_vt_make_elt(X) ->
  spawn(
    ?MODULE, ats2erlpre_ref_vt_server_proc, [X]
  ). %% spawn
%%
ats2erlpre_ref_vt_server_proc(X) ->
  receive
    {Client, get_elt} ->
      Client ! {self(), X}, ats2erlpre_ref_vt_server_proc(X);
    {Client, set_elt, Y} ->
      Client ! {self(), atscc2erl_void}, ats2erlpre_ref_vt_server_proc(Y);
    {Client, exch_elt, Y} ->
      Client ! {self(), Y}, ats2erlpre_ref_vt_server_proc(Y);
    {Client, takeout} ->
      Client ! {self(), X}, ats2erlpre_ref_vt_server_proc2();
    {Client, getfree_elt} -> Client ! {self(), X} %% Server exits here
  end.
ats2erlpre_ref_vt_server_proc2() ->
  receive
    {Client, addback, X} -> 
      Client ! {self(), atscc2erl_void}, ats2erlpre_ref_vt_server_proc(X)
  end.
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlpre_ref_vt_get_elt(Server) ->
  Server ! {self(), get_elt}, receive {Server, Res} -> Res end.
%%fun%%
ats2erlpre_ref_vt_set_elt(Server, Y) ->
  Server ! {self(), set_elt, Y}, receive {Server, Res} -> Res end.
%%fun%%
ats2erlpre_ref_vt_exch_elt(Server, Y) ->
  Server ! {self(), exch_elt, Y}, receive {Server, Res} -> Res end.
%%
ats2erlpre_ref_vt_getfree_elt(Server) ->
  Server ! {self(), getfree_elt}, receive {Server, Res} -> Res end.
%%
%%fun%%
ats2erlpre_ref_vt_takeout(Server) ->
  Server ! {self(), takeout}, receive {Server, Res} -> Res end.
ats2erlpre_ref_vt_addback(Server, Y) ->
  Server ! {self(), addback, Y}, receive {Server, Res} -> Res end.
%%
%% ****** ****** %%

%% end of [reference_cats.hrl] %%
%%
%%%%%%
%
% HX-2015-09:
% for Erlang code
% translated from ATS
%
%%%%%%
%%

%%
%%%%%%
% beg of [file_cats.hrl]
%%%%%%
%%

%% ****** ****** %%
%%fun%%
ats2erlibc_filename_all2string
  (X) ->
  case X of
    _ when is_list(X) -> X;
    _ when is_binary(X) -> binary:bin_to_list(X)
  end.
%%
%% ****** ****** %%

%%fun%%
ats2erlibc_file_print_filename(X) -> io:format("~p", [X]).
%%fun%%
ats2erlibc_file_print_filename_all(X) -> io:format("~p", [X]).

%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2get_cwd_0_opt
  () ->
  case file:get_cwd() of
    {ok, Filename} ->
      ats2erlpre_option_some(Filename)
    ; %% Some(Filename)
    {error, _Reason_} ->
      ats2erlpre_option_none() %% None((*void*))
  end.
%%fun%%
ats2erlibc_file_ats2get_cwd_1_opt
  (Drive) ->
  case file:get_cwd(Drive) of
    {ok, Filename} ->
      ats2erlpre_option_some(Filename)
    ; %% Some(Filename)
    {error, _Reason_} ->
      ats2erlpre_option_none() %% None((*void*))
  end.
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2del_dir_opt
  (Dir) ->
  case
  file:del_dir(Dir)
  of %% of-case
    ok -> true; {error, _Reason_} -> false
  end. %% end-case
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2list_dir_opt
  (Dir) ->
  case
  file:list_dir(Dir)
  of %% case
    {ok, Filenames} ->
      ats2erlpre_option_some(Filenames)
    ; %% Some(Filename)
    {error, _Reason_} ->
      ats2erlpre_option_none() %% None((*void*))
  end.
%%
%%fun%%
ats2erlibc_file_ats2list_dir_all_opt
  (Dir) ->
  case
  file:list_dir_all(Dir)
  of %% case
    {ok, Filenames} ->
      ats2erlpre_option_some(Filenames)
    ; %% Some(Filename)
    {error, _Reason_} ->
      ats2erlpre_option_none() %% None((*void*))
  end.
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2make_dir_opt
  (Dir) ->
  case
  file:make_dir(Dir)
  of %% of-case
    ok -> true; {error, _Reason_} -> false
  end. %% end-case
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2make_link_opt
  (Existing, New) ->
  case
  file:make_link(Existing, New)
  of %% of-case
    ok -> true; {error, _Reason_} -> false
  end. %% end-case
%%
%%fun%%
ats2erlibc_file_ats2make_symlink_opt
  (Existing, New) ->
  case
  file:make_symlink(Existing, New)
  of %% of-case
    ok -> true; {error, _Reason_} -> false
  end. %% end-case
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2read_file_opt
  (Filename) ->
  case
  file:read_file(Filename)
  of %% case
    {ok, Binary} ->
      ats2erlpre_option_some(Binary)
    ; %% Some(Filename)
    {error, _Reason_} ->
      ats2erlpre_option_none() %% None((*void*))
  end.
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2rename_opt
  (Src, Dst) ->
  case
  file:rename(Src, Dst)
  of %% of-case
    ok -> true; {error, _Reason_} -> false
  end. %% end-case
%%
%% ****** ****** %%
%%
%%fun%%
ats2erlibc_file_ats2set_cwd_opt
  (Dir) ->
  case
  file:set_cwd(Dir)
  of %% of-case
    ok -> true; {error, _Reason_} -> false
  end. %% end-case
%%
%% ****** ****** %%

%% end of [file_cats.hrl] %%
%%%%%%
%%
%% The Erlang code is generated by atscc2erl
%% The starting compilation time is: 2016-12-25: 17h:43m
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
%% The starting compilation time is: 2016-12-25: 17h:43m
%%
%%%%%%

%%fun%%
f_ats2erlpre_list_patsfun_31__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_31(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_35__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_35(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_38__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_38(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_42__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_42(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_46__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_46(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_50__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_50(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_53__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_53(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_57__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_57(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_61__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_list_patsfun_61(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_65__closurerize(XEnv0, XEnv1) -> 
%{
  {fun({_, Cenv1, Cenv2}, XArg0) -> f_ats2erlpre_list_patsfun_65(Cenv1, Cenv2, XArg0) end, XEnv0, XEnv1}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_69__closurerize(XEnv0, XEnv1) -> 
%{
  {fun({_, Cenv1, Cenv2}, XArg0) -> f_ats2erlpre_list_patsfun_69(Cenv1, Cenv2, XArg0) end, XEnv0, XEnv1}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_73__closurerize(XEnv0, XEnv1) -> 
%{
  {fun({_, Cenv1, Cenv2}, XArg0) -> f_ats2erlpre_list_patsfun_73(Cenv1, Cenv2, XArg0) end, XEnv0, XEnv1}.
%}


%%fun%%
f_ats2erlpre_list_patsfun_77__closurerize(XEnv0, XEnv1) -> 
%{
  {fun({_, Cenv1, Cenv2}, XArg0) -> f_ats2erlpre_list_patsfun_77(Cenv1, Cenv2, XArg0) end, XEnv0, XEnv1}.
%}


%%fun%%
ats2erlpre_list_make_intrange_2(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret2
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
%% var Tmpret3
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
%% var Tmp33
%% var Tmp34
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
      Tmp14 = ats2erlpre_gt_int0_int0(Arg2, 0),
      if(not(?ATSCKpat_bool(Tmp14, true))) -> Casefun(Casefun, 2); true ->
        Tmp15 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
        if
          Tmp15 ->
            Tmp19 = ats2erlpre_sub_int0_int0(Arg1, Arg0),
            Tmp18 = ats2erlpre_add_int0_int0(Tmp19, Arg2),
            Tmp17 = ats2erlpre_sub_int0_int0(Tmp18, 1),
            Tmp16 = ats2erlpre_div_int0_int0(Tmp17, Arg2),
            Tmp22 = ats2erlpre_sub_int0_int0(Tmp16, 1),
            Tmp21 = ats2erlpre_mul_int0_int0(Tmp22, Arg2),
            Tmp20 = ats2erlpre_add_int0_int0(Arg0, Tmp21),
            Tmp23 = atscc2erl_null,
            f_ats2erlpre_list_loop1_4(Tmp16, Tmp20, Arg2, Tmp23);
          %% if-then
          true ->
            atscc2erl_null
          %% if-else
        end
      end;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      2 ->
      Tmp24 = ats2erlpre_lt_int0_int0(Arg2, 0),
      if(not(?ATSCKpat_bool(Tmp24, true))) -> Casefun(Casefun, 3); true ->
        Tmp25 = ats2erlpre_gt_int0_int0(Arg0, Arg1),
        if
          Tmp25 ->
            Tmp26 = ats2erlpre_neg_int0(Arg2),
            Tmp30 = ats2erlpre_sub_int0_int0(Arg0, Arg1),
            Tmp29 = ats2erlpre_add_int0_int0(Tmp30, Tmp26),
            Tmp28 = ats2erlpre_sub_int0_int0(Tmp29, 1),
            Tmp27 = ats2erlpre_div_int0_int0(Tmp28, Tmp26),
            Tmp33 = ats2erlpre_sub_int0_int0(Tmp27, 1),
            Tmp32 = ats2erlpre_mul_int0_int0(Tmp33, Tmp26),
            Tmp31 = ats2erlpre_sub_int0_int0(Arg0, Tmp32),
            Tmp34 = atscc2erl_null,
            f_ats2erlpre_list_loop2_5(Tmp27, Tmp31, Tmp26, Tmp34);
          %% if-then
          true ->
            atscc2erl_null
          %% if-else
        end
      end;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      atscc2erl_null;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop1_4(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret4
%% var Tmp5
%% var Tmp6
%% var Tmp7
%% var Tmp8
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop1_4,
  Tmp5 = ats2erlpre_gt_int0_int0(Arg0, 0),
  if
    Tmp5 ->
      Tmp6 = ats2erlpre_sub_int0_int0(Arg0, 1),
      Tmp7 = ats2erlpre_sub_int0_int0(Arg1, Arg2),
      Tmp8 = {Arg1, Arg3},
      f_ats2erlpre_list_loop1_4(Tmp6, Tmp7, Arg2, Tmp8);
    %% if-then
    true ->
      Arg3
    %% if-else
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop2_5(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret9
%% var Tmp10
%% var Tmp11
%% var Tmp12
%% var Tmp13
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop2_5,
  Tmp10 = ats2erlpre_gt_int0_int0(Arg0, 0),
  if
    Tmp10 ->
      Tmp11 = ats2erlpre_sub_int0_int0(Arg0, 1),
      Tmp12 = ats2erlpre_add_int0_int0(Arg1, Arg2),
      Tmp13 = {Arg1, Arg3},
      f_ats2erlpre_list_loop2_5(Tmp11, Tmp12, Arg2, Tmp13);
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
%% var Tmpret46
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_length,
  f_ats2erlpre_list_loop_12(Arg0, 0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_12(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret47
%% var Tmp49
%% var Tmp50
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_12,
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
      Tmp49 = ?ATSSELcon(Arg0, 1),
      Tmp50 = ats2erlpre_add_int1_int1(Arg1, 1),
      f_ats2erlpre_list_loop_12(Tmp49, Tmp50);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_last(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret51
%% var Tmp52
%% var Tmp53
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_last,
  Tmp52 = ?ATSSELcon(Arg0, 0),
  Tmp53 = ?ATSSELcon(Arg0, 1),
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Tmp53)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Tmp52;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      ats2erlpre_list_last(Tmp53);
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
%% var Tmpret54
%% var Tmp55
%% var Tmp56
%% var Tmp57
%% var Tmp58
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_get_at,
  Tmp55 = ats2erlpre_eq_int1_int1(Arg1, 0),
  if
    Tmp55 ->
      Tmp56 = ?ATSSELcon(Arg0, 0),
      Tmp56;
    %% if-then
    true ->
      Tmp57 = ?ATSSELcon(Arg0, 1),
      Tmp58 = ats2erlpre_sub_int1_int1(Arg1, 1),
      ats2erlpre_list_get_at(Tmp57, Tmp58)
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_snoc(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret59
%% var Tmp60
%% var Tmp61
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_snoc,
  Tmp61 = atscc2erl_null,
  Tmp60 = {Arg1, Tmp61},
  ats2erlpre_list_append(Arg0, Tmp60).
%} // end-of-function


%%fun%%
ats2erlpre_list_extend(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret62
%% var Tmp63
%% var Tmp64
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_extend,
  Tmp64 = atscc2erl_null,
  Tmp63 = {Arg1, Tmp64},
  ats2erlpre_list_append(Arg0, Tmp63).
%} // end-of-function


%%fun%%
ats2erlpre_list_append(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret65
%% var Tmp66
%% var Tmp67
%% var Tmp68
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
      Tmp66 = ?ATSSELcon(Arg0, 0),
      Tmp67 = ?ATSSELcon(Arg0, 1),
      Tmp68 = ats2erlpre_list_append(Tmp67, Arg1),
      {Tmp66, Tmp68};
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
%% var Tmpret69
%% var Tmp70
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_reverse,
  Tmp70 = atscc2erl_null,
  ats2erlpre_list_reverse_append(Arg0, Tmp70).
%} // end-of-function


%%fun%%
ats2erlpre_list_reverse_append(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret71
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_reverse_append,
  f_ats2erlpre_list_loop_20(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_20(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret72
%% var Tmp73
%% var Tmp74
%% var Tmp75
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_20,
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
      Tmp73 = ?ATSSELcon(Arg0, 0),
      Tmp74 = ?ATSSELcon(Arg0, 1),
      Tmp75 = {Tmp73, Arg1},
      f_ats2erlpre_list_loop_20(Tmp74, Tmp75);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_concat(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret76
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_concat,
  f_ats2erlpre_list_auxlst_22(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_auxlst_22(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret77
%% var Tmp78
%% var Tmp79
%% var Tmp80
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_auxlst_22,
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
      atscc2erl_null;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp78 = ?ATSSELcon(Arg0, 0),
      Tmp79 = ?ATSSELcon(Arg0, 1),
      Tmp80 = f_ats2erlpre_list_auxlst_22(Tmp79),
      ats2erlpre_list_append(Tmp78, Tmp80);
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
%% var Tmpret81
%% var Tmp82
%% var Tmp83
%% var Tmp84
%% var Tmp85
%% var Tmp86
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_take,
  Tmp82 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp82 ->
      Tmp83 = ?ATSSELcon(Arg0, 0),
      Tmp84 = ?ATSSELcon(Arg0, 1),
      Tmp86 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp85 = ats2erlpre_list_take(Tmp84, Tmp86),
      {Tmp83, Tmp85};
    %% if-then
    true ->
      atscc2erl_null
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_drop(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret87
%% var Tmp88
%% var Tmp89
%% var Tmp90
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_drop,
  Tmp88 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp88 ->
      Tmp89 = ?ATSSELcon(Arg0, 1),
      Tmp90 = ats2erlpre_sub_int1_int1(Arg1, 1),
      ats2erlpre_list_drop(Tmp89, Tmp90);
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
%% var Tmpret91
%% var Tmp92
%% var Tmp93
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_split_at,
  Tmp92 = ats2erlpre_list_take(Arg0, Arg1),
  Tmp93 = ats2erlpre_list_drop(Arg0, Arg1),
  {Tmp92, Tmp93}.
%} // end-of-function


%%fun%%
ats2erlpre_list_insert_at(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret94
%% var Tmp95
%% var Tmp96
%% var Tmp97
%% var Tmp98
%% var Tmp99
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_insert_at,
  Tmp95 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp95 ->
      Tmp96 = ?ATSSELcon(Arg0, 0),
      Tmp97 = ?ATSSELcon(Arg0, 1),
      Tmp99 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp98 = ats2erlpre_list_insert_at(Tmp97, Tmp99, Arg2),
      {Tmp96, Tmp98};
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
%% var Tmpret100
%% var Tmp101
%% var Tmp102
%% var Tmp103
%% var Tmp104
%% var Tmp105
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_remove_at,
  Tmp101 = ?ATSSELcon(Arg0, 0),
  Tmp102 = ?ATSSELcon(Arg0, 1),
  Tmp103 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp103 ->
      Tmp105 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp104 = ats2erlpre_list_remove_at(Tmp102, Tmp105),
      {Tmp101, Tmp104};
    %% if-then
    true ->
      Tmp102
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_takeout_at(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret106
%% var Tmp107
%% var Tmp108
%% var Tmp109
%% var Tmp110
%% var Tmp111
%% var Tmp112
%% var Tmp113
%% var Tmp114
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_takeout_at,
  Tmp107 = ?ATSSELcon(Arg0, 0),
  Tmp108 = ?ATSSELcon(Arg0, 1),
  Tmp109 = ats2erlpre_gt_int1_int1(Arg1, 0),
  if
    Tmp109 ->
      Tmp111 = ats2erlpre_sub_int1_int1(Arg1, 1),
      Tmp110 = ats2erlpre_list_takeout_at(Tmp108, Tmp111),
      Tmp112 = ?ATSSELboxrec(Tmp110, 0),
      Tmp113 = ?ATSSELboxrec(Tmp110, 1),
      Tmp114 = {Tmp107, Tmp113},
      {Tmp112, Tmp114};
    %% if-then
    true ->
      {Tmp107, Tmp108}
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_exists(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret115
%% var Tmp116
%% var Tmp117
%% var Tmp118
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_exists,
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
      false;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp116 = ?ATSSELcon(Arg0, 0),
      Tmp117 = ?ATSSELcon(Arg0, 1),
      Tmp118 = ?ATSfunclo_clo(Arg1)(Arg1, Tmp116),
      if
        Tmp118 ->
          true;
        %% if-then
        true ->
          ats2erlpre_list_exists(Tmp117, Arg1)
        %% if-else
      end;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_exists_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret119
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_exists_method,
  f_ats2erlpre_list_patsfun_31__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_31(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret120
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_31,
  ats2erlpre_list_exists(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_iexists(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret121
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_iexists,
  f_ats2erlpre_list_loop_33(Arg1, 0, Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_33(Env0, Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret122
%% var Tmp123
%% var Tmp124
%% var Tmp125
%% var Tmp126
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_33,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg1)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      false;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp123 = ?ATSSELcon(Arg1, 0),
      Tmp124 = ?ATSSELcon(Arg1, 1),
      Tmp125 = ?ATSfunclo_clo(Env0)(Env0, Arg0, Tmp123),
      if
        Tmp125 ->
          true;
        %% if-then
        true ->
          Tmp126 = ats2erlpre_add_int1_int1(Arg0, 1),
          f_ats2erlpre_list_loop_33(Env0, Tmp126, Tmp124)
        %% if-else
      end;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_iexists_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret127
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_iexists_method,
  f_ats2erlpre_list_patsfun_35__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_35(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret128
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_35,
  ats2erlpre_list_iexists(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_forall(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret129
%% var Tmp130
%% var Tmp131
%% var Tmp132
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_forall,
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
      true;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp130 = ?ATSSELcon(Arg0, 0),
      Tmp131 = ?ATSSELcon(Arg0, 1),
      Tmp132 = ?ATSfunclo_clo(Arg1)(Arg1, Tmp130),
      if
        Tmp132 ->
          ats2erlpre_list_forall(Tmp131, Arg1);
        %% if-then
        true ->
          false
        %% if-else
      end;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_forall_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret133
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_forall_method,
  f_ats2erlpre_list_patsfun_38__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_38(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret134
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_38,
  ats2erlpre_list_forall(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_iforall(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret135
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_iforall,
  f_ats2erlpre_list_loop_40(Arg1, 0, Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_40(Env0, Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret136
%% var Tmp137
%% var Tmp138
%% var Tmp139
%% var Tmp140
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_40,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg1)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      true;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp137 = ?ATSSELcon(Arg1, 0),
      Tmp138 = ?ATSSELcon(Arg1, 1),
      Tmp139 = ?ATSfunclo_clo(Env0)(Env0, Arg0, Tmp137),
      if
        Tmp139 ->
          Tmp140 = ats2erlpre_add_int1_int1(Arg0, 1),
          f_ats2erlpre_list_loop_40(Env0, Tmp140, Tmp138);
        %% if-then
        true ->
          false
        %% if-else
      end;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_iforall_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret141
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_iforall_method,
  f_ats2erlpre_list_patsfun_42__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_42(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret142
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_42,
  ats2erlpre_list_iforall(Env0, Arg0).
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
%% var Tmp145
%% var Tmp146
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
      Tmp145 = ?ATSSELcon(Arg0, 0),
      Tmp146 = ?ATSSELcon(Arg0, 1),
      ?ATSfunclo_clo(Arg1)(Arg1, Tmp145),
      ats2erlpre_list_foreach(Tmp146, Arg1);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_foreach_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret148
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_foreach_method,
  f_ats2erlpre_list_patsfun_46__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_46(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_46,
  ats2erlpre_list_foreach(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_iforeach(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_iforeach,
  f_ats2erlpre_list_aux_48(Arg1, 0, Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_aux_48(Env0, Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmp152
%% var Tmp153
%% var Tmp155
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_aux_48,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg1)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      ?ATSINSmove_void();
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp152 = ?ATSSELcon(Arg1, 0),
      Tmp153 = ?ATSSELcon(Arg1, 1),
      ?ATSfunclo_clo(Env0)(Env0, Arg0, Tmp152),
      Tmp155 = ats2erlpre_add_int1_int1(Arg0, 1),
      f_ats2erlpre_list_aux_48(Env0, Tmp155, Tmp153);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_iforeach_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret156
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_iforeach_method,
  f_ats2erlpre_list_patsfun_50__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_50(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_50,
  ats2erlpre_list_iforeach(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_rforeach(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmp159
%% var Tmp160
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_rforeach,
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
      Tmp159 = ?ATSSELcon(Arg0, 0),
      Tmp160 = ?ATSSELcon(Arg0, 1),
      ats2erlpre_list_rforeach(Tmp160, Arg1),
      ?ATSfunclo_clo(Arg1)(Arg1, Tmp159);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_rforeach_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret162
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_rforeach_method,
  f_ats2erlpre_list_patsfun_53__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_53(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_53,
  ats2erlpre_list_rforeach(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_filter(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret164
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_filter,
  f_ats2erlpre_list_aux_55(Arg1, Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_aux_55(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret165
%% var Tmp166
%% var Tmp167
%% var Tmp168
%% var Tmp169
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_aux_55,
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
      atscc2erl_null;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp166 = ?ATSSELcon(Arg0, 0),
      Tmp167 = ?ATSSELcon(Arg0, 1),
      Tmp168 = ?ATSfunclo_clo(Env0)(Env0, Tmp166),
      if
        Tmp168 ->
          Tmp169 = f_ats2erlpre_list_aux_55(Env0, Tmp167),
          {Tmp166, Tmp169};
        %% if-then
        true ->
          f_ats2erlpre_list_aux_55(Env0, Tmp167)
        %% if-else
      end;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_filter_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret170
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_filter_method,
  f_ats2erlpre_list_patsfun_57__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_57(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret171
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_57,
  ats2erlpre_list_filter(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_map(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret172
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_map,
  f_ats2erlpre_list_aux_59(Arg1, Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_aux_59(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret173
%% var Tmp174
%% var Tmp175
%% var Tmp176
%% var Tmp177
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_aux_59,
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
      atscc2erl_null;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp174 = ?ATSSELcon(Arg0, 0),
      Tmp175 = ?ATSSELcon(Arg0, 1),
      Tmp176 = ?ATSfunclo_clo(Env0)(Env0, Tmp174),
      Tmp177 = f_ats2erlpre_list_aux_59(Env0, Tmp175),
      {Tmp176, Tmp177};
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_map_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret178
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_map_method,
  f_ats2erlpre_list_patsfun_61__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_61(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret179
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_61,
  ats2erlpre_list_map(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_foldleft(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret180
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_foldleft,
  f_ats2erlpre_list_loop_63(Arg2, Arg1, Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_63(Env0, Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret181
%% var Tmp182
%% var Tmp183
%% var Tmp184
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_63,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg1)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg0;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp182 = ?ATSSELcon(Arg1, 0),
      Tmp183 = ?ATSSELcon(Arg1, 1),
      Tmp184 = ?ATSfunclo_clo(Env0)(Env0, Arg0, Tmp182),
      f_ats2erlpre_list_loop_63(Env0, Tmp184, Tmp183);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_foldleft_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret185
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_foldleft_method,
  f_ats2erlpre_list_patsfun_65__closurerize(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_65(Env0, Env1, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret186
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_65,
  ats2erlpre_list_foldleft(Env0, Env1, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_ifoldleft(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret187
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_ifoldleft,
  f_ats2erlpre_list_loop_67(Arg2, 0, Arg1, Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_loop_67(Env0, Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret188
%% var Tmp189
%% var Tmp190
%% var Tmp191
%% var Tmp192
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_loop_67,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg2)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg1;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp189 = ?ATSSELcon(Arg2, 0),
      Tmp190 = ?ATSSELcon(Arg2, 1),
      Tmp191 = ats2erlpre_add_int1_int1(Arg0, 1),
      Tmp192 = ?ATSfunclo_clo(Env0)(Env0, Arg0, Arg1, Tmp189),
      f_ats2erlpre_list_loop_67(Env0, Tmp191, Tmp192, Tmp190);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_ifoldleft_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret193
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_ifoldleft_method,
  f_ats2erlpre_list_patsfun_69__closurerize(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_69(Env0, Env1, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret194
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_69,
  ats2erlpre_list_ifoldleft(Env0, Env1, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_list_foldright(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret195
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_foldright,
  f_ats2erlpre_list_aux_71(Arg1, Arg0, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_aux_71(Env0, Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret196
%% var Tmp197
%% var Tmp198
%% var Tmp199
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_aux_71,
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
      Tmp197 = ?ATSSELcon(Arg0, 0),
      Tmp198 = ?ATSSELcon(Arg0, 1),
      Tmp199 = f_ats2erlpre_list_aux_71(Env0, Tmp198, Arg1),
      ?ATSfunclo_clo(Env0)(Env0, Tmp197, Tmp199);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_foldright_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret200
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_foldright_method,
  f_ats2erlpre_list_patsfun_73__closurerize(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_73(Env0, Env1, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret201
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_73,
  ats2erlpre_list_foldright(Env0, Arg0, Env1).
%} // end-of-function


%%fun%%
ats2erlpre_list_ifoldright(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret202
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_ifoldright,
  f_ats2erlpre_list_aux_75(Arg1, 0, Arg0, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_aux_75(Env0, Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret203
%% var Tmp204
%% var Tmp205
%% var Tmp206
%% var Tmp207
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_aux_75,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptriscons(Arg1)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      Arg2;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      Tmp204 = ?ATSSELcon(Arg1, 0),
      Tmp205 = ?ATSSELcon(Arg1, 1),
      Tmp207 = ats2erlpre_add_int1_int1(Arg0, 1),
      Tmp206 = f_ats2erlpre_list_aux_75(Env0, Tmp207, Tmp205, Arg2),
      ?ATSfunclo_clo(Env0)(Env0, Arg0, Tmp204, Tmp206);
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_list_ifoldright_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret208
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_list_ifoldright_method,
  f_ats2erlpre_list_patsfun_77__closurerize(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_list_patsfun_77(Env0, Env1, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret209
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_list_patsfun_77,
  ats2erlpre_list_ifoldright(Env0, Arg0, Env1).
%} // end-of-function

%%%%%%
%%
%% end-of-compilation-unit
%%
%%%%%%
%%%%%%
%%
%% The Erlang code is generated by atscc2erl
%% The starting compilation time is: 2016-12-25: 17h:43m
%%
%%%%%%

%%fun%%
ats2erlpre_option_some(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_option_some,
  {Arg0}.
%} // end-of-function


%%fun%%
ats2erlpre_option_none() ->
%{
%%
%% knd = 0
%% var Tmpret1
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_option_none,
  atscc2erl_null.
%} // end-of-function


%%fun%%
ats2erlpre_option_unsome(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret2
%% var Tmp3
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_option_unsome,
  Tmp3 = ?ATSSELcon(Arg0, 0),
  Tmp3.
%} // end-of-function


%%fun%%
ats2erlpre_option_is_some(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret4
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_option_is_some,
  begin
  Casefunx1 =
  fun (Casefun, Tmplab) ->
    %switch(Tmplab) {
    case Tmplab of
      %% ATSbranchseq_beg
      1 ->
      if(?ATSCKptrisnull(Arg0)) -> Casefun(Casefun, 4); true ->
        Casefun(Casefun, 2)
      end;
      2 ->
      true;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      false;
      %% ATSbranchseq_end
      _ -> atscc2erl_caseof_deadcode(?FILE, ?LINE)
    end %% endcase
    %} // end-of-switch
  end, %% endfun
  Casefunx1(Casefunx1, 1)
  end.
%} // end-of-function


%%fun%%
ats2erlpre_option_is_none(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret5
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_option_is_none,
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
      true;
      %% ATSbranchseq_end
      %% ATSbranchseq_beg
      3 ->
      Casefun(Casefun, 4);
      4 ->
      false;
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
%% The starting compilation time is: 2016-12-25: 17h:43m
%%
%%%%%%

%%fun%%
f_ats2erlpre_intrange_patsfun_4__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_4(Cenv1, XArg0) end, XEnv0}.
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
f_ats2erlpre_intrange_patsfun_13__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_13(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_16__closurerize(XEnv0, XEnv1) -> 
%{
  {fun({_, Cenv1, Cenv2}, XArg0) -> f_ats2erlpre_intrange_patsfun_16(Cenv1, Cenv2, XArg0) end, XEnv0, XEnv1}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_20__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_20(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_23__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_23(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_30__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_30(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_34__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_34(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_38__closurerize(XEnv0) -> 
%{
  {fun({_, Cenv1}, XArg0) -> f_ats2erlpre_intrange_patsfun_38(Cenv1, XArg0) end, XEnv0}.
%}


%%fun%%
f_ats2erlpre_intrange_patsfun_42__closurerize(XEnv0, XEnv1, XEnv2) -> 
%{
  {fun({_, Cenv1, Cenv2, Cenv3}, XArg0) -> f_ats2erlpre_intrange_patsfun_42(Cenv1, Cenv2, Cenv3, XArg0) end, XEnv0, XEnv1, XEnv2}.
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
ats2erlpre_int_repeat_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret7
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_repeat_method,
  f_ats2erlpre_intrange_patsfun_4__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_4(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_4,
  ats2erlpre_int_repeat_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_exists_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret9
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
%% var Tmpret10
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
%% var Tmpret12
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_exists_method,
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
  ats2erlpre_int_exists_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_forall_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret14
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_forall_method,
  f_ats2erlpre_intrange_patsfun_11__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_11(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret15
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_11,
  ats2erlpre_int_forall_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_foreach_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret16
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_foreach_method,
  f_ats2erlpre_intrange_patsfun_13__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_13(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_13,
  ats2erlpre_int_foreach_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_foldleft_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret18
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
%% var Tmpret19
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_foldleft_method,
  f_ats2erlpre_intrange_patsfun_16__closurerize(Arg0, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_16(Env0, Env1, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret20
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_16,
  ats2erlpre_int_foldleft_cloref(Env0, Env1, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_list_map_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret21
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_list_map_cloref,
  f_ats2erlpre_intrange_aux_18(Arg0, Arg1, 0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_aux_18(Env0, Env1, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret22
%% var Tmp23
%% var Tmp24
%% var Tmp25
%% var Tmp26
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_aux_18,
  Tmp23 = ats2erlpre_lt_int1_int1(Arg0, Env0),
  if
    Tmp23 ->
      Tmp24 = ?ATSfunclo_clo(Env1)(Env1, Arg0),
      Tmp26 = ats2erlpre_add_int1_int1(Arg0, 1),
      Tmp25 = f_ats2erlpre_intrange_aux_18(Env0, Env1, Tmp26),
      {Tmp24, Tmp25};
    %% if-then
    true ->
      atscc2erl_null
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_int_list_map_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret27
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_list_map_method,
  f_ats2erlpre_intrange_patsfun_20__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_20(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret28
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_20,
  ats2erlpre_int_list_map_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int_list0_map_cloref(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret29
%% var Tmp30
%% var Tmp31
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_list0_map_cloref,
  Tmp30 = ats2erlpre_gte_int1_int1(Arg0, 0),
  if
    Tmp30 ->
      Tmp31 = ats2erlpre_int_list_map_cloref(Arg0, Arg1),
      Tmp31;
    %% if-then
    true ->
      atscc2erl_null
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_int_list0_map_method(Arg0, Arg1) ->
%{
%%
%% knd = 0
%% var Tmpret32
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_int_list0_map_method,
  f_ats2erlpre_intrange_patsfun_23__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_23(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret33
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_23,
  ats2erlpre_int_list0_map_cloref(Env0, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_int2_exists_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret34
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
%% var Tmpret35
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
%% var Tmpret37
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_exists_cloref,
  f_ats2erlpre_intrange_loop_28(Arg0, Arg1, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_28(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret38
%% var Tmp39
%% var Tmp40
%% var Tmp41
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_28,
  Tmp39 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp39 ->
      Tmp40 = ?ATSfunclo_clo(Arg2)(Arg2, Arg0),
      if
        Tmp40 ->
          true;
        %% if-then
        true ->
          Tmp41 = ats2erlpre_add_int0_int0(Arg0, 1),
          f_ats2erlpre_intrange_loop_28(Tmp41, Arg1, Arg2)
        %% if-else
      end;
    %% if-then
    true ->
      false
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange_exists_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret42
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_exists_method,
  f_ats2erlpre_intrange_patsfun_30__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_30(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret43
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_30,
  ats2erlpre_intrange_exists_cloref(?ATSSELboxrec(Env0, 0), ?ATSSELboxrec(Env0, 1), Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_intrange_forall_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret44
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_forall_cloref,
  f_ats2erlpre_intrange_loop_32(Arg0, Arg1, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_32(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmpret45
%% var Tmp46
%% var Tmp47
%% var Tmp48
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_32,
  Tmp46 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp46 ->
      Tmp47 = ?ATSfunclo_clo(Arg2)(Arg2, Arg0),
      if
        Tmp47 ->
          Tmp48 = ats2erlpre_add_int0_int0(Arg0, 1),
          f_ats2erlpre_intrange_loop_32(Tmp48, Arg1, Arg2);
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
ats2erlpre_intrange_forall_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret49
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_forall_method,
  f_ats2erlpre_intrange_patsfun_34__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_34(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret50
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_34,
  ats2erlpre_intrange_forall_cloref(?ATSSELboxrec(Env0, 0), ?ATSSELboxrec(Env0, 1), Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_intrange_foreach_cloref(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_foreach_cloref,
  f_ats2erlpre_intrange_loop_36(Arg0, Arg1, Arg2).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_36(Arg0, Arg1, Arg2) ->
%{
%%
%% knd = 0
%% var Tmp53
%% var Tmp55
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_36,
  Tmp53 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp53 ->
      ?ATSfunclo_clo(Arg2)(Arg2, Arg0),
      Tmp55 = ats2erlpre_add_int0_int0(Arg0, 1),
      f_ats2erlpre_intrange_loop_36(Tmp55, Arg1, Arg2);
    %% if-then
    true ->
      ?ATSINSmove_void()
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange_foreach_method(Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret56
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_foreach_method,
  f_ats2erlpre_intrange_patsfun_38__closurerize(Arg0).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_38(Env0, Arg0) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_38,
  ats2erlpre_intrange_foreach_cloref(?ATSSELboxrec(Env0, 0), ?ATSSELboxrec(Env0, 1), Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_intrange_foldleft_cloref(Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret58
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_foldleft_cloref,
  f_ats2erlpre_intrange_loop_40(Arg3, Arg0, Arg1, Arg2, Arg3).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop_40(Env0, Arg0, Arg1, Arg2, Arg3) ->
%{
%%
%% knd = 0
%% var Tmpret59
%% var Tmp60
%% var Tmp61
%% var Tmp62
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop_40,
  Tmp60 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp60 ->
      Tmp61 = ats2erlpre_add_int0_int0(Arg0, 1),
      Tmp62 = ?ATSfunclo_clo(Arg3)(Arg3, Arg2, Arg0),
      f_ats2erlpre_intrange_loop_40(Env0, Tmp61, Arg1, Tmp62, Env0);
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
%% var Tmp63
%% var Tmp64
%% var Tmpret65
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange_foldleft_method,
  Tmp63 = ?ATSSELboxrec(Arg0, 0),
  Tmp64 = ?ATSSELboxrec(Arg0, 1),
  f_ats2erlpre_intrange_patsfun_42__closurerize(Tmp63, Tmp64, Arg1).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_patsfun_42(Env0, Env1, Env2, Arg0) ->
%{
%%
%% knd = 0
%% var Tmpret66
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_patsfun_42,
  ats2erlpre_intrange_foldleft_cloref(Env0, Env1, Env2, Arg0).
%} // end-of-function


%%fun%%
ats2erlpre_intrange2_exists_cloref(Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret67
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange2_exists_cloref,
  f_ats2erlpre_intrange_loop1_44(Arg2, Arg3, Arg4, Arg0, Arg1, Arg2, Arg3, Arg4).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop1_44(Env0, Env1, Env2, Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret68
%% var Tmp69
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop1_44,
  Tmp69 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp69 ->
      f_ats2erlpre_intrange_loop2_45(Env0, Env1, Env2, Arg0, Arg1, Arg2, Arg3, Env2);
    %% if-then
    true ->
      false
    %% if-else
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop2_45(Env0, Env1, Env2, Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret70
%% var Tmp71
%% var Tmp72
%% var Tmp73
%% var Tmp74
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop2_45,
  Tmp71 = ats2erlpre_lt_int0_int0(Arg2, Arg3),
  if
    Tmp71 ->
      Tmp72 = ?ATSfunclo_clo(Arg4)(Arg4, Arg0, Arg2),
      if
        Tmp72 ->
          true;
        %% if-then
        true ->
          Tmp73 = ats2erlpre_add_int0_int0(Arg2, 1),
          f_ats2erlpre_intrange_loop2_45(Env0, Env1, Env2, Arg0, Arg1, Tmp73, Arg3, Arg4)
        %% if-else
      end;
    %% if-then
    true ->
      Tmp74 = ats2erlpre_add_int0_int0(Arg0, 1),
      f_ats2erlpre_intrange_loop1_44(Env0, Env1, Env2, Tmp74, Arg1, Env0, Env1, Arg4)
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange2_forall_cloref(Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret75
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange2_forall_cloref,
  f_ats2erlpre_intrange_loop1_47(Arg2, Arg3, Arg0, Arg1, Arg2, Arg3, Arg4).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop1_47(Env0, Env1, Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret76
%% var Tmp77
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop1_47,
  Tmp77 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp77 ->
      f_ats2erlpre_intrange_loop2_48(Env0, Env1, Arg0, Arg1, Arg2, Arg3, Arg4);
    %% if-then
    true ->
      true
    %% if-else
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop2_48(Env0, Env1, Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmpret78
%% var Tmp79
%% var Tmp80
%% var Tmp81
%% var Tmp82
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop2_48,
  Tmp79 = ats2erlpre_lt_int0_int0(Arg2, Arg3),
  if
    Tmp79 ->
      Tmp80 = ?ATSfunclo_clo(Arg4)(Arg4, Arg0, Arg2),
      if
        Tmp80 ->
          Tmp81 = ats2erlpre_add_int0_int0(Arg2, 1),
          f_ats2erlpre_intrange_loop2_48(Env0, Env1, Arg0, Arg1, Tmp81, Arg3, Arg4);
        %% if-then
        true ->
          false
        %% if-else
      end;
    %% if-then
    true ->
      Tmp82 = ats2erlpre_add_int0_int0(Arg0, 1),
      f_ats2erlpre_intrange_loop1_47(Env0, Env1, Tmp82, Arg1, Env0, Env1, Arg4)
    %% if-else
  end.
%} // end-of-function


%%fun%%
ats2erlpre_intrange2_foreach_cloref(Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab_intrange2_foreach_cloref,
  f_ats2erlpre_intrange_loop1_50(Arg2, Arg3, Arg0, Arg1, Arg2, Arg3, Arg4).
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop1_50(Env0, Env1, Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmp85
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop1_50,
  Tmp85 = ats2erlpre_lt_int0_int0(Arg0, Arg1),
  if
    Tmp85 ->
      f_ats2erlpre_intrange_loop2_51(Env0, Env1, Arg0, Arg1, Arg2, Arg3, Arg4);
    %% if-then
    true ->
      ?ATSINSmove_void()
    %% if-else
  end.
%} // end-of-function


%%fun%%
f_ats2erlpre_intrange_loop2_51(Env0, Env1, Arg0, Arg1, Arg2, Arg3, Arg4) ->
%{
%%
%% knd = 0
%% var Tmp87
%% var Tmp89
%% var Tmp90
%% var Tmplab, Tmplab_erl
%%
  %% __patsflab__ats2erlpre_intrange_loop2_51,
  Tmp87 = ats2erlpre_lt_int0_int0(Arg2, Arg3),
  if
    Tmp87 ->
      ?ATSfunclo_clo(Arg4)(Arg4, Arg0, Arg2),
      Tmp89 = ats2erlpre_add_int0_int0(Arg2, 1),
      f_ats2erlpre_intrange_loop2_51(Env0, Env1, Arg0, Arg1, Tmp89, Arg3, Arg4);
    %% if-then
    true ->
      Tmp90 = ats2erlpre_succ_int0(Arg0),
      f_ats2erlpre_intrange_loop1_50(Env0, Env1, Tmp90, Arg1, Env0, Env1, Arg4)
    %% if-else
  end.
%} // end-of-function

%%%%%%
%%
%% end-of-compilation-unit
%%
%%%%%%
-en \n%% ****** ****** %%\n
-en \n%% end of [libatscc2erl_all.hrl] %%\n
