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
ptoken_fun
(
  buf: &tokbuf, bt: int, err: &int
, f: (tnode) -> bool, enode: parerr_node
) : token // end of [ptoken_fun]

(* ****** ****** *)
//
fun p_COMMA : parser (token)
fun is_COMMA (x: tnode): bool
//
fun p_SEMICOLON : parser (token)
fun is_SEMICOLON (x: tnode): bool
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

fun
parse_from_lexbuf (buf: &lexbuf >> _): void

(* ****** ****** *)

fun
parse_from_tokbuf (buf: &tokbuf >> _): void

(* ****** ****** *)

fun parse_from_fileref (inp: FILEref): void

(* ****** ****** *)

(* end of [atsparemit_parsing.sats] *)
