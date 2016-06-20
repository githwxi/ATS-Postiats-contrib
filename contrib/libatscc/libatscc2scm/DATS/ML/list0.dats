(*
** For writing ATS code
** that translates into Scheme
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2scmpre_ML_"
#define
ATS_STATIC_PREFIX "_ats2scmpre_ML_list0_"
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
staload "./../../basics_scm.sats"
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
staload "./../../SATS/list.sats"
staload "./../../SATS/ML/list0.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/ML/list0.dats"
//
(* ****** ****** *)

(* end of [list0.dats] *)
