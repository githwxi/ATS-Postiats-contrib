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

typedef strchr = string(1)

(* ****** ****** *)
//
fun
string_get_at
{n:int}{i:nat | i < n}
(
  str: string(n), i: int(i)
) : strchr = "mac#%" // end-of-fun
//
overload [] with string_get_at of 100
//
(* ****** ****** *)
//
fun
string_length
  {n:int}(string(n)): int(n) = "mac#%"
//
overload length with string_length of 100
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
fun
compare_string_string:
  (string, string) -> intBtwe(~1, 1) = "mac#%"
//
overload
compare with compare_string_string of 100
//
(* ****** ****** *)
//
fun
string_isalnum : string -> bool = "mac#%"
fun
string_isalpha : string -> bool = "mac#%"
fun
string_isdecimal : string -> bool = "mac#%"
//
(* ****** ****** *)
//`
fun
string_append
  (string, string): string = "mac#%"
//
overload + with string_append of 100
//
(* ****** ****** *)

fun string_lower(string): string = "mac#%"
fun string_upper(string): string = "mac#%"

(* ****** ****** *)

(* end of [string.sats] *)
