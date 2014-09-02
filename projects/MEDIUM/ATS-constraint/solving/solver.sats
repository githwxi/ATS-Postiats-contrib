(**
  A generic wrapper around an SMT solver for solving ATS constraints.
*)

staload "constraint.sats"
staload "solving/smt.sats"

absviewt@ype smtenv_viewtype = @{
  smt= ptr,
  variables= @{
    statics= ptr
  },
  err= int
}

viewtypedef smtenv = smtenv_viewtype

fun smtenv_nil (env: &smtenv? >> smtenv): void
fun smtenv_free (env: &smtenv >> smtenv?): void

absview smtenv_push_v

fun smtenv_push (env: &smtenv): (smtenv_push_v | void)
fun smtenv_pop  (pf: smtenv_push_v | env: &smtenv): void

fun smtenv_add_svar (env: &smtenv, s2v: s2var): void
fun smtenv_get_var_exn (env: &smtenv, s2v: s2var): formula
fun smtenv_assert_sbexp (env: &smtenv, s2e: s2exp): void

fun smtenv_formula_is_valid (env: &smtenv, fm: formula): bool

fun smtenv_assert_formula (env: &smtenv, fm: formula): void

fun formula_cst (s2c: s2cst): formula

(* ****** ****** *)

absvt@ype s2varmap_vt0ype (a:viewt@ype) = @{
  scopes= ptr,
  variables= ptr
}

vtypedef s2varmap (a:vt@ype) = s2varmap_vt0ype (a)

fun {a:vt@ype}
s2varmap_element_free (a): void

fun {a:vt@ype}
s2varmap_element_copy (!a): a

fun {a:vt@ype}
s2varmap_nil (&s2varmap(a)? >> s2varmap(a)): void

fun {a:vt@ype}
s2varmap_delete (&s2varmap (a) >> s2varmap(a)?): void

fun {a:vt@ype}
s2varmap_add (&s2varmap (a), s2var, a): Option_vt (a)

(**
  Internally, this will make a copy of whatever type
  the s2var is mapped to.
*)
fun {a:vt@ype}
s2varmap_find (&s2varmap (a), s2var): Option_vt (a)

fun {a:vt@ype}
s2varmap_push (&s2varmap (a)): void

fun {a:vt@ype}
s2varmap_pop (&s2varmap (a)): void

fun {a:vt@ype}
s2varmap_size (&s2varmap (a)): size_t

(* ****** ****** *)

fun s2exp_make_h3ypo (env: &smtenv, h3p: h3ypo): s2exp
//
fun formula_make (env: &smtenv, s2e: s2exp): formula
//
fun make_true (env: &smtenv): formula
//
fun s2exp_make_h3ypo (env: &smtenv, h3p: h3ypo): s2exp
//
fun formula_make (env: &smtenv, s2e: s2exp): formula
//
// HX: these are auxiliary functions
//
fun formula_make_s2cst_s2explst
(
  env: &smtenv, s2c: s2cst, s2es: s2explst
) : formula // end of [s3exp_make_s2cst_s2explst]

(* ****** ****** *)

fun sort_make (s2rt): sort

(* ****** ****** *)

fun smtlib2_assert_file (file: string): void

(* ****** ****** *)

fun c3nstr_solve (c3t: c3nstr): void

(* ****** ****** *)

fun the_s2cdeclmap_listize (): List0_vt (@(string, func_decl))

(* ****** ****** *)

abstype s2cstmap (a:t@ype) = ptr

fun {a:t@ype}
s2cstmap_nil (): s2cstmap (a)

fun {a:t@ype}
s2cstmap_find (store: s2cstmap (a), key: s2cst): a

fun {a:t@ype}
s2cstmap_add (store: s2cstmap (a), key: s2cst, itm: a): s2cstmap (a)

(* ****** ****** *)

absvtype s2cfunmap = ptr

fun constraint3_initialize (): void

(* ****** ****** *)

typedef s2cstmap_ftype = (&smtenv, s2explst) -> formula

(* ****** ****** *)

fun f_identity : s2cstmap_ftype

fun f_neg_bool : s2cstmap_ftype

fun f_add_bool_bool : s2cstmap_ftype

fun f_mul_bool_bool : s2cstmap_ftype

fun f_eq_bool_bool : s2cstmap_ftype

fun f_neq_bool_bool : s2cstmap_ftype

fun f_neg_int : s2cstmap_ftype

fun f_add_int_int : s2cstmap_ftype

fun f_sub_int_int : s2cstmap_ftype

fun f_mul_int_int : s2cstmap_ftype

fun f_div_int_int : s2cstmap_ftype

fun f_ndiv_int_int : s2cstmap_ftype

fun f_idiv_int_int : s2cstmap_ftype

fun f_lt_int_int : s2cstmap_ftype

fun f_lte_int_int : s2cstmap_ftype

fun f_gt_int_int : s2cstmap_ftype

fun f_gte_int_int : s2cstmap_ftype

fun f_eq_int_int : s2cstmap_ftype

fun f_neq_int_int : s2cstmap_ftype

fun f_abs_int : s2cstmap_ftype

fun f_sgn_int : s2cstmap_ftype

fun f_max_int_int : s2cstmap_ftype

fun f_min_int_int : s2cstmap_ftype

fun f_ifint_bool_int_int : s2cstmap_ftype

fun f_rat_int : s2cstmap_ftype

fun f_rat_int_int : s2cstmap_ftype

fun f_mul_rat_rat : s2cstmap_ftype

fun f_div_rat_rat : s2cstmap_ftype

fun f_add_rat_rat : s2cstmap_ftype

fun f_sub_rat_rat : s2cstmap_ftype

fun f_gte_rat_rat : s2cstmap_ftype

fun f_is_int_int : s2cstmap_ftype

fun f_lte_cls_cls : s2cstmap_ftype

(* ****** ****** *)

fun f_bv8_of_int : s2cstmap_ftype

fun f_sub_bv_bv : s2cstmap_ftype

fun f_add_bv_bv : s2cstmap_ftype

fun f_land_bv_bv : s2cstmap_ftype

fun f_eq_bv_bv : s2cstmap_ftype

(* ****** ****** *)

fun f_partitioned_array : s2cstmap_ftype
fun f_sorted_array : s2cstmap_ftype
fun f_sorted_split_array : s2cstmap_ftype

fun f_partitioned_left_array  : s2cstmap_ftype
fun f_partitioned_right_array : s2cstmap_ftype

fun f_merged_array : s2cstmap_ftype

fun f_array_store : s2cstmap_ftype
fun f_array_select : s2cstmap_ftype

fun f_array_swap : s2cstmap_ftype

fun f_lte_stamp_stampseq : s2cstmap_ftype
fun f_lte_stampseq_stamp : s2cstmap_ftype

(* ****** ****** *)