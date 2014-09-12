(* ****** ****** *)
//
// ATS-parse-emit-python
//
(* ****** ****** *)
//
// AS-2014-08-17: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./atsparemit.sats"
staload "./atsparemit_cil.sats"
staload "./atsparemit_syntax.sats"
staload "./atsparemit_syntax_cil.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_emit.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_typedef.dats"
//
(* ****** ****** *)

implement
emit_ENDL (out) = emit_text (out, "\n")

(* ****** ****** *)

implement
emit_SPACE (out) = emit_text (out, " ")

(* ****** ****** *)

implement
emit_SHARP (out) = emit_text (out, "#")

(* ****** ****** *)

implement
emit_COLON (out) = emit_text (out, ":")

(* ****** ****** *)

implement
emit_LPAREN (out) = emit_text (out, "(")
implement
emit_RPAREN (out) = emit_text (out, ")")

(* ****** ****** *)

implement
emit_LBRACE (out) = emit_text (out, "{")
implement
emit_RBRACE (out) = emit_text (out, "}")


(* ****** ****** *)

implement
emit_LBRACKET (out) = emit_text (out, "[")
implement
emit_RBRACKET (out) = emit_text (out, "]")

(* ****** ****** *)

implement
emit_flush (out) = fileref_flush (out)
implement
emit_newline (out) = fprint_newline (out)

(* ****** ****** *)
//
implement
emit_int (out, x) = fprint_int (out, x)
//
implement
emit_text (out, x) = fprint_string (out, x)
//
(* ****** ****** *)
//
implement
emit_symbol (out, x) =
  fprint_string (out, symbol_get_name (x))
//
(* ****** ****** *)

implement
emit_PMVint
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVint]

(* ****** ****** *)

implement
emit_PMVi0nt
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVi0nt]

(* ****** ****** *)
//
implement
emit_PMVbool
  (out, tfv) =
(
  emit_text (out, if tfv then "1" else "0")
) (* end of [emit_PMVbool] *)
//
(* ****** ****** *)
implement
emit_PMVstring
  (out, tok) = let
//
val-T_STRING(rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVstring]

(* ****** ****** *)
//
implement
emit_i0de
  (out, id) = emit_symbol (out, id.i0de_sym)
implement
emit_label
  (out, lab) = emit_symbol (out, lab.i0de_sym)
fun
emit_label_mark
  (out, lab) =
  {
    val () = emit_label (out, lab)
    val () = emit_COLON (out)
    val () = emit_ENDL (out)
  }
//
(* ****** ****** *)

implement
emit_extcode
  (out, toks) = let
//
fun
auxtok
(
  out: FILEref, tok: token
) : void =
(
case+
tok.token_node of
//
| T_KWORD _ => ()
//
| T_ENDL () => emit_ENDL (out)
| T_SPACES (cs) => emit_text (out, cs)
//
| T_COMMENT_line () =>
    emit_text (out, "// COMMENT_line\n")
| T_COMMENT_block () => ((*ignored*))
//
| T_INT (_, rep) => emit_text (out, rep)
//
| T_STRING (str) => emit_text (out, str)
//
| T_IDENT_alp (name) => emit_text (out, name)
| T_IDENT_srp (name) => emit_text (out, name) // FIXME?
//
| T_IDENT_sym (name) => emit_text (out, name)
//
| T_LPAREN () => emit_LPAREN (out)
| T_RPAREN () => emit_RPAREN (out)
//
| T_LBRACKET () => emit_LBRACKET (out)
| T_RBRACKET () => emit_RBRACKET (out)
//
| T_LBRACE () => emit_LBRACE (out)
| T_RBRACE () => emit_RBRACE (out)
//
| T_LT () => emit_text (out, "<")
| T_GT () => emit_text (out, ">")
//
| T_MINUS () => emit_text (out, "-")
//
| T_COLON () => emit_text (out, ":")
//
| T_COMMA () => emit_text (out, ",")
| T_SEMICOLON () => emit_text (out, ";")
//
| T_SLASH () => emit_text (out, "/")
//
| _ (*unrecognized*) =>
  {
    val () = fprint! (out, "TOKERR(", tok, ")")
  }
) (* end of [auxtok] *)
//
in
//
case+ toks of
| list_nil () => ()
| list_cons (tok, toks) =>
  (
    auxtok (out, tok); emit_extcode (out, toks)
  ) (* end of [list_cons] *)
//
end // end of [emit_extcode]

(* ****** ****** *)
//
extern
fun emit_tmpvar_ld (out: FILEref, tmp: i0de): void
//
extern
fun emit_tmpvar_st (out: FILEref, tmp: i0de): void
//
implement
  emit_tmpvar_ld (out, tmp) =
  {
    val () =
      if tmpvar_is_arg (tmp.i0de_sym)
        then emit_text (out, "ldarg")
        else emit_text (out, "ldloc")
    val () = emit_SPACE (out)
    val () = emit_i0de (out, tmp)
  } // end of [emit_tmpvar_ld]
