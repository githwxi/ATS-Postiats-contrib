(* ****** ****** *)
//
// ATS-emitparse
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)

staload "./emitparse.sats"

(* ****** ****** *)
//
implement
print_filename
  (fil) = fprint_filename (stdout_ref, fil)
implement
prerr_filename
  (fil) = fprint_filename (stderr_ref, fil)
// 
(* ****** ****** *)
//
implement
print_position
  (pos) = fprint_position (stdout_ref, pos)
implement
prerr_position
  (pos) = fprint_position (stderr_ref, pos)
// 
(* ****** ****** *)
//
implement
print_location
  (loc) = fprint_location (stdout_ref, loc)
implement
prerr_location
  (loc) = fprint_location (stderr_ref, loc)
// 
(* ****** ****** *)

implement
fprint_tnode
  (out, x0) = let
in
//
case+ x0 of
//
| T_IDENT_alp (x) =>
    fprint! (out, "IDENT(", x, ")")
| T_IDENT_srp (x) =>
    fprint! (out, "IDENT#(", x, ")")
//
| T_STRING (str) =>
    fprint! (out, "STRING(", str, ")")
//
| T_COMMA () => fprint! (out, ",")
| T_SEMICOLON () => fprint! (out, ";")
//
| T_LPAREN () => fprint! (out, "(")
| T_RPAREN () => fprint! (out, ")")
| T_LBRACKET () => fprint! (out, "[")
| T_RBRACKET () => fprint! (out, "[")
| T_LBRACE () => fprint! (out, "}")
| T_RBRACE () => fprint! (out, "{")
//
| T_COMMENT_line () =>
    fprint! (out, "COMMENTline(", ")")
| T_COMMENT_block () =>
    fprint! (out, "COMMENTblock(", ")")
//
end // end of [fprint_tnode]

(* ****** ****** *)
//
implement
fprint_token (out, tok) =
  fprint_tnode (out, tok.token_node)
//
(* ****** ****** *)

(* end of [emitparse_print.dats] *)
