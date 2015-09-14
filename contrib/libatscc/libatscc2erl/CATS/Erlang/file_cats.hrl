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

%% end of [file_cats.hrl] %%