//
implement
  emit_tmpvar_st
    (out, tmp) =
  {
    val () =
      if tmpvar_is_arg (tmp.i0de_sym)
        then emit_text (out, "starg")
        else emit_text (out, "stloc")
    val () = emit_SPACE (out)
    val () = emit_i0de (out, tmp)
  } // end of [emit_tmpvar_st]
//
(* ****** ****** *)
//
extern
fun emit_MODCLSNAME (out: FILEref, fname: string): void
//
implement
  emit_MODCLSNAME (out, fname) = {
  val () = emit_text (out, "\'")
  // TODO: sanitize?
  val () = emit_text (out, fname)
  val () = emit_text (out, "\'")
} (* end of [emit_MODCLSNAME] *)
//
(* ****** ****** *)
//
extern
fun
emit_branchseqlst
  (out: FILEref, inss: instrlst, labthis: label, labnext: label): void
//
extern
fun
emit_instrlst
  (out: FILEref, inss: instrlst, labbeg: label, labend: label) : void
//
extern
fun
emit_s0exp : emit_type (s0exp)
extern
fun
emit_s0explst : emit_type (s0explst)
//
(* ****** ****** *)
//
implement
emit_s0exp
  (out, s0e) = let
//
//
in
//
case+
s0e.s0exp_node of
//
| S0Eide (id) =>
(
  case+ symbol_get_name (id) of
  | "atsvoid_t0ype" => emit_text (out, "void")
  | "atstype_void" => emit_text (out, "void")
  | _ => emit_symbol (out, id)
) (* end of [S0Eide] *)
| S0Elist (s0es) => () // shouldn't happen? marked as "temp"
| S0Eappid (id, s0es) =>
    // FIXME: what about other types? e.g. array types? struct types?
(
  case+ symbol_get_name (id.i0de_sym) of
  | "atstkind_t0ype" => let
    // unboxed type, of sort t@ype in ATS
    val-list_cons (s0e, list_nil ()) = s0es
    val-S0Eide (id) = s0e.s0exp_node
  in
    case+ symbol_get_name (id) of
    | "atstype_sint" => emit_text (out, "int16")
    | "atstype_usint" =>
      {
        val () = emit_text (out, "unsigned")
        val () = emit_SPACE (out)
        val () = emit_text (out, "int16")
      }
    | "atstype_int" => emit_text (out, "int32")
    | "atstype_uint" =>
      {
        val () = emit_text (out, "unsigned")
        val () = emit_SPACE (out)
        val () = emit_text (out, "int")
      }
    | "atstype_lint" => emit_text (out, "int64")
    | "atstype_ulint" =>
      {
        val () = emit_text (out, "unsigned")
        val () = emit_SPACE (out)
        val () = emit_text (out, "int64")
      }
    | "atstype_bool" => emit_text (out, "bool")
    | "atstype_byte" =>
      {
        val () = emit_text (out, "unsigned")
        val () = emit_SPACE (out)
        val () = emit_text (out, "int8")
      }
    // TODO: atstype_char, atstype_schar, atstype_uchar
    | "atstype_string" => emit_text (out, "string")
    | "atstype_stropt" => emit_text (out, "string")
    | "atstype_strptr" => emit_text (out, "string")
    | _ => emit_symbol (out, id)
  end // end of [let]
  | _ =>
    {
      val () = emit_i0de (out, id)
      val () = emit_LPAREN (out)
      val () = emit_s0explst (out, s0es)
      val () = emit_RPAREN (out)
    } // end of [_]
)
//
end // end of [emit_s0exp]
//
(* ****** ****** *)

implement
emit_s0explst
  (out, s0es) = let
//
fun
loop
(
  out: FILEref, s0es: s0explst, i: int
) : void =
(
case+ s0es of
| list_nil () => ()
| list_cons (s0e, s0es) => let
    val () =
      if i > 0 then emit_text (out, ", ")
    // end of [val]
  in
    emit_s0exp (out, s0e); loop (out, s0es, i+1)
  end // end of [list_cons]
)
//
in
  loop (out, s0es, 0)
end // end of [emit_s0explst]

(* ****** ****** *)
//
extern
fun
funlab_get_index (fl: label): int
extern
fun
tmplab_get_index (lab: label): int
//
(* ****** ****** *)
//
extern
fun
the_f0arglst_get (): f0arglst
extern
fun
the_f0arglst_set (f0as: f0arglst): void
//
(* ****** ****** *)
//
extern
fun
the_tmpdeclst_get (): tmpdeclst
extern
fun
the_tmpdeclst_set (tds: tmpdeclst): void
//
(* ****** ****** *)
//
extern
fun
the_funbodylst_get (): instrlst
extern
fun
the_funbodylst_set (inss: instrlst): void
//
(* ****** ****** *)
//
extern
fun
the_branchlablst_get (): labelist
extern
fun
the_branchlablst_set (labs: labelist): void
//
(* ****** ****** *)
//
extern
fun
the_caseofseqlst_get (): instrlst
extern
fun
the_caseofseqlst_set (inss: instrlst): void
//
(* ****** ****** *)

