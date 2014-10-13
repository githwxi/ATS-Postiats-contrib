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
fun lt_string_string
  : (string, string) -> bool = "mac#%"
fun lte_string_string
  : (string, string) -> bool = "mac#%"
fun gt_string_string
  : (string, string) -> bool = "mac#%"
fun gte_string_string
  : (string, string) -> bool = "mac#%"
//
fun eq_string_string
  : (string, string) -> bool = "mac#%"
fun neq_string_string
  : (string, string) -> bool = "mac#%"
//
(* ****** ****** *)
//
overload < with lt_string_string of 100
overload <= with lte_string_string of 100
overload > with gt_string_string of 100
overload >= with gte_string_string of 100
//
overload = with eq_string_string of 100
overload != with neq_string_string of 100
overload <> with neq_string_string of 100
//
(* ****** ****** *)
//
fun compare_string_string
  : (string, string) -> intBtwe(~1, 1) = "mac#%"
//
overload compare with compare_string_string of 100
//
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
  (str: string, index: int): char = "mac#%"
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
//
fun
string_append
(
  str1: string, str2: string
) : string = "mac#%"
//
overload + with string_append of 100
//
(* ****** ****** *)
//
fun
string_concat_2
(
  str1: string, str2: string
) : string = "mac#%"
fun
string_concat_3
(
  str1: string, str2: string, str3: string
) : string = "mac#%"
//
symintr string_concat
overload string_concat with string_concat_2 of 100
overload string_concat with string_concat_3 of 100
//
(* ****** ****** *)

(* end of [string.sats] *)
