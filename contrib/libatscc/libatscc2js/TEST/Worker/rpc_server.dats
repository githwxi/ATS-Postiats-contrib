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
//
extern
fun
{a1,a2:t0p}{b:t0p}
rpc_server(ch: chanpos, f: (a1, a2) -> b): void
//
implement
{a1,a2}{b}
rpc_server
  (ch, f) = let
//
macdef p(x) = wkmsg_parse(,(x))
//
in
//
chanpos_recv{a1}
( ch
, lam(ch, e1) =>
  chanpos_recv{a2}
  ( ch
  , lam(ch, e2) =>
    chanpos_send{b}
    (
      ch, f(p(e1), p(e2)), lam(ch) => rpc_server(ch, f)
    )
  )
)
//
end (* end of [rpc_server] *)

(* ****** ****** *)
//
(*
typedef T = int
*)
//
typedef T = double
//
val ((*void*)) =
  rpc_server<T,T><T>($UN.cast{chanpos}(0), lam(x, y) => x * y)
//
(* ****** ****** *)

%{$
//
theWorker_start();
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [rpc_server.dats] *)
