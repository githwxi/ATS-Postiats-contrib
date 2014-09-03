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
fun
string_length (string): int = "mac#%"
//
overload .length with string_length of 100
//
(* ****** ****** *)
//
fun
string_charAt
  (str: string, index: int): int = "mac#%"
//
(* ****** ****** *)
//
fun
string_charCodeAt
  (str: string, index: int): int = "mac#%"
//
(* ****** ****** *)
//
fun
string_indexOf (str: string, c: char): int = "mac#%"
//
(* ****** ****** *)

(* end of [string.sats] *)
