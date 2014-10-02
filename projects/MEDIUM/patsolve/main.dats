(**
  A constraint solver using Z3.
*)
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "constraint.sats"
staload "parsing/parsing.sats"
staload "solving/solver.sats"

(* ****** ****** *)

dynload "constraint_dynload.dats"
dynload "parsing/parsing_dynload.dats"
dynload "solving/solver_dynload.dats"

(* ****** ****** *)

dynload "solving/Z3/z3_dynload.dats"

(* ****** ****** *)

#define :: list_cons
#define nil list_nil

(* ****** ****** *)

implement main0 (argc, argv) = let
  val c3t = parse_c3nstr_from_stdin ()
  val () = constraint3_initialize ()
  val scripts = (if argc >= 2 then let
    (**
      Allow a user to supply just one file for now.
    *)
    val filename = argv[1]
  in
    filename :: nil
  end
  else
    nil ()
  ): List0 (string)
in
  c3nstr_solve (c3t, scripts)
end