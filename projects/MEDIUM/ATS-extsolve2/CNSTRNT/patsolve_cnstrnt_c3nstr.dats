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

implement
fprint_c3nstr
  (out, c3t) =
(
//
case
c3t.c3nstr_node
of // case+
| C3NSTRprop(s2e) =>
    fprintln! (out, "C3NSTRprop(", s2e, ")")
| C3NSTRitmlst(s3is) =>
    fprintln! (out, "C3NSTRitmlst(", s3is, ")")
//
) (* end of [fprint_c3nstr] *)

(* ****** ****** *)
//
implement
fprint_c3nstropt
  (out, opt) = fprint_option(out, opt)
//
(* ****** ****** *)

(* end of [patsolve_cnstrnt_c3nstr.dats] *)
