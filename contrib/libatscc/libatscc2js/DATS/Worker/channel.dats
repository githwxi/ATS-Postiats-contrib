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
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

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
abstype
wkmsg_type(a:t@ype+)
//
typedef
wkmsg(a:t0p) = wkmsg_type(a)
//
(* ****** ****** *)
//
extern
fun{a:t0p}
wkmsg_parse(wkmsg(INV(a))): (a)
//
(* ****** ****** *)
//
implement
wkmsg_parse<int> (msg) =
  $extfcall(int, "parseInt", $UN.cast{string}(msg))
//
implement
wkmsg_parse<double> (msg) =
  $extfcall(double, "parseFloat", $UN.cast{string}(msg))
//
(* ****** ****** *)

implement
(a:t@ype
,b:t0ype)
wkmsg_parse<$tup(a,b)>
  (msg) = let
//
val
msg =
$UN.cast{$tup(wkmsg(a),wkmsg(b))}(msg)
//
in
  $tup(wkmsg_parse<a>(msg.0), wkmsg_parse<b>(msg.1))
end // end of [wkmsg_parse<$tup(a,b)>]

(* ****** ****** *)

implement
(a:t@ype)
wkmsg_parse<list0(a)>
  (msg) = let
//
fun
aux{n:nat}
(
  xs: list(wkmsg(a), n)
) : list0(a) =
(
case+ xs of
//
| list_nil
    () => list0_nil()
  // list_nil
//
| list_cons
    (x, xs) => let
    val x =
      wkmsg_parse<a>(x)
    // end of [val]
  in
    list0_cons(x, aux(xs))
  end // end of [list_cons]
//
)
//
in
  aux($UN.cast{List0(wkmsg(a))}(msg))
end // end of [wkmsg_parse<list0(a)>]

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
self_close((*void*)): void = "mac#%"
%{^
//
function
ats2js_worker_self_close() { return self.close(); }
//
%} // end of [%{^]
//
(* ****** ****** *)
//
extern
fun
chanpos_send
  {a:t0p}
  (chanpos, x0: a, k0: wkcont0()): void = "mac#%"
//
extern
fun
chanpos_recv
  {a:t0p}
  (chanpos, k0: wkcont1(wkmsg(a))): void = "mac#%"
//
(* ****** ****** *)
//
extern
fun
{a:t0p}
{b:t0p}
rpc_server
  (chanpos, fopr: (a) -<cloref1> b): void = "mac#%"
//
extern
fun
{a:t0p}
{b:t0p}
rpc_server_cont
  (chanpos, fopr: (a) -<cloref1> b): void = "mac#%"
//
(* ****** ****** *)

implement
{a}{b}
rpc_server
  (ch, f) = let
//
(*
val () = println! ("rpc_server")
*)
//
in
//
chanpos_recv{a}
( ch
, lam(ch, e) =>
  chanpos_send{b}
  ( ch
  , f(wkmsg_parse<a>(e))
  , lam(ch) => rpc_server_cont(ch, f)
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
(* ****** ****** *)
(*
//
// HX: one-time service
//
implement
{a}{b}
rpc_server_cont(ch, f) = self_close()
*)
//
(* ****** ****** *)

(* end of [channel.dats] *)
