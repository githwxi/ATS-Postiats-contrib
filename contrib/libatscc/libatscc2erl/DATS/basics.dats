(*
** For writing ATS code
** that translates into Erlang
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
// HX-2014-08:
// prefix for external names
//
#define
ATS_EXTERN_PREFIX "ats2erlpre_"
#define
ATS_STATIC_PREFIX "_ats2erlpre_basics_"
//
(* ****** ****** *)
//
staload "./../basics_erl.sats"
//
(* ****** ****** *)

(* end of [basics.dats] *)
