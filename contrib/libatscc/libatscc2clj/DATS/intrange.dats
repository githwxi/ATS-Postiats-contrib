(*
** For writing ATS code
** that translates into Clojure
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2016-07:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2cljpre_"
#define
ATS_STATIC_PREFIX "_ats2cljpre_intrange_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
  "./../basics_clj.sats"
//
staload
  "./../SATS/integer.sats"
//
staload "./../SATS/list.sats"
//
(* ****** ****** *)
//
staload "./../SATS/intrange.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC}/DATS/intrange.dats"
//
(* ****** ****** *)

(* end of [intrange.dats] *)
