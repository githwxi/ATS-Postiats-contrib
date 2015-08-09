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
fprint_d2exp
  (out, d2e0) = let
in
//
  fprint (out, "D2E...")
//
end // end of [fprint_d2exp]

(* ****** ****** *)

implement
fprint_d2explst
  (out, d2es) = let
//
implement
fprint_list$sep<> (out) = fprint_string (out, ", ")
//
in
  fprint_list<d2exp> (out, d2es)
end // end of [fprint_d2explst]

(* ****** ****** *)

(* end of [patsunj2_synent2_d2exp.dats] *)
