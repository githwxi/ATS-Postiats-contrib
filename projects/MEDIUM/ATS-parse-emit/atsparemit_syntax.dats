(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

(* ****** ****** *)

infix ++
overload ++ with location_combine

(* ****** ****** *)

implement
synent_decode2{a}
  (x) = let
  val res = synent_decode{a}(x)
  prval ((*void*)) = topize (x) in res
end // end of [synent_decode2]

(* ****** ****** *)

implement
synent_null{a} () = $UN.cast{a}(the_null_ptr)

(* ****** ****** *)
//
implement
synent_is_null (ent) = iseqz ($UN.cast2ptr(ent))
implement
synent_isnot_null (ent) = isneqz ($UN.cast2ptr(ent))
//
(* ****** ****** *)
//
implement
i0de_make_sym
  (loc, sym) = '{ i0de_loc= loc, i0de_sym= sym }
//
implement
i0de_make_string
  (loc, name) = let
  val sym = symbol_make (name) in i0de_make_sym (loc, sym)
end // end of [i0de_make_string]
//
(* ****** ****** *)
//
fun
s0exp_make_node
  (loc, node) = '{ s0exp_loc=loc, s0exp_node=node }
//
implement
s0exp_ide (loc, id) =
  s0exp_make_node (loc, S0Eide (id.i0de_sym))
//
implement
s0exp_list (loc, s0es) = s0exp_make_node (loc, S0Elist (s0es))
//
implement
s0exp_appid (loc, id, s0es) =
  s0exp_make_node (loc, S0Eappid (id.i0de_sym, s0es))
//
(* ****** ****** *)
//
// HX: for constructing dynamic expressions
//
(* ****** ****** *)
//
fun
d0exp_make_node
  (loc, node) = '{ d0exp_loc=loc, d0exp_node=node }
//
implement
d0exp_ide (loc, id) =
  d0exp_make_node (loc, D0Eide (id.i0de_sym))
//
implement
d0exp_list
  (loc, d0es) = d0exp_make_node (loc, D0Elist (d0es))
//
implement
d0exp_appid (loc, id, d0es) =
  d0exp_make_node (loc, D0Eappid (id.i0de_sym, d0es))
//
(* ****** ****** *)

implement
ATSPMVint_make
(
  tok1, int, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  d0exp_make_node (loc, ATSPMVint (int))
end // end of [ATSPMVint]

(* ****** ****** *)

implement
ATSPMVbool_make
(
  tok1, tfv, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  d0exp_make_node (loc, ATSPMVbool (tfv))
end // end of [ATSPMVbool]

(* ****** ****** *)

implement
ATSPMVstring_make
(
  tok1, str, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  d0exp_make_node (loc, ATSPMVstring (str))
end // end of [ATSPMVint]

(* ****** ****** *)

implement
ATSPMVi0nt_make
(
  tok1, int, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  d0exp_make_node (loc, ATSPMVi0nt (int))
end // end of [ATSPMVi0nt]

(* ****** ****** *)

implement
ATSSELcon_make
(
  tok1, d0e, s0e, lab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  d0exp_make_node (loc, ATSSELcon (d0e, s0e, lab))
end // end of [ATSSELcon_make]

(* ****** ****** *)

implement
ATSSELboxrec_make
(
  tok1, d0e, s0e, lab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  d0exp_make_node (loc, ATSSELboxrec (d0e, s0e, lab))
end // end of [ATSSELboxrec_make]

(* ****** ****** *)

implement
ATSSELfltrec_make
(
  tok1, d0e, s0e, lab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  d0exp_make_node (loc, ATSSELfltrec (d0e, s0e, lab))
end // end of [ATSSELfltrec_make]

(* ****** ****** *)

implement
tyfld_make
  (s0e, id) = let
//
val loc = s0e.s0exp_loc ++ id.i0de_loc
//
in '{
  tyfld_loc= loc, tyfld_node= TYFLD (id, s0e)
} end // end of [tyfld_make]

(* ****** ****** *)

implement
tyrec_make
(
  tok1, tyflds, tok2
) = let
//
val loc = tok1.token_loc ++ tok2.token_loc
//
in '{
  tyrec_loc= loc, tyrec_node= tyflds
} end // end of [tyrec_make]

(* ****** ****** *)
//
implement
f0arg_none
  (s0e) = '{
  f0arg_loc= s0e.s0exp_loc
, f0arg_node= F0ARGnone (s0e)
} (* end of [f0arg_none] *)
//
implement
f0arg_some
  (s0e, id) = let
//
(*
val () = println! ("f0arg_some: id = ", id)
val () = println! ("f0arg_some: s0e = ", s0e)
*)
//
val loc =
  s0e.s0exp_loc ++ id.i0de_loc
//
in '{
  f0arg_loc= loc
, f0arg_node= F0ARGsome (id, s0e)
} end // end of [f0arg_some]
//
(* ****** ****** *)

implement
f0marg_make
(
  tok1, f0as, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in '{
  f0marg_loc= loc, f0marg_node = f0as
} end // end of [f0marg_make]

(* ****** ****** *)
//
implement
fkind_extern
  (tok1, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in '{
  fkind_loc= loc, fkind_node = FKextern ()
} end // end of [fkind_extern]
//
implement
fkind_static
  (tok1, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in '{
  fkind_loc= loc, fkind_node = FKstatic ()
} end // end of [fkind_static]
//
(* ****** ****** *)

implement
f0head_get_f0arglst
  (fhd) = f0ma.f0marg_node where
{
//
val+F0HEAD (_, f0ma, _) = fhd.f0head_node
//
} (* end of [f0head_get_f0arglst] *)

(* ****** ****** *)

implement
f0head_make
(
  res, id, marg
) = let
//
val loc =
  res.s0exp_loc ++ marg.f0marg_loc
//
in '{
  f0head_loc= loc
, f0head_node= F0HEAD (id, marg, res)
} end // end of [f0head_make]

(* ****** ****** *)

implement
tmpdec_make_none
(
  tok_kwd, tmp, tok_end
) = let
//
val loc =
tok_kwd.token_loc ++ tok_end.token_loc
//
in '{
  tmpdec_loc= loc, tmpdec_node= TMPDECnone (tmp)
} end // end of [tmpdec_make_none]

(* ****** ****** *)

implement
tmpdec_make_some
(
  tok_kwd, tmp, s0e, tok_end
) = let
//
val loc =
tok_kwd.token_loc ++ tok_end.token_loc
//
in '{
  tmpdec_loc= loc, tmpdec_node= TMPDECsome (tmp, s0e)
} end // end of [tmpdec_make_some]

(* ****** ****** *)

fun
instr_make_node
(
  loc: loc_t, node: instr_node
) : instr = '{ instr_loc= loc, instr_node= node }

(* ****** ****** *)

implement
ATSif_make
(
  tok_if, d0e, ins1, insopt2
) = let
//
val loc =
(
case+ insopt2 of
| Some (ins2) => tok_if.token_loc ++ ins2.instr_loc
| None ((*void*)) => tok_if.token_loc ++ ins1.instr_loc
) : loc_t // end of [val]
//
val inss_then = let
  val-ATSthen(inss) = ins1.instr_node in inss
end // end of [val]
val inssopt_else = (
//
case+ insopt2 of
| Some (ins2) => let
    val-ATSelse(inss) = ins2.instr_node in Some(inss)
  end // end of [Some]
| None ((*void*)) => None ()
//
) : instrlstopt // end of [val]
//
in
  instr_make_node (loc, ATSif (d0e, inss_then, inssopt_else))
end // end of [ATSif_make]

(* ****** ****** *)

implement
ATSifthen_make
(
  tok1, d0e, inss, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSifthen (d0e, inss))
end // end of [ATSifthen_make]

(* ****** ****** *)

implement
ATSifnthen_make
(
  tok1, d0e, inss, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSifnthen (d0e, inss))
end // end of [ATSifnthen_make]

(* ****** ****** *)
//
implement
ATSthen_make
  (tok1, inss, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSthen (inss))
end // end of [ATSthen_make]
//
implement
ATSelse_make
  (tok1, inss, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSelse (inss))
end // end of [ATSelse_make]
//
(* ****** ****** *)

implement
ATSbranchseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSbranchseq (inss))
end // end of [ATSbranchseq_make]

