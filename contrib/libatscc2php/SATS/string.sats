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
fun
string_length (string): int = "mac#%"
//
overload .length with string_length of 100
//
(* ****** ****** *)
//
fun
print_string (str: string): void = "mac#%"
fun
prerr_string (str: string): void = "mac#%"
//
fun
fprint_string: (PHPfilr, string) -> void = "mac#%"
//
(* ****** ****** *)
//
overload print with print_string of 100
overload prerr with prerr_string of 100
overload fprint with fprint_string of 100
//
(* ****** ****** *)

(* end of [string.sats] *)
