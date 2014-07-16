(* ****** ****** *)
//
// ATS-parsemit
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
(* ****** ****** *)

implement
lexing_IDENT_alp
  (buf) = let
//
val nchr = testing_identseq0 (buf)
val nchr1 = succ(nchr)
val name = lexbuf_takeout (buf, nchr1)
val name = strptr2string (name)
//
var pos: position
val () = lexbuf_get_position (buf, pos)
val () = position_incby (pos, nchr1)
val loc = lexbufpos_get_location (buf, pos)
val () = lexbuf_set_position (buf, pos)
//
in
  token_make (loc, T_IDENT_alp(name))
end // end of [lexing_IDENT_alp]

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
    IDENTFST_test (i0) =>
    lexing_IDENT_alp (buf)
//
| _ (*rest-of-char*) => let
//
// HX: skipping the unrecognized char
//
//
    var pos: position
    val () = lexbuf_get_position (buf, pos)
    val () = position_incby1 (pos)
    val loc = lexbufpos_get_location (buf, pos)
    val () = lexbuf_set_position (buf, pos)
//
    val () = lexbuf_remove_all (buf)
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
  var pos: position
  val () = lexbuf_get_position (buf, pos)
  val loc = lexbufpos_get_location (buf, pos)
in
  token_make (loc, T_EOF)
end // end of [else]
//
end // end of [lexing_get_token]

(* ****** ****** *)

(* end of [atsparemit_lexing.dats] *)
