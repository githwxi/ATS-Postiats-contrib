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
| TYPEDEF () => p "typedef"
//
| ATSstruct () => p "ATSstruct"
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
| ATSPMVi0nt () => p "ATSPMVi0nt"
| ATSPMVf0loat () => p "ATSPMVf0loat"
//
| ATSINSlab () => p "ATSINSlab"
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
| ATSinline () => p "ATSinline"
//
| ATSextern () => p "ATSextern"
| ATSstatic () => p "ATSstatic"
//
| ATSdyncst_mac () => p "ATSdyncst_mac"
| ATSdyncst_extfun () => p "ATSdyncst_extfun"
//
| SRPif () => p "#if"
| SRPifdef () => p "#ifdef"
| SRPifndef () => p "#ifndef"
| SRPinclude () => p "#include"
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
| T_INT (base, x) =>
    fprint! (out, "INT(", base, "; ", x, ")")
| T_FLOAT (base, x) =>
    fprint! (out, "FLOAT(", base, "; ", x, ")")
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
| T_LT () => fprint! (out, "<")
| T_GT () => fprint! (out, ">")
//
| T_COLON () => fprint! (out, ":")
//
| T_COMMA () => fprint! (out, ",")
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
(*
  val () = fprint! (out, tok.token_loc, ": ")
*)
  val () = fprint_tnode (out, tok.token_node)
}
//
(* ****** ****** *)

implement
print_i0de (x) = fprint (stdout_ref, x)
implement
prerr_i0de (x) = fprint (stderr_ref, x)

(* ****** ****** *)

implement
fprint_i0de (out, x) = fprint (out, x.i0de_sym)

(* ****** ****** *)

implement
print_s0exp (x) = fprint (stdout_ref, x)
implement
prerr_s0exp (x) = fprint (stderr_ref, x)

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

implement
fprint_primval
  (out, x) = let
in
//
case+
x.primval_node of
| ATSPMVi0nt (int) => fprint! (out, "ATSPMVi0nt(", int, ")")
//
end // end of [fprint_primval]
  
(* ****** ****** *)
//
implement
fprint_val<d0exp> = fprint_d0exp
//
implement
fprint_d0exp
  (out, d0e) = let
//
overload fprint with fprint_d0explst of 1000000
//
in
//
case+
d0e.d0exp_node of
//
| D0Eide (id) => fprint! (out, "D0Eide(", id, ")")
| D0Epmv (pmv) => fprint! (out, "D0Epmv(", pmv, ")")
| D0Elist (d0es) => fprint! (out, "D0Elist(", d0es, ")")
| D0Eappid (id, d0es) => fprint! (out, "D0Eappid(", id, "; ", d0es, ")")
//
end // end of [fprint_d0exp]
//
(* ****** ****** *)

implement
fprint_d0explst (out, xs) = fprint_list_sep (out, xs, ", ")

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
| F0ARGnone (s0e) =>
    fprint! (out, "F0ARGsome(", s0e, ")")
| F0ARGsome (id, s0e) =>
    fprint! (out, "F0ARGsome(", id, ": ", s0e, ")")
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
fprint_f0kind
  (out, x) = let
in
//
case+
x.f0kind_node of
| F0KINDextern () => fprint! (out, "ATSextern()")
| F0KINDstatic () => fprint! (out, "ATSstatic()")
//
end // end of [fprint_f0kind]

(* ****** ****** *)

implement
fprint_f0head
  (out, x) = let
in
//
case+
x.f0head_node of
| F0HEAD
  (
    id, marg, res
  ) =>
  fprint! (
    out, "F0HEAD(", "; ", id, "(", marg, "): ", res, ")"
  ) (* end of [fprint] *)
//
end // end of [fprint_f0head]

(* ****** ****** *)
//
implement
fprint_val<tmpdec> = fprint_tmpdec
//
implement
fprint_tmpdec
  (out, x) = let
in
//
case+
x.tmpdec_node of
| TMPDEC (tmp, s0e) =>
    fprint! (out, "TMPDEC(", tmp, ": ", s0e, ")")
//
end // end of [fprint_tmpdec]
//
(* ****** ****** *)

implement
fprint_tmpdeclst (out, xs) = fprint_list_sep (out, xs, ", ")

(* ****** ****** *)

implement
fprint_f0decl
  (out, x) = let
in
//
case+
x.f0decl_node of
| F0DECLnone (head) => fprint! (out, "F0DECLnone()")
| F0DECLsome (head, body) => fprint! (out, "F0DECLsome(...)")
//
end // end of [fprint_f0decl]

(* ****** ****** *)
//
implement
fprint_val<d0ecl> = fprint_d0ecl
//
implement
fprint_d0ecl
  (out, x) = let
in
//
case+
x.d0ecl_node of
| D0Cinclude (fname) =>
    fprint! (out, "D0Cinclude(", fname, ")")
| D0Cdyncst_mac (name) =>
    fprint! (out, "D0Cdyncst_mac(", name, ")")
| D0Cdyncst_extfun (name, s0es, s0e) =>
    fprint! (out, "D0Cdyncst_extfun(", name, ")")
| D0Ctypedef (id, tyrec) =>
    fprint! (out, "D0Ctypedef(", id, "; ", "...", ")")
| D0Cfundecl (knd, f0d) =>
    fprint! (out, "D0Cfundecl(", knd, "; ", "...", ")")
//
end // end of [fprint_d0ecl]
//
(* ****** ****** *)

implement
fprint_d0eclist
  (out, xs) = let
//
val () =
  fprint_list_sep (out, xs, "\n")
//
in
  fprint_newline (out)
end // end of [fprint_d0eclist]

(* ****** ****** *)

(* end of [atsparemit_print.dats] *)
