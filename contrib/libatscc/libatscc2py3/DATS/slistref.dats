(*
** For writing ATS code
** that translates into Python
*)

(* ****** ****** *)
//
// HX: list-bsaed stack
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2pypre_"
#define
ATS_STATIC_PREFIX "_ats2pypre_slistref_"
//
(* ****** ****** *)

%{^
######
from ats2pypre_basics_cats import *
######
from ats2pypre_bool_cats import *
from ats2pypre_integer_cats import *
######
from ats2pypre_reference_dats import *
######
%} // end of [%{^]

(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include "./../staloadall.hats"
//
(* ****** ****** *)
//
#include "share/atspre_define.hats"
//
#include "{$LIBATSCC}/DATS/slistref.dats"
//
(* ****** ****** *)

(* end of [slistref.dats] *)
