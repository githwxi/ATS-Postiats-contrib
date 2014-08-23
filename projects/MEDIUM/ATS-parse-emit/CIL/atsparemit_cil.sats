staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

(* ****** ****** *)
//
datatype
instr2_node =
//
  | ATS2brfalse of (
      d0exp // AS: cond
    , label // AS: then
    ) (* end of [ATS2brfalse] *)
//
  | ATS2brtrue of (
      d0exp // AS: cond
    , label // AS: then
    ) (* end of [ATS2brtrue] *)
//
  | ATS2branchseq of instr2lst
  | ATS2caseofseq of instr2lst
//
  | ATS2funbodyseq of instr2lst
//
  | ATS2return of (i0de)
  | ATS2return_void of (i0de)
//
  | ATS2linepragma of (token(*line*), token(*file*))
//
  | ATSINS2lab of (label)
  | ATSINS2goto of (label)
//
  | ATSINS2flab of (label)
  | ATSINS2fgoto of (label)
//
  | ATSINS2move of (i0de, d0exp)
  | ATSINS2move_void of (i0de, d0exp)
//
  | ATSINS2move_nil of (i0de)
  | ATSINS2move_con0 of (i0de, token(*tag*))
//
  | ATSINS2move_con1 of (instr2lst)
  | ATSINS2move_con1_new of (i0de, s0exp)
  | ATSINS2store_con1_tag of (i0de, token(*tag*))
  | ATSINS2store_con1_ofs of (i0de, s0exp, i0de, d0exp)
//
  | ATSINS2move_boxrec of (instr2lst)
  | ATSINS2move_boxrec_new of (i0de, s0exp)
  | ATSINS2store_boxrec_ofs of (i0de, s0exp, i0de, d0exp)
//
  | ATSINS2move_fltrec of (instr2lst)
  | ATSINS2store_fltrec_ofs of (i0de, s0exp, i0de, d0exp)
//
  | ATS2tailcalseq of instr2lst
  | ATSINS2move_tlcal of (i0de, d0exp)
  | ATSINS2argmove_tlcal of (i0de, i0de)
//
  | ATSINS2deadcode_fail of (token)
//
  | ATS2dynload0 of (i0de)
  | ATS2dynload1 of (i0de)
  | ATS2dynloadset of (i0de)
//
// end of [instr2_node]
//
where
instr2 = '{
  instr2_loc= loc_t, instr2_node= instr2_node
} (* end of [instr2] *)
//
and instr2lst = List0 (instr2)
and instr2opt = Option (instr2)
and instr2lstopt = Option (instr2lst)
//
vtypedef
instr2lst_vt = List0_vt (instr2)
//
(* ****** ****** *)
//
fun fprint_instr2 : fprint_type (instr2)
fun fprint_instr2lst : fprint_type (instr2lst)
//
overload fprint with fprint_instr2
overload fprint with fprint_instr2lst
//
(* ****** ****** *)

(* end of [atsparemit_cil.sats] *)
