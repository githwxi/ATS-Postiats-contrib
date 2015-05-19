(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)

implement
fprint_h3ypo
  (out, h3p) =
(
//
case
h3p.h3ypo_node
of // case+
//
| H3YPOprop(s2e) =>
    fprintln! (out, "H3YPOprop(", s2e, ")")
//
| H3YPObind(s2v1, s2e2) =>
    fprintln! (out, "H3YPObind(", s2v1, " -> ", s2e2, ")")
//
| H3YPOeqeq(s2e1, s2e2) =>
    fprintln! (out, "H3YPObind(", s2e1, " == ", s2e2, ")")
//
) (* end of [fprint_h3ypo] *)

(* ****** ****** *)

(* end of [patsolve_cnstrnt_h3ypo.dats] *)
