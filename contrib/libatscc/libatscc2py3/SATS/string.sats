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
//
fun
string_get_at
  {n:int}{i:nat | i < n}
(
  str: string(n), i: int(i)
) : charNZ = "mac#%" // end-of-fun
//
overload [] with string_get_at of 100
//
(* ****** ****** *)
fun
string_isalnum : string -> bool = "mac#%"
fun
string_isalpha : string -> bool = "mac#%"
fun
string_isdecimal : string -> bool = "mac#%"

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
