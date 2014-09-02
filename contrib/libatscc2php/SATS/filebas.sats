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
//
(*
val STDIN : PHPfile = "mac#"
val STDOUT : PHPfile = "mac#"
val STDERR : PHPfile = "mac#"
*)
macdef STDIN = $extval (PHPfile, "STDIN")
macdef STDOUT = $extval (PHPfile, "STDOUT")
macdef STDERR = $extval (PHPfile, "STDERR")
//
(* ****** ****** *)

(* end of [filebas.sats] *)
