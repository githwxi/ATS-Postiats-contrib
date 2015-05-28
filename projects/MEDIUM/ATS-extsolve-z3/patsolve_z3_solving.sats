(*
##
## ATS-extsolve-z3:
## Solving ATS-constraints with Z3
##
*)

(* ****** ****** *)
//
#define
PATSOLVE_targetloc "./.ATS-extsolve"
//
staload "{$PATSOLVE}/patsolve_cnstrnt.sats"
//
(* ****** ****** *)

fun{}
c3nstr_z3_solve (c3nstr): void

(* ****** ****** *)
//
absvtype sort = ptr
vtypedef sortlst = List0_vt (sort)
//
absvtype formula = ptr
vtypedef form = formula
vtypedef formlst = List0_vt (form)
//
absvtype func_decl = ptr
//
(* ****** ****** *)

fun sort_make_int (): sort
fun sort_make_bool (): sort
fun sort_make_real (): sort

(* ****** ****** *)

fun sort_make_s2rt (s2rt): sort

(* ****** ****** *)
//
fun
formula_make_int
  (i: int, srt: !sort): form
//
(* ****** ****** *)

fun formula_make_true  (): form
fun formula_make_false (): form

(* ****** ****** *)

fun formula_make_int (i: int): form
fun formula_make_intrep (rep: string): form

(* ****** ****** *)
//
fun
formula_make_app
  (f: func_decl, args: formlst): form
//
(* ****** ****** *)

fun 
func_decl_make
(
  name: string, domain: sortlst, range: sort
) : func_decl // end of [func_decl_make]

(* ****** ****** *)
//
fun formula_make_not (form): form
//
fun formula_make_disj (form, form): form
fun formula_make_conj (form, form): form
fun formula_make_impl (form, form): form
//
fun
formula_make_cond
(
  f_cond: form, f_then: form, f_else: form
) : form // end of [formula_make_cond]
//
(* ****** ****** *)

fun formula_make_s2cst (s2c: s2cst): form

(* ****** ****** *)

absvtype smtenv_vtype
vtypedef smtenv = smtenv_vtype

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
formula_make_s2exp(env: !smtenv, s2p: s2exp): form
//
(* ****** ****** *)

fun
smtenv_formula_solve (!smtenv, form): bool
 
(* ****** ****** *)

(* end of [patsolve_z3_solving.sats] *)
