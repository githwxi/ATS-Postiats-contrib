(*
** For writing ATS code
** that translates into Perl
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2plpre_ML_"
#define
ATS_STATIC_PREFIX "_ats2plpre_ML_array0_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./../../basics_pl.sats"
//
(* ****** ****** *)
//
staload "./../../SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./../../SATS/print.sats"
staload "./../../SATS/filebas.sats"
//
(* ****** ****** *)
//
staload "./../../SATS/arrayref.sats"
staload "./../../SATS/ML/array0.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/ML/array0.dats"
//
(* ****** ****** *)

(* end of [array0.dats] *)
