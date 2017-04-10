(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./../basics_js.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/list_vt.sats"
//
(* ****** ****** *)

(* end of [list_vt.sats] *)
