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
| S2RTint() => sort_int()
| S2RTaddr() => sort_int()
| S2RTbool() => sort_bool()
//
| S2RTreal() => sort_real()
(*
| S2RTstring() => sort_string()
*)
//
| _(*unrecognized*) => sort_error()
//
end (* end of [sort_make_s2rt] *)

(* ****** ****** *)

(* end of [patsolve_z3_solving_sort.dats] *)
