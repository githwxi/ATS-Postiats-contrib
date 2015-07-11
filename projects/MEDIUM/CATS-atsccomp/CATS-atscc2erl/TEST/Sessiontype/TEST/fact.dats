(*
** Erathosthene's sieve
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
-compile(nowarn_unused_function).
%%
-export([ats2erlpre_cloref1_app/2]).
-export([libats2erl_session_chanpos_xfer/0]).
-export([libats2erl_session_chanposneg_link_pn/2]).
-export([libats2erl_session_chanposneg_link_np/3]).
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
//
staload "./../SATS/basis.sats"
//
(* ****** ****** *)
//
extern
fun
channeg_fact
  (n:int): channeg(chsnd(int)::nil)
//
(* ****** ****** *)
//
macdef
chanpos_send_close(chp, x) =
  let val chp = ,(chp) in chanpos_send(chp, ,(x)); chanpos_nil_wait(chp) end
//
macdef
channeg_send_close(chn) =
  let val chn = ,(chn); val x = channeg_send(chn) in channeg_nil_close(chn); x end
//
(* ****** ****** *)

implement
channeg_fact(n) = let
//
fun
fserv
(chp: chanpos(chsnd(int)::nil)): void =
(
  chanpos_send_close(chp, if n > 0 then n * channeg_send_close(channeg_fact(n-1)) else 1)
)
//
in
  channeg_create(llam(chp) => fserv(chp))
end // end of [channeg_fact]

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
val N = 100
//
val chn = channeg_fact(N)
val ans = channeg_send(chn)
val ((*void*)) = channeg_nil_close(chn)
//
val ((*void*)) = println! ("channeg_fact(", N, ") = ", ans)
//
} (* end of [main0_erl] *)

(* ****** ****** *)

(* end of [fact.dats] *)
