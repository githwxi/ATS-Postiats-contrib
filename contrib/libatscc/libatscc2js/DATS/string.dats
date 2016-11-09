(*
** For writing ATS code
** that translates into Javascript
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
#define
ATS_STATIC_PREFIX "_ats2jspre_string_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../basics_js.sats"
//
(* ****** ****** *)
//
staload "./../SATS/integer.sats"
//
(* ****** ****** *)

staload "./../SATS/string.sats"

(* ****** ****** *)

implement
streamize_string_code
  (str0) =
  auxmain(0) where
{
//
val
[n:int] str0 = g1ofg0(str0)
//
val len = string_length(str0)
//
fun
auxmain
{i:nat | i <= n}
(
  i: int(i)
) : stream_vt(int) = $ldelay
(
//
if i < len
  then
  stream_vt_cons
    (str0.charCodeAt(i), auxmain(i+1))
  // stream_vt_cons
  else stream_vt_nil((*void*))
//
) (* end of [auxmain] *)
//
} (* end of [streamize_string_code] *)

(* ****** ****** *)

(* end of [string.dats] *)
