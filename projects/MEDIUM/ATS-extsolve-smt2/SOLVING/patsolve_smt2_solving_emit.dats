(*
##
## ATS-extsolve-smt2:
## Outputing ATS-constraints
## in the format of smt-lib2
##
*)

(* ****** ****** *)
//
#ifndef
PATSOLVE_SMT2_SOLVING
#include "./myheader.hats"
#endif // end of [ifndef]
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

implement
emit_form
  (out, fml) = let
(*
val () =
println! ("emit_form")
*)
in
//
case+ fml of
| FORMnot(fml) =>
  {
    val () =
      fprint(out, "(not ")
    // end of [val]
    val () = emit_form(out, fml)
    val () = fprint! (out, ")")
  }
| FORMs2exp(s2e) =>
  {
    val () = emit_s2exp(out, s2e)
  }
| _ (*rest*) => fprint_form(out, fml)
//
end // end of [emit_form]

(* ****** ****** *)

implement
emit_s2rt
  (out, s2t0) = let
//
(*
val () =
  println! ("emit_s2rt")
*)
//
macdef
emit(x) = fprint(out, ,(x))
//
in
//
case+ s2t0 of
//
| S2RTint() => emit("s2rt_int")
| S2RTaddr() => emit("s2rt_addr")
| S2RTbool() => emit("s2rt_bool")
//
| S2RTreal() => emit("s2rt_real")
//
| S2RTfloat() => emit("s2rt_float")
| S2RTstring() => emit("s2rt_string")
//
| S2RTcls() => emit("s2rt_cls")
| S2RTeff() => emit("s2rt_err")
//
| S2RTtup() => emit("s2rt_tup")
//
| S2RTtype() => emit("s2rt_type")
| S2RTvtype() => emit("s2rt_vtype")
//
| S2RTt0ype() => emit("s2rt_t0ype")
| S2RTvt0ype() => emit("s2rt_vt0ype")
//
| S2RTprop() => emit("s2rt_prop")
| S2RTview() => emit("s2rt_view")
//
| S2RTtkind() => emit("s2rt_tkind")
//
| S2RTfun
  (
    s2ts_arg, s2t_res
  ) =>
  {
    val () = emit("(")
    val () = emit("s2rt_fun")
    val () = emit(" ")
    val () =
      emit_s2rtlst(out, s2ts_arg)
    // end of [val]
    val () = emit(" ")
    val () = emit_s2rt(out, s2t_res)
    val () = emit(")")
  }
//
| S2RTnamed
    (name) => fprint(out, name)
  // S2RTnamed
//
| S2RTerror() => emit("s2rt_error")
//
end // end of [emit_s2rt]

(* ****** ****** *)

implement
emit_s2rtlst
  (out, xs) = () where
{
//
val () = fprint(out, "(")
val () =
(
case+ xs of
| list_nil() => ()
| list_cons(x, xs) =>
  {
    val () = emit_s2rt(out, x)
//
    var
    fwork =
    lam@
    (
      x: s2rt
    ) : void => (
    fprint (out, " "); emit_s2rt(out, x)
    ) (* end of [lam@] *)
//
    val () = list_foreach_clo(xs, fwork)
  }
)
val () = fprint(out, ")")
//
} (* end of [emit_s2rtlst] *)

(* ****** ****** *)

implement
emit_s2cst
  (out, s2c0) = let
//
val name = s2c0.name()
//
val opt0 = s2cst_get_s2cinterp(s2c0)
//
in
//
case+ opt0 of
| Some _ => fprint! (out, name)
| None _ => fprint! (out, name, "!", s2c0.stamp())
//
end // end of [emit_s2cst]

(* ****** ****** *)

implement
emit_s2var
  (out, s2v0) = let
//
val name = s2v0.name()
val stamp = s2v0.stamp()
//
in
  fprint! (out, name, "!", stamp)
end // end of [emit_s2var]

(* ****** ****** *)

implement
emit_s2exp
  (out, s2e0) = let
