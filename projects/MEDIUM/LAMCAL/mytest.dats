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
//
dynload "./lamcal_tvar.dats"
dynload "./lamcal_tvarset.dats"
//
dynload "./lamcal_term.dats"
dynload "./lamcal_tpathset.dats"
//
dynload "./lamcal_aterm.dats"
//
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
val () = assertloc(term_is_bnormal(omega))
val () = assertloc(term_is_bnormal(omega'))
val () = assertloc(~term_is_bnormal(TMapp(omega, omega')))
//
val omega = term_alpha_normalize(omega)
val omega' = term_alpha_normalize(omega')
//
val ((*void*)) = assertloc(omega = omega')
val ((*void*)) = assertloc(not(omega != omega'))
//
val ((*void*)) = println! ("omega = ", omega)
val ((*void*)) = println! ("omega' = ", omega')
//
val Omega = ATMapp(omega, omega)
val-~Some_vt(Omega') = aterm_breduce_leftmost(Omega)
//
val ((*void*)) = assertloc(Omega = Omega')
//
val ((*void*)) = println! ("Omega = ", Omega)
val ((*void*)) = println! ("Omega' = ", Omega')
//
val y = tvar_make_name("y")
val z = tvar_make_name("z")
//
val K = TMlam(x, TMlam(y, TMvar(x)))
val S = TMlam(x, TMlam(y, TMlam(z, TMapp(TMapp(TMvar(x), TMvar(z)), TMapp(TMvar(y), TMvar(z))))))
//
val _ = assertloc(tvarset_is_nil(term_eval_fvset(K)))
val _ = assertloc(tvarset_is_nil(term_eval_fvset(S)))
//
val K = term_alpha_normalize(K)
val S = term_alpha_normalize(S)
//
val SKK = ATMapp(ATMapp(S, K), K)
//
val I = aterm_mbreduce_leftmost(SKK)
val ((*void*)) = println! ("I = ", I)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mytest.dats] *)
