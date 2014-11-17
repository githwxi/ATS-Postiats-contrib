(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)
//
// HX: prefix for external names
//
#define ATS_EXTERN_PREFIX "ats2plpre_"
//
(* ****** ****** *)

fun print_obj{a:t0p}(obj: a): void = "mac#%"

(* ****** ****** *)

fun{a:t0p} print_val (x: a): void = "mac#%"
  
(* ****** ****** *)

(* end of [print.sats] *)
