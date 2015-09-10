(*
** Factorials
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "fact_client_"
#define
ATS_STATIC_PREFIX "_fact_client_"

(* ****** ****** *)

%{^
%%
-module(fact_client_dats).
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

staload "./fact_server.dats"

(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

macdef
SERVICE_NODE = $extval(atom, "'fact_server@xats.bu.edu'")

(* ****** ****** *)
//
extern
fun
fact_client(n: int): int
//
implement
fact_client(n) = let
//
val chn = 
  chansrvc_request($UN.cast{service_fact}($tup(SERVICE_FACT,SERVICE_NODE)))
//
val () = channel_send(chn, n)
val result = channel_recv(chn)
val ((*closed*)) = channeg_nil_close(chn)
//
in
  result
end // end of [fact_client]
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
val N = 10
val ((*void*)) = println! ("fact(", N, ") = ", fact_client(N))
val N = 12
val ((*void*)) = println! ("fact(", N, ") = ", fact_client(N))
val N = 100
val ((*void*)) = println! ("fact(", N, ") = ", fact_client(N))
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [fact_client.dats] *)
