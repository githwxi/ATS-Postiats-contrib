(* ****** ****** *)
//
// RPC based on WebWorker
//
(* ****** ****** *)

#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "theWorker_start"

(* ****** ****** *)
  
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
  
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
#include
"./../../DATS/Worker/channel.dats"
//
(* ****** ****** *)

(*
fun
rpc_fserv(ch, f) = let
//
val e1 = chanpos_recv(ch)
val e2 = chanpos_recv(ch)
val () = chanpos_send(ch, f(e1, e2))
//
in
  rpc_fserv(ch)
end // end of [rpc_fserv]
*)

(* ****** ****** *)

extern
fun
rpc_server
  {a1,a2:t@ype}{b:t@ype}
  (ch: chanpos, f: (a1, a2) -> b): void
//
implement
rpc_server
{a1,a2}{b}
  (ch, f) = (
//
chanpos_recv{a1}
( ch
, lam(ch, e1) =>
  chanpos_recv{a2}
  ( ch
  , lam(ch, e2) =>
    chanpos_send{b}(ch, f(e1, e2), lam(ch) => rpc_server(ch, f))
  )
)
//
) (* end of [rpc_server] *)

(* ****** ****** *)

val () = rpc_server{int,int}{int}($UN.cast{chanpos}(0), lam(x, y) => x + y)

(* ****** ****** *)

%{$
//
theWorker_start();
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [rpc_server.dats] *)
