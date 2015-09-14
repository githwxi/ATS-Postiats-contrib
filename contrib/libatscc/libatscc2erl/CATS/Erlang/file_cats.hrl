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

%% end of [file_cats.hrl] %%
