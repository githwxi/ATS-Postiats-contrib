(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)
//
// HX-2014-11:
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
(* ****** ****** *)
//
staload "./../basics_pl.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/intrange.sats"
//
(* ****** ****** *)

(* end of [intrange.sats] *)
