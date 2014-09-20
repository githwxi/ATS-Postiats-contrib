(*
** For writing ATS code
** that translates into PHP
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2phppre_"
#define
ATS_STATIC_PREFIX "_ats2phppre_intrange_"
//
(* ****** ****** *)
//
#include "./../staloadall.hats"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include "{$LIBATSCC}/DATS/intrange.dats"
//
(* ****** ****** *)

(* end of [intrange.dats] *)
