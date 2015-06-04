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
s2exp_make_node
  (s2t, s2en) = '{
  s2exp_srt= s2t, s2exp_node= s2en
} (* end of [s2exp_make_node] *)

(* ****** ****** *)
//
implement
s2exp_var(s2v) =
  s2exp_make_node(s2v.srt(), S2Evar(s2v))
implement
s2exp_eqeq(s2e1, s2e2) =
  s2exp_make_node(s2rt_bool(), S2Eeqeq(s2e1, s2e2))
//
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
| S2Eeqeq(s2e1, s2e2) =>
    fprint! (out, "S2Eeqeq(", s2e1, ", ", s2e2, ")")
//
| S2Eapp(s2e_fun, s2es_arg) =>
    fprint! (out, "S2Eapp(", s2e_fun, "; ", s2es_arg, ")")
//
| S2Emetdec(s2es_met, s2es_bound) =>
    fprint! (out, "S2Emetdec(", s2es_met, "; ", s2es_bound, ")")
//
| S2Einvar(s2e) => fprint! (out, "S2Einvar(", s2e, ")")
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

(* end of [patsolve_cnstrnt_s2exp.dats] *)
