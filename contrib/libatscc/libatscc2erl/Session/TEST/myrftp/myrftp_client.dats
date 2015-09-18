(*
** client for myrftp
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#define
ATS_EXTERN_PREFIX "myrftp_"
#define
ATS_STATIC_PREFIX "_myrftp_"
//
(* ****** ****** *)

%{^
%%
-module(myrftp_client_dats).
%%
-export([main0_erl/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-export([ats2erlpre_cloref1_app/2]).
-export([ats2erlpre_cloref2_app/3]).
-export([libats2erl_session_chque_server/0]).
-export([libats2erl_session_chanpos_server/2]).
-export([libats2erl_session_channeg_server/2]).
-export([libats2erl_session_chansrvc_create_server/1]).
-export([libats2erl_session_chansrvc2_create_server/1]).
%%
-include("libatscc2erl_all.hrl").
-include("Session/mylibats2erl_all.hrl").
%%
%} // end of [%{]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2ERL}/staloadall.hats"
//
staload
"{$LIBATSCC2ERL}/SATS/Erlang/file.sats"
//
staload
"{$LIBATSCC2ERL}/Session/SATS/basis.sats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include "./myrftp_protocol.dats"
//
(* ****** ****** *)
//
extern
fun
myrftp_client(channeg(ssdisj(ssftp))): void
//
(* ****** ****** *)

implement
myrftp_client(chn) = let
//
val () = println! ("myrftp_client: enter")
//
val opt = channeg_ssftp(chn)
//
val () = println! ("myrftp_client: opt = ", $UN.castvwtp1{ERLval}(opt))
//
in
//
case+ opt of
//
| ~channeg_ssftp_ls0() => let
    val Dir = "."
    val res =
      $extfcall(ERLval, "file:list_dir", Dir)
    // end of [val]
  in
    channel_send(chn, res); myrftp_client(chn)
  end // end of [channeg_ssftp_ls]
//
| ~channeg_ssftp_ls1(Dir) => let
    val res =
      $extfcall(ERLval, "file:list_dir", Dir)
    // end of [val]
  in
    channel_send(chn, res); myrftp_client(chn)
  end // end of [channeg_ssftp_ls]
//
| ~channeg_ssftp_cd1(Dir) => let
    val res =
      $extfcall(ERLval, "file:set_cwd", Dir)
    // end of [val]
  in
    channel_send(chn, res); myrftp_client(chn)
  end // end of [channeg_ssftp_cd]
//
| ~channeg_ssftp_get1(Filename) => let
    val res =
      $extfcall(ERLval, "file:read_file", Filename)
    // end of [val]
  in
    channel_send(chn, res); myrftp_client(chn)
  end // end of [channeg_ssftp_get]
//
| ~channeg_ssftp_quit0() => channeg_nil_close(chn)
//
end // end of [myrftp_client]

(* ****** ****** *)
//
macdef SERVICE_NODE = $extval(atom, "'myrftpd@localhost'")
(*
macdef SERVICE_NODE = $extval(atom, "'myrftpd@xats.bu.edu'")
*)
//
(* ****** ****** *)
//
extern
fun
main0_erl
(
// argumentless
) : void = "mac#"
//
implement
main0_erl () =
myrftp_client(chn) where
{
//
val chn = 
chansrvc_request
(
  $UN.cast{service(ssdisj(ssftp))}($tup(SERVICE_MYRFTP,SERVICE_NODE))
) (* end of [val] *)
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [myrftp_client.dats] *)
