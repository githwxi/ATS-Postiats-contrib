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

implement
fprint_label
  (out, lab) =
(
//
case+ lab of
//
| LABint(int) =>
    fprint! (out, "LABint(", int, ")")
//
| LABsym(sym) =>
    fprint! (out, "LABsym(", sym, ")")
//
) (* end of [fprint_label] *)

(* ****** ****** *)

(* end of [patsunj2_synent2_label.dats] *)
