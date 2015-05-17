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

staload "./patsolve_main.sats"

(* ****** ****** *)
//
dynload "patsolve_cnstrnt.dats"
//
(* ****** ****** *)
//
dynload "patsolve_parsing.dats"
//
(* ****** ****** *)
//
dynload "patsolve_commarg.dats"
//
(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
println! ("Hello from patsolve!")
//
val arglst = patsolve_cmdline (argc, argv)
val ((*void*)) = patsolve_commarglst (arglst)
//
} (* end of [main] *)

(* ****** ****** *)

(* end of [patsolve_main.dats] *)
