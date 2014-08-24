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
fun not_bool0 : bool -> bool = "mac#%"
//
(* ****** ****** *)
//
fun not_bool1
  : {b:bool} bool(b) -> bool(~b) = "mac#%"
//
(* ****** ****** *)

overload ~ with not_bool0 of 100
overload ~ with not_bool1 of 120

(* ****** ****** *)
//
fun print_bool : (bool) -> void = "mac#%"
fun prerr_bool : (bool) -> void = "mac#%"
//
fun
fprint_bool : (PYfile, bool) -> void = "mac#%"
//
overload print with print_bool of 100
overload prerr with prerr_bool of 100
overload fprint with fprint_bool of 100
//
(* ****** ****** *)

(* end of [bool.sats] *)
