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
implement
print_symbol
  (sym) = fprint_symbol (stdout_ref, sym)
implement
prerr_symbol
  (sym) = fprint_symbol (stderr_ref, sym)
// 
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
| ATStmpdec () => p "ATStmpdec"
//
| ATSif () => p "ATSif"
| ATSthen () => p "ATSthen"
| ATSelse () => p "ATSelse"
//
| ATSgoto () => p "ATSgoto"
//
| ATSreturn () => p "ATSreturn"
| ATSreturn_void () => p "ATSreturn_void"
//
| ATStailcalbeg () => p "ATStailcalbeg"
| ATStailcalend () => p "ATStailcalend"
//
| ATSINSmove () => p "ATSINSmove"
//
| ATSINSmove_boxrec () => p "ATSINSmove_boxrec"
| ATSINSmove_boxrec_ofs () => p "ATSINSmove_boxrec_ofs"
//
| ATSSELboxrec () => p "ATSSELboxrec"
| ATSSELfltrec () => p "ATSSELfltrec"
//
| ATSINSstore_boxrec_ofs () => p "ATSINSstore_boxrec_ofs"
| ATSINSstore_fltrec_ofs () => p "ATSINSstore_fltrec_ofs"
//
| ATSINSmove_tlcal () => p "ATSINSmove_tlcal"
| ATSINSargmove_tlcal () => p "ATSINSargmove_tlcal"
//
| ATSPMVi0nt () => p "ATSPMVi0nt"
| ATSPMVf0loat () => p "ATSPMVf0loat"
//
| ATSinline () => p "ATSinline"
//
| ATSglobaldec () => p "ATSglobaldec"
| ATSstaticdec () => p "ATSstaticdec"
//
| ATSdyncst_mac () => p "ATSdyncst_mac"
| ATSdyncst_extfun () => p "ATSdyncst_extfun"
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

implement
fprint_i0de (out, x) = fprint (out, x.i0de_sym)

(* ****** ****** *)
//
implement
fprint_val<s0exp> = fprint_s0exp
//
implement
fprint_s0exp
  (out, s0e) = let
//
overload fprint with fprint_s0explst of 1000000
//
in
//
case+
s0e.s0exp_node of
//
| S0Eide (id) => fprint! (out, "S0Eide(", id, ")")
| S0Elist (s0es) => fprint! (out, "S0Elist(", s0es, ")")
| S0Eappid (id, s0es) => fprint! (out, "S0Eappid(", id, "; ", s0es, ")")
//
end // end of [fprint_s0exp]
//
(* ****** ****** *)

implement
fprint_s0explst (out, xs) = fprint_list_sep (out, xs, ", ")

(* ****** ****** *)
//
implement
fprint_val<f0arg> = fprint_f0arg
//
implement
fprint_f0arg
  (out, f0a) = let
in
//
case+
f0a.f0arg_node of
//
| F0ARG (id, s0e) => fprint! (out, "F0ARG(", id, ": ", s0e, ")")
//
end // end of [fprint_f0arg]
//
(* ****** ****** *)
//
implement
fprint_f0marg
  (out, x) = fprint_list_sep (out, x.f0marg_node, ", ")
//
(* ****** ****** *)

implement
fprint_f0decl
  (out, x) = let
in
//
case+
x.f0decl_node of
| F0DECL (id, marg, res) =>
    fprint! (out, "F0DECL(", id, "(", marg, "): ", res, ")")
//
end // end of [fprint_f0decl]

(* ****** ****** *)

(* end of [atsparemit_print.dats] *)
