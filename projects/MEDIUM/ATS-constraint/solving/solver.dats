#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload "constraint.sats"
staload "solving/solver.sats"

staload ERR = "solving/error.sats"

(* ****** ****** *)

local

fun auxeq (
  env: &smtenv, s2e1: s2exp, s2e2: s2exp
) : s2exp = let
  val s2t1 = s2e1.s2exp_srt
//
in
  s2exp_eqeq (s2e1, s2e2)
end // end of [auxeq]

fun auxbind (
  loc0: loc_t
, env: &smtenv, s2v1: s2var, s2e2: s2exp
) : s2exp = let
  val s2e1 = s2exp_from_var (s2v1)
  val s2be = auxeq (env, s2e1, s2e2)
in
  s2be
end // end of [aux_bind]

in (* in of [local] *)

implement
s2exp_make_h3ypo
  (env, h3p) = (
  case+ h3p.h3ypo_node of
  | H3YPOprop s2p => s2p
  | H3YPObind (s2v1, s2e2) => auxbind (h3p.h3ypo_loc, env, s2v1, s2e2)
  | H3YPOeqeq (s2e1, s2e2) => auxeq (env, s2e1, s2e2)
) // end of [s2exp_make_h3ypo]

end // end of [local]

(* ****** ****** *)

extern
fun c3nstr_solve_main 
  (env: &smtenv, c3t: c3nstr, unsolved : &uint, error: &int): int

extern fun
c3nstr_solve_prop (
  loc0: loc_t, env: &smtenv, s2p: s2exp, err: &int
) : int(*status*)
// end of [c3nstr_solve_prop]

extern fun
c3nstr_solve_itmlst (
  loc0: loc_t
, env: &smtenv
, s3is: s3itmlst, unsolved: &uint, err: &int
) : int(*status*) // end of [c3nstr_solve_itmlst]

extern fun
c3nstr_solve_itmlst_cnstr (
  loc0: loc_t
, env: &smtenv
, s3is: s3itmlst, c3t: c3nstr, unsolved: &uint, err: &int
) : int(*status*) // end of [c3nstr_solve_itmlst_cnstr]

extern fun
c3nstr_solve_itmlst_disj (
  loc0: loc_t
, env: &smtenv
, s3is: s3itmlst, s3iss: s3itmlstlst, unsolved: &uint, err: &int
) : int(*status*) // end of [c3nstr_solve_itmlst_disj]

extern fun
c3nstr_solve_itmlst (
  loc0: loc_t
, env: &smtenv
, s3is: s3itmlst, unsolved: &uint, err: &int
) : int(*status*) // end of [c3nstr_solve_itmlst]

extern fun
c3nstr_solve_errmsg (c3t: c3nstr, unsolved: uint): int

implement 
c3nstr_solve_errmsg (c3t, unsolved) = 
  if unsolved > 0u then
    0
  else let
    val out = stdout_ref
    val loc = c3t.c3nstr_loc
  in
    fprintln! (out, "Unsolved constraint @ ", loc,":");
    fprintln! (out, c3t);
    0
  end
  
implement
c3nstr_solve_prop
  (loc0, env, s2p, err) = let
  val prop = formula_make (env, s2p)
  //
  val valid = smtenv_formula_is_valid (env, prop)
  //
in
  if valid then
    ~1 (* Solved *)
  else
     0 (* Unsolved *)
end // end of [c3nstr_solve_prop]

