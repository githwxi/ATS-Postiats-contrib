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

staload "./patsolve_smt2_commarg.sats"
staload "./patsolve_smt2_solving.sats"

(* ****** ****** *)
//
(*
dynload "patsolve_cnstrnt.dats"
*)
val () =
  patsolve_cnstrnt__dynload() where
{
  extern
  fun
  patsolve_cnstrnt__dynload(): void = "ext#"
}
//
(* ****** ****** *)
//
(*
dynload "patsolve_parsing.dats"
*)
val () =
  patsolve_parsing__dynload() where
{
  extern
  fun
  patsolve_parsing__dynload(): void = "ext#"
}
//
(* ****** ****** *)

dynload "./patsolve_smt2_commarg.dats"
dynload "./patsolve_smt2_solving.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
prerrln!
  ("Hello from [patsolve_smt2]!")
//
val () = the_s2cinterp_initize()
//
val
arglst =
patsolve_smt2_cmdline (argc, argv)
//
// HX: skipping argv[0]
//
val-~list_vt_cons(_, arglst) = arglst
//
val () = patsolve_smt2_commarglst(arglst)
//
} (* end of [main] *)

(* ****** ****** *)

(* end of [patsolve_smt2_main.dats] *)
