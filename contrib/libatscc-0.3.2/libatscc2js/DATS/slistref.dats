(*
** For writing ATS code
** that translates into JavaScript
*)

(* ****** ****** *)
//
// HX: list-based stack
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2jspre_"
#define
ATS_STATIC_PREFIX "_ats2jspre_slistref_"
//
(* ****** ****** *)
//
(*
#include
"share/atspre_define.hats"
*)
//
#define
LIBATSCC_targetloc
"$PATSCONTRIB/contrib/libatscc-0.3.2"
//
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
#include "{$LIBATSCC}/DATS/slistref.dats"
//
(* ****** ****** *)

(* end of [slistref.dats] *)