local
//
val the_f0arglst = ref<f0arglst> (list_nil)
val the_tmpdeclst = ref<tmpdeclst> (list_nil)
//
val the_funbodylst = ref<instrlst> (list_nil)
//
val the_branchlablst = ref<labelist> (list_nil)
val the_caseofseqlst = ref<instrlst> (list_nil)
//
in (* in-of-local *)

implement
the_f0arglst_get () = !the_f0arglst
implement
the_f0arglst_set (xs) = !the_f0arglst := xs

implement
the_tmpdeclst_get () = !the_tmpdeclst
implement
the_tmpdeclst_set (xs) = !the_tmpdeclst := xs

implement
the_funbodylst_get () = !the_funbodylst
implement
the_funbodylst_set (xs) = !the_funbodylst := xs

implement
the_branchlablst_get () = !the_branchlablst
implement
the_branchlablst_set (xs) = !the_branchlablst := xs

implement
the_caseofseqlst_get () = !the_caseofseqlst
implement
the_caseofseqlst_set (xs) = !the_caseofseqlst := xs

end // end of [local]

(* ******* ****** *)

local

fun
loop
(
  out: FILEref, d0es: d0explst, i: int
) : void =
(
case+ d0es of
| list_nil () => ()
| list_cons (d0e, d0es) => let
    val () =
      if i > 0 then emit_newline (out)
    // end of [val]
  in
    emit_d0exp (out, d0e);
    emit_newline (out);
    loop (out, d0es, i+1)
  end // end of [list_cons]
)

in (* in-of-local *)

implement
emit_d0explst (out, d0es) = loop (out, d0es, 0)
implement
emit_d0explst_1 (out, d0es) = loop (out, d0es, 1)

end // end of [local]

(* ******* ****** *)
//
extern
fun emit_f0arg : emit_type (f0arg)
extern
fun emit_f0marg : emit_type (f0marg)
extern
fun emit_f0head : emit_type (f0head)
//
(* ****** ****** *)

implement
emit_d0exp
  (out, d0e) = let
in
//
case+
d0e.d0exp_node of
//
| D0Eide (id) =>
  {
    val () = emit_tmpvar_ld (out, id)
  }
//
| D0Eappid (id, d0es) => let
    val () = emit_d0explst (out, d0es)

    // need type for [id]
    // what is [tyrec] type for?
    // val-~Some_vt (s0rec) = typedef_search_opt (id.i0de_sym)
    
    val f0head_opt = f0head_search_opt (id.i0de_sym)
  in
    case+ f0head_opt of
    | ~None_vt() =>
      {
        val () =
        (
          case+ symbol_get_name (id.i0de_sym) of
          // many more functions
          // atspre_g1int_add_int
          // atspre_g0int_sub_int
          // atspre_g0int_mul_int
          // atspre_g0int2int_int_int
          // atspre_g0int_lte_int
          // atspre_g0int_sub_int
          // - some of these are just macros (map to other functions)
          // - we still have to figure out the type signatures
          | "atspre_print_newline" =>
            {
              val () = emit_text (out, "call")
              val () = emit_SPACE (out)
              val () = emit_text (out, "void [mscorlib]System.Console::WriteLine()")
            }
          | "atspre_print_string" =>
            {
              val () = emit_text (out, "call")
              val () = emit_SPACE (out)
              val () = emit_text (out, "void [mscorlib]System.Console::WriteLine(string)")
            }
          | "atspre_print_int" =>
            {
              val () = emit_text (out, "call")
              val () = emit_SPACE (out)
              val () = emit_text (out, "void [mscorlib]System.Console::Write(int32)")
            }
          //
          | "ATSCKpat_int" => emit_text (out, "ceq")
          | "ATSCKpat_bool" => emit_text (out, "ceq")
          | "ATSCKpat_char" => emit_text (out, "ceq")
          | "ATSCKpat_float" => emit_text (out, "ceq")
          | "ATSCKpat_string" =>
            {
              val () = emit_text (out, "call")
              val () = emit_SPACE (out)
              val () = emit_text (out, "bool [mscorlib]System.String::Equals(string,string)")
            }
          // TODO: ATSCKpat_(con*|exn*)
          //
          | _ =>
            {
              val () = emit_text (out, "call")
              val () = emit_SPACE (out)
              val () = emit_i0de (out, id) // FIXME: need also type of [id]!
            }
        ) (* end of [val] *)
      }
    | ~Some_vt(fhd) =>
      {
        val () = emit_text (out, "call")
        val () = emit_SPACE (out)
        val () = emit_f0head (out, fhd)
      }
  end // end of [D0Eappid]
