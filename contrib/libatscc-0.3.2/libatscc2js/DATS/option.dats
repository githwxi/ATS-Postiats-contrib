(*
** For writing ATS code
** that translates into Javascript
*)

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
ATS_STATIC_PREFIX "_ats2jspre_option_"
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
staload "./../SATS/integer.sats"
//
(* ****** ****** *)
//
staload "./../SATS/option.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/option.dats"
//
(* ****** ****** *)

(* end of [option.dats] *)
