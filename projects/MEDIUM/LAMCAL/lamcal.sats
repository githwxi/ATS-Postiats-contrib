(*
** For studying
** lambda-calculus
*)

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)

abstype tvar_type = ptr
typedef tvar = tvar_type

(* ****** ****** *)
//
fun tvar_make_name : (string) -> tvar
fun tvar_make_index : (intGte(0)) -> tvar
//
(* ****** ****** *)
//
fun tvar_get_index : tvar -> intGte(~1)
//
fun tvar_shift_gte : (tvar, int) -> tvar
//
(* ****** ****** *)

abstype tvarset_type = ptr
typedef tvarset = tvarset_type

(* ****** ****** *)
//
fun
tvarset_make_nil(): tvarset
fun
tvarset_make_sing(tvar): tvarset
//
fun
tvarset_is_nil : (tvarset) -> bool
fun
tvarset_is_member : (tvarset, tvar) -> bool
//
fun
tvarset_add : (tvarset, tvar) -> tvarset
fun
tvarset_remove : (tvarset, tvar) -> tvarset
//
fun
tvarset_union : (tvarset, tvarset) -> tvarset
//
(* ****** ****** *)
//
datatype term =
  | TMvar of tvar
  | TMlam of (tvar, term)
  | TMapp of (term, term)
//
(* ****** ****** *)
//
typedef tpath = list0(int)
abstype tpathset_type = ptr
typedef tpathset = tpathset_type
//
exception TPATH_ERROR of ()
//
(* ****** ****** *)
//
fun
tpathset_make_nil(): tpathset
fun
tpathset_make_sing(tpath): tpathset
//
fun
tpathset_is_nil : (tpathset) -> bool
fun
tpathset_is_member : (tpathset, tpath) -> bool
//
fun
tpathset_add : (tpathset, tpath) -> tpathset
fun
tpathset_remove : (tpathset, tpath) -> tpathset
//
fun
tpathset_union : (tpathset, tpathset) -> tpathset
//
(* ****** ****** *)
//
(*
fun tpathset_mcons(xs: tpathset, n: int): tpathset
*)
//
(* ****** ****** *)
//
fun
term_get_at
  (t0:term, ns:tpath): term
//
overload [] with term_get_at
//
(* ****** ****** *)
//
fun
term_eval_fvset: term -> tvarset
//
(* ****** ****** *)

fun
term_is_bnormal: term -> bool

(* ****** ****** *)
//
fun
term_find_bredexes: term -> stream_vt(tpath)
//
(* ****** ****** *)
//
datatype aterm =
  | ATMvar of tvar
  | ATMlam of (aterm)
  | ATMapp of (aterm, aterm)
//
(* ****** ****** *)
//
fun
aterm_shift(aterm): aterm
//
(* ****** ****** *)
//
fun
aterm_subst
  (t0: aterm, sub: aterm): aterm
//
(* ****** ****** *)
//
fun
term_alpha_normalize : term -> aterm
//
(* ****** ****** *)
//
fun aterm_is_bredex(t0: aterm): bool
//
(* ****** ****** *)
//
fun
aterm_breduce_leftmost(aterm): Option_vt(aterm)
//
fun aterm_mbreduce_leftmost(t0: aterm): aterm(*NF*)
//
(* ****** ****** *)
//
(*
//
##atext_fopen_out()
//
##atext_fprintln('(*')
##atext_fprintln('##ctime()*)')
##atext_fprintln("(* ****** ****** *)")

##ats2decl_fprint(tvar)
##ats2decl_compare(tvar)

##atext_fprintln("(* ****** ****** *)")

##ats2decl_fprint(term)

##atext_fprintln("(* ****** ****** *)")

##ats2decl_equal(aterm)
##ats2decl_fprint(aterm)

##atext_fprintln("(* ****** ****** *)")
//
##atext_fclose_top()
//
*)
#include "./HATS/lamcal_sats.hats"
//
(* ****** ****** *)

(* end of [lamcal.sats] *)
