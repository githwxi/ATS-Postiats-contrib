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

staload "./patsolve_z3_commarg.sats"

(* ****** ****** *)
//
(*
dynload "patsolve_cnstrnt.dats"
*)
val () = patsolve_cnstrnt__dynload() where
{
  extern fun patsolve_cnstrnt__dynload(): void = "ext#"
}
//
(* ****** ****** *)
//
(*
dynload "patsolve_parsing.dats"
*)
val () = patsolve_parsing__dynload() where
{
  extern fun patsolve_parsing__dynload(): void = "ext#"
}
//
(* ****** ****** *)

dynload "./patsolve_z3_commarg.dats"
dynload "./patsolve_z3_solving.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
println!
  ("Hello from [patsolve_z3]!")
//
val arglst =
  patsolve_z3_cmdline (argc, argv)
//
// HX: skipping argv[0]
//
val-~list_vt_cons(arg, arglst) = arglst
//
val ((*void*)) = patsolve_z3_commarglst (arglst)
//
} (* end of [main] *)

(* ****** ****** *)

(* end of [patsolve_z3_main.dats] *)