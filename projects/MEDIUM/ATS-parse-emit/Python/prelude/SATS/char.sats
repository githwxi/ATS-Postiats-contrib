(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "ats2pypre_"
//
(* ****** ****** *)
//
fun print_char : (char) -> void = "mac#%"
fun prerr_char : (char) -> void = "mac#%"
//
fun
fprint_char: (FILEref, char) -> void = "mac#%"
//
overload print with print_char of 100
overload prerr with prerr_char of 100
overload fprint with fprint_char of 100
//
(* ****** ****** *)

(* end of [char.sats] *)
