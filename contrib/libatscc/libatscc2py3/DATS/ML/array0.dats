(*
** For writing ATS code
** that translates into Python3
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_ML_"
#define
ATS_STATIC_PREFIX "_ats2pypre_ML_array0_"
//
(* ****** ****** *)

%{^
######
from ats2pypre_basics_cats import *
######
from ats2pypre_arrayref_dats import *
######
%} // end of [%{^]

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
staload "./../../basics_py.sats"
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
