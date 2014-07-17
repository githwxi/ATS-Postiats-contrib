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
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)

macdef EOL = char2int0('\n')

(* ****** ****** *)
//
implement
token_make (loc, node) =
  '{ token_loc= loc, token_node= node }
//
(* ****** ****** *)
//
implement
lexerr_make (loc, node) =
  '{ lexerr_loc= loc, lexerr_node= node }
//
(* ****** ****** *)

fun BLANK_test (i: int): bool = isspace (i)

(* ****** ****** *)

fun
IDENTFST_test
  (i: int): bool = let
//
val c = int2char0 (i)
//
in
  case+ 0 of
  | _ when ('a' <= c andalso c <= 'z') => true
  | _ when ('A' <= c andalso c <= 'Z') => true
  | _ when c = '_' => true
  | _ (*rest-of-char*) => false
end (* end of [IDENTFST_test] *)

(* ****** ****** *)

fun
IDENTRST_test
  (i: int): bool = let
//
val c = int2char0 (i)
//
in
  case+ 0 of
  | _ when ('a' <= c andalso c <= 'z') => true
  | _ when ('A' <= c andalso c <= 'Z') => true
  | _ when ('0' <= c andalso c <= '9') => true
  | _ when c = '_' => true
  | _ when c = '\'' => true
  | _ when c = '$' => true
  | _ (*rest-of-char*) => false
end (* end of [IDENTRST_test] *)

(* ****** ****** *)
//
fun xX_test
  (i: int): bool = let
//
val c = int2char0 (i) in c = 'x' || c = 'X'
//
end // end of [xX_test]
//
fun eE_test
  (i: int): bool = let
//
val c = int2char0 (i) in c = 'e' || c = 'E'
//
end // end of [eE_test]
//
fun pP_test
  (i: int): bool = let
//
val c = int2char0 (i) in c = 'p' || c = 'P'
//
end // end of [pP_test]
//
(* ****** ****** *)
//
fun DIGIT_test (i: int): bool = isdigit (i)
fun XDIGIT_test (i: int): bool = isxdigit (i)
//
(* ****** ****** *)
//
fun INTSP_test
  (i: int): bool = let
//
val c = toupper(int2char0(i)) in c = 'L' || c = 'U'
//
end // end of [INTSP_test]
//
fun FLOATSP_test
  (i: int): bool = let
//
val c = toupper(int2char0(i)) in c = 'F' || c = 'L'
//
end // end of [FLOATSP_test]
//
(* ****** ****** *)
//
fun SIGN_test (c: char): bool = (c = '-' || c = '+')
//
(* ****** ****** *)
//
extern
fun
ftesting_opt
(
  buf: &lexbuf, f: int -> bool
) : intGte(0) // end of [ftesting_opt]
implement
ftesting_opt
  (buf, f) = let
  val i = lexbuf_get_char (buf)
in
  if i > 0 then (if f(i) then 1 else 0) else 0
end // end of [ftesting_opt]
//
(* ****** ****** *)
//
extern
fun
ftesting_seq0
(
  buf: &lexbuf >> _, f: int -> bool
) : intGte(0) // end of [ftesting_seq0]
implement
ftesting_seq0
  (buf, f) = let
//
fun loop
(
  buf: &lexbuf >> _, nchr: intGte(0)
) : intGte(0) = let
  val i = lexbuf_get_char (buf)
in
  if i > 0
    then (
      if f(i)
        then loop (buf, succ(nchr)) else nchr
      // end of [if]
    ) (* end of [then] *)
    else nchr
  // end of [if]
end // end of [loop]
//
in
  loop (buf, 0)
end // end of [ftesting_seq0]