implement
c3nstr_solve_itmlst
(
  loc0, env, s3is, unsolved, err
) = let
(**
val () = begin
  print "c3str_solve_itmlst: s3is = ";
  fprint_s3itmlst (stdout_ref, s3is); print_newline ();
end // end of [val]
*)
in
//
case+ s3is of
| list_cons (s3i, s3is) => (
  case+ s3i of
  | S3ITMsvar (s2v) => let
      val () = smtenv_add_svar (env, s2v)
    in
      c3nstr_solve_itmlst (loc0, env, s3is, unsolved, err)
    end // end of [S3ITMsvar]
  | S3ITMhypo (h3p) => let
      // Assert the assumption
      val prop = s2exp_make_h3ypo (env, h3p)
      val () = (
        case+ prop.s2exp_node of
        | S2Eignored () => let
        (*
            val () = begin
              prerr_warning3_loc (loc0);
              prerr ": unused hypothesis: ["; prerr_h3ypo (h3p); prerr "]";
              prerr_newline ()
            end // end of [val]
        *)
          in
            // nothing
          end // end of [S3Eerr]
        | _ => smtenv_assert_sbexp (env, prop)
      ) : void // end of [val]
    in
      c3nstr_solve_itmlst (loc0, env, s3is, unsolved, err)
    end // end of [S3ITMhypo]
  | S3ITMsVar (s2V) =>
      c3nstr_solve_itmlst (loc0, env, s3is, unsolved, err)
  | S3ITMcnstr c3t =>
      c3nstr_solve_itmlst_cnstr (loc0, env, s3is, c3t, unsolved, err)
  | S3ITMcnstr_ref (loc1, ctr) => (
      case+ ctr of
      | Some c3t =>
          c3nstr_solve_itmlst_cnstr (loc1, env, s3is, c3t, unsolved, err)
      | None () => ~1(*solved*)
  )
  | S3ITMdisj (s3iss_disj) =>
      c3nstr_solve_itmlst_disj (loc0, env, s3is, s3iss_disj, unsolved, err)
  ) // end of [list_cons]
| list_nil () => ~1(*solved*)
//
end // end of [c3nstr_solve_itmlst]

implement
c3nstr_solve_itmlst_cnstr
(
  loc0, env, s3is, c3t, unsolved, err
) = let
  val (pf1 | ()) = smtenv_push (env)
  val ans1 =
    c3nstr_solve_main (env, c3t, unsolved, err)
  // end of [val]
  val () = smtenv_pop (pf1 | env)
  val ans2 =
    c3nstr_solve_itmlst (loc0, env, s3is, unsolved, err)
  // end of [val]
in
  if ans1 >= 0 then 0(*unsolved*) else ans2
end // end of [c3nstr_solve_itmlst_cnstr]


implement
c3nstr_solve_itmlst_disj (
  loc0, env, s3is0, s3iss(*disj*), unsolved, err
) = let
(**
val () = (
  print "c3nstr_solve_itmlst_disj: s3iss = ..."; print_newline ()
) // end of [val]
*)
in
//
case+ s3iss of
| list_cons (s3is, s3iss) => let
    val (pf1 | ()) = smtenv_push (env)
    val s3is1 = list_append (s3is, s3is0)
    val ans = c3nstr_solve_itmlst (loc0, env, s3is1, unsolved, err)
    val () = smtenv_pop (pf1 |env)
  in
    c3nstr_solve_itmlst_disj (loc0, env, s3is0, s3iss, unsolved, err)
  end // end of [list_cons]
| list_nil () => ~1 (*solved*)
//
end // end of [c3nstr_solve_itmlst_disj]


implement
c3nstr_solve_main
  (env, c3t, unsolved, err) = let
//
val loc0 = c3t.c3nstr_loc
//
var status: int = (
//
// ~1: solved; 0: unsolved
//
  case+ c3t.c3nstr_node of
  | C3NSTRprop s2p =>
      c3nstr_solve_prop (loc0, env, s2p, err)
  | C3NSTRitmlst s3is =>
      c3nstr_solve_itmlst (loc0, env, s3is, unsolved, err)
) : int // end of [val]
//
val () = if status >= 0 then {
  val iswarn =
    c3nstr_solve_errmsg (c3t, unsolved)
  // end of [val]
  val () = if iswarn > 0 then (status := ~1)
} // end of [val]
//
val () = if status >= 0 then (unsolved := unsolved + 1u)
//
in
  status (* 0: unsolved; ~1: solved *)
end // end of [c3nstr_solve_main]

implement c3nstr_solve (c3t) = let
  var env : smtenv
  val _ = smtenv_nil (env)
  var unsolved: uint = 0u and err: int = 0
  val _(*status*) = c3nstr_solve_main (env, c3t, unsolved, err)
  val () = smtenv_free (env)
in
//
case+ 0 of
| _ when unsolved = 0u => let
    val () = (
      prerrln! "typechecking is finished successfully!"
    ) // end of [val]
  in
    // nothing
  end // end of [unsolved = 0]
| _ => { // unsolved > 0
    val () = prerr "typechecking has failed"
    val () = if unsolved <= 1u then
      prerr ": there is one unsolved constraint"
    val () = if unsolved >= 2u then
      prerr ": there are some unsolved constraints"
    val () = (
      prerr ": please inspect the above reported error message(s) for information."
    ) // end of [val]
    val () = prerr_newline ()
  } // end of [_]
//
end // end of [c3nstr_solve]