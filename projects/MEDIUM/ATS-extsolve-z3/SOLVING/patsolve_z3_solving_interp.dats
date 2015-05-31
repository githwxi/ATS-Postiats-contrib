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
(* ****** ****** *)

local
//
#define :: list_cons
//
typedef
f_type =
  (!smtenv, s2explst) -> form
//
extern
fun f_identity : f_type
//
extern
fun f_neg_bool : f_type
//
extern
fun
f_add_bool_bool : f_type
and
f_mul_bool_bool : f_type
//
extern
fun f_eq_bool_bool : f_type
and f_neq_bool_bool : f_type
//
extern
fun f_neg_int : f_type
//
extern
fun f_add_int_int : f_type
and f_sub_int_int : f_type
extern
fun f_mul_int_int : f_type
and f_div_int_int : f_type
//
extern
fun f_lt_int_int : f_type
and f_lte_int_int : f_type
//
extern
fun f_gt_int_int : f_type
and f_gte_int_int : f_type
//
extern
fun f_eq_int_int : f_type
and f_neq_int_int : f_type
//
(* ****** ****** *)

in (* in-of-local *)

implement
f_identity
  (env, s2es) = let
  val-s2e1 :: _  = s2es
in
  formula_make_s2exp (env, s2e1)
end // end of [f_identity]

(* ****** ****** *)

implement
f_neg_bool
  (env, s2es) = let
  val-s2e1 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
in
  formula_not (s2e1)
end // end of [f_neg_bool]

(* ****** ****** *)

implement
f_add_bool_bool
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_disj (s2e1, s2e2)
end // end of [f_add_bool_bool]

implement
f_mul_bool_bool
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_conj (s2e1, s2e2)
end // end of [f_mul_bool_bool]

(* ****** ****** *)

implement
f_eq_bool_bool
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_beq (s2e1, s2e2)
end (* end of [f_eq_bool_bool] *)

implement
f_neq_bool_bool
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_bneq (s2e1, s2e2)
end (* end of [f_neq_bool_bool] *)

(* ****** ****** *)

implement
f_neg_int
  (env, s2es) = let
  val-s2e1 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
in
  formula_ineg (s2e1)
end (* end of [f_neg_int] *)

(* ****** ****** *)
  
implement
f_add_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_iadd (s2e1, s2e2)
end (* end of [f_add_int_int] *)

implement
f_sub_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_isub (s2e1, s2e2)
end (* end of [f_sub_int_int] *)

(* ****** ****** *)

implement
f_mul_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_imul (s2e1, s2e2)
end (* end of [f_mul_int_int] *)

implement
f_div_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_idiv (s2e1, s2e2)
end (* end of [f_div_int_int] *)

(* ****** ****** *)

implement
f_lt_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_ilt (s2e1, s2e2)
end (* end of [f_lt_int_int] *)

implement
f_lte_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_ilte (s2e1, s2e2)
end (* end of [f_lte_int_int] *)

(* ****** ****** *)

implement
f_gt_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_igt (s2e1, s2e2)
end (* end of [f_gt_int_int] *)

implement
f_gte_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_igte (s2e1, s2e2)
end (* end of [f_gte_int_int] *)

(* ****** ****** *)

implement
f_eq_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_ieq (s2e1, s2e2)
end (* end of [f_eq_int_int] *)

implement
f_neq_int_int
  (env, s2es) = let
  val-s2e1 :: s2e2 :: _ = s2es
  val s2e1 = formula_make_s2exp (env, s2e1)
  val s2e2 = formula_make_s2exp (env, s2e2)
in
  formula_ineq (s2e1, s2e2)
end (* end of [f_neq_int_int] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [patsolve_z3_solving_interp.dats] *)
