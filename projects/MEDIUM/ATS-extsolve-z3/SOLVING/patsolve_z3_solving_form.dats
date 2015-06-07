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
assume func_decl_vtype = Z3_func_decl

(* ****** ****** *)

implement
formula_decref
  (ast) = () where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val () = Z3_dec_ref(ctx, ast)
  prval ((*void*)) = fpf(ctx)
}

(* ****** ****** *)

implement
formula_incref
  (ast) = ast2 where
{
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val ast2 = Z3_inc_ref(ctx, ast)
  prval ((*void*)) = fpf(ctx)
}

(* ****** ****** *)
//
implement
formula_null
  ((*void*)) = formula_int(0)
//
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
formula_iabs
  (s2e) = let
  val _0_ = formula_int(0)
  val s2e_1 = formula_incref(s2e)
  val s2e_2 = formula_ineg(formula_incref(s2e))
in
  formula_cond(formula_igte(s2e, _0_), s2e_1, s2e_2)
end // end of [formula_iabs]

(* ****** ****** *)

implement
formula_isgn
  (s2e) = let
  val s2e_ = formula_incref(s2e)
  val s2e_gtz = formula_igt(s2e, formula_int(0))
  val s2e_ltz = formula_ilt(s2e_, formula_int(0))
in
//
formula_cond
(
  s2e_gtz, formula_int(1), formula_cond(s2e_ltz, formula_int(~1), formula_int(0))
)
//
end // end of [formula_isgn

(* ****** ****** *)

implement
formula_imax
  (s2e1, s2e2) = let
  val s2e1_ = formula_incref(s2e1)
  val s2e2_ = formula_incref(s2e2)
in
  formula_cond(formula_igte(s2e1, s2e2), s2e1_, s2e2_)
end // end of [formula_imax]

implement
formula_imin
  (s2e1, s2e2) = let
  val s2e1_ = formula_incref(s2e1)
  val s2e2_ = formula_incref(s2e2)
in
  formula_cond(formula_ilte(s2e1, s2e2), s2e1_, s2e2_)
end // end of [formula_imin]

(* ****** ****** *)
//
implement
formula_bneg(s2e) = formula_not(s2e)
//
implement
formula_badd
  (s2e1, s2e2) = formula_disj(s2e1, s2e2)
//
implement
formula_bmul
  (s2e1, s2e2) = formula_conj(s2e1, s2e2)
//
(* ****** ****** *)
//
implement
formula_blt
  (s2e1, s2e2) =
  formula_conj(formula_not(s2e1), s2e2)
//
implement
formula_blte
  (s2e1, s2e2) = formula_impl(s2e1, s2e2)
//
implement
formula_bgt
  (s2e1, s2e2) =
  formula_conj(s2e1, formula_not(s2e2))
//
implement
formula_bgte
  (s2e1, s2e2) = formula_impl(s2e2, s2e1)
//
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
formula_cond
(
  s2e0, s2e1, s2e2
) = res where
{
//
  val (fpf | ctx) =
    the_Z3_context_vget()
  // end of [val]
  val res =
    Z3_mk_ite (ctx, s2e0, s2e1, s2e2)
  // end of [val]
  val () = Z3_dec_ref(ctx, s2e0)
  val () = Z3_dec_ref(ctx, s2e1)
  val () = Z3_dec_ref(ctx, s2e2)
  prval ((*void*)) = fpf(ctx)
//
} (* end of [formula_cond] *)

(* ****** ****** *)

implement
formula_eqeq
  (s2e1, s2e2) = res where
{
//
(*
val () = println! ("formula_eqeq: enter")
*)
//
val (fpf | ctx) =
  the_Z3_context_vget()
// end of [val]
val res =
  Z3_mk_eq (ctx, s2e1, s2e2)
// end of [val]
val () = Z3_dec_ref(ctx, s2e1)
val () = Z3_dec_ref(ctx, s2e2)
prval ((*void*)) = fpf(ctx)
//
(*
val () = println! ("formula_eqeq: leave")
*)
//
} (* end of [formula_eqeq] *)

(* ****** ****** *)

implement
formula_sizeof_t0ype
  (s2e) = let
//
val r = sort_int()
val a = sort_mk_t0ype()
//
val fd =
  func_decl_1("sizeof_t0ype", a, r)
//
in
  formula_fdapp_1(fd, s2e)
end // end of [formula_sizeof]

(* ****** ****** *)

implement
func_decl_1
  (name, arg, res) = let
//
val (fpf | ctx) =
  the_Z3_context_vget()
