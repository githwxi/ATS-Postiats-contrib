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
sort_make_s2rt(s2t0) = let
//
val () =
println! ("sort_make: s2t0 = ", s2t0)
//
in
//
case+ s2t0 of
//
| S2RTint() => sort_make_int()
| S2RTaddr() => sort_make_int()
| S2RTbool() => sort_make_bool()
//
| S2RTreal() => sort_make_real()
//
| _(*unrecognized*) => sort_make_int()
//
end (* end of [sort_make_s2rt] *)

(* ****** ****** *)

implement
formula_make_s2exp
  (env, s2e0) = let
in
  $UN.castvwtp0{form}(exit(1){ptr})
end // end of [formula_make_s2exp]

(* ****** ****** *)

(* end of [patsolve_z3_solvig_smt.dats] *)
