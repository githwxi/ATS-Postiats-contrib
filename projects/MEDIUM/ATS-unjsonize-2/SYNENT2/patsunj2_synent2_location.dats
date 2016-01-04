(* ****** ****** *)
//
// ATS-unjsonize-2
//
(* ****** ****** *)
//
(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** HX-2015-08-07: start
*)
//
(* ****** ****** *)

assume location_type = string

(* ****** ****** *)

implement
location_make (rep) = rep

(* ****** ****** *)

implement
fprint_location
  (out, loc) = fprint_string (out, loc)
// end of [fprint_location]

(* ****** ****** *)

(* end of [patsunj2_synent2_location.dats] *)
