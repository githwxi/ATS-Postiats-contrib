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

dynload "./lamcal_tvar.dats"
dynload "./lamcal_term.dats"

(* ****** ****** *)

implement
main0((*void*)) =
{
//
val () =
println!
  ("Hello from [lamcal]!")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [lamcal_term.dats] *)
