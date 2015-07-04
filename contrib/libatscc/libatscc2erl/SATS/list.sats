(*
** For writing ATS code
** that translates into Erlang
*)

(* ****** ****** *)
//
// HX-2015-07:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2erlpre_"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./../basics_erl.sats"

(* ****** ****** *)
//
#include "{$LIBATSCC}/SATS/list.sats"
//
(* ****** ****** *)

(* end of [list.sats] *)
