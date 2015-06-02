(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#ifndef
PATSOLVE_Z3_SOLVING
#include "./myheader.hats"
#endif // end of [ifndef]
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
staload "./patsolve_z3_solving_ctx.dats"
//
(* ****** ****** *)

datavtype
smtenv =
SMTENV of (smtenv_struct)

where
smtenv_struct = @{
//
smtenv_solver= Z3_solver
,
smtenv_s2varlst = s2varlst_vt
,
smtenv_s2varlstlst = List0_vt(s2varlst_vt)
//
} (* end of [smtenv_struct] *)

(* ****** ****** *)
//
extern
fun
smtenv_s2varlst_vt_free(s2varlst_vt): void
extern
fun
smtenv_s2varlstlst_vt_free(List0_vt(s2varlst_vt)): void
//
(* ****** ****** *)

implement
smtenv_s2varlst_vt_free
  (s2vs) = loop(s2vs) where
{
//
fun
loop
(
  s2vs: s2varlst_vt
) : void = (
//
case+ s2vs of
| ~list_vt_nil() => ()
| ~list_vt_cons(s2v, s2vs) => let
    val (fpf | ctx) = the_Z3_context_vget()
    val () =
    Z3_dec_ref
    (
      ctx
    , $UN.castvwtp0{Z3_ast}(s2var_get_payload(s2v))
    ) (* end of [Z3_dec_ref] *)
    prval ((*void*)) = fpf(ctx)
  in
    loop(s2vs)
  end // end of [list_vt_cons]
//
) (* end of [loop] *)
//
} (* end of [smtenv_s2varlst_vt_free] *)

(* ****** ****** *)

implement
smtenv_s2varlstlst_vt_free
  (xss) =
(
case+ xss of
| ~list_vt_nil() => ()
| ~list_vt_cons(xs, xss) =>
  (
    smtenv_s2varlst_vt_free(xs);
    smtenv_s2varlstlst_vt_free(xss)
  )
) (* smtenv_s2varlstlst_vt_free *)

(* ****** ****** *)

assume smtenv_vtype = smtenv
assume smtenv_push_v = unit_v

(* ****** ****** *)

implement
smtenv_create
  () = env where
{
//
val env = SMTENV(_)
val+SMTENV(env_s) = env
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val
solver = Z3_mk_solver(ctx)
//
prval ((*void*)) = fpf(ctx)
//
val () = env_s.smtenv_solver := solver
val () = env_s.smtenv_s2varlst := nil_vt()
val () = env_s.smtenv_s2varlstlst := nil_vt()
//
prval () = fold@(env)
//
} (* end of [smtenv_create] *)

(* ****** ****** *)

implement
smtenv_destroy
  (env) = let
//
val+~SMTENV(env_s) = env
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val () = Z3_solver_dec_ref(ctx, env_s.smtenv_solver)
//
prval ((*void*)) = fpf(ctx)
//
val () = smtenv_s2varlst_vt_free(env_s.smtenv_s2varlst)
val () = smtenv_s2varlstlst_vt_free(env_s.smtenv_s2varlstlst)
//
in
  // nothing
end // end of [smtenv_destroy]

(* ****** ****** *)

implement
smtenv_pop
  (pf | env) = let
//
prval unit_v() = pf
//
val+@SMTENV(env_s) = env
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val ((*void*)) =
  Z3_solver_pop (ctx, env_s.smtenv_solver, 1u)
//
prval ((*void*)) = fpf(ctx)
//
val s2vs = env_s.smtenv_s2varlst
val ((*void*)) = smtenv_s2varlst_vt_free(s2vs)
val-~list_vt_cons(s2vs, s2vss) = env_s.smtenv_s2varlstlst
//
val ((*void*)) = env_s.smtenv_s2varlst := s2vs
val ((*void*)) = env_s.smtenv_s2varlstlst := s2vss
//
prval ((*folded*)) = fold@(env)
//
in
  // nothing
end // end of [smtenv_pop]

(* ****** ****** *)

implement
smtenv_push
  (env) = let
//
val+@SMTENV(env_s) = env
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val ((*void*)) =
  Z3_solver_push (ctx, env_s.smtenv_solver)
//
prval ((*void*)) = fpf(ctx)
//
val s2vs = env_s.smtenv_s2varlst
val s2vss = env_s.smtenv_s2varlstlst
//
val ((*void*)) = env_s.smtenv_s2varlst := nil_vt()
val ((*void*)) = env_s.smtenv_s2varlstlst := cons_vt(s2vs, s2vss)
//
prval ((*folded*)) = fold@(env)
//
in
  (unit_v() | ())
end // end of [smtenv_push]

(* ****** ****** *)

implement
smtenv_add_s2var
  (env, s2v0) = let
//
val+@SMTENV(env_s) = env
val s2vs = env_s.smtenv_s2varlst
val ((*void*)) =
  env_s.smtenv_s2varlst := cons_vt(s2v0, s2vs)
prval ((*void*)) = fold@(env)
//
val name = s2v0.name()
val name = symbol_get_name(name)
val name = string0_copy(name)
//
val stamp =
  stamp_get_int(s2v0.stamp())
//
val stamp = g0int2string(stamp)
//
val name2 =
string0_append
  ($UN.strptr2string(name), $UN.strptr2string(stamp))
//
val () = strptr_free(name)
val () = strptr_free(stamp)
//
val ty = sort_make_s2rt(s2v0.srt())
val ty = $UN.castvwtp0{Z3_sort}(ty)
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val
sym =
Z3_mk_string_symbol
  (ctx, $UN.strptr2string(name2))
//
val ast = Z3_mk_const(ctx, sym, ty)
//
prval ((*void*)) = fpf(ctx)
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val ((*freed*)) = Z3_sort_dec_ref(ctx, ty)
//
prval ((*void*)) = fpf(ctx)
//
val () = strptr_free(name2)
//
in
  s2var_set_payload(s2v0, $UN.castvwtp0{ptr}(ast))
end // end of [smtenv_add_s2var]

(* ****** ****** *)

implement
smtenv_add_s2exp
  (env, s2p0) = let
//
val s2p0 =
  formula_make_s2exp(env, s2p0)
//
val s2p0 = $UN.castvwtp0{Z3_ast}(s2p0)
//
val+@SMTENV(env_s) = env
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val ((*void*)) =
  Z3_solver_assert(ctx, env_s.smtenv_solver, s2p0)
//
prval ((*void*)) = fpf(ctx)
//
prval ((*void*)) = fold@(env)
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val () = Z3_dec_ref(ctx, s2p0)
//
prval ((*void*)) = fpf(ctx)
//
in
  // nothing
end // end of [smtenv_add_s2exp]

(* ****** ****** *)

implement
smtenv_formula_solve
  (env, s2p0) = let
//
val+@SMTENV(env_s) = env
//
val (fpf | ctx) =
  the_Z3_context_vget()
//
val () =
Z3_solver_push
  (ctx, env_s.smtenv_solver)
//
val s2p1 = formula_not(s2p0)
val s2p1 = $UN.castvwtp0{Z3_ast}(s2p1)
//
val () =
Z3_solver_assert
  (ctx, env_s.smtenv_solver, s2p1)
//
val ans =
Z3_solver_check(ctx, env_s.smtenv_solver)
//
val ((*freed*)) = Z3_dec_ref(ctx, s2p1)
//
val () =
Z3_solver_pop
  (ctx, env_s.smtenv_solver, 1u)
//
prval ((*void*)) = fpf(ctx)
//
prval ((*void*)) = fold@(env)
//
in
//
case+ 0 of
| _ when ans = Z3_L_TRUE => 1
| _ when ans = Z3_L_FALSE => ~1
| _ (*when ans = Z3_L_UNDEF*) => 0
//
end (* end of [smtenv_formula_solve] *)

(* ****** ****** *)

(* end of [patsolve_z3_solving_smtenv.dats] *)
