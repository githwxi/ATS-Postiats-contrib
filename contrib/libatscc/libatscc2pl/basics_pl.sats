(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2plpre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include "{$LIBATSCC}/basics.sats"
//
(* ****** ****** *)

abstype PLfile

(* ****** ****** *)

abstype PLarray(a:t@ype)

(* ****** ****** *)

fun print_newline ((*void*)): void = "mac#%"
fun prerr_newline ((*void*)): void = "mac#%"
fun fprint_newline (out: PLfile): void = "mac#%"

(* ****** ****** *)

(* end of [basics_pl.sats] *)
