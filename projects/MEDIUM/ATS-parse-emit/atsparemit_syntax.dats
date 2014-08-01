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

fun
pmval_make_node
(
  loc: loc_t, node: primval_node
) : primval = '{ primval_loc= loc, primval_node= node }

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
  pmval_make_node (loc, ATSPMVi0nt (int))
end // end of [ATSPMVi0nt]

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
d0exp_pmv
  (loc, pmv) = d0exp_make_node (loc, D0Epmv (pmv))
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
val () = println! ("f0arg_some: id = ", id)
val () = println! ("f0arg_some: s0e = ", s0e)
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
f0kind_extern
  (tok1, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in '{
  f0kind_loc= loc, f0kind_node = F0KINDextern ()
} end // end of [f0kind_extern]
//
implement
f0kind_static
  (tok1, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in '{
  f0kind_loc= loc, f0kind_node = F0KINDstatic ()
} end // end of [f0kind_static]
//
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
tmpdec_make
(
  tok_kwd, tmp, s0e, tok_end
) = let
//
val loc =
tok_kwd.token_loc ++ tok_end.token_loc
//
in '{
  tmpdec_loc= loc, tmpdec_node= TMPDEC (tmp, s0e)
} end // end of [tmpdec_make]

(* ****** ****** *)

fun
instr_make_node
(
  loc: loc_t, node: instr_node
) : instr = '{ instr_loc= loc, instr_node= node }

(* ****** ****** *)

implement
ATSINSlab_make
(
  tok1, tmp, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr_make_node (loc, ATSINSlab (tmp))
end // end of [ATSINSlab_make]

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
d0ecl_f0decl
  (knd, f0d) = let
//
val loc = knd.f0kind_loc ++ f0d.f0decl_loc
//
in
  d0ecl_make_node (loc, D0Cfundecl (knd, f0d))
end // end of [d0ecl_f0decl]

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

(* end of [atsparemit_syntax.dats] *)
