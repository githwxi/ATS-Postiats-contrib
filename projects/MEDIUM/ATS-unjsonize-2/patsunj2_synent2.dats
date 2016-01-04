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
fprint_val<label> = fprint_label
//
implement
fprint_val<loc_t> = fprint_location
//
(* ****** ****** *)
//
implement
fprint_val<s2rt> = fprint_s2rt
//
implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2var> = fprint_s2var
//
implement
fprint_val<s2exp> = fprint_s2exp
implement
fprint_val<labs2exp> = fprint_labs2exp
//
(* ****** ****** *)

implement
fprint_val<d2con> = fprint_d2con
implement
fprint_val<d2cst> = fprint_d2cst
implement
fprint_val<d2var> = fprint_d2var
implement
fprint_val<d2exp> = fprint_d2exp

(* ****** ****** *)

implement
fprint_val<d2ecl> = fprint_d2ecl

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

local
//
#include
"./SYNENT2/patsunj2_synent2_d2exp.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

local
//
#include
"./SYNENT2/patsunj2_synent2_d2ecl.dats" in (*nothing*)
//
end // end of [local]

(* ****** ****** *)

(* end of [patsunj2_synent2.dats] *)