(* ****** ****** *)

implement
caseofseq_get_tmplablst
  (ins0) = let
//
vtypedef res = labelist_vt
//
fun auxlst
(
  xs: instrlst, res: res
) : res =
(
case+ xs of
| list_nil () => res
| list_cons (x, xs) =>
  (
    case+ x.instr_node of
    | ATSINSlab (lab) =>
        auxlst (xs, cons_vt (lab, res))
    | _(*non-ATSINSlab*) => auxlst (xs, res)
  )
) (* end of [auxlst] *)
//
fun auxlst2
(
  xs: instrlst, res: res
) : res =
(
case+ xs of
| list_nil () => res
| list_cons (x, xs) =>
  (
    case- x.instr_node of
    | ATSbranchseq(inss) => auxlst2 (xs, auxlst (inss, res))
  ) (* end of [list_cons] *)
) (* end of [auxlst2] *)
//
val-ATScaseofseq(inss) = ins0.instr_node
//
val res = auxlst2 (inss, list_vt_nil())
//
in
  list_vt2t(list_vt_reverse(res))
end // end of [caseofseq_get_tmplablst]

(* ****** ****** *)

implement
ATScaseofseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATScaseofseq (inss))
end // end of [ATScaseofseq_make]

(* ****** ****** *)

implement
funbodyseq_get_funlab
  (ins0) = fl where
{
//
val-
ATSfunbodyseq (inss) = ins0.instr_node
val-list_cons (ins1, _(*inss2*)) = inss
val-ATSINSflab (fl) = ins1.instr_node
//
} // end of [funbodyseq_get_funlab]