// end of [val]
//
val
sym =
Z3_mk_string_symbol(ctx, name)
//
val arg = $UN.castvwtp0{Z3_sort}(arg)
val res = $UN.castvwtp0{Z3_sort}(res)
//
val
fd1 =
Z3_mk_func_decl_1(ctx, sym, arg, res)
//
val ((*void*)) = Z3_sort_dec_ref(ctx, arg)
val ((*void*)) = Z3_sort_dec_ref(ctx, res)
//
prval ((*void*)) = fpf(ctx)
//
in
  fd1
end // end of [func_decl_1]

(* ****** ****** *)

implement
formula_fdapp_1
  (fd, arg) = res where
{
//
val (fpf | ctx) =
  the_Z3_context_vget()
// end of [val]
//
val res = Z3_mk_app_1 (ctx, fd, arg)
//
val () =
  Z3_func_decl_dec_ref(ctx, fd)
//
val ((*void*)) = Z3_dec_ref(ctx, arg)
//
prval ((*void*)) = fpf(ctx)
//
} (* end of [formula_fdapp_1] *)

(* ****** ****** *)

implement
formula_error_s2cst
  (s2c0) = res where
{
//
val () =
prerrln!
  ("formula_error: s2c0 = ", s2c0)
//
val () = assertloc(false)
val res = formula_error_s2cst(s2c0)
//
} (* end of [formula_error_s2cst] *)

implement
formula_error_s2exp
  (s2e0) = res where
{
//
val () =
prerrln!
  ("formula_error: s2e0 = ", s2e0)
//
val () = assertloc(false)
val res = formula_error_s2exp(s2e0)
//
} (* end of [formula_error_s2exp] *)

(* ****** ****** *)

implement
formula_make_s2cst
  (env, s2c0) = let
//
val s2ci = s2cst_get_s2cinterp(s2c0)
//
in
//
case+ s2ci of
//
| S2CINTnone() => let
    val s2e = 
    formula_make_s2cst_fresh(env, s2c0)
    val s2e_ = formula_incref(s2e)
    val s2e =
    S2CINTsome($UN.castvwtp0{ptr}(s2e))
    val ((*void*)) =
      s2cst_set_payload(s2c0, $UN.cast{ptr}(s2e))
    // end of [val]
  in
    s2e_
  end // end of [S2CINTnone]
//
| S2CINTsome(ptr) => let
    val s2e =
      $UN.castvwtp0{form}(ptr)
    val s2e_ = formula_incref(s2e)
    prval () = $UN.cast2void(s2e)
  in
    s2e_
  end // end of [S2CINTsome]
//
| S2CINTbuiltin_0(f) => f((*void*))
//
| _(*rest-of-S2CINT*) => formula_error(s2c0)
//
end // end of [formula_make_s2cst]

(* ****** ****** *)

implement
formula_make_s2cst_fresh
  (env, s2c0) = ast where
{
//
val name = s2c0.name()
val name = symbol_get_name(name)
val name = string0_copy(name)
//
val stamp =
  stamp_get_int(s2c0.stamp())
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
val ty = sort_make_s2rt(s2c0.srt())
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
} (* end of [formula_make_s2cst_fresh] *)

(* ****** ****** *)

implement
formula_make_s2var
  (env, s2v0) = let
//
(*
val () =
println!
(
 "formula_make_s2var: s2v0 = ", s2v0
) (* end of [val] *)
val () =
println!
(
 "formula_make_s2var: s2v0.stamp = ", s2v0.stamp()
) (* end of [val] *)
*)
//
val
ptr =
s2var_get_payload(s2v0)
//
in
//
if
ptr > 0
then let
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
end // end of [then]
else (
  formula_make_s2var_fresh(env, s2v0)
) (* end of [else] *)
//
end // end of [formula_make_s2var]

(* ****** ****** *)

implement
formula_make_s2var_fresh
  (env, s2v0) = ast where
{
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
} (* end of [formula_make_s2var_fresh] *)

(* ****** ****** *)

implement
s2cfun_initize_s2cinterp
  (s2c0) = let
//
val name = s2c0.name()
val name = symbol_get_name(name)
//
val s2t0 = s2c0.srt()
val-S2RTfun(s2ts_arg, s2t_res) = s2t0
(*
val arity = list_length(s2ts_arg)
*)
//
val
fopr = lam
(
  xs: formlst
) : form =<cloref1> let
//
val range = sort_make_s2rt(s2t_res)
//
val domain =
  list_map_fun<s2rt><sort>(s2ts_arg, sort_make_s2rt)
// end of [val]
//
val fd0 = func_decl_make(name, domain, range)
//
in
  formula_fdapp_list(fd0, xs)
end // end of [fopr]
//
in
  s2cst_set_payload(s2c0, $UN.cast{ptr}(S2CINTbuiltin_list(fopr)))
