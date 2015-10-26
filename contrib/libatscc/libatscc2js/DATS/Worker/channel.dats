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

#define
ATS_STALOADFLAG 0 // no staloading at run-time
#define
ATS_EXTERN_PREFIX "ats2js_worker_" // prefix for external names

(* ****** ****** *)
//
staload
"./../../basics_js.sats"
//
(* ****** ****** *)

%{^
//
var
theWorker_cont;
//
onmessage =
function(e)
{
  var k0 = theWorker_cont;
  return ats2jspre_cloref2_app(k0, 0, e.data);
}
//
function
ats2js_worker_chanpos_recv
  (ch, k0)
{
  theWorker_cont = k0; return;
}
function
ats2js_worker_chanpos_send
  (ch, x0, k0)
{
  postMessage(x0); ats2jspre_cloref1_app(k0, 0); return;
}
//
%} // end of [%{^]

(* ****** ****** *)

abstype chanpos_type
abstype channeg_type

(* ****** ****** *)

typedef chanpos = chanpos_type
typedef channeg = channeg_type

(* ****** ****** *)
//
typedef
wkcont0() = cfun1(chanpos, void)
typedef
wkcont1(a:t0p) = cfun2(chanpos, a, void)
//
(* ****** ****** *)
//
extern
fun
chanpos_recv
  {a:t0p}
  (chanpos, k0: wkcont1(a)): void = "mac#%"
extern
fun
chanpos_send
  {a:t0p}
  (chanpos, x0: a, k0: wkcont0()): void = "mac#%"
//
(* ****** ****** *)

(* end of [channel.dats] *)
