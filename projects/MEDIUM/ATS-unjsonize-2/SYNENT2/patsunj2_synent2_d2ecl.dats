(* ****** ****** *)
//
// ATS-unjsonize-2
//
(* ****** ****** *)
//
(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** HX-2015-08-08: start
*)
//
(* ****** ****** *)

implement
fprint_d2ecl
  (out, d2c0) = let
in
//
fprint (out, "D2C...")
//
end // end of [fprint_d2ecl]

(* ****** ****** *)

implement
fprint_d2eclist
  (out, d2cs) = let
//
implement
fprint_list$sep<> (out) = fprint_string (out, ", ")
//
in
  fprint_list<d2ecl> (out, d2cs)
end // end of [fprint_d2eclist]

(* ****** ****** *)

(* end of [patsunj2_synent2_d2ecl.dats] *)
