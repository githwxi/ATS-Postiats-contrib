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
dynload
"patsolve_cnstrnt_stamp.dats"
//
(* ****** ****** *)
//
dynload
"patsolve_cnstrnt_symbol.dats"
//
(* ****** ****** *)
//
dynload
"patsolve_cnstrnt_location.dats"
//
(* ****** ****** *)
//
dynload
"patsolve_cnstrnt_s2cst.dats"
dynload
"patsolve_cnstrnt_s2var.dats"
dynload
"patsolve_cnstrnt_s2vvar.dats"
//
dynload
"patsolve_cnstrnt_s2exp.dats"
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
