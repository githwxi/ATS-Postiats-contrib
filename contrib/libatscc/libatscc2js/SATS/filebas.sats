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

staload "./../basics_js.sats"

(* ****** ****** *)
//
(*
val STDIN : JSfile = "mac#"
val STDOUT : JSfile = "mac#"
val STDERR : JSfile = "mac#"
*)
macdef STDIN = $extval (JSfilr, "0")
macdef STDOUT = $extval (JSfilr, "1")
macdef STDERR = $extval (JSfilr, "2")
//
(* ****** ****** *)

(* end of [filebas.sats] *)