//
(*
val () = 
println! ("emit_s2exp")
*)
//
fun
aux_bool
(
  b: bool
) : void = (
//
fprint_string
(
  out, if b then "true" else "false"
)
//
) (* end of [aux_bool] *)
//
fun
aux_lt
(
  s2e1: s2exp, s2e2: s2exp
) : void =
{
   val () =
     fprint(out, "(< ")
   // end of [val]
   val () = emit_s2exp(out, s2e1)
   val () = fprint(out, " ")
   val () = emit_s2exp(out, s2e2)
   val () = fprint(out, ")")
}
//
fun
aux_lte
(
  s2e1: s2exp, s2e2: s2exp
) : void =
{
   val () =
     fprint(out, "(<= ")
   // end of [val]
   val () = emit_s2exp(out, s2e1)
   val () = fprint(out, " ")
   val () = emit_s2exp(out, s2e2)
   val () = fprint(out, ")")
}
//
fun
aux_metdec
(
  s2es1: s2explst, s2es2: s2explst
) : void =
(
case+ s2es1 of
| list_nil() =>
    aux_bool(false)
  // list_nil
| list_cons(s2e1, nil()) =>
  (
    case- s2es2 of
    | list_cons(s2e2, nil()) =>
      {
        val () = aux_lt(s2e1, s2e2)
      }
  )
| list_cons(s2e1, s2es1) =>
  (
    case- s2es2 of
    | list_cons(s2e2, s2es2) =>
      {
        val () = fprint(out, "(or ")
        val () = aux_lt(s2e1, s2e2)
        val () = fprint(out, " ")
        val () = fprint(out, "(and ")
        val () = aux_lte(s2e1, s2e2)
        val () = fprint(out, " ")
        val () = aux_metdec(s2es1, s2es2)
        val () = fprint(out, ")")
        val () = fprint(out, ")")
      }
  )
) (* end of [aux_metdec] *)
//
in
//
case+
s2e0.s2exp_node
of // case+
| S2Eint(int) => fprint(out, int)
| S2Eintinf(rep) => fprint(out, rep)
| S2Ecst(s2c) => emit_s2cst(out, s2c)
| S2Evar(s2v) => emit_s2var(out, s2v)
//
| S2Eeqeq(s2e1, s2e2) =>
  {
    val () =
    fprint
      (out, "(s2exp_eqeq (=")
    // end of [val]
    val () = fprint(out, " ")
    val () = emit_s2exp(out, s2e1)
    val () = fprint(out, " ")
    val () = emit_s2exp(out, s2e2)
    val () = fprint(out, "))")
  }
//
| S2Emetdec(s2es1, s2es2) =>
  {
    val () = fprint(out, "(")
    val () =
      fprint(out, "s2exp_metdec")
    // end of [val]
    val () = fprint(out, " ")
    val () = aux_metdec(s2es1, s2es2)
    val () = fprint(out, ")")
  }
//
| S2Eapp
  (
    s2e_fun, s2es_arg
  ) =>
  {
    val () = fprint(out, "(")
    val () = emit_s2exp(out, s2e_fun)
//
    local
    var
    fwork =
    lam@
    (
      s2e: s2exp
    ) : void =<clo1>
    (
      fprint(out, " "); emit_s2exp(out, s2e)
    ) (* end of [list_foreach$fwork] *)
    in (* in-of-local*)
    val () = list_foreach_clo<s2exp>(s2es_arg, fwork)
    end // end of [local]
//
    val () = fprint(out, ")")
  } (* end of [S2Eapp] *)
//
| _(*rest-of-s2exp*) => fprint(out, s2e0)
//
end // end of [emit_s2exp]

(* ****** ****** *)

implement
emit_decl_s2cst
  (out, s2c) = let
//
fun
auxs2t
(
  s2t: s2rt
) : void = (
//
case+ s2t of
| S2RTfun
  (
    s2ts_arg, s2t_res
  ) =>
  {
    val () =
      emit_s2rtlst(out, s2ts_arg)
    // end of [val]
    val () = fprint(out, " ")
    val () = emit_s2rt(out, s2t_res)
  }
| _ (*non-fun*) => emit_s2rt(out, s2t)
//
) (* end of [auxs2t] *)
//
fun
auxs2c
(
  s2c: s2cst
) : void =
{
  val () =
  fprint (out, "(declare-fun ")
  val () =
  fprint! (out, s2c.name(), "!", s2c.stamp())
  val () = fprint(out, " ")
  val () = auxs2t(s2c.srt())
  val () = fprintln! (out, ")")
}
//
val opt0 =
  s2cst_get_s2cinterp(s2c)
