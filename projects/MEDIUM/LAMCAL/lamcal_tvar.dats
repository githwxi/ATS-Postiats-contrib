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

staload "./lamcal.sats"

(* ****** ****** *)
//
datatype tvar =
  | TVARint of int
  | TVARname of string
//
assume tvar_type = tvar
//
(* ****** ****** *)
//
implement
tvar_make_int(n) = TVARint(n)
//
implement
tvar_make_name(name) = TVARname(name)
//
(* ****** ****** *)
//
implement
fprint_tvar(out, x) =
(
case+ x of
| TVARint(n) => fprint!(out, "$", n)
| TVARname(name) => fprint!(out, name)
)
//
(* ****** ****** *)

(* end of [lamcal_term.dats] *)
