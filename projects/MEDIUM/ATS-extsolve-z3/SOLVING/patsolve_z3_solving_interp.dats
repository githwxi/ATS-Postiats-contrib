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
//
implement
print_s2cinterp
  (x) = fprint_s2cinterp(stdout_ref, x)
implement
fprint_s2cinterp
  (out, x) = let
in
//
case+ x of
//
| S2CINTnone() => fprint! (out, "S2CINTnone()")
//
| S2CINTbuiltin_0 _ => fprint! (out, "S2CINTbuiltin_0(...)")
| S2CINTbuiltin_1 _ => fprint! (out, "S2CINTbuiltin_1(...)")
| S2CINTbuiltin_2 _ => fprint! (out, "S2CINTbuiltin_2(...)")
| S2CINTbuiltin_lst _ => fprint! (out, "S2CINTbuiltin_lst(...)")
//
end // end of [fprint_s2cinterp]
//
(* ****** ****** *)

(* end of [patsolve_z3_solving_interp.dats] *)
