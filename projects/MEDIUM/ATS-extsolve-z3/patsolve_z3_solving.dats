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
absview
smtenv_push_v
//
extern
fun
smtenv_push
  (env: !smtenv): (smtenv_push_v | void)
//
extern
fun
smtenv_pop
  (pf: smtenv_push_v | env: !smtenv): void
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
) : int(*status*) // end-of-function

(* ****** ****** *)

extern
fun
c3nstr_solve_itmlst_cnstr
(
  loc0: loc_t, env: !smtenv
, s3is: s3itmlst, c3t: c3nstr, unsolved: &uint >> _, nerr: &int >> _
) : int(*status*) // end-of-function

(* ****** ****** *)

extern fun
c3nstr_solve_itmlst_disj
(
  loc0: loc_t, env: !smtenv
, s3is: s3itmlst, s3iss: s3itmlstlst, unsolved: &uint >> _, nerr: &int >> _
) : int(*status*) // end-of-function

(* ****** ****** *)

extern
fun
c3nstr_solve_main 
(
  env: !smtenv, c3t: c3nstr, unsolved : &uint >> _, nerr: &int >> _
) : int(*status*) // end of [c3nstr_solve_main]

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

implement
c3nstr_solve_itmlst
(
  loc0, env, s3is, unsolved, nerr
) = let
//
val () =
println!
  ("c3str_solve_itmlst: s3is = ", s3is)
//
in
//
case+ s3is of
| list_nil
    ((*void*)) => ~1(*solved*)
  // end of [list_nil]
| list_cons
    (s3i, s3is) =>
  (
  case+ s3i of
  | S3ITMsvar (s2v) => let
      val () = smtenv_add_s2var (env, s2v)
    in
      c3nstr_solve_itmlst (loc0, env, s3is, unsolved, nerr)
    end // end of [S3ITMsvar]
  | S3ITMhypo (h3p) => let
      val s2p = s2exp_make_h3ypo (h3p)
      val ((*void*)) = smtenv_add_s2exp (env, s2p)
    in
      c3nstr_solve_itmlst (loc0, env, s3is, unsolved, nerr)
    end // end of [S3ITMhypo]
  | S3ITMsVar (s2V) =>
      c3nstr_solve_itmlst (loc0, env, s3is, unsolved, nerr)
  | S3ITMcnstr c3t =>
      c3nstr_solve_itmlst_cnstr (loc0, env, s3is, c3t, unsolved, nerr)
  | S3ITMcnstr_ref
      (loc1, ctr) => (
      case+ ctr of
      | Some(c3t) =>
          c3nstr_solve_itmlst_cnstr (loc1, env, s3is, c3t, unsolved, nerr)
        // end of [Some]
      | None((*void*)) => ~1(*solved*)
    ) (* end of [S3ITMcnstr] *)
  | S3ITMdisj (s3iss_disj) =>
      c3nstr_solve_itmlst_disj (loc0, env, s3is, s3iss_disj, unsolved, nerr)
    // end of [S3ITMdisj]
  ) // end of [list_cons]
//
end // end of [c3nstr_solve_itmlst]

(* ****** ****** *)

implement
c3nstr_solve_itmlst_cnstr
(
  loc0, env, s3is, c3t, unsolved, nerr
) = let
  val (pf|()) = smtenv_push (env)
  val ans1 =
    c3nstr_solve_main (env, c3t, unsolved, nerr)
  // end of [val]
  val ((*void*)) = smtenv_pop (pf | env)
  val ans2 =
    c3nstr_solve_itmlst (loc0, env, s3is, unsolved, nerr)
  // end of [val]
in
  if ans1 >= 0 then 0(*unsolved*) else ans2
end // end of [c3nstr_solve_itmlst_cnstr]

(* ****** ****** *)

implement
c3nstr_solve_itmlst_disj
(
  loc0, env
, s3is0, s3iss(*disj*), unsolved, nerr
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
    ((*void*)) => ~1 (*solved*)
  // end of [list_nil]
| list_cons
    (s3is, s3iss) => let
    val (pf|()) = smtenv_push (env)
    val s3is1 = list_append (s3is, s3is0)
    val ans = c3nstr_solve_itmlst (loc0, env, s3is1, unsolved, nerr)
    val ((*void*)) = smtenv_pop (pf | env)
  in
    c3nstr_solve_itmlst_disj (loc0, env, s3is0, s3iss, unsolved, nerr)
  end // end of [list_cons]
//
end // end of [c3nstr_solve_itmlst_disj]

(* ****** ****** *)

implement
c3nstr_solve_main
(
  env, c3t, unsolved, nerr
) = let
//
val loc0 = c3t.c3nstr_loc
//
var status: int =
(
//
// ~1: solved; 0: unsolved
//
case+
c3t.c3nstr_node of
| C3NSTRprop s2p =>
    c3nstr_solve_prop(loc0, env, s2p, nerr)
  // end of [C3NSTRprop]
| C3NSTRitmlst s3is =>
    c3nstr_solve_itmlst(loc0, env, s3is, unsolved, nerr)
  // end of [C3NSTRitmlst]
//
) : int // end of [val]
//
val () = (
//
if
status >= 0
then {
  val iswarn =
    c3nstr_solve_errmsg (c3t, unsolved)
  // end of [val]
  val () = if iswarn > 0 then (status := ~1)
} // end of [then]
//
) (* end of [val] *)
//
val () =
  if status >= 0 then (unsolved := unsolved + 1u)
//
in
  status (* ~1/0: solved/unsolved *)
end // end of [c3nstr_solve_main]

(* ****** ****** *)

implement
{}(*tmp*)
c3nstr_z3_solve
  (c3t0) = let
//
val env = smtenv_create()
//
var unsolved: uint = 0u and err: int = 0
val _(*ans*) = c3nstr_solve_main (env, c3t0, unsolved, err)
//
val ((*void*)) = smtenv_destroy (env)
in
//
case+ 0 of
| _ when
    unsolved = 0u => let
    val () = (
      prerrln! "typechecking is finished successfully!"
    ) (* end of [val] *)
  in
    // nothing
  end // end of [unsolved = 0]
| _ (* unsolved > 0 *) =>
  {
    val () = prerr "typechecking has failed"
    val () =
    if unsolved <= 1u then prerr ": there is one unsolved constraint"
    val () =
    if unsolved >= 2u then prerr ": there are some unsolved constraints"
    val () = (
      prerrln! ": please inspect the above reported error message(s) for information."
    ) (* end of [val] *)
  } (* end of [_ when unsolved > 0] *)
//
end // end of [c3nstr_z3_solve]

(* ****** ****** *)

#define PATSOLVE_Z3_SOLVING 1

(* ****** ****** *)

local
//
#include "./SOLVING/patsolve_z3_solving_sort.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

local
//
#include "./SOLVING/patsolve_z3_solving_form.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

local
//
#include "./SOLVING/patsolve_z3_solving_smtenv.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

(* end of [patsolve_z3_solving.dats] *)
