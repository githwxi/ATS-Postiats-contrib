(**
  A constraint solver built on top of Z3.
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

overload mapfree with list_vt_mapfree
overload filter with list_vt_filter

(* ****** ****** *)

implement main0 (argc, argv) = let
  val c3t = parse_c3nstr_from_stdin ()
  val () = constraint3_initialize ()
  val args = parse_argv (argc, argv)
  //
  macdef nonlinear = list_of_list_vt  
  //
  implement
  list_vt_freelin$clear<commarg> (x) = {
    val () = topize (x)
  }
  implement
  list_vt_filter$pred<commarg> (x) =
    case+ x of 
      | Script (s) => true
      | _ =>> false
  implement
  list_vt_mapfree$fopr<commarg><string> (x) =
    case- x of
      | Script (s) => s
  //
  val scriptargs = filter (list_vt_copy (args))
  val scripts = mapfree<commarg><string> (scriptargs)
  //
  implement
  list_find$pred<commarg> (x) =
    case+ x of
      | Verbose () => true
      | _ =>> false
  val opt = list_find_opt (nonlinear(args))
  val verbose = (
    case+ opt of
      | ~Some_vt _ => true
      | ~None_vt () => false
  ): bool
  //
in
  c3nstr_solve (c3t, nonlinear (scripts), verbose)
end