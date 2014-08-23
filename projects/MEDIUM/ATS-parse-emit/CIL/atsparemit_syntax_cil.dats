(* ****** ****** *)
//
// ATS-parse-emit-cil
//
(* ****** ****** *)
//
// AS-2014-08-22: start
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

staload
STRING = "libc/SATS/string.sats"

(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_cil.sats"
staload "./atsparemit_syntax_cil.sats"

(* ****** ****** *)

infix ++
overload ++ with location_combine

(* ****** ****** *)

implement
instr2lst_skip_linepragma
  (inss) = (
//
case+ inss of
| list_nil () => list_nil ()
| list_cons (ins, inss2) =>
  (
    case+ ins.instr2_node of
    | ATS2linepragma _ => inss2 | _ => inss
  )
//
) (* end of [instr2lst_skip_linepragma] *)

(* ****** ****** *)

fun
instr2_make_node (
  loc: loc_t, node: instr2_node
) : instr2 = '{ instr2_loc= loc, instr2_node= node }

(* ****** ****** *)

implement
ATS2brfalse_make
(
  tok_if, _test, _then
) = let
//
val loc = tok_if.token_loc ++ _then.i0de_loc
//
in
  instr2_make_node (loc, ATS2brfalse (_test, _then))
end // end of [ATS2brfalse_make]

(* ****** ****** *)

implement
ATS2brtrue_make
(
  tok1, d0e, _then
) = let
//
val loc = tok1.token_loc ++ _then.i0de_loc
//
in
  instr2_make_node (loc, ATS2brtrue (d0e, _then))
end // end of [ATS2brtrue_make]

(* ****** ****** *)

implement
ATS2branchseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2branchseq (inss))
end // end of [ATS2branchseq_make]

(* ****** ****** *)

implement
caseofseq2_get_tmplablst
  (ins0) = let
//
vtypedef res = labelist_vt
//
fun auxlst
(
  xs: instr2lst, res: res
) : res =
(
case+ xs of
| list_nil () => res
| list_cons (x, xs) =>
  (
    case+ x.instr2_node of
    | ATSINS2lab (lab) =>
        auxlst (xs, cons_vt (lab, res))
    | _(*non-ATSINS2lab*) => auxlst (xs, res)
  )
) (* end of [auxlst] *)
//
fun auxlst2
(
  xs: instr2lst, res: res
) : res =
(
case+ xs of
| list_nil () => res
| list_cons (x, xs) =>
  (
    case- x.instr2_node of
    | ATS2branchseq(inss) => auxlst2 (xs, auxlst (inss, res))
  ) (* end of [list_cons] *)
) (* end of [auxlst2] *)
//
val-ATS2caseofseq(inss) = ins0.instr2_node
//
val res = auxlst2 (inss, list_vt_nil())
//
in
  list_vt2t(list_vt_reverse(res))
end // end of [caseofseq2_get_tmplablst]

(* ****** ****** *)

implement
ATS2caseofseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2caseofseq (inss))
end // end of [ATS2caseofseq_make]

(* ****** ****** *)

implement
funbodyseq2_get_funlab
  (ins0) = flab where
{
//
val-
ATS2funbodyseq(inss) = ins0.instr2_node
val
inss = instr2lst_skip_linepragma (inss)
//
val-list_cons (ins1, _(*inss2*)) = inss
val-ATSINS2flab (flab) = ins1.instr2_node
//
} // end of [funbodyseq2_get_funlab]

(* ****** ****** *)

implement
ATS2funbodyseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2funbodyseq (inss))
end // end of [ATS2funbodyseq_make]

(* ****** ****** *)

implement
ATS2return_make
(
  tok1, tmp, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2return (tmp))
end // end of [ATS2return_make]

(* ****** ****** *)

implement
ATS2return_void_make
(
  tok1, tmp, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2return_void (tmp))
end // end of [ATS2return_void_make]

(* ****** ****** *)

implement
ATS2linepragma_make
  (tok_kwd, line, file) = let
//
val loc = tok_kwd.token_loc ++ file.token_loc
//
in
  instr2_make_node (loc, ATS2linepragma (line, file))
end // end of [ATS2linepragma_make]

(* ****** ****** *)

implement
ATSINS2lab_make
(
  tok1, lab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2lab (lab))
end // end of [ATSINSlab_make]

(* ****** ****** *)

implement
ATSINS2goto_make
(
  tok1, lab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2goto (lab))
