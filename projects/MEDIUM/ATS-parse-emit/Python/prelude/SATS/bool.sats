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

(* end of [bool.sats] *)
