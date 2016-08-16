(*
** For studying
** lambda-calculus
** cbv: call-by-value
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

abstype tcst_type = ptr
typedef tcst = tcst_type

(* ****** ****** *)
//
datatype term =
  | TMvar of tvar
  | TMcst of tcst
  | TMlam of (tvar, term)
  | TMapp of (term, term)
  | TMlet of (tvar, term, term)
  | TMfix of (tvar, tvar, term)
//
(* ****** ****** *)
//
datatype aterm =
  | ATMvar of tvar
  | ATMcst of tcst
  | ATMlam of (aterm)
  | ATMapp of (aterm, aterm)
  | ATMlet of (aterm, aterm)
  | ATMfix of (aterm)
  | ATMref of ref(aterm)
//
(* ****** ****** *)

(* end of [lamcal.sats] *)
