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
EStream_scan_stream_opt
  {a,b,c:t0p}
(
  xs: EStream(b)
, ini: a, ys: stream(c), fopr: cfun(a, b, c, Option_vt(a))
) : Property(a) = "mac#%" // end-of-function
*)
//
implement
EStream_scan_stream_opt
  {a,b,c}
  (xs, ini, ys, fopr) = let
//
val rys = ref{stream(c)}(ys)
//
val
fopr2 = lam
(
  ini: a, x: b
) : a =<cloref1> let
  val ys = rys[]
in
//
case+ !ys of
| stream_nil() => ini
| stream_cons(y, ys) => let
    val opt = fopr(ini, x, y)
  in
    case+ opt of
    | ~None_vt() => ini
    | ~Some_vt(ini) => (rys[] := ys; ini)
  end // end of [stream_cons]
//
end // end of [fopr2]
//
in
  EStream_scan(xs, ini, fopr2)
end // end of [EStream_scan_stream_opt]
//
(* ****** ****** *)
//
(*
fun
EValue_get_elt
  {a:t0p}
  (x: EValue(a)): (a) = "mac#%"
*)
implement
EValue_get_elt
  {a}(eval) =
  ref_get_elt($UN.cast{ref(a)}(eval))
//
(* ****** ****** *)
//
(*
fun
EValue_make_property
  {a:t0p}(Property(a)): EValue(a) = "mac#%"
*)
//
implement
EValue_make_property
  {a}(xs) = let
//
val x0 =
  $UN.cast{a}(0)
//
val
xref = ref{a}(x0)
//
val ((*void*)) =
Property_onValue
  (xs, lam(x) =<cloref1> xref[] := x)
//
in
  $UN.cast{EValue(a)}(xref)
end // end of [EValue_make_property]
  
(* ****** ****** *)
//
(*
fun
EValue_make_estream_scan
  {a,b:t0p}
(
  x0: a, ys: EStream(b), fopr: cfun(a, b, a)
) : EValue(a) = "mac#%" // end-of-fun
*)
//
implement
EValue_make_estream_scan
  {a,b}
  (x0, ys, fopr) = let
//
val
xref = ref{a}(x0)
//
val ((*void*)) =
EStream_onValue(ys
, lam(y) =<cloref1> xref[] := fopr(xref[], y)
) (* end of [val] *)
//
in
  $UN.cast{EValue(a)}(xref)
end // end of [EValue_make_estream_scan]

(* ****** ****** *)

(* end of [baconjs_ext.dats] *)
