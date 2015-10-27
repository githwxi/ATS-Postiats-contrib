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
ats2js_worker_channeg_new_file
  (file) { var ch = new Worker(file); return ch; }
//
%} // end of [%{^]
//
(* ****** ****** *)
//
%{^
//
function
ats2js_worker_channeg_close(ch) { return ch.terminate(); }
//
%} // end of [%{^]
//
(* ****** ****** *)
//
%{^
//
function
ats2js_worker_channeg_send(chn, k0)
{
  chn.onmessage =
  function(event)
    { return ats2jspre_cloref2_app(k0, chn, event.data); };
  return/*void*/;
}
function
ats2js_worker_channeg_recv(chn, x0, k0)
{
  chn.postMessage(x0); return ats2jspre_cloref1_app(k0, chn);
}
//
%} // end of [%{^]
//
(* ****** ****** *)

(* end of [channeg.dats] *)
