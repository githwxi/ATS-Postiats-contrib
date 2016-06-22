(*
##
## ATS-extsolve-smt2:
## Outputing ATS-constraints
## in the format of smt-lib2
##
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start time: June, 2015
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
staload
UN = "prelude/SATS/unsafe.sats"
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
staload "./patsolve_smt2_solving.sats"
//
(* ****** ****** *)
//
implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<s2Var> = fprint_s2Var
implement
fprint_val<s2exp> = fprint_s2exp
implement
fprint_val<s3itm> = fprint_s3itm
//
implement
fprint_val<sort> = fprint_sort
implement
fprint_val<form> = fprint_form
implement
fprint_val<solvercmd> = fprint_solvercmd
//
(* ****** ****** *)
//
implement
print_solvercmd(x0) =
  fprint_solvercmd(stdout_ref, x0)
implement
prerr_solvercmd(x0) =
  fprint_solvercmd(stderr_ref, x0)
//
implement
fprint_solvercmd
  (out, x0) = (
//
case+ x0 of
| SOLVERCMDpop() =>
    fprint! (out, "SOLVERCMDpop()")
| SOLVERCMDpush() =>
    fprint! (out, "SOLVERCMDpush()")
| SOLVERCMDcheck() =>
    fprint! (out, "SOLVERCMDcheck()")
| SOLVERCMDassert(fml) =>
    fprint! (out, "SOLVERCMDassert(", fml, ")")
//
| SOLVERCMDpopenv(s2vs) =>
    fprint! (out, "SOLVERCMDpopenv(", s2vs, ")")
| SOLVERCMDpushenv((*void*)) =>
    fprint! (out, "SOLVERCMDpushenv()")
//
) (* end of [fprint_solvercmd] *)
//
(* ****** ****** *)
//
extern
fun
c3nstr_solve_main 
  (env: !smtenv, c3t: c3nstr): void
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
  val c3tk = c3t.c3nstr_kind
in
//
case+ c3tk of
| C3TKmain() =>
  (
    fprintln! (out, "UnsolvedConstraint(main)@", loc, ":", c3t)
  )
| C3TKtermet_isnat() =>
  (
    fprintln! (out, "UnsolvedConstraint(termet_isnat)@", loc, ":", c3t)
  )
| C3TKtermet_isdec() =>
  (
    fprintln! (out, "UnsolvedConstraint(termet_isdec)@", loc, ":", c3t)
  )
| _(*rest-of-C3TK*) =>
  (
    fprintln! (out, "UnsolvedConstraint(unclassified)@", loc, ":", c3t)
  )
//
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
  loc0: loc_t, env: !smtenv, s2p: s2exp
) : void // end-of-function

(* ****** ****** *)

extern
fun
c3nstr_solve_itmlst
(
  loc0: loc_t, env: !smtenv, s3is: s3itmlst
) : void // end-of-function

(* ****** ****** *)

extern
fun
c3nstr_solve_itmlst_cnstr
(
  loc0: loc_t
, env: !smtenv, s3is: s3itmlst, c3t: c3nstr
) : void // end-of-function

(* ****** ****** *)

extern
fun
c3nstr_solve_itmlst_disj
(
  loc0: loc_t
, env: !smtenv, s3is: s3itmlst, s3iss: s3itmlstlst
) : void // end-of-function

(* ****** ****** *)
//
extern
fun
c3nstr_solve_solverify
  (loc0: loc_t, env: !smtenv, s2e_prop: s2exp): void
//
(* ****** ****** *)

implement
c3nstr_solve_prop
(
  loc0, env, s2p
) = let
//
val s2p =
  formula_make_s2exp (env, s2p)
//
//
in
  smtenv_formula_solve (env, s2p)
end // end of [c3nstr_solve_prop]

(* ****** ****** *)

implement
c3nstr_solve_itmlst
  (loc0, env, s3is) = let
//
(*
val () =
println!
  ("c3str_solve_itmlst: s3is = ", s3is)
*)
//
in
//
case+ s3is of
| list_nil
    ((*void*)) => ()
  // end of [list_nil]
