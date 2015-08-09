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
//
implement
fprint_val<stamp> = fprint_stamp
implement
fprint_val<symbol> = fprint_symbol
implement
fprint_val<loc_t> = fprint_location
//
(* ****** ****** *)

implement
print_stamp(x) = fprint_stamp(stdout_ref, x)

(* ****** ****** *)
//
implement
print_symbol(x) = fprint_symbol(stdout_ref, x)
//
(* ****** ****** *)
//
implement
print_label(x) = fprint_label(stdout_ref, x)
//
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

local
//
#include
"./SYNENT2/patsunj2_synent2_label.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_location.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_s2rt.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_s2cst.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_s2var.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_s2exp.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

(* end of [patsunj2_synent2.dats] *)
