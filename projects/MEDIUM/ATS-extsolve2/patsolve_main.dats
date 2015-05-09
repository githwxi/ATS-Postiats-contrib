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
dynload
"patsolve_constraint3_stamp.dats"
//
(* ****** ****** *)
//
dynload
"patsolve_constraint3_symbol.dats"
//
(* ****** ****** *)
//
dynload
"patsolve_constraint3_location.dats"
//
(* ****** ****** *)
//
dynload
"patsolve_constraint3_s2cst.dats"
dynload
"patsolve_constraint3_s2var.dats"
dynload
"patsolve_constraint3_s2vvar.dats"
//
(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () = println! ("Hello from patsolve!")
//
} (* end of [main] *)

(* ****** ****** *)

(* end of [patsolve_main.dats] *)