//
// TODO: D0Elist
//
| ATSempty (x) => emit_text (out, "ldnull")
//
| ATSPMVint (tok) =>
  {
    val () = emit_text (out, "ldc.i4")
    val () = emit_SPACE (out)
    val () = emit_PMVint (out, tok)
  } (* end of [ATSPMVint] *)
| ATSPMVi0nt (tok) =>
  {
    val-T_INT(base, rep) = tok.token_node
    val () = emit_text (out, "ldc.i4")
    val () = emit_SPACE (out)
    val () = emit_text (out, rep)
  } (* end of [ATSPMVi0nt] *)
//
| ATSPMVbool (tfv) =>
  {
    val () = emit_text (out, "ldc.i4")
    val () = emit_SPACE (out)
    val () = emit_PMVbool (out, tfv)
  } (* end of [ATSPMVbool] *)
//
| ATSPMVstring (tok) =>
  {
    val () = emit_text (out, "ldstr")
    val () = emit_SPACE(out)
    val () = emit_PMVstring (out, tok)
  } (* end of [ATSPMVstring] *)
//
| ATSPMVf0loat (tok) =>
  {
    val-T_FLOAT(base, rep) = tok.token_node
    val () = emit_text (out, rep)
  }
//
| _ => emit_text (out, "**D0EXP**")
//
end // end of [emit_d0exp]

(* ****** ****** *)
//
extern
fun emit_f0body : emit_type (f0body)
//
(* ****** ****** *)

implement
emit_f0arg
  (out, f0a) = let
in
//
case+
f0a.f0arg_node of
//
| F0ARGnone s0e => emit_s0exp (out, s0e)
| F0ARGsome (id, s0e) =>
  {
    val () = emit_s0exp (out, s0e)
    val () = emit_SPACE (out)
    val () = emit_i0de (out, id)
  } (* end of [F0ARGsome] *)
//
end // end of [emit_f0arg]

(* ****** ****** *)

implement
emit_f0marg
  (out, f0ma) = let
//
fun
loop
(
  out: FILEref, f0as: f0arglst, i: int
) : void =
(
case+ f0as of
| list_nil () => ()
| list_cons (f0a, f0as) => let
    val () =
      if i > 0 then emit_text (out, ", ")
    // end of [val]
  in
    emit_f0arg (out, f0a); loop (out, f0as, i+1)
  end // end of [list_cons]
)
//
in
  loop (out, f0ma.f0marg_node, 0)
end // end of [emit_f0marg]

(* ****** ****** *)

implement
emit_f0head
  (out, fhd) = let
//
val f0as =
  f0head_get_f0arglst (fhd)
//
val () = the_f0arglst_set (f0as)
//
in
//
case+
fhd.f0head_node of
| F0HEAD
    (id(*name of function*), f0ma(*list of arguments*), res(*result type*)) =>
  {
    val () = emit_s0exp (out, res)
    val () = emit_SPACE (out)
    val () = emit_i0de (out, id)
    val () = emit_LPAREN (out)
    val () = emit_f0marg (out, f0ma)
    val () = emit_RPAREN (out)
  }
//
end // end of [emit_f0head]

(* ****** ****** *)
//
extern
fun
emit_tmpdeclst
  (out: FILEref, tds: tmpdeclst): void
//
implement
emit_tmpdeclst
  (out, tds) = let
//
fun auxlst
(
  out: FILEref, tds: tmpdeclst, i: int
) : void =
(
case+ tds of
| list_nil () => ()
| list_cons (td, tds) =>
  (
    case+ td.tmpdec_node of
    | TMPDECnone
        (tmp) => auxlst (out, tds, i) // probably ATStmpdec_void()
    | TMPDECsome
        (tmp, s0e) => let
        val () =
          if i > 0 then
            emit_text(out, ", ")
        // end of [val]
        val () = emit_s0exp (out, s0e)
        val () = emit_SPACE (out)
        val () = emit_i0de (out, tmp)
        val () = emit_newline (out)
      in
        auxlst (out, tds, i+1)
      end // end of [TMPDECsome]
  ) (* end of [list_cons] *)
)
//
in
  auxlst (out, tds, 0)
end // end of [emit_tmpdeclst_initize]
//
(* ****** ****** *)
//
extern
fun emit_instr_0
  (out: FILEref, ins: instr): void
//
implement
emit_instr_0
  (out, ins0) = let
in
//
case+
ins0.instr_node of
//
| ATSreturn (tmp) =>
  {
    val () = emit_tmpvar_ld (out, tmp)
    val () = emit_newline (out)
    val () = emit_text (out, "ret")
  }
//
| ATSreturn_void (tmp) =>
  {
    val () = emit_text (out, "ret")
  }
