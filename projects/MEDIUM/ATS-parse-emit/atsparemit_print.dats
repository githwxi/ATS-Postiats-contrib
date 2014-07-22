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
implement
print_filename
  (fil) = fprint_filename (stdout_ref, fil)
implement
prerr_filename
  (fil) = fprint_filename (stderr_ref, fil)
// 
(* ****** ****** *)
//
(*
implement
print_position
  (pos) = fprint_position (stdout_ref, pos)
implement
prerr_position
  (pos) = fprint_position (stderr_ref, pos)
*)
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
fprint_keyword
  (out, x) = let
//
macdef
p (str) =
  fprint_string (out, ,(str))
//
in
//
case+ x of
//
| ATSif () => p "ATSif"
| ATSthen () => p "ATSthen"
| ATSelse () => p "ATSelse"
//
| ATSreturn () => p "ATSreturn"
| ATSreturn_void () => p "ATSreturn_void"
//
| ATSINSmove () => p "ATSINSmove"
//
| ATSPMVi0nt () => p "ATSPMVi0nt"
| ATSPMVf0loat () => p "ATSPMVf0loat"
//
| KWnone () => p "KWnone"
//
end // end of [fprint_keyword]

(* ****** ****** *)

implement
fprint_tnode
  (out, x0) = let
in
//
case+ x0 of
//
| T_CHAR (x) =>
    fprint! (out, "CHAR(", x, ")")
//
| T_FLOAT (x) =>
    fprint! (out, "FLOAT(", x, ")")
| T_INTEGER (base, x) =>
    fprint! (out, "INTEGER(", base, "; ", x, ")")
//
| T_STRING (x) =>
    fprint! (out, "STRING(", x, ")")
//
| T_KWORD (x) =>
    fprint! (out, "KWORD(", x, ")")
//
| T_IDENT_alp (x) =>
    fprint! (out, "IDENT(", x, ")")
| T_IDENT_sym (x) =>
    fprint! (out, "IDENT(", x, ")")
//
| T_IDENT_srp (x) =>
    fprint! (out, "IDENT#(", x, ")")
//
| T_COMMA () => fprint! (out, ",")
| T_COLON () => fprint! (out, ":")
| T_SEMICOLON () => fprint! (out, ";")
//
| T_LPAREN () => fprint! (out, "(")
| T_RPAREN () => fprint! (out, ")")
| T_LBRACKET () => fprint! (out, "[")
| T_RBRACKET () => fprint! (out, "]")
| T_LBRACE () => fprint! (out, "{")
| T_RBRACE () => fprint! (out, "}")
//
| T_SLASH () => fprint! (out, "/")
//
| T_COMMENT_line () =>
    fprint! (out, "COMMENTline(", ")")
| T_COMMENT_block () =>
    fprint! (out, "COMMENTblock(", ")")
//
| T_EOF () => fprint! (out, "EOF(", ")")
//
end // end of [fprint_tnode]

(* ****** ****** *)
//
implement
print_token
  (tok) = fprint_token (stdout_ref, tok)
implement
prerr_token
  (tok) = fprint_token (stderr_ref, tok)
//
implement
fprint_token
  (out, tok) =
{
  val () = fprint! (out, tok.token_loc, ": ")
  val () = fprint_tnode (out, tok.token_node)
}
//
(* ****** ****** *)

(* end of [atsparemit_print.dats] *)
