(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2014-11:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload "./../basics_py.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/stream.sats"
//
(* ****** ****** *)

(* end of [stream.sats] *)