//
| _ => emit_text (out, "**INSTR**")
//
end // end of [emit_instr_0]
//
extern
fun emit_instr
  (out: FILEref, ins: instr, labthis: label, labnext: label) : void
//
implement
emit_instr
  (out, ins0, labthis, labnext) = let
in
//
case+
ins0.instr_node of
//
| ATSif
  (
    d0e(*test*), inss(*then*), inssopt(*else*)
  ) =>
  (
    emit_d0exp (out, d0e);
    emit_newline (out);
    
    case+ inssopt of
    | Some (inss2) =>
      {
        val () = emit_text (out, "brfalse")
        val () = emit_SPACE (out)
        val L1 = label_for_instrlst (inss2)
        val () = emit_label (out, L1)
        val () = emit_ENDL (out)
        val L0 = label_for_instrlst (inss)
        val brlab = make_label (ins0.instr_loc)
        val () = emit_instrlst (out, inss, L0, brlab)
        val () = emit_label_mark (out, brlab)
        val () = emit_text (out, "br")
        val () = emit_SPACE (out)
        val () = emit_label (out, labnext)
        val () = emit_ENDL (out)
        val () = emit_instrlst (out, inss2, L1, labnext)
      }
    | None () =>
      {
        val () = emit_text (out, "brfalse")
        val () = emit_SPACE (out)
        val () = emit_label (out, labnext)
        val () = emit_ENDL (out)
        val () = emit_instrlst (out, inss, labthis, labnext)
      }
  )
//
| ATSifthen (d0e, inss) =>
  {
//
    val-list_cons (ins, _) = inss
//
    val () = emit_d0exp (out, d0e)
    val () = emit_ENDL (out)
    val () = emit_text (out, "brfalse")
    val () = emit_SPACE (out)
    val () = emit_label (out, labnext)
    val () = emit_ENDL (out)
    val () = emit_instr (out, ins, labthis, labnext)
  }
| ATSifnthen (d0e, inss) =>
  {
//
    val-list_cons (ins, _) = inss
//
    val () = emit_d0exp (out, d0e)
    val () = emit_ENDL (out)
    val () = emit_text (out, "brtrue")
    val () = emit_SPACE (out)
    val () = emit_label (out, labnext)
    val () = emit_ENDL (out)
    val () = emit_instr (out, ins, labthis, labnext)
  }
//
| ATSbranchseq (inss) =>
  {
    val () = emit_text (out, "/* ATSbranch */")
  }
//
| ATScaseofseq (inss) =>
  {
    val () = emit_text (out, "/* ATScaseofseq_beg */\n")
    val () = emit_branchseqlst (out, inss, labthis, labnext)
    val () = emit_text (out, "/* ATScaseofseq_end */\n")
  }
//
// TODO: ATSlinepragma
//
| ATSreturn (tmp) =>
  {
    val () =
      if tmpvar_is_arg (tmp.i0de_sym)
        then emit_text (out, "ldarg")
        else emit_text (out, "ldloc")
    // end of [val]
    val () = emit_SPACE (out)
    val () = emit_i0de (out, tmp)
    val () = emit_newline (out)
    val () = emit_text (out, "ret")
  }
//
| ATSreturn_void (tmp) =>
  {
    val () = emit_text (out, "ret")
  }
//
(*
| ATSlinepragma (line, file) =>
  {
    val () = emit_text (out, ".line")
    val () = emit_SPACE (out)
    val-T_INT(_, lpos) = line.token_node
    val () = emit_text (out, lpos)
    val () = emit_SPACE (out)
    val-T_STRING(filnam) = file.token_node
    val () = emit_text (out, filnam)
  }
*)
//
(*
| ATSINSlab (lab) =>
  {
    val () = emit_label_mark (out, lab)
  }
*)
//
| ATSINSgoto (lab) =>
  {
    val () = emit_text (out, "br")
    val () = emit_SPACE (out)
    val () = emit_label (out, lab)
  }
//
(*
| ATSINSflab (flab) =>
  {
    val () = emit_label_mark (out, flab)
  }
*)
//
| ATSINSfgoto (flab) =>
  {
    val () = emit_text (out, "br")
    val () = emit_SPACE (out)
    val () = emit_label (out, flab)
  }
//
| ATSINSmove (tmp, d0e) =>
  {
    val () = emit_d0exp (out, d0e)
    val () = emit_newline (out)
    val () = emit_tmpvar_st (out, tmp)
  } (* end of [ATSINSmove] *)
| ATSINSmove_void (_, d0e) =>
  {
    val () = emit_d0exp (out, d0e)
  } (* end of [ATSINSmove_void] *)
// TODO: ATSdynload0, ATSdynload1, ATSdynloadset
//
| ATStailcalseq (inss) =>
  {
    val () = emit_text (out, "// ATStailcalseq_beg")
    val () = emit_ENDL (out)
    val () = emit_instrlst (out, inss, labthis, labnext)
    val () = emit_text (out, "// ATStailcalseq_end")
  } (* end of [ATStailcalseq] *)
