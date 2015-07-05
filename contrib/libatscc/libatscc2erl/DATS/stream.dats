(*
** For writing ATS code
** that translates into Erlang
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2erlpre_"
#define
ATS_STATIC_PREFIX "_ats2erlpre_stream_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
"./../SATS/integer.sats"
//
staload "./../SATS/print.sats"
//
(* ****** ****** *)

staload "./../SATS/stream.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/stream.dats"
//
(* ****** ****** *)

(* end of [stream.dats] *)