end // end of [ATSINS2goto_make]

(* ****** ****** *)

implement
ATSINS2flab_make
(
  tok1, flab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2flab (flab))
end // end of [ATSINS2flab_make]

(* ****** ****** *)

implement
ATSINS2fgoto_make
(
  tok1, flab, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2fgoto (flab))
end // end of [ATSINS2fgoto_make]

(* ****** ****** *)

implement
ATSINS2move_make
(
  tok1, tmp, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move (tmp, d0e))
end // end of [ATSINSmove_make]

(* ****** ****** *)

implement
ATSINS2move_void_make
(
  tok1, tmp, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_void (tmp, d0e))
end // end of [ATSINS2move_void_make]

(* ****** ****** *)

implement
ATSINS2move_nil_make
(
  tok1, tmp, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_nil (tmp))
end // end of [ATSINS2move_nil_make]

(* ****** ****** *)

implement
ATSINS2move_con0_make
(
  tok1, tmp, tag, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_con0 (tmp, tag))
end // end of [ATSINS2move_con0_make]

(* ****** ****** *)

implement
ATSINS2move_con1_make
(
  tok1, inss, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_con1 (inss))
end // end of [ATSINS2move_con1_make]

(* ****** ****** *)

implement
ATSINS2move_con1_new_make
(
  tok1, tmp, s0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_con1_new (tmp, s0e))
end // end of [ATSINS2move_con1_new_make]

(* ****** ****** *)

implement
ATSINS2store_con1_tag_make
(
  tok1, tmp, tag, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2store_con1_tag (tmp, tag))
end // end of [ATSINS2store_con1_tag_make]

(* ****** ****** *)

implement
ATSINS2store_con1_ofs_make
(
  tok1, tmp, s0e, lab, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2store_con1_ofs (tmp, s0e, lab, d0e))
end // end of [ATSINS2store_con1_ofs_make]

(* ****** ****** *)

implement
ATSINS2move_fltrec_make
(
  tok1, inss, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_fltrec (inss))
end // end of [ATSINS2move_fltrec_make]

(* ****** ****** *)

implement
ATSINS2store_fltrec_ofs_make
(
  tok1, tmp, s0e, lab, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2store_fltrec_ofs (tmp, s0e, lab, d0e))
end // end of [ATSINS2store_fltrec_ofs_make]

(* ****** ****** *)

implement
ATSINS2move_boxrec_make
(
  tok1, inss, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_boxrec (inss))
end // end of [ATSINS2move_boxrec_make]

(* ****** ****** *)

implement
ATSINS2move_boxrec_new_make
(
  tok1, tmp, s0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_boxrec_new (tmp, s0e))
end // end of [ATSINS2move_boxrec_new_make]

(* ****** ****** *)

implement
ATSINS2store_boxrec_ofs_make
(
  tok1, tmp, s0e, lab, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2store_boxrec_ofs (tmp, s0e, lab, d0e))
end // end of [ATSINS2store_boxrec_ofs_make]

(* ****** ****** *)

implement
ATS2tailcalseq_make
(
  tok1, inss, tok2
) = let
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2tailcalseq (inss))
end // end of [ATS2tailcalseq_make]

(* ****** ****** *)

implement
ATSINS2move_tlcal_make
(
  tok1, apy, d0e, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2move_tlcal (apy, d0e))
end // end of [ATSINS2move_tlcal_make]

(* ****** ****** *)

implement
ATSINS2argmove_tlcal_make
(
  tok1, arg, apy, tok2
) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2argmove_tlcal (arg, apy))
end // end of [ATSINS2argmove_tlcal_make]

(* ****** ****** *)

implement
ATSINS2deadcode_fail_make
  (tok1, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATSINS2deadcode_fail(tok1))
end // end of [ATSINS2deadcode_fail_make]

(* ****** ****** *)

implement
ATS2dynload0_make
  (tok1, id, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2dynload0(id))
end // end of [ATS2dynload0]

(* ****** ****** *)

implement
ATS2dynload1_make
  (tok1, id, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2dynload1(id))
end // end of [ATS2dynload1]

(* ****** ****** *)

implement
ATS2dynloadset_make
  (tok1, id, tok2) = let
//
val loc =
  tok1.token_loc ++ tok2.token_loc
//
in
  instr2_make_node (loc, ATS2dynloadset(id))
end // end of [ATS2dynloadset]