//
| ATSINSmove_tlcal (tmp, d0e) =>
  {
    val () = emit_d0exp (out, d0e)
    val () = emit_ENDL (out)
    val () = emit_tmpvar_st (out, tmp)
  } (* end of [ATSINSmove_tlcal] *)
//
| ATSINSargmove_tlcal (tmp1, tmp2) =>
  {
    val () = emit_tmpvar_ld (out, tmp2)
    val () = emit_ENDL (out)
    val () = emit_tmpvar_st (out, tmp1)    
  } (* end of [ATSINSargmove_tlcal] *)
//
| _ =>
  {
    val ((*error*)) = fprint! (out, "UNRECOGNIZED-INSTRUCTION: ", ins0)
  }
//
end // end of [emit_instr]

(* ****** ****** *)

implement
emit_branchseqlst
  (out, inss, labthis, lablast) = let
//
fun auxseq
(
  out: FILEref
, ins0: instr
, labthis: label
, labnext: label
) : void = let
in
//
case-
ins0.instr_node of
//
| ATSbranchseq
    (inss) =>
  {
    val () = emit_text (out, "/* ATSbranch_beg */\n")
    val () = emit_instrlst (out, inss, labthis, labnext)
    val () = emit_text (out, "/* ATSbranch_end */\n")
  } // end of [ATSbranchseq]
//
end (* end of [auxseq] *)
//
fun auxseqlst
(
  out: FILEref
, inss: instrlst
, labnext: label
, lablast: label
) : void = let
in
//
case+ inss of
| list_nil () => ()
| list_cons
    (ins, inss) => let
//
    val labnext =
    (
      case+ inss of
      | list_nil () => lablast
      | _ => label_for_instrlst (inss)
    ) (* end of [val] *)
//
    val () = auxseq (out, ins, labnext, lablast)
//
    val () = emit_text (out, "br")
    val () = emit_SPACE (out)
    val () = emit_label (out, lablast)
    val () = emit_ENDL (out)
//
  in
    auxseqlst (out, inss, labnext, lablast)
  end (* end of [list_cons] *)
//
end (* end of [auxseqlst] *)
//
  val labthis =
  (
    case+ inss of
    | list_nil () => lablast
    | _ => label_for_instrlst (inss)
  ) (* end of [val] *)
//
in
  auxseqlst (out, inss, labthis, lablast);
end // end of [emit_branchseqlst]

(* ****** ****** *)

implement
emit_instrlst
(
  out, inss, labthis, lablast
) = (
//
case+ inss of
| list_nil () => ()
| list_cons (ins0, inss) => let
  //
  //
  in
    case+ ins0.instr_node of
    | ATSINSlab (label) =>
      (
        emit_instrlst (out, inss, label, lablast)
      )
    | ATSINSflab (label) =>
      (
        emit_instrlst (out, inss, label, lablast)
      )
    | ATSlinepragma (line, file) =>
      {
        val () = emit_text (out, ".line")
        val () = emit_SPACE (out)
        val-T_INT(_, lpos) = line.token_node
        val () = emit_text (out, lpos)
        val () = emit_SPACE (out)
        val-T_STRING(filnam) = file.token_node
        val filnam = g1ofg0 (filnam)
        // double quotes -> single quotes
        val () = emit_text (out, "'")
        // FIXME: very involved
        val-true = string_isnot_empty filnam
        val len = pred (length filnam)
        val-true = len > g1int2uint(0)
        val () = fprint_substring (out, filnam, g1int2uint(1), pred (len))
        val () = emit_text (out, "'")
        val () = emit_ENDL (out)
        val () = emit_instrlst (out, inss, labthis, lablast)
      }
    | _(*other*) =>
      {
        val () = emit_label_mark (out, labthis)
        val labnext =
        (
          case+ inss of
          | list_nil () => lablast
          | _ => label_for_instrlst (inss)
        ) (* end of [val] *)
        val () = emit_instr (out, ins0, labthis, labnext)
        val () = emit_ENDL (out)
        val () = emit_instrlst (out, inss, labnext, lablast)
      }
  end // end of [let]
//
) (* end of [emit_instrlst] *)

(* ****** ****** *)
//
extern
fun emit_ATSfunbodyseq
  (out: FILEref, ins: instr, labnext: label) : void
//
implement
emit_ATSfunbodyseq
  (out, ins, labnext) = let
//
val-ATSfunbodyseq (inss) = ins.instr_node
val L1 = label_for_instrlst (inss)
//
in
  emit_instrlst (out, inss, L1, labnext)
end // end of [emit_ATSfunbodyseq]

(* ****** ****** *)
//
extern
fun emit_f0body_0 : emit_type (f0body)
//
implement
emit_f0body_0
  (out, fbody) = let
