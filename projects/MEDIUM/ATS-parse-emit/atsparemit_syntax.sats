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
//
fun f0arg_make (s0e: s0exp, id: i0de): f0arg
//
fun
f0marg_make
  (tok_beg: token, f0as: f0arglst, tok_end: token): f0marg
//
fun
f0decl_make (res: s0exp, id: i0de, marg: f0marg): f0decl
//
(* ****** ****** *)

(* end of [atsparemit_syntax.sats] *)
