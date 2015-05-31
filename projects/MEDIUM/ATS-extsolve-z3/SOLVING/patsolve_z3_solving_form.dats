(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#ifndef
PATSOLVE_Z3_SOLVING
#include "./myheader.hats"
#endif // end of [ifndef]
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
formula_make_s2exp
  (env, s2e0) = let
//
val () =
println!
  ("formula_make_s2exp: s2e0 = ", s2e0)
//
in
//
case+
s2e0.s2exp_node
of // case+
//
| S2Eint(i) => formula_int(i)
| S2Eintinf(i) => formula_intrep(i)
//
| S2Eeqeq
    (s2e1, s2e2) => let
    val s2e1 =
      formula_make_s2exp(env, s2e1)
    and s2e2 =
      formula_make_s2exp(env, s2e2) in formula_eqeq (s2e1, s2e2)
  end // end of [S2Eeqeq]
//
| _ (*unrecognized*) => formula_error()
//
end // end of [formula_make_s2exp]

(* ****** ****** *)

(* end of [patsolve_z3_solving_form.dats] *)
