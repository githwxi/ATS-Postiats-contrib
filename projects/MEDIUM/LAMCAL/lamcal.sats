(*
** For studying lambda-calculus
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
datatype
term =
  | TMvar of tvar
  | TMapp of (term, term)
  | TMlam of (tvar, term)
//
(* ****** ****** *)
//
fun print_tvar : tvar -> void
fun fprint_tvar : fprint_type(term)
//
overload print with print_tvar
overload fprint with fprint_tvar
//
fun print_term : term -> void
fun fprint_term : fprint_type(term)
//
overload print with print_term
overload fprint with fprint_term
//
(* ****** ****** *)

typedef tpath = list0(int)

(* ****** ****** *)

exception TPATH_EXN of ()

(* ****** ****** *)
//
fun
term_get_at
  : (term, tpath) -> term
//
overload [] with term_get_at
//
(* ****** ****** *)

(* end of [lamcal.sats] *)
