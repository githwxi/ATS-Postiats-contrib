(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)

(*
** Node.js/basics
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2js_node_"
//
(* ****** ****** *)

abstype NJSstream // readable/writable

(* ****** ****** *)

fun print_newline ((*void*)): void = "mac#%"
fun prerr_newline ((*void*)): void = "mac#%"
fun fprint_newline (NJSstream): void = "mac#%"

(* ****** ****** *)
//
fun print_obj{a:t0p}(obj: a): void = "mac#%"
fun prerr_obj{a:t0p}(obj: a): void = "mac#%"
fun fprint_obj{a:t0p}(NJSstream, a): void = "mac#%"
//
fun println_obj{a:t0p}(obj: a): void = "mac#%"
fun prerrln_obj{a:t0p}(obj: a): void = "mac#%"
fun fprintln_obj{a:t0p}(NJSstream, a): void = "mac#%"
//
(* ****** ****** *)
//
fun print_int : (int) -> void = "mac#%"
fun prerr_int : (int) -> void = "mac#%"
//
fun fprint_int: (NJSstream, int) -> void = "mac#%"
//
overload print with print_int of 100
overload prerr with prerr_int of 100
overload fprint with fprint_int of 100
//
(* ****** ****** *)
//
fun print_string (str: string): void = "mac#%"
fun prerr_string (str: string): void = "mac#%"
fun fprint_string (NJSstream, string): void = "mac#%"
//
(* ****** ****** *)
//
overload print with print_string of 100
overload prerr with prerr_string of 100
overload fprint with fprint_string of 100
//
(* ****** ****** *)

(* end of [basics.sats] *)