//
fun
auxlst
(
  out: FILEref, inss: instrlst
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons
    (ins0, inss1) => let
    val-list_cons (ins1, inss2) = inss1
    val labnext = label_for_instrlst (inss1)
    val () = emit_ATSfunbodyseq (out, ins0, labnext)
    val () = emit_label_mark (out, labnext)
    // FIXME: inss2 is EMPTY! what now?
    val lablast =
    (
      case+ inss2 of
      | list_nil () => i0de_make_string (location_dummy, "LASTLABEL")
      | _ => label_for_instrlst (inss2)
    )
    val () = emit_instr (out, ins1, labnext, lablast)
  in
    auxlst (out, inss2)
  end // end of [list_cons]
) (* end of [auxlst] *)
//
in
//
case+
fbody.f0body_node of
//
| F0BODY (tds, inss) => let
    val () = label_reset ()
  in
    auxlst (out, inss)
  end // end of [auxlst]
//
end // end of [emit_f0body_0]

(* ****** ****** *)
implement
emit_f0body
  (out, fbody) = let
//
val tmpdecs =
  f0body_get_tmpdeclst (fbody)
//
val () = the_tmpdeclst_set (tmpdecs)
val () = emit_LBRACE (out)
val () = emit_newline (out)
// TODO: how to compute maxstack?
val () = emit_text (out, ".maxstack 16")
val () = emit_newline (out)
// emit locals
val () = emit_text (out, ".locals")
val () = emit_SPACE (out)
(*
val () = emit_text (out, "init")
val () = emit_SPACE (out)
*)
val () = emit_LPAREN (out)
val () = emit_newline (out)
val () = emit_tmpdeclst (out, tmpdecs)
val () = emit_RPAREN (out)
val () = emit_newline (out)

val () = emit_f0body_0 (out, fbody)
val () = emit_newline (out)
val () = emit_RBRACE (out)
in
//
//
end // end of [emit_f0body]

(* ****** ****** *)

implement
emit_f0decl
  (out, fdec) = let
in
//
case+
fdec.f0decl_node of
| F0DECLnone (fhd) =>
  // does this actually mean function declaration (e.g. forward function decl)?
  {
    val-F0HEAD(id, _, _) = fhd.f0head_node
    val () = f0head_insert (id.i0de_sym, fhd)
  }
| F0DECLsome (fhd, fbody) =>
  {
    val () = emit_text (out, ".method")
    val () = emit_SPACE (out)
    val () = emit_text (out, "static")
    // TODO: public/private?
    // static -> private
    val () = emit_SPACE (out)
    val () = emit_text (out, "public")
    val () = emit_SPACE (out)
    val-F0HEAD(id, _, _) = fhd.f0head_node
    val () = f0head_insert (id.i0de_sym, fhd)
    val () = emit_f0head (out, fhd)
    val () = emit_SPACE (out)    
    val () = emit_text (out, "cil")
    val () = emit_SPACE (out)
    val () = emit_text (out, "managed")
    val () = emit_newline (out)
    val () = emit_f0body (out, fbody)
    val () = emit_newline (out)
  } (* end of [F0DECLsome] *)
//
end // end of [emit_f0decl]

(* ****** ****** *)

//
extern
fun
tyrec_labsel
  (tyrec: tyrec, lab: symbol): int
//
implement
tyrec_labsel
  (tyrec, lab) = let
//
fun loop
(
  xs: tyfldlst, i: int
) : int =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (id, s0e) = x.tyfld_node
  in
    if lab = id.i0de_sym then i else loop (xs, i+1)
  end // end of [list_cons
| list_nil ((*void*)) => ~1(*error*)
)
//
in
  loop (tyrec.tyrec_node, 0)
end // end of [tyrec_labsel]
//
(* ****** ****** *)

implement
emit_SELcon
  (out, d0e) = let
//
val-ATSSELcon
  (d0rec, s0e, id) = d0e.d0exp_node
val-S0Eide (name) = s0e.s0exp_node
val-~Some_vt (s0rec) = typedef_search_opt (name)
//
val index = tyrec_labsel (s0rec, id.i0de_sym)
//
val () =
  emit_d0exp (out, d0rec)
//
val () = emit_LBRACKET (out)
val () = emit_int (out, index)
val () = emit_RBRACKET (out)
//
in
  // nothing
end // end of [emit_SELcon]

(* ****** ****** *)

implement
emit_SELboxrec
  (out, d0e) = let
//
val-ATSSELboxrec
  (d0rec, s0e, id) = d0e.d0exp_node
val-S0Eide (name) = s0e.s0exp_node
val-~Some_vt (s0rec) = typedef_search_opt (name)
//
val index = tyrec_labsel (s0rec, id.i0de_sym)
//
val () =
  emit_d0exp (out, d0rec)
//
val () = emit_LBRACKET (out)
val () = emit_int (out, index)
val () = emit_RBRACKET (out)
//
in
  // nothing
