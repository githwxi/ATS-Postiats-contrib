(*
** server for myrftp
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
-module(myrftp_server_dats).
%%
-export([main0_erl/0]).
%%
-export([myrftp_ls0/0]).
-export([myrftp_ls1/1]).
-export([myrftp_cd1/1]).
-export([myrftp_get1/1]).
-export([myrftp_quit0/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-export([ats2erlpre_cloref1_app/2]).
-export([ats2erlpre_cloref2_app/3]).
-export([ats2erlpre_ref_server_proc/1]).
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

vtypedef chanpos_ssftp = chanpos(ssdisj(ssftp))

(* ****** ****** *)
//
extern
fun
myrftp_server_ls0(!chanpos_ssftp): ERLval
extern
fun
myrftp_server_ls1(!chanpos_ssftp, Dir: string): ERLval
extern
fun
myrftp_server_cd1(!chanpos_ssftp, Dir: string): ERLval
extern
fun
myrftp_server_get1(!chanpos_ssftp, Filename: string): ERLval
extern
fun
myrftp_server_quit0(chanpos_ssftp): void // HX: terminated
//
(* ****** ****** *)
//
implement
myrftp_server_ls0(chp) = let
//
val () = chanpos_ssftp_ls0(chp) in channel_recv(chp)
//
end // end of [myrftp_server_ls0]
//
(* ****** ****** *)

implement
myrftp_server_ls1(chp, Dir) = let
//
val () = chanpos_ssftp_ls1(chp, Dir) in channel_recv(chp)
//
end // end of [myrftp_server_ls1]

(* ****** ****** *)

implement
myrftp_server_cd1(chp, Dir) = let
//
val () = chanpos_ssftp_cd1(chp, Dir) in channel_recv(chp)
//
end // end of [myrftp_server_cd1]

(* ****** ****** *)

implement
myrftp_server_get1(chp, Filename) = let
//
val () =
  chanpos_ssftp_get1(chp, Filename) in channel_recv(chp)
//
end // end of [myftp_server_get1]

(* ****** ****** *)

implement
myrftp_server_quit0(chp) = let
//
val () = chanpos_ssftp_quit0(chp) in chanpos_nil_wait(chp)
//
end // end of [myftp_server_quit0]

(* ****** ****** *)
//
absview takeout_v
//
extern
fun
the_chanpos_takeout
(
// argumentless
) : (takeout_v | Option_vt(chanpos_ssftp))
//
extern
fun
the_chanpos_addback
(
  pf: takeout_v | opt: Option_vt(chanpos_ssftp)
) : void // end of [the_chanpos_addback]
//
(* ****** ****** *)
//
extern
fun
myrftp_ls0(): ERLval = "mac#"
//
extern
fun
myrftp_ls1(Dir: string): ERLval = "mac#"
//
extern
fun
myrftp_cd1(Dir: string): ERLval = "mac#"
//
extern
fun
myrftp_get1(Fil: string): ERLval = "mac#"
//
extern fun myrftp_quit0(): ERLval = "mac#"
//
(* ****** ****** *)
//
macdef
ERROR$MYRFTP_CHANNEL_NONE =
  $extval(ERLval, "{error, myrftp_channel_none}")
//
(* ****** ****** *)

implement
myrftp_ls0
  () = let
//
val (pf | opt) = the_chanpos_takeout()
//
in
//
case+ opt of
| Some_vt(chp) => let
    val res =
      myrftp_server_ls0(chp)
    // end of [val]
  in
    the_chanpos_addback(pf | opt); res
  end // end of [Some_vt]
| None_vt((*void*)) =>
    (the_chanpos_addback(pf | opt); ERROR$MYRFTP_CHANNEL_NONE)
//
end // end of [myrftp_ls0]

(* ****** ****** *)

implement
myrftp_ls1
  (Dir) = let
//
val (pf | opt) = the_chanpos_takeout()
//
in
//
case+ opt of
| Some_vt(chp) => let
    val res =
      myrftp_server_ls1(chp, Dir)
    // end of [val]
  in
    the_chanpos_addback(pf | opt); res
  end // end of [Some_vt]
| None_vt((*void*)) =>
    (the_chanpos_addback(pf | opt); ERROR$MYRFTP_CHANNEL_NONE)
//
end // end of [myrftp_ls1]

(* ****** ****** *)

implement
myrftp_cd1
  (Dir) = let
//
val (pf | opt) = the_chanpos_takeout()
//
in
//
case+ opt of
| Some_vt(chp) => let
    val res =
      myrftp_server_cd1(chp, Dir)
    // end of [val]
  in
    the_chanpos_addback(pf | opt); res
  end // end of [Some_vt]
| None_vt((*void*)) =>
    (the_chanpos_addback(pf | opt); ERROR$MYRFTP_CHANNEL_NONE)
//
end // end of [myrftp_cd1]

(* ****** ****** *)

implement
myrftp_get1
  (Filename) = let
//
val (pf | opt) = the_chanpos_takeout()
//
in
//
case+ opt of
| Some_vt(chp) => let
    val res =
      myrftp_server_get1(chp, Filename)
    // end of [val]
  in
    the_chanpos_addback(pf | opt); res
  end // end of [Some_vt]
| None_vt((*void*)) =>
    (the_chanpos_addback(pf | opt); ERROR$MYRFTP_CHANNEL_NONE)
//
end // end of [myrftp_get1]

(* ****** ****** *)

implement
myrftp_quit0
  () = let
//
val (pf | opt) = the_chanpos_takeout()
//
in
//
case+ opt of
| ~Some_vt(chp) => let
    val () =
      myrftp_server_quit0(chp)
    // end of [val]
    val opt = None_vt((*void*))
  in
    the_chanpos_addback(pf | opt); $extval(ERLval, "ok")
  end // end of [Some_vt]
| ~None_vt((*void*)) => let
    val opt = None_vt((*void*))
  in
    the_chanpos_addback(pf | opt); ERROR$MYRFTP_CHANNEL_NONE
  end // end of [None_vt]
//
end // end of [myrftp_quit0]

(* ****** ****** *)
//
macdef
the_channel_ref_name = $extval(atom, "'the_chanpos_ref'")
//
fun
the_chanpos_ref() =
  $extfcall(ref(Option_vt(chanpos_ssftp)), "get", the_channel_ref_name)
//
(* ****** ****** *)

local
//
assume
takeout_v =
  ref_takeout_v(Option_vt(chanpos_ssftp))
//
in
//
implement
the_chanpos_takeout() = ref_takeout(the_chanpos_ref())
implement
the_chanpos_addback(pf | x) = ref_addback(pf | the_chanpos_ref(), x)
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
myrftp_server
(
  chp: chanpos_ssftp
, ref: ref(Option_vt(chanpos_ssftp))
) : void // end of [myrftp_server]
//
implement
myrftp_server
  (chp, ref) = () where
{
//
val opt =
  ref_exch_elt(ref, Some_vt(chp))
//
prval((*leaked*)) = $UN.cast2void(opt)
//
} (* end of [myrftp_server] *)
//
(* ****** ****** *)

extern
fun
main0_erl
(
// argumentless
) : void = "mac#"
//
implement
main0_erl () =
{
//
val r0 =
  ref{Option_vt(chanpos_ssftp)}(None_vt())
//
val () =
$extfcall(void, "put", the_channel_ref_name, r0)
//
val srvc =
  chansrvc_create(lam(chp) => myrftp_server(chp, r0))
//
val ((*void*)) = chansrvc_register(SERVICE_MYRFTP, srvc)
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [myrftp_server.dats] *)
