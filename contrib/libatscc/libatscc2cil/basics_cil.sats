(*
** For writing ATS code
** that translates into CIL
*)

(* ****** ****** *)

#define
ATS_EXTERN_PREFIX "ats2cilpre_"

(* ****** ****** *)

%{#
#include "libatscc2cil/CATS/basics_cil.cats"
#include "libatscc2cil/CATS/integer_cil.cats"
#include "libatscc2cil/CATS/float_cil.cats"
%} // end of [%{#]

(* ****** ****** *)

fun print_int : (int) -> void = "mac#%"
fun print_bool : (bool) -> void = "mac#%"
fun print_double : (double) -> void = "mac#%"
fun print_string : (string) -> void = "mac#%"

(* ****** ****** *)

overload print with print_int of 100
overload print with print_bool of 100
overload print with print_double of 100
overload print with print_string of 100

(* ****** ****** *)

fun print_newline ((*void*)): void = "mac#%"

(* ****** ****** *)

(* end of [basics_cil.sats] *)
