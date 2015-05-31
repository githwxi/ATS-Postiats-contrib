(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#define
Z3_targetloc
"$PATSHOMERELOC/contrib/SMT/Z3"
#define
PATSOLVE_targetloc "./.ATS-extsolve"
//
(* ****** ****** *)
//
staload "{$Z3}/SATS/z3.sats"
//
(* ****** ****** *)
//
staload "{$PATSOLVE}/patsolve_cnstrnt.sats"
//
(* ****** ****** *)

fun{}
c3nstr_z3_solve (c3nstr): void

(* ****** ****** *)
//
absvtype sort_vtype = ptr
//
vtypedef sort = sort_vtype
vtypedef sortlst = List0_vt (sort)
//
absvtype form_vtype = ptr
//
vtypedef form = form_vtype
vtypedef formlst = List0_vt (form)
//
absvtype func_decl_vtype = ptr
vtypedef func_decl = func_decl_vtype
//
(* ****** ****** *)
//
fun sort_int (): sort
fun sort_bool (): sort
//
fun sort_real (): sort
(*
fun sort_string (): sort
*)
//
fun sort_error (): sort
//
(* ****** ****** *)

fun sort_make_s2rt (s2rt): sort

(* ****** ****** *)

fun formula_true (): form
fun formula_false (): form

(* ****** ****** *)

fun formula_int (i: int): form
fun formula_intrep (rep: string): form

(* ****** ****** *)
//
fun formula_not (form): form
//
fun formula_beq (form, form): form
fun formula_bneq (form, form): form
//
fun formula_disj (form, form): form
fun formula_conj (form, form): form
fun formula_impl (form, form): form
//  
(* ****** ****** *)
//
fun formula_ineg (form): form
fun formula_iadd (form, form): form
fun formula_isub (form, form): form
fun formula_imul (form, form): form
fun formula_idiv (form, form): form
//
fun formula_ilt (form, form): form
fun formula_ilte (form, form): form
fun formula_igt (form, form): form
fun formula_igte (form, form): form
fun formula_ieq (form, form): form
fun formula_ineq (form, form): form
//
(* ****** ****** *)
//
fun formula_error((*void*)): form
//
(* ****** ****** *)
//
fun
formula_cond
(
  f_cond: form, f_then: form, f_else: form
) : form // end of [formula_cond]
//
(* ****** ****** *)
//
fun
formula_eqeq (s2e1: form, s2e2: form): form
//
(* ****** ****** *)
//
fun
formula_fdapp(f: func_decl, args: formlst): form
//
(* ****** ****** *)
//
fun 
func_decl_make
  (name: string, domain: sortlst, range: sort): func_decl
//
(* ****** ****** *)

absvtype smtenv_vtype
vtypedef smtenv = smtenv_vtype

(* ****** ****** *)
//
fun
smtenv_create(): smtenv
fun
smtenv_destroy(env: smtenv): void
//
fun
smtenv_set_verbose
  (env: !smtenv, verbose: bool): void
//
(* ****** ****** *)
//
fun
smtenv_add_s2var
  (env: !smtenv, s2v: s2var): void
fun
smtenv_add_s2exp
  (env: !smtenv, s2e: s2exp): void
//
(* ****** ****** *)
//
fun
formula_make_s2cst
  (env: !smtenv, s2c: s2cst): form
//
fun
formula_make_s2exp
  (env: !smtenv, s2p: s2exp): form
//
fun
formula_make_s2cst_s2explst
  (env: !smtenv, s2c: s2cst, s2ps: s2explst): form
//
(* ****** ****** *)

fun
smtenv_formula_solve (!smtenv, form): bool
 
(* ****** ****** *)

(* end of [patsolve_z3_solving.sats] *)