//
in
//
case+ opt0 of
| None _ => auxs2c(s2c) | Some _ => ((*global*))
//
end // end of [emit_decl_s2cst]

(* ****** ****** *)

implement
emit_decl_s2cstlst
  (out, s2cs) = let
//
implement
list_foreach$fwork<s2cst><void>
  (s2c, env) = emit_decl_s2cst(out, s2c)
//
in
  list_foreach(s2cs)
end // end of [emit_decl_s2cstlst]

(* ****** ****** *)
//
implement
emit_decl_s2var
  (out, s2v) = {
//
val () =
fprint (
  out, "(declare-const "
) (* fprint *)
//
val () = emit_s2var(out, s2v)
val () = fprint (out, " ")
val () = emit_s2rt(out, s2v.srt())
val () = fprintln! (out, ")")
//
} (* end of [decl_s2var] *)
//
implement
emit_decl_s2varlst
  (out, s2vs) = let
//
implement
list_foreach$fwork<s2var><void>
  (s2v, env) = emit_decl_s2var(out, s2v)
//
in
  list_foreach(s2vs)
end // end of [emit_decl_s2varlst]
//
(* ****** ****** *)

implement
emit_solvercmd
  (out, cmd) = let
//
(*
val () =
println! ("emit_solvercmd")
*)
//
in
//
case+ cmd of
//
| SOLVERCMDpop() => fprintln! (out, "(pop)")
| SOLVERCMDpush() => fprintln! (out, "(push)")
//
| SOLVERCMDassert(fml) =>
  {
    val () =
      fprint(out, "(assert ")
    // end of [val]
    val () = emit_form(out, fml)
    val () = fprintln! (out, ")")
  } (* end of [SOLVERCMDassert] *)
//
| SOLVERCMDchecksat
    ((*void*)) => fprintln! (out, "(check-sat)")
//
| SOLVERCMDecholoc(loc) =>
  {
    val () = fprintln! (out, "(echo \"", loc, "\")")
  }
//
| SOLVERCMDpopenv _ => () // removed
| SOLVERCMDpushenv _ => () // removed
//
| SOLVERCMDpopenv2 _ => ()
| SOLVERCMDpushenv2(s2vs) =>
  {
    val ((*void*)) = emit_decl_s2varlst(out, s2vs)
  } (* SOLVERCMDpushenv2 *)
//
end // end of [emit_solvercmd]

(* ****** ****** *)

implement
emit_solvercmdlst
  (out, cmds) =
(
//
case+ cmds of
| list_nil() => ()
| list_cons(cmd, cmds) =>
  {
    val () = emit_solvercmd(out, cmd)
    val () = emit_solvercmdlst(out, cmds)
  } (* end of [list_cons] *)
//
) (* end of [emit_solvercmdlst] *)

(* ****** ****** *)