end // end of [emit_SELboxrec]

(* ****** ****** *)
//
#define
ATSEXTCODE_BEG "/*\nATSextcode_beg()\n*/"
#define
ATSEXTCODE_END "/*\nATSextcode_end()\n*/"
//
(* ****** ****** *)

implement
emit_d0ecl
  (out, d0c) = let
in
//
case+
d0c.d0ecl_node of
//
| D0Cinclude include =>
  {
    val () = emit_text (out, "#include")
    val () = emit_SPACE (out)
    val-T_STRING(filnam) = include.token_node
    val () = emit_text (out, filnam)
    val () = emit_newline (out)
  }
//
| D0Cifdef (i0de, d0eclist) =>
  {
    val () = emit_text (out, "#ifdef")
    val () = emit_SPACE (out)
    val () = emit_i0de (out, i0de)
    val () = emit_newline (out)
    val () = emit_text (out, "#endif")
    val () = emit_newline (out)
  }
| D0Cifndef (i0de, d0eclist) =>
  {
    val () = emit_text (out, "#ifndef")
    val () = emit_SPACE (out)
    val () = emit_i0de (out, i0de)
    val () = emit_newline (out)
    val () = emit_text (out, "#endif")
    val () = emit_newline (out)
  }
//
| D0Ctypedef (id, def) =>
  {
    val () = typedef_insert (id.i0de_sym, def)
    // TODO: insert type (class) declaration
  } (* end of [D0Ctypedef] *)
//
| D0Cassume (id) =>
  {
    val () = emit_text (out, "/* ATSassume(")
    val () = emit_i0de (out, id)
    val () = emit_text (out, ") */\n")
  }
//
| D0Cdyncst_mac ide =>
  // [ide] is the identifier for a dynamic constant which is implemented as a macro
  ()
  (*
  {
    val () = emit_text (out, "dyncst_mac")
    val () = emit_SPACE (out)
    val filnam = ide.i0de_sym
    val () = emit_symbol (out, filnam)
    val () = emit_ENDL (out)
  }*)
| D0Cdyncst_extfun (i0de, s0explst, s0exp) =>
  {
  }
//
| D0Cstatmp
    (tmp, opt) =>
  {
    val () = (
      case+ opt of
      | Some _ => () | None () => emit_text (out, "//")
    ) (* end of [val] *)
    val () = (
      emit_i0de (out, tmp)
    ) (* end of [val] *)
  } (* end of [D0Cstatmp] *)
//
| D0Cextcode (toks) =>
  {
    val () = emit_text (out, ATSEXTCODE_BEG)
    val () = emit_extcode (out, toks)
    val () = emit_text (out, ATSEXTCODE_END)
  }
| D0Cclosurerize (_, _, _, _) => ()
//
| D0Cfundecl (fk, f0d) => emit_f0decl (out, f0d)
//
| D0Cdynloadflag_init (flag) =>
  (
    emit_text (out, "// dynloadflag_init\n");
    (* TODO
    emit_global (out, flag); emit_text (out, " = 0;\n")
    *)
  )
//
end // end of [emit_d0ecl]

(* ****** ****** *)

implement
emit2_toplevel
  (out, d0cs, fname, namespace) = let
//
fun
loop
(
  out: FILEref, d0cs: d0eclist
) : void =
(
//
case+ d0cs of
| list_nil () => ()
| list_cons
    (d0c, d0cs) => let
  in
    emit_d0ecl (out, d0c); loop (out, d0cs)
  end // end of [list_cons]
//
)
//
// TODO: for the main file, emit assembly manifest (assembly references, etc.)
// TODO: for all modules, emit .module extern for other modules?
// TODO: handle entry point
//
val () = emit_text (out, ".module")
val () = emit_SPACE (out)
val () = emit_text (out, "'")
val () = emit_text (out, fname)
val () = emit_text (out, "'")
val () = emit_ENDL (out)
//
val () = emit_text (out, ".namespace")
val () = emit_SPACE (out)
val () = emit_text (out, namespace)
val () = emit_SPACE (out)
val () = emit_LBRACE (out)
val () = emit_ENDL (out)
//
val () = emit_text (out, ".class")
val () = emit_SPACE (out)
val () = emit_MODCLSNAME (out, fname)
val () = emit_SPACE (out)
val () = emit_LBRACE (out)
val () = emit_ENDL (out)
val () = loop (out, d0cs)
val () = emit_RBRACE (out) (* end of [class] definition *)
val () = emit_text (out, "/* end of class */")
//
val () = emit_ENDL (out)
val () = emit_RBRACE (out) (* end of [namespace] definition *)
val () = emit_text (out, "/* end of namespace */")
//
in
  (*empty*)
end // end of [emit2_toplevel]

(* ****** ****** *)

(* end of [atsparemit_emit_cil.dats] *)
