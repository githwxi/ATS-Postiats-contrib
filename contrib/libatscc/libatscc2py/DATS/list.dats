(*
** For writing ATS code
** that translates into Python
*)

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
ATS_STATIC_PREFIX "_ats2pypre_list_"
//
(* ****** ****** *)
//
staload UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include "./../staloadall.hats"
//
(* ****** ****** *)

%{^
######
from ats2pypre_basics_cats import *
######
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include "{$LIBATSCC}/DATS/list.dats"
//
(* ****** ****** *)

(* end of [list.dats] *)
