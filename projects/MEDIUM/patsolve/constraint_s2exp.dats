(*
** ATS constaint-solving
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./constraint.sats"

(* ****** ****** *)

implement
fprint_s2exp
  (out, s2e0) = let
in
//
case+ s2e0.s2exp_node of
//
| S2Eint (int) => fprint! (out, "S2Eint(", int, ")")
| S2Eintinf (rep) => fprint! (out, "S2Eintinf(", rep, ")")
//
| S2Ecst (s2c) => fprint! (out, "S2Ecst(", s2c, ")")
| S2Evar (s2v) => fprint! (out, "S2Evar(", s2v, ")")
| S2EVar (s2V) => fprint! (out, "S2EVar(", s2V, ")")
//
| S2Esizeof (s2e) => fprint! (out, "S2Esizeof(", s2e, ")")
//
| S2Eeqeq (s2e1, s2e2) =>
    fprint! (out, "S2Eeqeq(", s2e1, " == ", s2e2, ")")
//
| S2Eapp (s2e_fun, s2es_arg) =>
    fprint! (out, "S2Eapp(", s2e_fun, "; ", s2es_arg, ")")
//
| S2Emetdec (met, bound) =>
    fprint! (out, "S2Emetdec(", met, ",", bound, ")")
//
| S2Etop (knd, s2e) =>
    fprint! (out, "S2Etop(", knd, ",", s2e, ")")
//
| S2Eignored () => fprint! (out, "S2Eignored(", ")")
//
end // end of [fprint_d2exp]

(* ****** ****** *)

implement
fprint_s2explst
  (out, d2es) = let
//
implement
fprint_val<s2exp> = fprint_s2exp
implement
fprint_list$sep<> (out) = fprint_string (out, ", ")
//
in
  fprint_list<s2exp> (out, d2es)
end // end of [fprint_s2explst]

(* ****** ****** *)

implement
s2exp_make_node
  (s2t, node) = '{
  s2exp_srt= s2t, s2exp_node= node
} (* end of [s2exp_make_node] *)

(* ****** ****** *)
//
implement
s2exp_cst (s2t, s2c) =
  s2exp_make_node (s2t, S2Ecst(s2c))
//
implement
s2exp_var (s2t, s2v) =
  s2exp_make_node (s2t, S2Evar(s2v))
//
implement
s2exp_from_var (s2v) = let
  val srt = s2var_get_srt (s2v)
in
  s2exp_make_node (srt, S2Evar(s2v))
end
//
implement
s2exp_eqeq (s2e0, s2e1) =
  s2exp_make_node (s2e0.s2exp_srt, S2Eeqeq (s2e0, s2e1))
  
(* ****** ****** *)

implement
s2exp_ignored (s2t) =
  s2exp_make_node (s2t, S2Eignored())
//
(* ****** ****** *)

(* end of [constraint_s2exp.dats] *)