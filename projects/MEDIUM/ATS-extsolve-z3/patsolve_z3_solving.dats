(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#define
PATSOLVE_targetloc "./.ATS-extsolve"
//
(* ****** ****** *)
//
staload
"{$PATSOLVE}/patsolve_cnstrnt.sats"
staload
"{$PATSOLVE}/patsolve_parsing.sats"
//
(* ****** ****** *)
//
staload "./patsolve_z3_solving.sats"
//
(* ****** ****** *)
//
extern
fun
c3nstr_solve_errmsg
  (c3t: c3nstr, unsolved: uint): int
//
implement 
c3nstr_solve_errmsg
  (c3t, unsolved) = 0 where
{
//
val () = (
//
if
unsolved = 0u
then let
  val out = stderr_ref
  val loc = c3t.c3nstr_loc
in
  fprintln! (out, "Unsolved constraint @ ", loc, ":", c3t);
end // end of [then]
//
) (* end of [val] *)
//
} (* end of [c3nstr_solve_errmsg] *)
//
(* ****** ****** *)

extern
fun
c3nstr_solve_prop
(
  loc0: loc_t
, env: !smtenv, s2p: s2exp, nerr: &int >> _
) : int (*status*) // end-of-function

(* ****** ****** *)

extern
fun
c3nstr_solve_itmlst
(
  loc0: loc_t, env: !smtenv
, s3is: s3itmlst, unsolved: &uint >> _, nerr: &int >> _
) : int(*status*) // end of [c3nstr_solve_itmlst]

(* ****** ****** *)

extern
fun
c3nstr_solve_itmlst_cnstr
(
  loc0: loc_t, env: !smtenv
, s3is: s3itmlst, c3t: c3nstr, unsolved: &uint >> _, nerr: &int >> _
) : int(*status*) // end of [c3nstr_solve_itmlst_cnstr]

(* ****** ****** *)

extern fun
c3nstr_solve_itmlst_disj
(
  loc0: loc_t, env: !smtenv
, s3is: s3itmlst, s3iss: s3itmlstlst, unsolved: &uint >> _, nerr: &int >> _
) : int(*status*) // end of [c3nstr_solve_itmlst_disj]

(* ****** ****** *)

implement
c3nstr_solve_prop
(
  loc0, env, s2p, nerr
) = let
//
val s2p =
  formula_make_s2exp (env, s2p)
//
val ans =
  smtenv_formula_solve (env, s2p)
//
in
//
if ans then ~1(*solved*) else 0 (*unsolved*)
//
end // end of [c3nstr_solve_prop]

(* ****** ****** *)

(* end of [patsolve_z3_solving.dats] *)
