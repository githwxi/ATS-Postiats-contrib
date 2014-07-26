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
staload "./atsparemit_parsing.sats"

(* ****** ****** *)

#define NULL the_null_ptr

(* ****** ****** *)

fun
token_null
(
// argumentless
) : token = $UN.cast{token}(NULL)

(* ****** ****** *)

implement
ptoken_fun
(
  buf, bt, err, f, enode
) = let
  val tok = tokbuf_get_token (buf)
in
  if f (tok.token_node) then let
    val () = tokbuf_incby1 (buf) in tok
  end else let
    val loc = tok.token_loc
    val () = err := err + 1
    val () = the_parerrlst_add_ifnbt (bt, loc, enode)
  in
    token_null ()
  end // end of [_]
//
end // end of [ptoken_fun]

(* ****** ****** *)
//
implement
is_LPAREN (x) = case+ x of
  | T_LPAREN () => true | _ => false
implement
p_LPAREN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_LPAREN, PARERR_LPAREN)
//
implement
is_RPAREN (x) = case+ x of
  | T_RPAREN () => true | _ => false
implement
p_RPAREN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_RPAREN, PARERR_RPAREN)
//
(* ****** ****** *)

fun
tokbuf_process
(
  buf: &tokbuf >> _
) : void = let
//
val tok = tokbuf_getinc_token (buf)
//
in
//
case+
tok.token_node
of (* case+ *)
| T_EOF () => ()
| _ (*non-EOF*) =>
  {
    val () =
    println! ("tok = ", tok)
    val () =  tokbuf_process (buf)
  } (* end of [_] *)
//
end // end of [tokbuf_process]

(* ****** ****** *)

implement
parse_from_tokbuf
  (buf) = let
//
val () = the_lexerrlst_clear ()
//
val ((*void*)) = tokbuf_process (buf)
//
val nerr = the_lexerrlst_print_free ((*void*))
//
in
  // nothing
end // end of [parse_from_tokbuf]

(* ****** ****** *)

implement
parse_from_fileref
  (inp) = let
//
var buf: tokbuf
val () =
  tokbuf_initize_fileref (buf, inp)
//
val () = parse_from_tokbuf (buf)
//
val () = tokbuf_uninitize (buf)
//
in
  // nothing
end // end of [parse_from_fileref]

(* ****** ****** *)

(* end of [atsparemit_parsing.dats] *)
