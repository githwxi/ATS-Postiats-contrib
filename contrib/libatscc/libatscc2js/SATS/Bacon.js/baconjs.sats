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
** Start Time: April, 2015
*)

(* ****** ****** *)

#define
ATS_STALOADFLAG 0 // no staloading at run-time
#define
ATS_EXTERN_PREFIX "ats2js_bacon_" // prefix for external names

(* ****** ****** *)
//
staload
"./../../basics_js.sats"
//
(* ****** ****** *)
//
abstype Event = ptr
abstype EStream(a:t@ype) = ptr
//
abstype Property(a:t@ype) = ptr
//
(* ****** ****** *)
//
fun
EStream_map
  {a,b:t0p}
(
  xs: EStream(a), fopr: cfun(a, b)
) : EStream(b) = "mac#%" // end-of-fun
//
overload map with EStream_map
overload .map with EStream_map
//
(* ****** ****** *)
//
fun
EStream_scan
  {a,b:t0p}
(
  xs: EStream(b), ini: a, fopr: cfun(a, b, a)
) : Property(a) = "mac#%" // end-of-function
//
overload scan with EStream_scan
overload .scan with EStream_scan
//
(* ****** ****** *)
//
fun
EStream_merge2
  {a:t0p}
  (EStream(a), EStream(a)): EStream(a) = "mac#%"
//
overload merge with EStream_merge2
overload .merge with EStream_merge2
//
(* ****** ****** *)
//
fun
EStream_toProperty
  {a:t0p}(EStream(a), ini: a): EStream(a) = "mac#%"
//
overload toProperty with EStream_toProperty
overload .toProperty with EStream_toProperty
//
(* ****** ****** *)

(* end of [baconjs.sats] *)
