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
//
%{^
//
function
ats2js_worker_channeg0_new_file
  (file) { var ch = new Worker(file); return ch; }
//
%} // end of [%{^]
//
(* ****** ****** *)
//
%{^
//
function
ats2js_worker_channeg0_close(ch) { return ch.terminate(); }
function
ats2js_worker_channeg1_close(ch) { return ch.terminate(); }
//
%} // end of [%{^]
//
(* ****** ****** *)
//
%{^
//
function
ats2js_worker_channeg0_send(chn, k0)
{
  chn.onmessage =
  function(event)
    { return ats2jspre_cloref2_app(k0, chn, event.data); };
  return/*void*/;
}
function
ats2js_worker_channeg0_recv(chn, x0, k0)
{
  chn.postMessage(x0); return ats2jspre_cloref1_app(k0, chn);
}
//
function
ats2js_worker_channeg1_send
  (chp, k0)
{
  return ats2js_worker_channeg0_send(chp, k0);
}
function
ats2js_worker_channeg1_recv
  (chp, x0, k0)
{
  return ats2js_worker_channeg0_recv(chp, x0, k0);
}
//
%} // end of [%{^]
//
(* ****** ****** *)

implement
{a}{b}
rpc_client
  (chn, arg, fopr) = let
//
(*
val () = println! ("rpc_client")
*)
//
in
//
channeg0_recv{a}
( chn
, arg
, lam(chn) =>
  channeg0_send{b}
  ( chn
  , lam(chn, e) => fopr(chmsg_parse<b>(e))
  )
)
//
end (* end of [rpc_client] *)

(* ****** ****** *)
//
(*
fun{}
channeg1_append
  {ss1,ss2:type}
(
  channeg(ssappend(ss1,ss2)), k0: chncont0_nil
, fserv1: channeg_nullify(ss1), fserv2: channeg_nullify(ss2)
) : void // end of [channeg1_append]
*)
//
implement
{}(*tmp*)
channeg1_append
  {ss1,ss2}
(
  chn, k0, fserv1, fserv2
) = (
//
fserv1
(
  $UN.castvwtp0{channeg(ss1)}(chn)
, $UN.castvwtp0{chncont0_nil}(lam(chn:channeg(ss2)) => fserv2(chn, k0))
) (* end of [fserv1] *)
//
) (* end of [channeg1_append] *)
//
(* ****** ****** *)
//
(*
fun{}
channeg1_repeat_disj
  {ss:type}
(
  channeg(ssrepeat(ss))
, k0: chpcont0_nil, fserv: channeg_nullify(ss)
) : void // end of [channeg1_repeat_disj]
*)
//
implement
{}(*tmp*)
channeg1_repeat_disj
  {ss}(chn, k0, fserv) = let
//
typedef
loop =
$d2ctype
  (channeg1_repeat_disj<>)
//
fun
loop: loop =
lam(chn, k0, fserv) => let
  val chn0 =
    $UN.castvwtp0{channeg()}(chn)
  // end of [val]
in
//
channeg0_send
  {int}
(
  chn0
, lam(chn0, tag0) => let
    val tag0 =
      chmsg_parse<int>(tag0)
  in
    case+ tag0 of
    | 0 => k0($UN.castvwtp0(chn0))
    | _ => fserv($UN.castvwtp0(chn0), lam(chn) => loop($UN.castvwtp0(chn), k0, fserv))
  end // end of [lam]
) (* end of [channeg0_send] *)
//
end // end of [loop]
//
in
  loop(chn, k0, fserv)
end // end of [channeg1_repeat_disj]
//
(* ****** ****** *)

(* end of [channeg.dats] *)