(* ****** ****** *)
//
fun
skip_blankseq0
(
  buf: &lexbuf >> _
) : intGte(0) = let
//
fun loop
(
  buf: &lexbuf >> _, pos: &position >> _, nchr: intGte(0)
) : intGte(0) = let
//
val i = lexbuf_get_char (buf)
//
in
//
if
i > 0
then (
  if isspace (i)
    then let
      val c = int2char0 (i)
      val () = position_incby_char (pos, c)
    in
      loop (buf, pos, succ(nchr))
    end // end of [then]
    else nchr // end of [else]
  // end of [if]
) (* end of [then] *)
else nchr // end of [else]
//
end // end of [loop]
//
var pos: position
val () = lexbuf_get_position (buf, pos)
val nchr = loop (buf, pos, 0)
val () = lexbuf_remove (buf, nchr)
val () = lexbuf_set_position (buf, pos)
//
in
  nchr  
end // end of [skip_blankseq0]
//
(* ****** ****** *)
//
fun
testing_identseq0
  (buf: &lexbuf): intGte(0) =
  ftesting_seq0 (buf, IDENTRST_test)
//
(* ****** ****** *)
//
extern
fun
lexing_IDENT_alp (buf: &lexbuf): token
//
implement
lexing_IDENT_alp
  (buf) = let
//
val nchr = testing_identseq0 (buf)
val nchr1 = succ(nchr)
val name = lexbuf_takeout (buf, nchr1)
val name = strptr2string (name)
//
val loc = lexbuf_getincby_location (buf, nchr1)
//
in
  token_make (loc, T_IDENT_alp(name))
end // end of [lexing_IDENT_alp]

(* ****** ****** *)
//
#define COMMA ','
//
#define LPAREN '\('
#define RPAREN ')';
#define LBRACE '\{'
#define RBRACE '}';
#define LBRACKET '\['
#define RBRACKET ']';
//
#define SHARP '#'
#define SLASH '/'
//
(* ****** ****** *)
//
extern
fun
lexing_litchar
  (buf: &lexbuf, node: tnode): token
//
implement
lexing_litchar
  (buf, node) = let
//
val () = lexbuf_remove (buf, 1)
val loc = lexbuf_getincby_location (buf, 1)
//
in
  token_make (loc, node)
end // end of [lexing_litchar]
//
(* ****** ****** *)
//
extern
fun
lexing_SHARP (buf: &lexbuf): token
//
implement
lexing_SHARP
  (buf) = let
//
val nchr = testing_identseq0 (buf)
val nchr1 = succ(nchr)
val name = lexbuf_takeout (buf, nchr1)
val name = strptr2string (name)
//
val loc = lexbuf_getincby_location (buf, nchr1)
//
in
  token_make (loc, T_IDENT_srp(name))
end // end of [lexing_SHARP]

(* ****** ****** *)
//
extern
fun
lexing_SLASH (buf: &lexbuf): token
extern
fun
lexing_SLASHSTAR (buf: &lexbuf): token
extern
fun
lexing_SLASHSLASH (buf: &lexbuf): token
//
(* ****** ****** *)

implement
lexing_SLASH
  (buf) = let
//
val i0 = lexbuf_get_char(buf)
//
in
//
if
i0 > 0
then let
//
val c0 = int2char0(i0)
//
in
//
case+ 0 of
//
| _ when c0 = '*' => lexing_SLASHSTAR (buf)
| _ when c0 = '/' => lexing_SLASHSLASH (buf)
//
| _ (*rest-of-char*) => lexing_litchar (buf, T_SLASH)
//
end // end of [then]
else lexing_litchar (buf, T_SLASH)
//
end // end of [lexing_SLASH]

(* ****** ****** *)
//
extern
fun
testing_until_literal
  (buf: &lexbuf >> _, pos: &position >> _, lit: string): intGte(0)
//
implement
testing_until_literal
  (buf, pos, lit0) = let
//
val [n0:int]
  lit0 = g1ofg0 (lit0)
val n0 = length (lit0)
//
fun
loop
  {n:nat | n0 >= n}
