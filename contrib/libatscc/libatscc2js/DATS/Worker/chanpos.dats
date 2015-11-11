(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)

(*
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
** 
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxi AT gmail DOT com
** Start Time: October, 2015
*)

(* ****** ****** *)
//
staload
"./../../basics_js.sats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

staload "./../../SATS/Worker/channel.sats"

(* ****** ****** *)

%{^
//
var
theWorker_cont;
//
self.onmessage =
function(event)
{
  var k0 = theWorker_cont;
  return ats2jspre_cloref2_app(k0, 0, event.data);
}
//
function
ats2js_worker_chanpos0_recv
  (chp, k0)
{
  theWorker_cont = k0; return;
}
function
ats2js_worker_chanpos0_send
  (chp, x0, k0)
{
  postMessage(x0); return ats2jspre_cloref1_app(k0, 0);
}
//
function
ats2js_worker_chanpos1_recv
  (chp, k0)
{
  return ats2js_worker_chanpos0_recv(chp, k0);
}
function
ats2js_worker_chanpos1_send
  (chp, x0, k0)
{
  return ats2js_worker_chanpos0_send(chp, x0, k0);
}
//
%} // end of [%{^]

(* ****** ****** *)
//
%{^
//
function
ats2js_worker_chanpos0_close(chp) { return self.close(); }
function
ats2js_worker_chanpos1_close(chp) { return self.close(); }
//
%} // end of [%{^]
//
(* ****** ****** *)
//
implement
{a}{b}
rpc_server
  (chp, fopr) = let
//
(*
val () = println! ("rpc_server")
*)
//
in
//
chanpos0_recv{a}
( chp
, lam(chp, e) =>
  chanpos0_send{b}
  ( chp
  , fopr(chmsg_parse<a>(e))
  , lam(chp) => rpc_server_cont(chp, fopr)
  )
)
//
end (* end of [rpc_server] *)

(* ****** ****** *)
//
// HX: looping
//
implement
{a}{b}
rpc_server_cont = rpc_server<a><b>
//
(*
//
// HX: one-time service
//
implement
{a}{b}
rpc_server_cont(chp, fopr) = chanpos0_close(chp)
*)
//
(* ****** ****** *)

(* end of [chanpos.dats] *)
