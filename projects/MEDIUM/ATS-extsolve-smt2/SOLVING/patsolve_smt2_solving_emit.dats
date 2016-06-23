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
emit_s2cst
  (out, s2c) = let
//
val name = s2c.name()
val stamp = s2c.stamp()
//
in
  fprint! (out, name, "!", stamp)
end // end of [emit_s2cst]

(* ****** ****** *)

implement
emit_s2var
  (out, s2v) = let
//
val name = s2v.name()
val stamp = s2v.stamp()
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
    val () = fprint(out, "(")
    val () = fprint(out, "S2Eeqeq")
    val () = fprint(out, " ")
    val () = emit_s2exp(out, s2e1)
    val () = fprint(out, " ")
    val () = emit_s2exp(out, s2e2)
    val () = fprint(out, ")")
  }
//
| S2Emetdec(s2es1, s2es2) =>
  {
    val () = fprint(out, "(")
    val () = fprint(out, "S2Emetdec")
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
    implement
    list_foreach$fwork<s2exp><void>
      (s2e, env) = (
      fprint(out, " "); emit_s2exp(out, s2e)
    ) (* end of [list_foreach$fwork] *)
    in (* in-of-local*)
    val () = list_foreach(s2es_arg)
    end // end of [local]
//
    val () = fprint(out, ")")
  } (* end of [S2Eapp] *)
//
| _(*rest-of-s2exp*) => fprint(out, s2e0)
//
end // end of [emit_s2exp]

(* ****** ****** *)
//
implement
decl_s2var
  (out, s2v) = {
//
val () =
fprint (
  out, "(declare-const "
) (* fprint *)
//
val () = emit_s2var(out, s2v)
val () = fprintln! (out, ")")
//
} (* end of [decl_s2var] *)
//
implement
decl_s2varlst
  (out, s2vs) = let
//
implement
list_foreach$fwork<s2var><void>(s2v, env) = decl_s2var(out, s2v)
//
in
  list_foreach(s2vs)
end // end of [decl_s2varlst]
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
    val () = decl_s2varlst(out, s2vs)
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

(* end of [patsolve_smt2_solving_emit.dats] *)