(
  buf: &lexbuf >> _
, pos: &position >> _
, lit: string(n), n: size_t(n)
, nchr: intGte(0)
) : intGte(0) = let
in
//
if
n > 0
then let
  val i = lexbuf_get_char (buf)
in
//
if i <= 0
  then nchr
  else let
    val c = int2char0(i)
    val () = position_incby_char (pos, c)
  in
    if c != lit.head
      then let
        val np = sz2i(n0 - n)
        val () = position_decby (pos, np)
        val () = lexbuf_incby_nback (buf, np)
      in
        loop (buf, pos, lit0, n0, succ(nchr))
      end // end of [then]
      else (
        loop (buf, pos, lit.tail, pred(n), succ(nchr))
      ) (* end of [else] *)
  end // end of [else]
//
end // end of [then]
else nchr // end of [else]
//
end // end of [loop]
//
in
  loop (buf, pos, lit0, n0, 0)
end // end of [testing_until_literal]

(* ****** ****** *)

implement
lexing_SLASHSTAR
  (buf) = let
//
var pos: position
val () = lexbuf_get_position (buf, pos)
val () = position_incby (pos, 2)
//
#define STARSLASH "*/"
//
val nchr =
  testing_until_literal (buf, pos, STARSLASH)
//
val () = lexbuf_remove (buf, nchr + 2)
val loc = lexbufpos_get_location (buf, pos)
val ((*void*)) = lexbuf_set_position (buf, pos)
//
in
  token_make (loc, T_COMMENT_block)
end // end of [lexing_SLASHSTAR]

(* ****** ****** *)

implement
lexing_SLASHSLASH
  (buf) = let
//
val nchr =
ftesting_seq0 (buf, lam i => i != EOL)
val () = lexbuf_remove_all (buf)
val loc = lexbuf_getincby_location (buf, nchr)
//
in
  token_make (loc, T_COMMENT_line)
end // end of [lexing_SLASHSLASH]

(* ****** ****** *)

implement
lexbuf_get_token
  (buf) = let
//
var res: int
val k0 = skip_blankseq0 (buf)
val () = lexbuf_set_nspace (buf, k0)
//
val i0 = lexbuf_get_char (buf)
//
in
//
if
i0 > 0
then let
//
val c0 = $UN.cast{charNZ}(i0)
//
in
//
case+ 0 of
//
| _ when
    IDENTFST_test (i0) => lexing_IDENT_alp (buf)
//
| _ when i0 = COMMA => lexing_litchar (buf, T_COMMA)
//
| _ when i0 = LPAREN => lexing_litchar (buf, T_LPAREN)
| _ when i0 = RPAREN => lexing_litchar (buf, T_RPAREN)
| _ when i0 = LBRACE => lexing_litchar (buf, T_LBRACE)
| _ when i0 = RBRACE => lexing_litchar (buf, T_RBRACE)
| _ when i0 = LBRACKET => lexing_litchar (buf, T_LBRACKET)
| _ when i0 = RBRACKET => lexing_litchar (buf, T_RBRACKET)
//
| _ when c0 = SHARP => lexing_SHARP (buf)
//
| _ when i0 = SLASH => lexing_SLASH (buf)
//
| _ (*rest-of-char*) => let
//
// HX: skipping the unrecognized char
//
    val () = lexbuf_remove_all (buf)
    val loc = lexbuf_getincby_location (buf, 1)
//
    val err =
      lexerr_make (loc, LEXERR_UNSUPPORTED_char(c0))
    val () = the_lexerrlst_insert (err)
  in
    lexbuf_get_token (buf)
  end // end of [rest-of-char]
//
end // end of [then]
else let
  val loc =
    lexbuf_getincby_location (buf, 0) in token_make (loc, T_EOF)
  // end of [val]
end // end of [else]
//
end // end of [lexing_get_token]

(* ****** ****** *)

(* end of [atsparemit_lexing.dats] *)
