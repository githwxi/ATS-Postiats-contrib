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
    Z3_mk_le (ctx, s2e1, s2e2)
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
    Z3_mk_ge (ctx, s2e1, s2e2)
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
| S2Eeqeq
    (s2e1, s2e2) => let
    val s2e1 =
      formula_make_s2exp(env, s2e1)
    and s2e2 =
      formula_make_s2exp(env, s2e2) in formula_eqeq (s2e1, s2e2)
  end // end of [S2Eeqeq]
//
| _ (*unrecognized*) => formula_error(s2e0)
//
end // end of [formula_make_s2exp]

(* ****** ****** *)

(* end of [patsolve_z3_solving_form.dats] *)
