(*
** For writing ATS code
** that translates into Python3
*)

(* ****** ****** *)
//
// HX-2014-10:
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

staload "./../basics_py.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/matrixref.sats"
//
(* ****** ****** *)

(* end of [matrixref.sats] *)
