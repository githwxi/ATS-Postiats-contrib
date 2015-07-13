(*
** Factorials
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "fact_"
#define
ATS_STATIC_PREFIX "_fact_"

(* ****** ****** *)

%{^
%%
-module(fact_dats).
%%
-export([main0_erl/0]).
%%
-compile(nowarn_unused_vars).
-compile(nowarn_unused_function).
%%
-export([ats2erlpre_cloref1_app/2]).
-export([ats2erlpre_cloref2_app/3]).
-export([libats2erl_session_chanpos_xfer/0]).
-export([libats2erl_session_chanposneg_link_pn/2]).
-export([libats2erl_session_chanposneg_link_np/3]).
-export([libats2erl_session_chansrv_create_loop/1]).
-export([libats2erl_session_chansrv2_create_loop/1]).
%%
-include("./libatscc2erl/libatscc2erl_all.hrl").
-include("./libatscc2erl/Sessiontype_mylibats2erl_all.hrl").
%%
%} // end of [%{]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include
"{$LIBATSCC2ERL}/staloadall.hats"
//
(* ****** ****** *)

staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
staload "./../SATS/basis.sats"
//
(* ****** ****** *)
//
extern
fun
channeg_fact
(
  n:int
) : channeg(chsnd(int)::nil)
//
(* ****** ****** *)

implement
channeg_fact(n) = let
//
fun
fserv
(
  chp: chanpos(chsnd(int)::nil)
) : void =
channel_send_close
( chp
, if n > 0
    then n * channel_recv_close(channeg_fact(n-1))
    else 1
  // end-of-if
) (* channel_send_close *)
//
in
  channeg_create(llam(chp) => fserv(chp))
end // end of [channeg_fact]

(* ****** ****** *)
//
typedef
chansrv2_fact =
chansrv2(int, chsnd(int)::nil)
//
extern
fun
chansrv2_fact(): chansrv2_fact
//
(* ****** ****** *)
//
implement
chansrv2_fact() =
chansrv2_create
  (lam(n, chp) => chanposneg_link(chp, channeg_fact(n)))
//
(* ****** ****** *)

macdef
FACT_SERVICE = $extval(atom, "'FACT_SERVICE'")

(* ****** ****** *)
//
fun
fact(n: int): int = 
channel_recv_close
  (chansrv2_request(n, $UN.cast{chansrv2_fact}(FACT_SERVICE)))
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
val () =
chansrv2_register(FACT_SERVICE, chansrv2_fact())
//
val N = 10
val ((*void*)) = println! ("fact(", N, ") = ", fact(N))
val N = 12
val ((*void*)) = println! ("fact(", N, ") = ", fact(N))
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [fact.dats] *)
