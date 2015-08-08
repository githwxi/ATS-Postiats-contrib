(* ****** ****** *)
//
// ATS-unjsonize-2
//
(* ****** ****** *)
//
(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** HX-2015-08-06: start
*)
//
(* ****** ****** *)
//
#define
ATS_PACKNAME "PATSUNJ2"
//
(* ****** ****** *)
//
#define ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"patsunj2_synent2__dynload"
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./patsunj2_synent2.sats"

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_stamp.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_symbol.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

(* end of [patsunj2_synent2.dats] *)
