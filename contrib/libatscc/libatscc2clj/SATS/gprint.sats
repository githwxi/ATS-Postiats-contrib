(*
** For writing ATS code
** that translates into Clojure
*)

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2cljpre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./../basics_clj.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/gprint.sats"
//
(* ****** ****** *)

(* end of [gprint.sats] *)
