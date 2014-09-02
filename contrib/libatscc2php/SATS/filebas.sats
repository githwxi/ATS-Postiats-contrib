(*
** For writing ATS code
** that translates into PHP
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2phppre_"
//
(* ****** ****** *)

staload "./../basics_php.sats"

(* ****** ****** *)

val stdin : PHPfile = "mac#%"
val stdout : PHPfile = "mac#%"
val stderr : PHPfile = "mac#%"

(* ****** ****** *)

(* end of [filebas.sats] *)
