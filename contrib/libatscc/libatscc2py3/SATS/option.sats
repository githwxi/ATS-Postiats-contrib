(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX-2014-08:
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
#include "{$LIBATSCC}/SATS/option.sats"
//
(* ****** ****** *)
//
fun{a:t0p}
fprint_option
  (PYfilr, Option(INV(a))): void = "mac#%"
//
(* ****** ****** *)

(* end of [option.sats] *)
