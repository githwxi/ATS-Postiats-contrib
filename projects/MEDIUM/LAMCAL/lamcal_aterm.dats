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
staload _ = "./lamcal_term.dats"
//
(* ****** ****** *)

#include "prelude/lmacrodef.hats"

(* ****** ****** *)
//
implement
fprint_val<aterm> = fprint_aterm
//
(* ****** ****** *)

implement
eq_aterm_aterm
  (t1, t2) =
(
//
case+
(t1, t2) of
| (ATMvar x1,
   ATMvar x2) => (x1 = x2)
| (ATMlam t10,
   ATMlam t20) => (t10 = t20)
| (ATMapp(t11, t12),
   ATMapp(t21, t22)) => (t11 = t21) && (t12 = t22)
| (_, _) => false
//
) (* end of [eq_aterm_aterm] *)

implement
neq_aterm_aterm(t1, t2) = not(t1 = t2)

(* ****** ****** *)

implement
aterm_shift
  (t0) = let
//
fun
aux
(
  n: int, t0: aterm
) : aterm =
(
case+ t0 of
| ATMvar(x0) =>
  ATMvar(tvar_shift_gte(x0, n))
//
| ATMlam(t_body) => ATMlam(aux(n+1, t_body))
//
| ATMapp(t1, t2) => ATMapp(aux(n, t1), aux(n, t2))
)
//
in
  aux(0, t0)
end // end of [aterm_shift]

(* ****** ****** *)

implement
aterm_subst
  (t0, sub) = let
//
fun
aux
(
  t0: aterm
, sub: aterm, n: intGte(0)
) : aterm = (
//
case+ t0 of
| ATMvar(x0) => let
    val i = tvar_get_index(x0)
  in
    ifcase
      | i < n => t0
      | i = n => sub
      | _(* i > n *) =>
        ATMvar(tvar_make_index(i-1))
  end // end of [ATMvar]
| ATMlam(t_body) =>
  (
    ATMlam(aux(t_body, aterm_shift(sub), n+1))
  ) (* end of [ATMlam] *)
| ATMapp(t_fun, t_arg) =>
  (
    ATMapp(aux(t_fun, sub, n), aux(t_arg, sub, n))
  ) (* end of [ATMapp] *)
//
) (* end of [aux] *)
//
in
  aux(t0, sub, 0)
end // end of [aterm_subst]

(* ****** ****** *)

implement
term_alpha_normalize
  (t0) = let
//
typedef ctx = list0(tvar)
//
fun
aux(ctx: ctx, t0: term): aterm =
(
case+ t0 of
| TMvar(x0) => let
    val ind =
      list0_find_index(ctx, eqfn(x0))
    // end of [val]
  in
    ATMvar(
      if ind >= 0
        then tvar_make_index(ind) else x0
      // end of [if]
    ) (* ATMvar *)
  end // end of [TMvar]
//
| TMlam(x_arg, t_bod) =>
    ATMlam(aux(cons0(x_arg, ctx), t_bod))
//
| TMapp(t_fun, t_arg) =>
    ATMapp(aux(ctx, t_fun), aux(ctx, t_arg))
) (* end of [aux] *)
//
in
//
  aux(list0_nil(*ctx*), t0)
//
end // end of [term_alpha_normlize]

(* ****** ****** *)
//
implement
aterm_is_bredex(t0) =
(
//
case+ t0 of
| ATMapp(ATMlam _, _) => true | _ => false
//
) (* end of [aterm_is_bredex *)
//
(* ****** ****** *)

implement
aterm_breduce_leftmost
  (t0) = let
//
macdef
bredlm = 
aterm_breduce_leftmost
//
in
//
case+ t0 of
| ATMvar _ => None_vt()
| ATMlam(t_body) => let
    val opt = bredlm(t_body)
  in
    case+ opt of
    | ~None_vt() => None_vt()
    | ~Some_vt t_body => Some_vt(ATMlam(t_body))
  end // end of [ATMlam]
| ATMapp(t_fun, t_arg) =>
  (
    case+ t_fun of
    | ATMlam(t_body) =>
        Some_vt(aterm_subst(t_body, t_arg))
    | _(* non-ATMlam *) => let
       val opt = bredlm(t_fun)
     in
       case+ opt of
       | ~None_vt() => let
           val opt = bredlm(t_arg)
         in
           case+ opt of
           | ~None_vt() => None_vt()
           | ~Some_vt(t_arg) =>
               Some_vt(ATMapp(t_fun, t_arg))
             // end of [Some_vt]
         end // end of [None_vt]
       | ~Some_vt(t_fun) => Some_vt(ATMapp(t_fun, t_arg))
     end // end of [non-ATMlam]
  ) (* end of [ATMapp] *)
//
end (* end of [aterm_breduce_leftmost] *)

(* ****** ****** *)

implement
aterm_mbreduce_leftmost
  (t0) = let
//
val opt =
aterm_breduce_leftmost(t0)
//
in
//
case+ opt of
| ~None_vt() => t0
| ~Some_vt(t0) => aterm_mbreduce_leftmost(t0)
//
end (* end of [aterm_mbreduce_leftmost] *)

(* ****** ****** *)

(*
//
##atext_fopen_path\
("\
./HATS/lamcal_aterm_fprint.hats\
")
##ats2impl_fprint2printerr(aterm)
//
##atext_fclose_top()
//
*)

(* ****** ****** *)
//
extern
fun{}
fprint_aterm_
  (FILEref, aterm): void
//
#ifdef
CODEGEN2_FPRINT
#then
#codegen2(fprint, aterm)
#endif // end of [ifdef]
//
#include
"./HATS/lamcal_aterm_fprint.hats"
//
implement
fprint_aterm
  (out, x0) = fprint_aterm_<>(out, x0)
//
(* ****** ****** *)

(* end of [lamcal_aterm.dats] *)
