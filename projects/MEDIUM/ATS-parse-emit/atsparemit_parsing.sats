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
"share/atspre_define.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
fun the_parerrlst_add (x: parerr): void
//
fun
the_parerrlst_add_ifnbt
(
  bt: int, loc: loc_t, node: parerr_node
) : void // end-of-function
//
(* ****** ****** *)

fun
tokbuf_set_ntok_null
  {a:type} (buf: &tokbuf >> _, n0: size_t): (a)
// end of [tokbuf_set_ntok_null]

(* ****** ****** *)

fun
ptoken_fun
(
  buf: &tokbuf >> _
, bt: int
, err: &int
, f: (tnode) -> bool
, enode: parerr_node
) : token // end of [ptoken_fun]

fun
ptoken_test_fun
(
  buf: &tokbuf >> _, f: (tnode) -> bool
) : bool // end of [ptoken_test_fun]

(* ****** ****** *)

fun p_EOF : parser (token)
fun is_EOF (x: tnode): bool

(* ****** ****** *)
//
fun p_COMMA : parser (token)
fun is_COMMA (x: tnode): bool
fun p_COMMA_test (buf: &tokbuf >> _): bool
//
fun p_COLON : parser (token)
fun is_COLON (x: tnode): bool
fun p_COLON_test (buf: &tokbuf >> _): bool
//
fun p_SEMICOLON : parser (token)
fun is_SEMICOLON (x: tnode): bool
fun p_SEMICOLON_test (buf: &tokbuf >> _): bool
//
(* ****** ****** *)
//
fun p_LPAREN : parser (token)
fun is_LPAREN (x: tnode): bool
//
fun p_RPAREN : parser (token)
fun is_RPAREN (x: tnode): bool
//
(* ****** ****** *)
//
fun p_LBRACE : parser (token)
fun is_LBRACE (x: tnode): bool
//
fun p_RBRACE : parser (token)
fun is_RBRACE (x: tnode): bool
//
(* ****** ****** *)
//
fun p_INT : parser (token)
fun is_INT (x: tnode): bool
//
fun p_STRING : parser (token)
fun is_STRING (x: tnode): bool
//
(* ****** ****** *)

fun p_SRPendif : parser (token)  
fun is_SRPendif (x: tnode): bool
  
(* ****** ****** *)

fun p_ATScaseofend : parser (token)
fun is_ATScaseofend (x: tnode): bool

(* ****** ****** *)

fun p_ATSbranchend : parser (token)
fun is_ATSbranchend (x: tnode): bool

(* ****** ****** *)

fun p_ATStailcalend : parser (token)
fun is_ATStailcalend (x: tnode): bool

(* ****** ****** *)

fun ptest_fun
  {a:type} (
  buf: &tokbuf >> _, f: parser (a), ent: &synent? >> synent
) : bool // end of [ptest_fun]

(* ****** ****** *)

fun
pstar_fun{a:type}
  (buf: &tokbuf >> _, bt: int, f: parser (a)): List0_vt(a)
// end of [pstar_fun]

(* ****** ****** *)

fun
pstar_sep_fun
  {a:type}
(
  buf: &tokbuf >> _, bt: int, sep: (&tokbuf >> _) -> bool, f: parser(a)
) : List0_vt (a) // end of [pstar_sep_fun]

(* ****** ****** *)

fun
pstar_COMMA_fun
  {a:type}
  (buf: &tokbuf >> _, bt: int, f: parser(a)): List0_vt(a)
// end of [pstar_COMMA_fun]

(* ****** ****** *)

fun
pstar_fun0_sep
  {a:type} (
  buf: &tokbuf >> _, bt: int, f: parser (a), sep: (&tokbuf >> _) -> bool
) : List0_vt (a) // end of [pstar_fun0_sep]

(* ****** ****** *)

fun
pstar_fun0_COMMA
  {a:type}
  (buf: &tokbuf, bt: int, f: parser (a)) : List0_vt (a)
// end of [pstar_fun0_COMMA]

(* ****** ****** *)

fun pif_fun
  {a:type} (
  buf: &tokbuf >> _
, bt: int, err: &int, f: parser (a), err0: int
) : (a) // end of [pif_fun]

(* ****** ****** *)

fun parse_i0de : parser (i0de)
fun parse_label : parser (label)

(* ****** ****** *)

fun parse_s0exp : parser (s0exp)
fun parse_s0expargopt : parser (s0expopt)

(* ****** ****** *)

fun parse_d0exp : parser (d0exp)
fun parse_d0expargopt : parser (d0expopt)

(* ****** ****** *)

fun parse_d0ecl : parser (d0ecl)
fun parse_d0eclseq : parser (d0eclist)

(* ****** ****** *)

fun parse_tyfld : parser (tyfld)
fun parse_tyrec : parser (tyrec)

(* ****** ****** *)

fun parse_f0arg : parser (f0arg)
fun parse_f0marg : parser (f0marg)

(* ****** ****** *)

fun parse_f0kind : parser (f0kind)
fun parse_f0head : parser (f0head)

(* ****** ****** *)

fun parse_tmpdec : parser (tmpdec)
fun parse_tmpdecs : parser (tmpdeclst)

(* ****** ****** *)

fun parse_instr : parser (instr)
fun parse_instrseq : parser (instrlst)

(* ****** ****** *)

fun parse_f0body : parser (f0body)

(* ****** ****** *)

fun parse_f0decl : parser (f0decl)

(* ****** ****** *)

fun parse_toplevel (buf: &tokbuf >> _): d0eclist

(* ****** ****** *)

fun
parse_from_string{a:type}
  (inp: string, f: parser a): Option_vt (a)
// end of [parse_from_string]

(* ****** ****** *)

fun
parse_from_tokbuf (buf: &tokbuf >> _): d0eclist

(* ****** ****** *)

fun parse_from_fileref (inp: FILEref): d0eclist

(* ****** ****** *)

(* end of [atsparemit_parsing.sats] *)
