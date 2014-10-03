(**
  A constraint solver using Z3.
*)
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "patsolve.sats"
staload "constraint/constraint.sats"
staload "parsing/parsing.sats"
staload "solving/solver.sats"

(* ****** ****** *)

dynload "constraint/constraint_dynload.dats"
dynload "parsing/parsing_dynload.dats"
dynload "solving/solver_dynload.dats"

(* ****** ****** *)

dynload "solving/Z3/z3_dynload.dats"

(* ****** ****** *)

dynload "commarg.dats"

(* ****** ****** *)

#define :: list_cons
#define nil list_nil

(* ****** ****** *)

implement main0 (argc, argv) = let
  val c3t = parse_c3nstr_from_stdin ()
  val () = constraint3_initialize ()
  val args = parse_argv (argc, argv)
  //
  macdef nonlinear = list_of_list_vt  
  //  
  implement
  list_filter$pred<commarg> (x) = 
    case+ x of 
      | Script (s) => true
      | _ =>> false
  implement
  list_map$fopr<commarg><string> (x) = 
    case- x of 
      | Script (s) => s
  val scripts = nonlinear (list_map<commarg><string> (nonlinear (
    list_filter(args)
  )))
  //
  implement
  list_find$pred<commarg> (x) =
    case+ x of 
      | Verbose () => true
      | _ =>> false
  val opt = list_find_opt (args)
  val verbose = (
    case+ opt of
      | ~Some_vt _ => true
      | ~None_vt () => false
  ): bool
  //
in
  c3nstr_solve (c3t, scripts, verbose)
end