(* ****** ****** *)

implement
ATSfunbodyseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSfunbodyseq (inss))
end // end of [ATSfunbodyseq_make]

(* ****** ****** *)

implement
ATSreturn_make
(
  tok1, tmp, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSreturn (tmp))
end // end of [ATSreturn_make]

(* ****** ****** *)

implement
ATSreturn_void_make
(
  tok1, tmp, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSreturn_void (tmp))
end // end of [ATSreturn_void_make]

(* ****** ****** *)

implement
ATSINSlab_make
(
  tok1, lab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSlab (lab))
end // end of [ATSINSlab_make]

(* ****** ****** *)

implement
ATSINSgoto_make
(
  tok1, lab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSgoto (lab))
end // end of [ATSINSgoto_make]

(* ****** ****** *)

implement
ATSINSflab_make
(
  tok1, flab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSflab (flab))
end // end of [ATSINSlab_make]

(* ****** ****** *)

implement
ATSINSfgoto_make
(
  tok1, flab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSfgoto (flab))
end // end of [ATSINSfgoto_make]

(* ****** ****** *)

implement
ATSINSmove_make
(
  tok1, tmp, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSmove (tmp, d0e))
end // end of [ATSINSmove_make]

(* ****** ****** *)

implement
ATSINSmove_void_make
(
  tok1, tmp, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSmove_void (tmp, d0e))
end // end of [ATSINSmove_void_make]

(* ****** ****** *)

implement
ATSINSmove_fltrec_make
(
  tok1, inss, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSmove_fltrec (inss))
end // end of [ATSINSmove_fltrec_make]

(* ****** ****** *)

implement
ATSINSstore_fltrec_ofs_make
(
  tok1, d0e_l, s0e, lab, d0e_r, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSstore_fltrec_ofs (d0e_l, s0e, lab, d0e_r))
end // end of [ATSINSstore_fltrec_ofs_make]

(* ****** ****** *)

implement
ATSINSmove_boxrec_make
(
  tok1, inss, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSmove_boxrec (inss))
end // end of [ATSINSmove_boxrec_make]

(* ****** ****** *)

implement
ATSINSmove_boxrec_new_make
(
  tok1, tmp, s0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSmove_boxrec_new (tmp, s0e))
end // end of [ATSINSmove_boxrec_new_make]

(* ****** ****** *)

implement
ATSINSstore_boxrec_ofs_make
(
  tok1, d0e_l, s0e, lab, d0e_r, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSstore_boxrec_ofs (d0e_l, s0e, lab, d0e_r))
end // end of [ATSINSstore_boxrec_ofs_make]

(* ****** ****** *)

implement
ATStailcalseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATStailcalseq (inss))
end // end of [ATStailcalseq_make]

(* ****** ****** *)

implement
ATSINSmove_tlcal_make
(
  tok1, apy, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSmove_tlcal (apy, d0e))
end // end of [ATSINSmove_tlcal_make]

(* ****** ****** *)

implement
ATSINSargmove_tlcal_make
(
  tok1, arg, apy, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSargmove_tlcal (arg, apy))
end // end of [ATSINSargmove_tlcal_make]

(* ****** ****** *)

implement
ATSINSdeadcode_fail_make
  (tok1, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSdeadcode_fail(tok1))
end // end of [ATSINSdeadcode_fail_make]

(* ****** ****** *)

implement
ATSdynload0_make
  (tok1, id, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSdynload0(id))
end // end of [ATSdynload0]

(* ****** ****** *)

implement
ATSdynload1_make
  (tok1, id, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSdynload1(id))
end // end of [ATSdynload1]

(* ****** ****** *)

implement
ATSdynloadset_make
  (tok1, id, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSdynloadset(id))
end // end of [ATSdynloadset]

(* ****** ****** *)

implement
f0body_classify
  (fbody) = let
//
fun
fcount
(
  xs: instrlst, res: int
) : int =
(
case+ xs of
| list_nil () => res
| list_cons (x, xs) => (
    case+ x.instr_node of
    | ATSfunbodyseq _ => fcount (xs, res+1) | _ => fcount (xs, res)
  ) (* end of [list_cons] *)
)
//
fun istailcal
(
  inss: instrlst
) : bool = let
//
fun aux (x: instr): bool =
(
case+ x.instr_node of
| ATStailcalseq _ => true
| ATSif (_, _then, _else) =>
    if auxlst (_then) then true else auxlstopt (_else)
| ATSbranchseq (inss) => auxlst (inss)
| ATScaseofseq (inss) => auxlst (inss)
| ATSfunbodyseq (inss) => auxlst (inss)
| _(*rest-of-instr*) => false
)
//
and auxlst
  (xs: instrlst): bool =