implement
emit_preamble(out) = () where
{
//
macdef
emitln(x) = fprintln! (out, ,(x))
//
val () = emitln("(declare-sort s2rt_cls 0)")
val () = emitln("(declare-sort s2rt_eff 0)")
val () = emitln("(declare-sort s2rt_type 0)")
val () = emitln("(declare-sort s2rt_vtype 0)")
val () = emitln("(declare-sort s2rt_t0ype 0)")
val () = emitln("(declare-sort s2rt_vt0ype 0)")
val () = emitln("(declare-sort s2rt_prop 0)")
val () = emitln("(declare-sort s2rt_view 0)")
val () = emitln("(declare-sort s2rt_tkind 0)")
val () = emitln("(declare-sort s2rt_error 0)")
//
val () = emitln("(define-sort s2rt_int () Int)")
val () = emitln("(define-sort s2rt_bool () Bool)")
val () = emitln("(define-sort s2rt_real () Real)")
//
val () = emitln("(define-fun s2exp_eqeq ((x Bool)) Bool x)")
val () = emitln("(define-fun s2exp_metdec ((x Bool)) Bool x)")
//
val () = emitln("(declare-fun sizeof_t0ype (s2rt_t0ype) Int)")
//
val () = emitln("(define-fun neg_int ((x Int)) Int (- x))")
val () = emitln("(define-fun abs_int ((x Int)) Int (abs x))")
val () = emitln("(define-fun add_int_int ((x Int) (y Int)) Int (+ x y))")
val () = emitln("(define-fun sub_int_int ((x Int) (y Int)) Int (- x y))")
val () = emitln("(define-fun mul_int_int ((x Int) (y Int)) Int (* x y))")
val () = emitln("(define-fun div_int_int ((x Int) (y Int)) Int (div x y))")
val () = emitln("(define-fun mod_int_int ((x Int) (y Int)) Int (mod x y))")
//
val () = emitln("(define-fun eq_int_int ((x Int) (y Int)) Bool (= x y))")
val () = emitln("(define-fun lt_int_int ((x Int) (y Int)) Bool (< x y))")
val () = emitln("(define-fun gt_int_int ((x Int) (y Int)) Bool (> x y))")
val () = emitln("(define-fun lte_int_int ((x Int) (y Int)) Bool (<= x y))")
val () = emitln("(define-fun gte_int_int ((x Int) (y Int)) Bool (>= x y))")
val () = emitln("(define-fun neq_int_int ((x Int) (y Int)) Bool (not (= x y)))")
//
val () = emitln("(define-fun sgn_int ((x Int)) Int (ite (< x 0) -1 (ite (> x 0) 1 0)))")
//
val () = emitln("(define-fun max_int_int ((x Int) (y Int)) Int (ite (>= x y) x y))")
val () = emitln("(define-fun min_int_int ((x Int) (y Int)) Int (ite (<= x y) x y))")
//
val () = emitln("(define-fun neg_bool ((x Bool)) Bool (not x))")
val () = emitln("(define-fun add_bool ((x Bool) (y Bool)) Bool (or x y))")
val () = emitln("(define-fun mul_bool ((x Bool) (y Bool)) Bool (and x y))")
//
val () = emitln("(define-fun eq_bool_bool ((x Bool) (y Bool)) Bool (= x y))")
val () = emitln("(define-fun lt_bool_bool ((x Bool) (y Bool)) Bool (and (not x) y))")
val () = emitln("(define-fun gt_bool_bool ((x Bool) (y Bool)) Bool (and x (not y)))")
val () = emitln("(define-fun neq_bool_bool ((x Bool) (y Bool)) Bool (not (= x y)))")
val () = emitln("(define-fun lte_bool_bool ((x Bool) (y Bool)) Bool (or (not x) y))")
val () = emitln("(define-fun gte_bool_bool ((x Bool) (y Bool)) Bool (or x (not y)))")
//
val () = emitln("(define-fun neg_real ((x Real)) Real (- x))")
val () = emitln("(define-fun abs_real ((x Real)) Real (abs x))")
val () = emitln("(define-fun add_real_real ((x Real) (y Real)) Real (+ x y))")
val () = emitln("(define-fun sub_real_real ((x Real) (y Real)) Real (- x y))")
val () = emitln("(define-fun mul_real_real ((x Real) (y Real)) Real (* x y))")
val () = emitln("(define-fun div_real_real ((x Real) (y Real)) Real (/ x y))")
//
val () = emitln("(define-fun eq_real_real ((x Real) (y Real)) Bool (= x y))")
val () = emitln("(define-fun lt_real_real ((x Real) (y Real)) Bool (< x y))")
val () = emitln("(define-fun gt_real_real ((x Real) (y Real)) Bool (> x y))")
val () = emitln("(define-fun lte_real_real ((x Real) (y Real)) Bool (<= x y))")
val () = emitln("(define-fun gte_real_real ((x Real) (y Real)) Bool (>= x y))")
val () = emitln("(define-fun neq_real_real ((x Real) (y Real)) Bool (not (= x y)))")
//
val () = emitln("(define-fun max_real_real ((x Real) (y Real)) Real (ite (>= x y) x y))")
val () = emitln("(define-fun min_real_real ((x Real) (y Real)) Real (ite (<= x y) x y))")
//
} (* end of [emit_preamble] *)

(* ****** ****** *)

implement
emit_the_s2cstmap
  (out) = () where
{
//
val s2cs = the_s2cstmap_listize()
//
val ((*void*)) =
  emit_decl_s2cstlst(out, $UN.list_vt2t(s2cs))
//
val ((*freed*)) = list_vt_free(s2cs)
//
} (* end of [emit_the_s2cstmap] *)

(* ****** ****** *)

(* end of [patsolve_smt2_solving_emit.dats] *)
