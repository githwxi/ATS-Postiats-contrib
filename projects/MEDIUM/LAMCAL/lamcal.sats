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
fun tvar_make : () -> tvar
fun tvar_make_int : (int) -> tvar
fun tvar_make_name : (string) -> tvar
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
#ifdef
MYTEXTING
#then
(*
//
##declats_equal_compare(tvar)
//
##declats_print_prerr_fprint(tvar)
##declats_print_prerr_fprint(term)
//
*)
#else
//
#include
"./lamcal_declats.hats"
//
#endif // end of [ifdef]
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

(* end of [lamcal.sats] *)
