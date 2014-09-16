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
fun print_char : (char) -> void = "mac#%"
fun prerr_char : (char) -> void = "mac#%"
//
fun
fprint_char : (PYfile, char) -> void = "mac#%"
//
overload print with print_char of 100
overload prerr with prerr_char of 100
overload fprint with fprint_char of 100
//
(* ****** ****** *)

(* end of [char.sats] *)
