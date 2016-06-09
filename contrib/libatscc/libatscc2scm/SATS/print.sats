(*
** For writing ATS code
** that translates into Scheme
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "ats2scmpre_"
//
(* ****** ****** *)

staload "./../basics_scm.sats"

(* ****** ****** *)

fun print_int : int -> void = "mac#%"

(* ****** ****** *)

fun print_bool : bool -> void = "mac#%"

(* ****** ****** *)

fun print_char : char -> void = "mac#%"

(* ****** ****** *)

fun print_double : double -> void = "mac#%"

(* ****** ****** *)
//
fun print_string : string -> void = "mac#%"
//
(* ****** ****** *)

fun print_SCMval : (SCMval) -> void = "mac#%"

(* ****** ****** *)

(*
fun print_obj{a:t0p}(obj: a): void = "mac#%"
*)

(* ****** ****** *)

fun print_newline : ((*void*)) -> void = "mac#%"

(* ****** ****** *)

overload print with print_int of 100
overload print with print_bool of 100
overload print with print_double of 100
overload print with print_string of 100

(* ****** ****** *)

overload print with print_SCMval of 100

(* ****** ****** *)
//  
fun{a:t0p} print_val (x: a): void = "mac#%"
//
(* ****** ****** *)

(* end of [print.sats] *)
