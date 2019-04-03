(*
** For studying
** simply-typed
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
//
datatype styp =
| STbas of int
| STfun of (styp, styp)
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
datatype term =
  | TMvar of tvar
  | TMlam of (tvar, styp, term)
  | TMapp of (term, term)
//
(* ****** ****** *)
//
fun term_type_check : (term) -> bool
//
(* ****** ****** *)
//
#ifdef
CODEGEN
#include "./CODEGEN/lamcal_sats.hats"
#endif // endof [ifdef]
//
(* ****** ****** *)

(* end of [lamcal.sats] *)