| list_cons
    (s3i, s3is) =>
  (
  case+ s3i of
  | S3ITMsvar(s2v) => let
      val () = smtenv_add_s2var(env, s2v)
    in
      c3nstr_solve_itmlst(loc0, env, s3is)
    end // end of [S3ITMsvar]
  | S3ITMhypo(h3p) => let
      val () = smtenv_add_h3ypo(env, h3p)
    in
      c3nstr_solve_itmlst(loc0, env, s3is)
    end // end of [S3ITMhypo]
  | S3ITMsVar(s2V) =>
      c3nstr_solve_itmlst(loc0, env, s3is)
  | S3ITMcnstr(c3t) =>
      c3nstr_solve_itmlst_cnstr(loc0, env, s3is, c3t)
  | S3ITMcnstr_ref
      (loc_ref, opt) =>
    (
      case+ opt of
      | None() => ()
      | Some(c3t) =>
        c3nstr_solve_itmlst_cnstr(loc_ref, env, s3is, c3t)
    ) (* end of [S3ITMcnstr] *)
  | S3ITMdisj(s3iss_disj) =>
    (
      c3nstr_solve_itmlst_disj(loc0, env, s3is, s3iss_disj)
    ) (* end of [S3ITMdisj] *)
  | S3ITMsolassert(s2e_prop) => let
      val () =
        smtenv_add_s2exp(env, s2e_prop)
      // end of [val]
    in
      c3nstr_solve_itmlst(loc0, env, s3is)
    end // end of [S3ITMsolassert]
  ) // end of [list_cons]
//
end // end of [c3nstr_solve_itmlst]

(* ****** ****** *)

implement
c3nstr_solve_itmlst_cnstr
  (loc0, env, s3is, c3t) = () where
{
  val (pf|()) = smtenv_push (env)
//
  val ans1 =
    c3nstr_solve_main (env, c3t)
  // end of [val]
//
  val ((*void*)) = smtenv_pop (pf | env)
//
  val ans2 =
    c3nstr_solve_itmlst (loc0, env, s3is)
  // end of [val]
//
} (* end of [c3nstr_solve_itmlst_cnstr] *)

(* ****** ****** *)

implement
c3nstr_solve_itmlst_disj
(
  loc0, env, s3is0, s3iss(*disj*)
) = let
(*
val () = (
  println! ("c3nstr_solve_itmlst_disj: s3iss = ...")
) (* end of [val] *)
*)
in
//
case+ s3iss of
| list_nil
    ((*void*)) => ()
  // end of [list_nil]
| list_cons
    (s3is, s3iss) => let
    val (pf|()) = smtenv_push (env)
    val s3is1 = list_append (s3is, s3is0)
    val ans = c3nstr_solve_itmlst (loc0, env, s3is1)
    val ((*void*)) = smtenv_pop (pf | env)
  in
    c3nstr_solve_itmlst_disj (loc0, env, s3is0, s3iss)
  end // end of [list_cons]
//
end // end of [c3nstr_solve_itmlst_disj]

(* ****** ****** *)

implement
c3nstr_solve_solverify
  (loc0, env, s2e_prop) = let
//
val s2e_prop =
  formula_make_s2exp (env, s2e_prop)
//
//
in
  smtenv_formula_solve (env, s2e_prop)
end // end of [c3nstr_solve_solverify]

(* ****** ****** *)

implement
c3nstr_solve_main
  (env, c3t) = let
//
val loc0 = c3t.c3nstr_loc
//
in
//
case+
c3t.c3nstr_node
of (* case+ *)
| C3NSTRprop(s2p) =>
    c3nstr_solve_prop(loc0, env, s2p)
  // end of [C3NSTRprop]
| C3NSTRitmlst(s3is) =>
    c3nstr_solve_itmlst(loc0, env, s3is)
  // end of [C3NSTRitmlst]
| C3NSTRsolverify(s2e_prop) =>
    c3nstr_solve_solverify(loc0, env, s2e_prop)
//
end // end of [c3nstr_solve_main]

(* ****** ****** *)

implement
c3nstr_smt2_solve
  (c3t0) = () where
{
//
val env = smtenv_create()
//
val ((*void*)) =
  c3nstr_solve_main (env, c3t0)
//
val solvercmds = smtenv_destroy (env)
//
// (*
local
implement
fprint_list$sep<>
  (out) = fprint_newline(out)
in
val ((*void*)) =
  fprintln! (stdout_ref, solvercmds)
end
val ((*void*)) =
  fprintln!
  ( stdout_ref
  , "length(solvercmds) = ", length(solvercmds)
  ) (* fprintln! *)
// *)
//
val ((*void*)) = list_vt_free(solvercmds)
//
} (* end of [c3nstr_smt2_solve] *)

(* ****** ****** *)

#define PATSOLVE_SMT2_SOLVING 1

(* ****** ****** *)

local
//
#include "./SOLVING/patsolve_smt2_solving_ctx.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

(*
local
//
#include "./SOLVING/patsolve_smt2_solving_sort.dats"
//
in
  // nothing
end // end of [local]
*)

(* ****** ****** *)

local
//
#include "./SOLVING/patsolve_smt2_solving_form.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

local
//
#include "./SOLVING/patsolve_smt2_solving_smtenv.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

local
//
#include "./SOLVING/patsolve_smt2_solving_interp.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

(* end of [patsolve_smt2_solving.dats] *)
