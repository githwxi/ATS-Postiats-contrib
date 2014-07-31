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

fun d0exp_ide (loc: loc_t, id: i0de): d0exp
fun d0exp_list (loc: loc_t, d0es: d0explst): d0exp
fun d0exp_appid (loc: loc_t, id: i0de, arg: d0explst): d0exp

(* ****** ****** *)
//
fun
f0arg_make (s0e: s0exp, id: i0de): f0arg
//
fun
f0marg_make
  (tok_beg: token, f0as: f0arglst, tok_end: token): f0marg
//
(* ****** ****** *)
//
fun
f0kind_global (tok1: token, tok2: token): f0kind
fun
f0kind_static (tok1: token, tok2: token): f0kind
//
fun
f0head_make (res: s0exp, id: i0de, marg: f0marg): f0head
//
(* ****** ****** *)
//
fun
tmpdec_make
  (tok_kwd: token, tmp: i0de, s0e: s0exp, tok_end: token): tmpdec
//
(* ****** ****** *)
//
// HX: for constructing instructions
//
(* ****** ****** *)
//
fun
ATSINSlab_make
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
(* ****** ****** *)

fun ATSif_make
(
  tok_if: token, _test: d0exp, _then: instr, _else: instropt
) : instr // end of [ATSif_make]

fun ATSthen_make
  (tok_then: token, inss: instrlst, tok_end: token): instr
// end of [ATSthen_make]

fun ATSelse_make
  (tok_else: token, inss: instrlst, tok_end: token): instr
// end of [ATSelse_make]

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
fun d0ecl_f0decl (knd: f0kind, f0d: f0decl): d0ecl
fun d0ecl_include (tok_beg: token, fname: s0tring): d0ecl
//
(* ****** ****** *)

(* end of [atsparemit_syntax.sats] *)
