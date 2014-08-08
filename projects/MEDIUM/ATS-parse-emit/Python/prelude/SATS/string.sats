(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "atspre2py_"
//
(* ****** ****** *)
//
fun string_get_at
  {n:int}{i:nat | i < n}
  (str: string(n), i: int(i)): charNZ = "mac#%"
//
overload [] with string_get_at of 100
//
(* ****** ****** *)

fun string_isalnum : string -> bool = "mac#%"
fun string_isalpha : string -> bool = "mac#%"
fun string_isdecimal : string -> bool = "mac#%"

(* ****** ****** *)

fun string_lower (str: string): string = "mac#%"
fun string_upper (str: string): string = "mac#%"

(* ****** ****** *)

(* end of [string.sats] *)
