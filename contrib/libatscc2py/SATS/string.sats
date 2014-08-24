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

staload "./../basics_py.sats"

(* ****** ****** *)
//
fun
string_get_at
  {n:int}{i:nat | i < n}
  (str: string(n), i: int(i)): charNZ = "mac#%"
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

fun
string_lower (str: string): string = "mac#%"
fun
string_upper (str: string): string = "mac#%"

(* ****** ****** *)
//
fun
print_string (str: string): void = "mac#%"
fun
prerr_string (str: string): void = "mac#%"
//
fun
fprint_string : (PYfile, string) -> void = "mac#%"
//
overload print with print_string of 100
overload prerr with prerr_string of 100
overload fprint with fprint_string of 100
//
(* ****** ****** *)

(* end of [string.sats] *)
