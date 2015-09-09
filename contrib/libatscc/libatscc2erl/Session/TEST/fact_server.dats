(*
** Server: Factorials
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "fact_server_"
#define
ATS_STATIC_PREFIX "_fact_server_"

(* ****** ****** *)

%{^
%%
-module(fact_server_dats).
%%
-export([main0_erl/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-export([service_fact/0]).
%%
-export([ats2erlpre_cloref1_app/2]).
-export([ats2erlpre_cloref2_app/3]).
-export([libats2erl_session_chque_server/0]).
-export([libats2erl_session_chanpos_server/2]).
-export([libats2erl_session_channeg_server/2]).
-export([libats2erl_session_chansrvc_create_server/1]).
-export([libats2erl_session_chansrvc2_create_server/1]).
%%
-include("./../../libatscc2erl_all.hrl").
-include("./../../Session/mylibats2erl_all.hrl").
%%
%} // end of [%{]

(* ****** ****** *)
//
#include
"./../../staloadall.hats"
//
staload "./../SATS/basis.sats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
typedef
ssfact =
chrcv(int)::chsnd(int)::chnil
//
typedef
service_fact = service(ssfact)
//
extern
fun service_fact(): service_fact = "mac#"
//
(* ****** ****** *)

macdef
SERVICE_FACT = $extval(atom, "'SERVICE_FACT'")

(* ****** ****** *)
//
implement
service_fact() = let
//
fun
fserv
(
  chp: chanpos(ssfact)
) : void = () where
{
  val n = channel_recv(chp)
  val r = (fix f(n:int):int => if n > 0 then n*f(n-1) else 1)(n)
  val () = channel_send(chp, r)
  val () = chanpos_nil_wait(chp)
}
//
in
  chansrvc_create(lam(chp) => fserv(chp))
end // end of [service_fact]
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
val () = chansrvc_register(SERVICE_FACT, service_fact())
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [fact_server.dats] *)
