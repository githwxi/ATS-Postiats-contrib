(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
castfn
synent_encode {a:type} (x: a): synent
castfn
synent_decode {a:type} (x: synent): (a)
//
(* ****** ****** *)
//
fun
synent_decode2{a:type} (x: &synent >> _?): a
//
(* ****** ****** *)
//
fun synent_null {a:type} (): a // = null
//
fun synent_is_null {a:type} (x: a):<> bool
fun synent_isnot_null {a:type} (x: a):<> bool
//
(* ****** ****** *)
//
fun
i0de_make_sym (loc: loc_t, sym: symbol): i0de
fun
i0de_make_string (loc: loc_t, name: string): i0de
//
(* ****** ****** *)

fun s0exp_ide (loc: loc_t, id: i0de): s0exp
fun s0exp_list (loc: loc_t, s0es: s0explst): s0exp
fun s0exp_appid (loc: loc_t, id: i0de, arg: s0explst): s0exp

(* ****** ****** *)
//
// HX: for constructing primvals
//
(* ****** ****** *)

fun d0exp_ide (loc: loc_t, id: i0de): d0exp
fun d0exp_list (loc: loc_t, d0es: d0explst): d0exp
fun d0exp_appid (loc: loc_t, id: i0de, arg: d0explst): d0exp

(* ****** ****** *)
//
fun
ATSPMVint_make
(
  tok_kwd: token, tok: i0nt, tok_end: token
) : d0exp // end-of-fun
fun
ATSPMVbool_make
(
  tok_kwd: token, tfv: bool, tok_end: token
) : d0exp // end-of-fun
fun
ATSPMVstring_make
(
  tok_kwd: token, tok: s0tring, tok_end: token
) : d0exp // end-of-fun
//
(* ****** ****** *)
//
fun
ATSPMVi0nt_make
(
  tok_kwd: token, tok: i0nt, tok_end: token
) : d0exp // end-of-fun
fun
ATSPMVf0loat_make
(
  tok_kwd: token, tok: f0loat, tok_end: token
) : d0exp // end-of-fun
//
(* ****** ****** *)
//
fun
ATSSELcon_make
(
  tok_kwd: token
, d0e: d0exp, s0e: s0exp, lab: label
, tok_end: token
) : d0exp // end of [ATSSELcon_make]
//
fun
ATSSELfltrec_make
(
  tok_kwd: token
, d0e: d0exp, s0e: s0exp, lab: label
, tok_end: token
) : d0exp // end of [ATSSELfltrec_make]
//
fun
ATSSELboxrec_make
(
  tok_kwd: token
, d0e: d0exp, s0e: s0exp, lab: label
, tok_end: token
) : d0exp // end of [ATSSELboxrec_make]
//
(* ****** ****** *)
//
fun tyfld_make (s0e: s0exp, id: i0de): tyfld
//
fun tyrec_make
  (tok_beg: token, xs: tyfldlst, tok_end: token): tyrec
//
(* ****** ****** *)
//
fun
fkind_extern (tok1: token, tok2: token): fkind
fun
fkind_static (tok1: token, tok2: token): fkind
//
(* ****** ****** *)
//
fun f0arg_none (s0e: s0exp): f0arg
fun f0arg_some (s0e: s0exp, id: i0de): f0arg
//
fun
f0marg_make
  (tok_beg: token, f0as: f0arglst, tok_end: token): f0marg
//
(* ****** ****** *)
//
fun f0head_get_f0arglst (fhd: f0head): f0arglst
//
fun
f0head_make (res: s0exp, id: i0de, marg: f0marg): f0head
//
(* ****** ****** *)
//
fun
tmpdec_make_none
(
  tok_kwd: token, tmp: i0de, tok_end: token
) : tmpdec // end-of-fun
fun
tmpdec_make_some
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, tok_end: token
) : tmpdec // end-of-fun
//
(* ****** ****** *)
//
// HX: for constructing instructions
//
(* ****** ****** *)
//
fun ATSif_make
(
  tok_if: token
, _test: d0exp, _then: instr, _else: instropt
) : instr // end of [ATSif_make]
//
fun ATSthen_make
(
  tok_then: token, inss: instrlst, tok_end: token
) : instr // end of [ATSthen_make]
//
fun ATSelse_make
(
  tok_else: token, inss: instrlst, tok_end: token
) : instr // end of [ATSelse_make]
//
(* ****** ****** *)
//
fun ATSifthen_make
(
  tok_ifthen: token
, _test: d0exp, _then: instrlst, tok_end: token
) : instr // end-of-fun
//
fun ATSifnthen_make
(
  tok_ifnthen: token
, _test: d0exp, _then: instrlst, tok_end: token
) : instr // end-of-fun
//
(* ****** ****** *)

fun
ATSbranchseq_make
(
  tok_kwd: token, inss: instrlst, tok_end: token
) : instr // end-of-function

(* ****** ****** *)

fun
caseofseq_get_tmplablst (x: instr): labelist

(* ****** ****** *)

fun
ATScaseofseq_make
(
  tok_kwd: token, inss: instrlst, tok_end: token
) : instr // end-of-function

(* ****** ****** *)

fun
funbodyseq_get_funlab (ins0: instr): label

(* ****** ****** *)

fun
ATSfunbodyseq_make
(
  tok_kwd: token, inss: instrlst, tok_end: token
) : instr // end-of-function

