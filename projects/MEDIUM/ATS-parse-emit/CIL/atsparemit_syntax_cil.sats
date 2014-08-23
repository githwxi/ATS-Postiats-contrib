(* ****** ****** *)
//
// ATS-parse-emit-cil
//
(* ****** ****** *)
//
// AS-2014-08-22: start
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_cil.sats"

(* ****** ****** *)
//
// AS: for constructing instructions
//
(* ****** ****** *)
//
fun ATS2brfalse_make
(
  tok_if: token
, _test: d0exp, _then: i0de
) : instr2 // end of [ATS2brfalse_make]
//
fun ATS2brtrue_make
(
  tok_if: token
, _test: d0exp, _then: i0de
) : instr2 // end of [ATS2brtrue_make]
//
(* ****** ****** *)

fun
ATS2branchseq_make
(
  tok_kwd: token, inss: instr2lst, tok_end: token
) : instr2 // end-of-function

(* ****** ****** *)

fun
caseofseq2_get_tmplablst (x: instr2): labelist

(* ****** ****** *)

fun
ATS2caseofseq_make
(
  tok_kwd: token, inss: instr2lst, tok_end: token
) : instr2 // end-of-function

(* ******* ****** *)

fun
funbodyseq2_get_funlab (ins0: instr2): label

(* ****** ****** *)

fun
ATS2funbodyseq_make
(
  tok_kwd: token, inss: instr2lst, tok_end: token
) : instr2 // end-of-function

(* ****** ****** *)
//
fun
ATS2return_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr2
fun
ATS2return_void_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr2
//
(* ****** ****** *)
//
fun
instr2lst_skip_linepragma (inss: instr2lst): instr2lst
//
(* ****** ****** *)
//
fun
ATS2linepragma_make
  (tok_kwd: token, line: token, file: token): instr2
//
(* ****** ****** *)
//
fun
ATSINS2lab_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr2
//
fun
ATSINS2goto_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr2
//
(* ****** ****** *)
//
fun
ATSINS2flab_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr2
//
fun
ATSINS2fgoto_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr2
//
(* ****** ****** *)
//
fun
ATSINS2move_make
(
  tok_kwd: token, tmp: i0de, d0e: d0exp, tok_end: token
) : instr2 // end of [ATSINS2move_make]
//
fun
ATSINS2move_void_make
(
  tok_kwd: token, tmp: i0de, d0e: d0exp, tok_end: token
) : instr2 // end of [ATSINS2move_void_make]
//
(* ****** ****** *)
//
fun
ATSINS2move_nil_make
(
  tok_kwd: token, tmp: i0de, tok_end: token
) : instr2 // end of [ATSINS2move_nil_make]
//
fun
ATSINS2move_con0_make
(
  tok_kwd: token, tmp: i0de, tag: token, tok_end: token
) : instr2 // end-of-function
//
(* ****** ****** *)
//
fun
ATSINS2move_con1_make
(
  tok_kwd: token, inss: instr2lst, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2move_con1_new_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2store_con1_tag_make
(
  tok_kwd: token, tmp: i0de, tag: token, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2store_con1_ofs_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, lab: label, d0e: d0exp, tok_end: token
) : instr2 // end-of-function
//
(* ****** ****** *)
//
fun
ATSINS2move_fltrec_make
(
  tok_kwd: token, inss: instr2lst, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2store_fltrec_ofs_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, lab: label, d0e: d0exp, tok_end: token
) : instr2 // end-of-function
//
(* ****** ****** *)
//
fun
ATSINS2move_boxrec_make
(
  tok_kwd: token, inss: instr2lst, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2move_boxrec_new_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2store_boxrec_ofs_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, lab: label, d0e: d0exp, tok_end: token
) : instr2 // end-of-function
//
(* ****** ****** *)
//
fun
ATS2tailcalseq_make
(
  tok_kwd: token, inss: instr2lst, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2move_tlcal_make
(
  tok_kwd: token, argx: i0de, d0e: d0exp, tok_end: token
) : instr2 // end-of-function
//
fun
ATSINS2argmove_tlcal_make
(
  tok_kwd: token, arg0: i0de, argx: i0de, tok_end: token
) : instr2 // end-of-function
//
(* ****** ****** *)

fun
ATSINS2deadcode_fail_make (tok_kwd: token, tok_end: token): instr2

(* ****** ****** *)

fun
ATS2dynload0_make (tok_kwd: token, id: i0de, tok_end: token): instr2
fun
ATS2dynload1_make (tok_kwd: token, id: i0de, tok_end: token): instr2
fun
ATS2dynloadset_make (tok_kwd: token, id: i0de, tok_end: token): instr2
