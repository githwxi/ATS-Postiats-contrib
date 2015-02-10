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
//
fun
string_length (string): int = "mac#%"
//
overload .length with string_length of 100
//
(* ****** ****** *)

(* end of [string.sats] *)
