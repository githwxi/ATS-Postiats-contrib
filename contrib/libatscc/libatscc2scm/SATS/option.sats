(*
** For writing ATS code
** that translates into Scheme
*)

(* ****** ****** *)
//
// HX-2016-06:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2scmpre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./../basics_scm.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/option.sats"
//
(* ****** ****** *)

(* end of [option.sats] *)
