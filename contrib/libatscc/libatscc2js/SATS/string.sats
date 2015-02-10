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
string_charAt{n:int}
  (str: string(n), i: natLt(n)): string = "mac#%"
//
(* ****** ****** *)
//
fun
string_charCodeAt{n:int}
  (str: string(n), index: natLt(n)): int = "mac#%"
//
(* ****** ****** *)
//
fun
string_fromCharCode_1
  (c1: int): string = "mac#%"
fun
string_fromCharCode_2
  (c1: int, c2: int): string = "mac#%"
fun
string_fromCharCode_3
  (c1: int, c2: int, c3: int): string = "mac#%"
fun
string_fromCharCode_4
  (c1: int, c2: int, c3: int, c4: int): string = "mac#%"
fun
string_fromCharCode_5
  (c1: int, c2: int, c3: int, c4: int, c5: int): string = "mac#%"
fun
string_fromCharCode_6
  (c1: int, c2: int, c3: int, c4: int, c5: int, c6: int): string = "mac#%"
//
symintr string_fromCharCode
overload string_fromCharCode with string_fromCharCode_1
overload string_fromCharCode with string_fromCharCode_2
overload string_fromCharCode with string_fromCharCode_3
overload string_fromCharCode with string_fromCharCode_4
overload string_fromCharCode with string_fromCharCode_5
overload string_fromCharCode with string_fromCharCode_6
//
(* ****** ****** *)
//
fun
string_indexOf_2
  (str: string, key: string): int = "mac#%"
fun
string_indexOf_3
  (str: string, key: string, start: int): int = "mac#%"
//
symintr string_indexOf
overload string_indexOf with string_indexOf_2
overload string_indexOf with string_indexOf_3
//
(* ****** ****** *)
//
fun
string_lastIndexOf_2
  (str: string, key: string): int = "mac#%"
fun
string_lastIndexOf_3
  (str: string, key: string, start: int): int = "mac#%"
//
symintr string_lastIndexOf
overload string_lastIndexOf with string_lastIndexOf_2
overload string_lastIndexOf with string_lastIndexOf_3
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
) : string = "mac#%" // endfun
fun
string_concat_3
(
  str1: string, str2: string, str3: string
) : string = "mac#%" // end-of-fun
//
symintr string_concat
overload string_concat with string_concat_2 of 100
overload string_concat with string_concat_3 of 100
//
(* ****** ****** *)

(* end of [string.sats] *)