end // end of [s2cfun_initize_s2cinterp]

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
  formula_make_s2cst(env, s2c)
end // end of [aux_S2Ecst]

(* ****** ****** *)

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

(* ****** ****** *)

fun
aux_S2Eapp
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-S2Eapp
  (s2e_fun, s2es_arg) = s2e0.s2exp_node
//
in
//
case+
s2e_fun.s2exp_node
of // case+
| S2Ecst(s2c) => let
    val s2ci =
      s2cst_get_s2cinterp(s2c)
    // end of [val]
  in
    case+ s2ci of
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
//
    | S2CINTbuiltin_list(f) =>
        f(formulas_make_s2explst(env, s2es_arg))
      // end of [S2CINTbuiltin_list]
//
    | S2CINTsome _ => formula_error(s2e0)
//
    | S2CINTnone() =>
        aux_S2Eapp(env, s2e0) where
      {
        val ((*void*)) = s2cfun_initize_s2cinterp(s2c)
      } (* [S2CINTnone] *)
//
  end // end of [S2Ecst]
| _(*non-S2Ecst*) => formula_error(s2e0)
//
end // end of [aux_S2Eapp]

(* ****** ****** *)

fun
aux_S2Emetdec
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-
S2Emetdec
  (s2es_met, s2es_bnd) = s2e0.s2exp_node
//
(*
val () =
println!
  ("aux_S2Emetdec: s2es_met = ", s2es_met)
//
val () =
println!
  ("aux_S2Emetdec: s2es_bnd = ", s2es_bnd)
*)
//
fun
auxlst
(
  env: !smtenv
, s2es10: s2explst
, s2es20: s2explst
) : form =
(
case+ s2es10 of
| list_nil
    ((*void*)) => formula_false()
| list_cons
    (s2e1, s2es1) => let
    val-
    list_cons
      (s2e2, s2es2) = s2es20
    // end of [val]
    val s2e1 =
      formula_make_s2exp (env, s2e1)
    val s2e2 =
      formula_make_s2exp (env, s2e2)
  in
    case+ s2es1 of
    | list_nil _ => formula_ilt(s2e1, s2e2)
    | list_cons _ => let
        val s2e1_ = formula_incref (s2e1)
        val s2e2_ = formula_incref (s2e2)
        val s2e_ilt = formula_ilt(s2e1, s2e2) 
        val s2e_ilte = formula_ilte(s2e1_, s2e2_)
      in
        formula_disj(s2e_ilt, formula_conj(s2e_ilte, auxlst(env, s2es1, s2es2)))
      end // end of [list_cons]
  end // end of [list_cons]
)
//
in
  auxlst(env, s2es_met, s2es_bnd)
end // end of [aux_S2Emetdec]

(* ****** ****** *)

fun
aux_S2Etop
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-
S2Etop(_, s2e) = s2e0.s2exp_node
//
in
  formula_make_s2exp(env, s2e)
end // end of [aux_S2Etop]

(* ****** ****** *)

fun
aux_S2Einvar
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-
S2Einvar(s2e) = s2e0.s2exp_node
//
in
  formula_make_s2exp(env, s2e)
end // end of [aux_S2Einvar]

(* ****** ****** *)

fun
aux_S2Esizeof
(
  env: !smtenv, s2e0: s2exp
) : form = let
//
val-
S2Esizeof(s2e) = s2e0.s2exp_node
//
val s2e = formula_make_s2exp(env, s2e)
//
in
  formula_sizeof_t0ype(s2e)
end // end of [aux_S2Esizeof]

in (* in-of-local *)

implement
formula_make_s2exp
  (env, s2e0) = let
//
(*
val () =
println!
  ("formula_make_s2exp: s2e0 = ", s2e0)
*)
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
| S2Emetdec _ => aux_S2Emetdec (env, s2e0)
//
| S2Etop(_, s2e) => aux_S2Etop (env, s2e0)
//
| S2Einvar(s2e) => aux_S2Einvar (env, s2e0)
//
| S2Esizeof(s2e) => aux_S2Esizeof (env, s2e0)
//
| _ (*unrecognized*) => formula_error(s2e0)
//
end // end of [formula_make_s2exp]

end // end of [local]

(* ****** ****** *)

implement
formulas_make_s2explst
  (env, s2es) = (
//
case+ s2es of
| list_nil
    ((*void*)) => list_vt_nil()
| list_cons
    (s2e, s2es) => let
    val s2e = formula_make_s2exp(env, s2e)
    val s2es = formulas_make_s2explst(env, s2es)
  in
    list_vt_cons(s2e, s2es)
  end // end of [list_cons]
//
) (* end of [formulas_make_s2explst] *)

(* ****** ****** *)

(* end of [patsolve_z3_solving_form.dats] *)