(* ****** ****** *)
//
fun
ATSreturn_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr
fun
ATSreturn_void_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr
//
(* ****** ****** *)
//
fun
instrlst_skip_linepragma (inss: instrlst): instrlst
//
(* ****** ****** *)
//
fun
ATSlinepragma_make
  (tok_kwd: token, line: token, file: token): instr
//
(* ****** ****** *)
//
fun
ATSINSlab_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr
//
fun
ATSINSgoto_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr
//
(* ****** ****** *)
//
fun
ATSINSflab_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr
//
fun
ATSINSfgoto_make
  (tok_kwd: token, tmp: i0de, tok_end: token): instr
//
(* ****** ****** *)
//
fun
ATSINSmove_make
(
  tok_kwd: token, tmp: i0de, d0e: d0exp, tok_end: token
) : instr // end of [ATSINSmove_make]
//
fun
ATSINSmove_void_make
(
  tok_kwd: token, tmp: i0de, d0e: d0exp, tok_end: token
) : instr // end of [ATSINSmove_void_make]
//
(* ****** ****** *)
//
fun
ATSINSmove_con0_make
(
  tok_kwd: token, tmp: i0de, tag: token, tok_end: token
) : instr // end-of-function
//
(* ****** ****** *)
//
fun
ATSINSmove_con1_make
(
  tok_kwd: token, inss: instrlst, tok_end: token
) : instr // end-of-function
//
fun
ATSINSmove_con1_new_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, tok_end: token
) : instr // end-of-function
//
fun
ATSINSstore_con1_tag_make
(
  tok_kwd: token, tmp: i0de, tag: token, tok_end: token
) : instr // end-of-function
//
fun
ATSINSstore_con1_ofs_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, lab: label, d0e: d0exp, tok_end: token
) : instr // end-of-function
//
(* ****** ****** *)
//
fun
ATSINSmove_fltrec_make
(
  tok_kwd: token, inss: instrlst, tok_end: token
) : instr // end-of-function
//
fun
ATSINSstore_fltrec_ofs_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, lab: label, d0e: d0exp, tok_end: token
) : instr // end-of-function
//
(* ****** ****** *)
//
fun
ATSINSmove_boxrec_make
(
  tok_kwd: token, inss: instrlst, tok_end: token
) : instr // end-of-function
//
fun
ATSINSmove_boxrec_new_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, tok_end: token
) : instr // end-of-function
//
fun
ATSINSstore_boxrec_ofs_make
(
  tok_kwd: token, tmp: i0de, s0e: s0exp, lab: label, d0e: d0exp, tok_end: token
) : instr // end-of-function
//
(* ****** ****** *)
//
fun
ATStailcalseq_make
(
  tok_kwd: token, inss: instrlst, tok_end: token
) : instr // end-of-function
//
fun
ATSINSmove_tlcal_make
(
  tok_kwd: token, argx: i0de, d0e: d0exp, tok_end: token
) : instr // end-of-function
//
fun
ATSINSargmove_tlcal_make
(
  tok_kwd: token, arg0: i0de, argx: i0de, tok_end: token
) : instr // end-of-function
//
(* ****** ****** *)

fun
ATSINSdeadcode_fail_make (tok_kwd: token, tok_end: token): instr

(* ****** ****** *)

fun
ATSdynload0_make (tok_kwd: token, id: i0de, tok_end: token): instr
fun
ATSdynload1_make (tok_kwd: token, id: i0de, tok_end: token): instr
fun
ATSdynloadset_make (tok_kwd: token, id: i0de, tok_end: token): instr

(* ****** ****** *)
//
fun
f0body_classify (f0body): int
//
fun
f0body_get_tmpdeclst (f0body): tmpdeclst
//
fun
f0body_get_bdinstrlst (f0body): instrlst
//
(* ****** ****** *)

fun
f0body_make
(
  tok_beg: token, tmps: tmpdeclst, inss: instrlst, tok_end: token
) : f0body // end-of-fun

(* ****** ****** *)

fun f0decl_none (head: f0head): f0decl
fun f0decl_some (head: f0head, body: f0body): f0decl

(* ****** ****** *)
//
fun d0ecl_include
  (tok_beg: token, fname: s0tring): d0ecl
//
fun d0ecl_typedef
  (tok_beg: token, tyrec: tyrec, id: i0de): d0ecl
//
fun
d0ecl_dyncst_mac
  (tok_beg: token, name: i0de, tok_end: token): d0ecl
fun
d0ecl_dyncst_extfun
(
  tok_beg: token
, name: i0de, arg: s0explst, res: s0exp, tok_end: token
) : d0ecl // end of [d0ecl_dyncst_extfun]
//
(* ****** ****** *)
//
fun d0ecl_fundecl (knd: fkind, f0d: f0decl): d0ecl
//
(* ****** ****** *)
//
fun
d0ecl_ifdef
(
  tok_beg: token, id: i0de, d0cs: d0eclist, tok_end: token
) : d0ecl // end of [d0ecl_ifdef]
//
fun
d0ecl_ifndef
(
  tok_beg: token, id: i0de, d0cs: d0eclist, tok_end: token
) : d0ecl // end of [d0ecl_ifdef]
//
(* ****** ****** *)

(* end of [atsparemit_syntax.sats] *)
