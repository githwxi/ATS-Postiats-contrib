(*
** For studying
** lambda-calculus
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./lamcal.sats"

(* ****** ****** *)

dynload "./lamcal_tvar.dats"
dynload "./lamcal_term.dats"
dynload "./lamcal_aterm.dats"

(* ****** ****** *)

implement
main0((*void*)) =
{
//
val () =
println!
(
  "Hello from [lamcal]!"
) (* println! *)
//
val x =
  tvar_make_name("x")
//
val () = println! ("x = ", x)
val omega =
  TMlam(x, TMapp(TMvar(x), TMvar(x)))
//
val ((*void*)) = println! ("omega = ", omega)
//
val x' = tvar_make_index(0)
val () = println! ("x' = ", x')
val omega' =
  TMlam(x', TMapp(TMvar(x'), TMvar(x')))
//
val ((*void*)) = println! ("omega' = ", omega')
//
val ((*void*)) = assertloc(x = x)
val ((*void*)) = assertloc(x > x')
val ((*void*)) = assertloc(not(x <= x'))
val ((*void*)) = assertloc(not(x' != x'))
//
val omega = term_alpha_normalize(omega)
val omega' = term_alpha_normalize(omega')
val ((*void*)) = println! ("omega = ", omega)
val ((*void*)) = println! ("omega' = ", omega')
//
val ((*void*)) = assertloc(omega = omega')
val ((*void*)) = assertloc(not(omega != omega'))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mytest.dats] *)
