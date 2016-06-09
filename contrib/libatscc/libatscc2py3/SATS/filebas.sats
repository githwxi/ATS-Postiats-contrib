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

staload "./../basics_py.sats"

(* ****** ****** *)

val stdin : PYfilr = "mac#%"
val stdout : PYfilr = "mac#%"
val stderr : PYfilr = "mac#%"

(* ****** ****** *)

(* end of [filebas.sats] *)
