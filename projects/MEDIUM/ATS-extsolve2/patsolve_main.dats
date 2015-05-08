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
"patsolve_constraint3_location.dats"
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
