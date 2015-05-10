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
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload UN =
"prelude/SATS/unsafe.sats"
//
staload
"./patsolve_constraint3.sats"
//
(* ****** ****** *)

implement
fprint_val<s2exp> = fprint_s2exp

(* ****** ****** *)

implement
fprint_s2exp
  (out, s2e) = let
in
//
case+
s2e.s2exp_node
of // case+
//
| S2Eint(i) => fprint! (out, "S2Eint(", i, ")")
| S2Eintinf(i) => fprint! (out, "S2Eintinf(", i, ")")
//
| S2Ecst(s2c) => fprint! (out, "S2Ecst(", s2c, ")")
| S2Evar(s2v) => fprint! (out, "S2Evar(", s2v, ")")
| S2EVar(s2V) => fprint! (out, "S2EVar(", s2V, ")")
//
| S2Eignored((*void*)) => fprint! (out, "S2Eignored()")
//
end // end of [fprint_s2exp]

(* ****** ****** *)

implement
fprint_s2explst
  (out, s2es) = let
//
implement
fprint_list$sep<> (out) = fprint_string (out, ", ")
//
in
  fprint_list<s2exp> (out, s2es)
end // end of [fprint_s2explst]

(* ****** ****** *)

(* end of [patsolve_constraint3_s2exp.dats] *)
