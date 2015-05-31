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

extern
fun
the_Z3_context_vget
(
// argumentless
) : (Z3_context -<prf> void | Z3_context)

(* ****** ****** *)

(* end of [patsolve_z3_solving_ctx.dats] *)
