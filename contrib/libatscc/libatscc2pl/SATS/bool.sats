(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)
//
// HX-2014-11-16:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2plpre_"
//
(* ****** ****** *)

staload "./../basics_pl.sats"

(* ****** ****** *)
//
fun
print_bool : (bool) -> void = "mac#%"
fun
prerr_bool : (bool) -> void = "mac#%"
//
fun
fprint_bool : (PLfile, bool) -> void = "mac#%"
//
overload print with print_bool of 100
overload prerr with prerr_bool of 100
overload fprint with fprint_bool of 100
//
(* ****** ****** *)

(* end of [bool.sats] *)
