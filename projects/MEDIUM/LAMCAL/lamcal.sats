(*
** For studying
** lambda-calculus
*)

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
staload
"libats/ML/SATS/funset.sats"
//
(* ****** ****** *)

abstype tvar_type = ptr
typedef tvar = tvar_type

(* ****** ****** *)
//
val TVARSET: set_modtype(tvar)
//
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
//
datatype term =
  | TMvar of tvar
  | TMlam of (tvar, term)
  | TMapp of (term, term)
//
(* ****** ****** *)
//
typedef tpath = list0(int)
typedef tpathset = set(tpath)
//
exception TPATH_ERROR of ()
//
(* ****** ****** *)
//
val TPATHSET: set_modtype(tpath)
//
(* ****** ****** *)
//
fun
tpathset_mcons(xs: tpathset, n: int): tpathset
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
term_eval_fvset: term -> set(tvar)
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
#include "./HATS/lamcal_sats.hats"
//
(* ****** ****** *)

(* end of [lamcal.sats] *)
