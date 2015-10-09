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
#define
ATS_DYNLOADFLAG 0 // no staloading at run-time
//
#define
ATS_EXTERN_PREFIX "ats2js_bacon_ext_" // prefix for extern names
#define
ATS_STATIC_PREFIX "_ats2js_bacon_ext_" // prefix for static names
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include "./../../staloadall.hats"
//
(* ****** ****** *)
//
staload "./../../SATS/Bacon.js/baconjs.sats"
staload "./../../SATS/Bacon.js/baconjs_ext.sats"
//
(* ****** ****** *)
//
(*
fun
EStream_zip_stream_cfun
  {a,b:t0p}{c:t0p}
(
  xs: EStream(a)
, ys: stream(b), y0: b, fopr: cfun(a, b, c)
) : EStream(c) = "mac#%" // end-of-function
*)
//
implement
EStream_zip_stream_cfun
  {a,b}{c}
  (xs, ys, y0, fopr) = let
//
val fys =
  stream2cloref_last(ys, y0)
//
in
  EStream_map(xs, lam(x) =<cloref1> fopr(x, fys()))
end // end of [EStream_zip_stream_cfun]
//
(* ****** ****** *)

(* end of [baconjs_ext.dats] *)
