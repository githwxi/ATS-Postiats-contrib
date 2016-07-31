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
//
staload "./lamcal.sats"
//
staload _ = "./lamcal_tvar.dats"
//
(* ****** ****** *)
//
implement
fprint_val<term> = fprint_term
//
(* ****** ****** *)

implement
term_eval_fvset
  (t0) = let
//
(*
val () =
println! ("term_get_fvset")
*)
//
macdef eval = term_eval_fvset
//
in
//
case+ t0 of
| TMvar(x) =>
    tvarset_make_sing(x)
| TMlam(x, t_body) =>
    tvarset_remove(eval(t_body), x)
| TMapp(t1, t2) =>
    tvarset_union(eval(t1), eval(t2))
//
end // end of [term_get_fvset]

(* ****** ****** *)

implement
term_get_at
  (t0, ns) =
(
  case+ ns of
  | list0_nil() => t0
  | list0_cons(n, ns) =>
    (
      case+ (t0, n) of
      | (TMlam(x1, t2), 0) => t2[ns]
      | (TMapp(t1, t2), 0) => t1[ns]
      | (TMapp(t1, t2), 1) => t2[ns]
      | (_, _)(*erroneous-path*) => $raise TPATH_ERROR()
    ) (* list0_cons *)
) (* end of [term_get_at] *)

(* ****** ****** *)

(*
//
##ats2impl_fprint2printerr(term)
//
*)

(* ****** ****** *)
//
extern
fun{}
fprint_term_
  (FILEref, term): void
//
#ifdef
CODEGEN2_FPRINT
#then
#codegen2(fprint, term)
#endif // end of [ifdef]
//
#include
"./HATS/lamcal_term_fprint.hats"
//
implement
fprint_term
  (out, x0) = fprint_term_<>(out, x0)
//
(* ****** ****** *)

(* end of [lamcal_term.dats] *)