(
case+ xs of
| list_nil () => false
| list_cons (x, xs) =>
    if aux (x) then true else auxlst (xs)
  // end of [list_cons]
)
//
and auxlstopt
  (opt: instrlstopt): bool =
(
case+ opt of
| None () => false | Some (inss) => auxlst (inss)
)
//
in
  auxlst (inss)
end // end of [istailcal]
//
in
//
case+
fbody.f0body_node of
| F0BODY
    (tds, inss) => let
    val nf = fcount (inss, 0)
  in
    if nf >= 2 then 2 else (if istailcal (inss) then 1 else 0)
  end // end of [...]
//
end // end of [f0body_classify]

(* ****** ****** *)

implement
f0body_get_tmpdeclst
  (fbody) =
(
//
case+
fbody.f0body_node of F0BODY (tds, _) => tds
//
) (* end of [f0body_get_tmpdeclst] *)

(* ****** ****** *)

implement
f0body_get_bdinstrlst
  (fbody) =
(
//
case+
fbody.f0body_node of F0BODY (_, inss) => inss
//
) (* end of [f0body_get_bdinstrlst] *)

(* ****** ****** *)

implement
f0body_make
(
  tok_beg, tmps, inss, tok_end
) = let
//
val loc =
  tok_beg.token_loc ++ tok_end.token_loc
//
in '{
  f0body_loc= loc, f0body_node= F0BODY (tmps, inss)
} end // end of [f0body_make]

(* ****** ****** *)

implement
f0decl_none
  (head) = let
//
val loc = head.f0head_loc
//
in '{
  f0decl_loc= loc, f0decl_node= F0DECLnone(head)
} end // end of [f0decl_none]

(* ****** ****** *)

implement
f0decl_some
  (head, body) = let
//
val loc =
  head.f0head_loc ++ body.f0body_loc
//
in '{
  f0decl_loc= loc, f0decl_node= F0DECLsome(head, body)
} end // end of [f0decl_some]

(* ****** ****** *)

fun
d0ecl_make_node
(
  loc: loc_t, node: d0ecl_node
) : d0ecl = '{ d0ecl_loc= loc, d0ecl_node= node }

(* ****** ****** *)

implement
d0ecl_include
  (tok, fname) = let
//
val loc = tok.token_loc ++ fname.token_loc
//
in
  d0ecl_make_node (loc, D0Cinclude (fname))
end // end of [d0ecl_include]

(* ****** ****** *)

implement
d0ecl_dyncst_mac
  (tok1, name, tok2) = let
//
val loc = tok1.token_loc ++ tok2.token_loc
//
in
  d0ecl_make_node (loc, D0Cdyncst_mac (name))
end // end of [d0ecl_dyncst_mac]

(* ****** ****** *)

implement
d0ecl_dyncst_extfun
  (tok1, name, s0es, s0e, tok2) = let
//
val loc = tok1.token_loc ++ tok2.token_loc
//
in
  d0ecl_make_node (loc, D0Cdyncst_extfun (name, s0es, s0e))
end // end of [d0ecl_dyncst_extfun]

(* ****** ****** *)

implement
d0ecl_typedef
  (tok, tyrec, id) = let
//
val loc = tok.token_loc ++ id.i0de_loc
//
in
  d0ecl_make_node (loc, D0Ctypedef (id, tyrec))
end // end of [d0ecl_typedef]

(* ****** ****** *)

implement
d0ecl_fundecl
  (fk, fdec) = let
//
val loc = fk.fkind_loc ++ fdec.f0decl_loc
//
in
  d0ecl_make_node (loc, D0Cfundecl (fk, fdec))
end // end of [d0ecl_fundecl]

(* ****** ****** *)

implement
d0ecl_ifdef
(
  tok1, id, d0cs, tok2
) = let
//
val loc = tok1.token_loc ++ tok2.token_loc
//
in
  d0ecl_make_node (loc, D0Cifdef (id, d0cs))
end // end of [d0ecl_ifdef]
  
(* ****** ****** *)

implement
d0ecl_ifndef
(
  tok1, id, d0cs, tok2
) = let
//
val loc = tok1.token_loc ++ tok2.token_loc
//
in
  d0ecl_make_node (loc, D0Cifdef (id, d0cs))
end // end of [d0ecl_ifndef]
  
(* ****** ****** *)

(* end of [atsparemit_syntax.dats] *)
