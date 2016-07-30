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
//
datatype term =
  | TMvar of tvar
  | TMlam of (tvar, term)
  | TMapp of (term, term)
//
(* ****** ****** *)
//
typedef tpath = list0(int)
//
exception TPATH_ERROR of ()
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
