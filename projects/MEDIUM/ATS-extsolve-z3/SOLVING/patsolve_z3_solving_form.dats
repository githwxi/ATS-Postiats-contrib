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

assume form_vtype = Z3_ast

(* ****** ****** *)

implement
formula_true() = tt where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val tt = Z3_mk_true(ctx)
  prval ((*void*)) = fpf(ctx)
}

implement
formula_false() = ff where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val ff = Z3_mk_false(ctx)
  prval ((*void*)) = fpf(ctx)
}

(* ****** ****** *)

implement
formula_int(i) = i2 where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val ty = Z3_mk_int_sort(ctx)
  val i2 = Z3_mk_int(ctx, i, ty)
  val () = Z3_sort_dec_ref(ctx, ty)
  prval ((*void*)) = fpf(ctx)
}
  
(* ****** ****** *)

implement
formula_intrep(rep) = i2 where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val ty = Z3_mk_int_sort(ctx)
  val i2 = Z3_mk_numeral(ctx, rep, ty)
  val () = Z3_sort_dec_ref(ctx, ty)
  prval ((*void*)) = fpf(ctx)
}
  
(* ****** ****** *)

implement
formula_beq
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_eq (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_beq] *)

(* ****** ****** *)
//
implement
formula_bneq
  (s2e1, s2e2) =
  formula_not(formula_beq(s2e1, s2e2))
//
(* ****** ****** *)

implement
formula_not
  (s2e1) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_not (ctx, s2e1)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_not] *)

implement
formula_disj
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_or2 (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_disj] *)

implement
formula_conj
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_and2 (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_conj] *)

implement
formula_impl
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_implies (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_impl] *)

(* ****** ****** *)

implement
formula_ineg
  (s2e1) = res where
{
//
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
  Z3_mk_unary_minus (ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e1)
  prval ((*void*)) = fpf(ctx)
//
} (* end of [formula_ineg] *)

(* ****** ****** *)

implement
formula_iadd
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_add2 (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_iadd] *)

(* ****** ****** *)

implement
formula_isub
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_sub2 (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_isub] *)

(* ****** ****** *)

implement
formula_imul
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_mul2 (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_imul] *)

(* ****** ****** *)
//
implement
formula_idiv
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_div (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_idiv] *)
//
implement
formula_ndiv
  (s2e1, s2e2) = formula_idiv(s2e1, s2e2)
//
(* ****** ****** *)

implement
formula_ilt
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_lt (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_ilt] *)

implement
formula_ilte
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_lte (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_ilte] *)

(* ****** ****** *)

implement
formula_igt
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_gt (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_igt] *)

implement
formula_igte
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_gte (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_igte] *)

(* ****** ****** *)

implement
formula_ieq
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_eq (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_ieq] *)

(* ****** ****** *)
//
implement
formula_ineq
  (s2e1, s2e2) =
  formula_not(formula_ieq(s2e1, s2e2))
//
(* ****** ****** *)

implement
formula_eqeq
  (s2e1, s2e2) = res where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_eq (ctx, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
} (* end of [formula_eqeq] *)

(* ****** ****** *)

implement
formula_error
  (s2e0) = res where
{
//
val () =
prerrln!
  ("formula_error: s2e0 = ", s2e0)
//
val () = assertloc(false)
val res = formula_error(s2e0)
//
} (* end of [formula_error] *)

(* ****** ****** *)

implement
formula_make_s2var
  (env, s2v0) = let
//
val
ptr =
s2var_get_payload(s2v0)
//
val
ast =
$UN.castvwtp0{Z3_ast}(ptr)
//
val (
  fpf | ctx
) = the_Z3_context_vget()
//
val ast2 = Z3_inc_ref(ctx, ast)
//
prval ((*void*)) = fpf(ctx)
//
prval ((*void*)) = $UN.cast2void(ast)
//
in
  $UN.castvwtp0{form}(ast2)
end // end of [formula_make_s2var]

(* ****** ****** *)

local

fun
aux_S2Ecst
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-S2Ecst(s2c) = s2e0.s2exp_node
//
in
  formula_error(s2e0)
(*
  formula_make_s2cst(env, s2c)
*)
end // end of [aux_S2Ecst]

fun
aux_S2Evar
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-S2Evar(s2v) = s2e0.s2exp_node
//
in
  formula_make_s2var(env, s2v)
end // end of [aux_S2Evar]

fun
aux_S2Eapp
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-S2Eapp(s2e_fun, s2es_arg) = s2e0.s2exp_node
//
in
//
case+
s2e_fun.s2exp_node
of // case+
| S2Ecst(s2c) => let
    val s2ci = s2cst_get_s2cinterp(s2c)
  in
    case+ s2ci of
    | S2CINTnone() =>
        formula_error(s2e0)
      // end of [S2CINTnone]
    | S2CINTbuiltin_0(f) => f()
    | S2CINTbuiltin_1(f) => let
        val-
        list_cons
          (s2e1, s2es_arg) = s2es_arg
        // end of [val]
        val s2e1 = formula_make_s2exp(env, s2e1)
      in
        f(s2e1)
      end // end of [S2CINTbuiltin_1]
    | S2CINTbuiltin_2(f) => let
        val-
        list_cons
          (s2e1, s2es_arg) = s2es_arg
        // end of [val]
        val-
        list_cons
          (s2e2, s2es_arg) = s2es_arg
        // end of [val]
        val s2e1 = formula_make_s2exp(env, s2e1)
        val s2e2 = formula_make_s2exp(env, s2e2)
      in
        f(s2e1, s2e2)
      end // end of [S2CINTbuiltin_2]
(*
    | S2CINTbuiltin_lst(f) => formula_error(s2e0)
*)
  end // end of [S2Ecst]
| _(*non-S2Ecst*) => formula_error(s2e0)
//
end // end of [aux_S2Eapp]

in (* in-of-local *)

implement
formula_make_s2exp
  (env, s2e0) = let
//
val () =
println!
  ("formula_make_s2exp: s2e0 = ", s2e0)
//
in
//
case+
s2e0.s2exp_node
of // case+
//
| S2Eint(i) => formula_int(i)
| S2Eintinf(rep) => formula_intrep(rep)
//
| S2Ecst _ => aux_S2Ecst(env, s2e0)
| S2Evar _ => aux_S2Evar(env, s2e0)
//
| S2Eeqeq
    (s2e1, s2e2) => let
    val s2e1 =
      formula_make_s2exp(env, s2e1)
    and s2e2 =
      formula_make_s2exp(env, s2e2) in formula_eqeq (s2e1, s2e2)
  end // end of [S2Eeqeq]
//
| S2Eapp _ => aux_S2Eapp (env, s2e0)
//
| _ (*unrecognized*) => formula_error(s2e0)
//
end // end of [formula_make_s2exp]

end // end of [local]

(* ****** ****** *)

(* end of [patsolve_z3_solving_form.dats] *)
