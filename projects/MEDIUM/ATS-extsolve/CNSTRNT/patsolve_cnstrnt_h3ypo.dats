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
h3ypo_make_node
  (loc, node) = '{
  h3ypo_loc= loc, h3ypo_node= node
} (* end of [h3ypo_make_node] *)

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
    fprint! (out, "H3YPOprop(", s2e, ")")
//
| H3YPObind(s2v1, s2e2) =>
    fprint! (out, "H3YPObind(", s2v1, " -> ", s2e2, ")")
//
| H3YPOeqeq(s2e1, s2e2) =>
    fprint! (out, "H3YPOeqeq(", s2e1, " == ", s2e2, ")")
//
) (* end of [fprint_h3ypo] *)

(* ****** ****** *)

implement
s2exp_make_h3ypo
  (h3p) = let
in
//
case+
h3p.h3ypo_node of
  | H3YPOprop s2p => s2p
  | H3YPObind
      (s2v1, s2e2) =>
    (
      s2exp_eqeq (s2exp_var(s2v1), s2e2)
    ) (* end of [H3YPObind] *)
  | H3YPOeqeq (s2e1, s2e2) => s2exp_eqeq (s2e1, s2e2)
//
end (* end of [s2exp_make_h3ypo] *)

(* ****** ****** *)

(* end of [patsolve_cnstrnt_h3ypo.dats] *)
