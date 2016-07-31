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
macdef TVS = TVARSET
macdef eval = term_eval_fvset
//
in
//
case+ t0 of
//
| TMvar(x) => (TVS.sing)(x)
//
| TMlam(
    x, t_body
  ) => let
    var tvs = eval(t_body)
  in
    ignoret(TVS.remove)(tvs, x); tvs
  end // end of [TMlam]
| TMapp(t1, t2) =>
    (TVS.union)(eval(t1), eval(t2))
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
//
implement
term_is_bnormal
  (t0) =
(
iseqz(term_find_bredexes(t0))
)
//
(* ****** ****** *)
//
implement
term_find_bredexes
  (t0) = $ldelay(
//
let
//
macdef aux = term_find_bredexes
//
macdef
mcons(xs, n) =
stream_vt_map_cloptr<tpath><tpath>
  (,(xs), lam x => list0_cons(,(n), x))
//
overload + with stream_vt_append
//
in (* in-of-local *)
//
case+ t0 of
| TMvar _ =>
  stream_vt_nil()
//
| TMlam
  (
    _, t_body
  ) => !(mcons(aux(t_body), 0))
//
| TMapp
  (
    t_fun, t_arg
  ) => let
    val root =
    (
      case+ t_fun of
      | TMlam _ =>
        stream_vt_make_sing(list0_nil)
      | _(*non-TMlam*) => stream_vt_make_nil()
    ) : stream_vt(tpath)
  in
    !(root + (mcons(aux(t_fun), 0) + mcons(aux(t_arg), 1)))
  end // end of [TMapp]
//
end : stream_vt_con(tpath)
//
) (* end of [term_find_bredexes] *)

(* ****** ****** *)

(*
//
##atext_fopen_path\
("\
./HATS/lamcal_term_fprint.hats\
")
##ats2impl_fprint2printerr(term)
//
##atext_fclose_top()
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
//
(*
##atext_fopen_path\
("\
./HATS/lamcal_tpath_funset.hats\
")
##ats2impl_funset(tpath, TPATHSET)
##atext_fclose_top()
*)
#include"\
./HATS/lamcal_tpath_funset.hats\
" // #include
//
(* ****** ****** *)

(* end of [lamcal_term.dats] *)
