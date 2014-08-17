(* ****** ****** *)
//
// ATS-parse-emit-python
//
(* ****** ****** *)
//
// HX-2014-08-04: start
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
staload "./atsparemit_syntax.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_emit.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_topenv.dats"
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
emit_LPAREN (out) = emit_text (out, "(")
implement
emit_RPAREN (out) = emit_text (out, ")")

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
  emit_text (out, if tfv then "True" else "False")
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
    val () = emit_symbol (out, id)
  }
//
| D0Eappid (id, d0es) =>
  {
    val () = emit_symbol (out, id)
    val () = emit_LPAREN (out)
    val () = emit_d0explst (out, d0es)
    val () = emit_RPAREN (out)
  }
//
| D0Elist (d0es) =>
  {
    val () = emit_text (out, "__D0Elist__")
    val () = emit_LPAREN (out)
    val () = emit_d0explst (out, d0es)
    val () = emit_RPAREN (out)
  }
//
| ATSPMVint (tok) => emit_PMVint (out, tok)
| ATSPMVi0nt (tok) => emit_PMVi0nt (out, tok)
//
| ATSPMVbool (tfv) => emit_PMVbool (out, tfv)
//
| ATSPMVstring (tok) => emit_PMVstring (out, tok)
//
| ATSPMVf0loat (tok) => emit_text (out, "ATSPMVf0loat(...)")
//
| ATSSELcon _ => emit_SELcon (out, d0e)
//
| ATSSELrecsin _ => emit_text (out, "ATSSELrecsin(...)")
//
| ATSSELboxrec _ => emit_SELboxrec (out, d0e)
//
| ATSSELfltrec _ => emit_text (out, "ATSSELfltrec(...)")
//
end // end of [emit_d0exp]

(* ****** ****** *)

implement
emit_d0explst
  (out, d0es) = let
//
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
      if i > 0 then emit_text (out, ", ")
    // end of [val]
  in
    emit_d0exp (out, d0e); loop (out, d0es, i+1)
  end // end of [list_cons]
)
//
in
  loop (out, d0es, 0)
end // end of [emit_d0explst]

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

implement
emit_d0ecl
  (out, d0c) = let
in
//
case+
d0c.d0ecl_node of
//
| D0Cinclude _ => ()
//
| D0Cifdef _ => ()
| D0Cifndef _ => ()
//
| D0Ctypedef (id, def) =>
  {
    val () = typedef_insert (id.i0de_sym, def)
  } (* end of [D0Ctypedef] *)
//
| D0Cdyncst_mac _ => ()
| D0Cdyncst_extfun _ => ()
//
| D0Cfundecl (fk, f0d) => emit_f0decl (out, f0d)
//
end // end of [emit_d0ecl]

(* ****** ****** *)
//
extern
fun
emit_nspc
  (out: FILEref, ind: int): void
//
implement
emit_nspc (out, ind) =
(
//
if ind > 0 then
  (emit_text (out, " "); emit_nspc (out, ind-1))
//
) (* end of [emit_nspc] *)
//
(* ****** ****** *)
//
extern
fun
emit_f0arglst_nonlocal
  (out: FILEref, f0as: f0arglst): void
//
implement
emit_f0arglst_nonlocal
  (out, f0as) = let
//
fun auxlst
(
  out: FILEref, f0as: f0arglst, i: int
) : void =
(
case+ f0as of
| list_nil () => ()
| list_cons (f0a, f0as) =>
  (
    case- f0a.f0arg_node of
    | F0ARGsome (id, _) => let
        val () =
        if i > 0
          then emit_text (out, ", ")
        // end of [if]
        val () = emit_i0de (out, id)
      in
        auxlst (out, f0as, i+1)
      end // end of [F0ARGsome]
  ) (* end of [list_cons] *)
)
//
in
//
case+ f0as of
| list_nil () => ()
| list_cons _ =>
  {
    val () =
    emit_nspc (out, 4(*ind*))
    val () =
    emit_text (out, "nonlocal ")
    val () = auxlst (out, f0as, 0(*i*))
    val () = emit_ENDL (out)
  }
//
end // end of [emit_f0arglst_nonlocal]
//
(* ****** ****** *)
//
extern
fun
emit_tmpdeclst_initize
  (out: FILEref, tds: tmpdeclst): void
//
implement
emit_tmpdeclst_initize
  (out, tds) = let
//
fun auxlst
(
  out: FILEref, tds: tmpdeclst
) : void =
(
case+ tds of
| list_nil () => ()
| list_cons (td, tds) =>
  (
    case+ td.tmpdec_node of
    | TMPDECnone
        (tmp) => auxlst (out, tds)
    | TMPDECsome
        (tmp, _) => let
        val () = emit_nspc (out, 2(*ind*))
        val () = emit_i0de (out, tmp)
        val () = emit_text (out, " = None\n")
      in
        auxlst (out, tds)
      end // end of [TMPDECsome]
  ) (* end of [list_cons] *)
)
//
in
  auxlst (out, tds)
end // end of [emit_tmpdeclst_initize]
//
(* ****** ****** *)
//
extern
fun
emit_tmpdeclst_nonlocal
  (out: FILEref, tds: tmpdeclst): void
//
implement
emit_tmpdeclst_nonlocal
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
        (tmp) => auxlst (out, tds, i)
    | TMPDECsome
        (tmp, _) => let
        val () =
        if i > 0 then
          emit_text (out, ", ")
        // end of [if]
        val () = emit_i0de (out, tmp)
      in
        auxlst (out, tds, i+1)
      end // end of [TMPDECsome]
  ) (* end of [list_cons] *)
)
//
in
//
case+ tds of
| list_nil () => ()
| list_cons _ =>
  {
    val () =
    emit_nspc (out, 4(*ind*))
    val () =
    emit_text (out, "nonlocal ")
    val () = auxlst (out, tds, 0)
    val () = emit_newline (out)
  } (* end of [list_cons] *)
//
end // end of [emit_tmpdeclst_nonlocal]
//
(* ****** ****** *)
//
extern
fun
emit_mbranchlst_initize
  (out: FILEref, inss: instrlst): void
//
implement
emit_mbranchlst_initize
  (out, inss) = let
//
fun auxlst
(
  out: FILEref, inss: instrlst, i: int
) : void =
(
//
case+ inss of
| list_nil () => ()
| list_cons (_, inss) =>
  {
    val () =
      emit_nspc (out, 2(*ind*))
    val () =
    (
      emit_text (out, "mbranch_"); emit_int (out, i); emit_text (out, " = None\n")
    )
    val () = auxlst (out, inss, i+1)
  }
//
) (* end of [auxlst] *)
//
in
  auxlst (out, inss, 1(*i*))
end // end of [emit_mbranchlst_initize]
//
(* ****** ****** *)
//
extern
fun
emit_mbranchlst_nonlocal
  (out: FILEref, inss: instrlst): void
//
implement
emit_mbranchlst_nonlocal
  (out, inss) = let
//
fun auxlst
(
  out: FILEref, inss: instrlst, i: int
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons (_, inss) => let
    val () =
      if i >= 2 then emit_text (out, ", ")
    val () =
    (
      emit_text (out, "mbranch_"); emit_int (out, i)
    )
  in
    auxlst (out, inss, i+1)
  end // end of [list_cons]
//
) (* end of [auxlst] *)
//
in
//
case+ inss of
| list_nil () => ()
| list_cons _ =>
  {
    val () =
    emit_nspc (out, 4(*ind*))
    val () =
    emit_text (out, "nonlocal ")
    val () = auxlst (out, inss, 1(*i*))
    val () = emit_ENDL (out)
  } (* end of [list_cons] *)
//
end // end of [emit_mbranchlst_nonlocal]
//
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

(* ****** ****** *)

implement
funlab_get_index
  (fl0) = let
//
val n0 = fl0.i0de_sym
//
fun
auxlst
(
  xs: instrlst, i: int
) : int = (
//
case+ xs of
| list_nil () => ~1(*error*)
| list_cons (x, xs) =>
  (
    case+ x.instr_node of
    | ATSfunbodyseq _ => let
        val fl = funbodyseq_get_funlab (x)
      in
        if n0 = fl.i0de_sym then i else auxlst (xs, i+1)
      end // end of [ATSfunbodyseq]
    | _ (*non-ATSfunbody*) => auxlst (xs, i)
  ) (* end of [list_cons] *)
//
) (* end of [auxlst] *)
//
in
  auxlst (the_funbodylst_get(), 1)
end // end of [funlab_get_index]

(* ****** ****** *)

implement
tmplab_get_index
  (lab0) = let
//
val n0 = lab0.i0de_sym
//
fun
auxlst
(
  xs: labelist, i: int
) : int =
(
case+ xs of
| list_nil () => ~1(*error*)
| list_cons (x, xs) =>
    if n0 = x.i0de_sym then i else auxlst (xs, i+1)
  // end of [list_cons]
)
//
in
  auxlst (the_branchlablst_get(), 1)
end // end of [tmplab_get_index]

(* ****** ****** *)
//
fun
emit_funlab_index
 (out: FILEref, fl: label): void =
 emit_int (out, funlab_get_index (fl))
//
fun
emit_tmplab_index
 (out: FILEref, lab: label): void =
 emit_int (out, tmplab_get_index (lab))
//
(* ****** ****** *)
  
extern
fun
branchmap_get_index (ins: instr): int
//
implement
branchmap_get_index
  (x0) = let
//
val p0 = $UN.cast2ptr (x0)
//
fun auxlst
(
  xs: instrlst, i: int
) : int =
(
case xs of
| list_nil () => ~1(*error*)
| list_cons (x, xs) =>
    if $UN.cast2ptr(x) = p0 then i else auxlst (xs, i+1)
  // end of [list_cons]
)
//
in
  auxlst (the_caseofseqlst_get (), 1)
end // end of [branchmap_get_index]

(* ****** ****** *)
//
fun
emit_branchmap_index
 (out: FILEref, ins: instr): void =
 emit_int (out, branchmap_get_index (ins))
//
(* ****** ****** *)
//
fun
emit_branchmap
(
  out: FILEref, ins0: instr
) : void = let
//
fun auxlst
(
  out: FILEref, xs: instrlst, i: int
) : int =
(
case+ xs of
| list_nil () => i
| list_cons (x, xs) =>
  (
    case+ x.instr_node of
    | ATSINSlab (lab) => let
        val ((*void*)) =
          if i >= 2 then emit_text (out, ", ")
        // end of [val]
        val () = emit_int (out, i)
        val () = emit_text (out, ": ")
        val () = emit_label (out, lab)
      in
        auxlst (out, xs, i+1)
      end // end of [ATSINSlab]
    | _(*non-ATSINSlab*) => auxlst (out, xs, i)
  )
) (* end of [auxlst] *)
//
fun auxlst2
(
  out: FILEref, xs: instrlst, i: int
) : void =
(
case+ xs of
| list_nil () => ()
| list_cons (x, xs) => let
    val-ATSbranchseq(inss) = x.instr_node
  in
    auxlst2 (out, xs, auxlst (out, inss, i))
  end // end of [list_cons]
) (* end of [auxlst2] *)
//
val-ATScaseofseq(inss) = ins0.instr_node
//
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "mbranch_")
val () = emit_branchmap_index (out, ins0)
val () = emit_text (out, " = ")
val ((*opening*)) = emit_text (out, "{ ")
val () = auxlst2 (out, inss, 1(*first*))
val ((*closing*)) = emit_text (out, " }\n")
//
in
  // nothing
end // end of [emit_branchmap]
//
(* ****** ****** *)

fun
emit_branchmaplst
(
  out: FILEref, inss: instrlst
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons (ins, inss) =>
  {
    val () = emit_branchmap (out, ins)
    val () = emit_branchmaplst (out, inss)
  }
) (* end of [emit_branchmaplst] *)

(* ****** ****** *)
//
extern
fun
f0body_collect_caseof
  (fbody: f0body): instrlst(*list-of-caseofseq*)
//
extern
fun
instrlst_collect_caseof
  (inss: instrlst): instrlst(*list-of-caseofseq*)
//
(* ****** ****** *)
//
implement
f0body_collect_caseof
  (fbody) = let
in
//
case+
fbody.f0body_node of
| F0BODY (tds, inss) => instrlst_collect_caseof (inss)
//
end // end of [f0body_collect_caseof]
//
implement
instrlst_collect_caseof
  (inss) = let
//
vtypedef res = instrlst_vt
//
fun
aux
(
  ins: instr, res: res
) : res =
(
case+
ins.instr_node of
//
| ATScaseofseq
    (inss) => (
    auxlst (inss, cons_vt (ins, res))
  ) (* end of [ATScaseofseq] *)
| ATSbranchseq (inss) => auxlst (inss, res)
| ATSfunbodyseq (inss) => auxlst (inss, res)
| _ (*rest-of-instr*) => res
//
) (* end of [aux] *)
//
and
auxlst
(
  inss: instrlst, res: res
) : res =
(
case+ inss of
| list_cons
    (ins, inss) => let
    val res = aux (ins, res) in auxlst (inss, res)
  end // end of [list_cons]
| list_nil ((*void*)) => res
)
//
val res = auxlst (inss, list_vt_nil)
//
in
  list_vt2t(list_vt_reverse(res))
end // end of [instrlst_collect_caseof]
//
(* ****** ****** *)
//
extern
fun emit2_instr
  (out: FILEref, ind: int, ins: instr) : void
extern
fun emit2_instr_ln
  (out: FILEref, ind: int, ins: instr) : void
extern
fun emit2_instrlst
  (out: FILEref, ind: int, inss: instrlst) : void
//
(* ****** ****** *)
//
extern
fun emit2_ATSfunbodyseq
  (out: FILEref, ind: int, ins: instr) : void
extern
fun emit2_ATSINSmove_boxrec
  (out: FILEref, ind: int, ins: instr) : void
//
(* ****** ****** *)
//
// HX-2014-08:
// this one should not be used for
// emitting multiple-line instructions
//
implement
emit_instr
  (out, ins) = emit2_instr (out, 0(*ind*), ins)
//
(* ****** ****** *)
//
implement
emit2_instr
  (out, ind, ins0) = let
in
//
case+
ins0.instr_node of
//
| ATSif
  (
    d0e, inss, inssopt
  ) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "if ")
    val () = emit_LPAREN (out)
    val () = emit_d0exp (out, d0e)
    val () = emit_RPAREN (out)
    val () = emit_text (out, ":\n")
    val () = emit2_instrlst (out, ind+2, inss)
    val () =
    (
      case+ inssopt of
      | Some(inss) =>
        {
          val () = emit_nspc (out, ind)
          val () = emit_text (out, "else:\n")
          val () = emit2_instrlst (out, ind+2, inss)
        }
      | None((*void*)) => ()
    )
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#endif")
  } (* end of [ATSif] *)
//
| ATSifthen (d0e, inss) =>
  {
//
    val-list_cons (ins, _) = inss
//
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "if (")
    val () = emit_d0exp (out, d0e)
    val ((*closing*)) = emit_text (out, "): ")
    val ((*void*)) = emit_instr (out, ins)
  }
| ATSifnthen (d0e, inss) =>
  {
//
    val-list_cons (ins, _) = inss
//
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "if not(")
    val () = emit_d0exp (out, d0e)
    val ((*closing*)) = emit_text (out, "): ")
    val ((*void*)) = emit_instr (out, ins)
  }
//
| ATScaseofseq (inss) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#ATScaseof_beg")
    val () = emit_ENDL (out)
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "tmplab_py = 1\n")
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "while (1):\n")
    val () = emit_nspc (out, ind+2)
    val () = emit_text (out, "mbranch_")
    val () = emit_branchmap_index (out, ins0)
    val () = emit_text (out, ".get(tmplab_py)()\n")
    val () = emit_nspc (out, ind+2)
    val () = emit_text (out, "if (tmplab_py == 0): break\n")
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#ATScaseof_end")
  }
//
| ATSbranchseq (inss) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#ATSbranch")
  }
//
| ATSreturn (tmp) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "return ")
    val () = emit_i0de (out, tmp)
  }
| ATSreturn_void (tmp) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "return#_void")
  }
//
| ATSINSlab (lab) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#")
    val () = emit_label (out, lab)
  }
| ATSINSgoto (lab) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "tmplab_py = ")
    val () = emit_tmplab_index (out, lab)
    val () =
    (
      emit_SPACE (out);
      emit_text (out, "; return");
      emit_SHARP (out); emit_label (out, lab)
    ) (* end of [val] *)
  }
//
| ATSINSflab (flab) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_SHARP (out)
    val () = emit_label (out, flab)
  }
| ATSINSfgoto (flab) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "funlab_py = ")
    val () = emit_funlab_index (out, flab)
    val () =
    (
      emit_SPACE (out); emit_SHARP (out); emit_label (out, flab)
    ) (* end of [val] *)
  }
//
| ATSINSmove (tmp, d0e) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_i0de (out, tmp)
    val () = emit_text (out, " = ")
    val () = emit_d0exp (out, d0e)
  } (* end of [ATSINSmove] *)
//
| ATSINSmove_boxrec _ =>
    emit2_ATSINSmove_boxrec (out, ind, ins0)
//
| ATStailcalseq (inss) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#tailcal_beg")
    val () = emit_ENDL (out)
    val () = emit2_instrlst (out, ind, inss)
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#tailcal_end")
  
  } (* end of [ATStailcalseq] *)
//
| ATSINSmove_tlcal (tmp, d0e) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_i0de (out, tmp)
    val () = emit_text (out, " = ")
    val () = emit_d0exp (out, d0e)  
  } (* end of [ATSINSmove_tlcal] *)
//
| ATSINSargmove_tlcal (tmp1, tmp2) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_i0de (out, tmp1)
    val () = emit_text (out, " = ")
    val () = emit_i0de (out, tmp2)
  } (* end of [ATSINSargmove_tlcal] *)
//
| ATSdynload0 (tmp) =>
  {
    val () = emit_nspc (out, ind)   
    val () = emit_text (out, "ATSdynload0")
    val () = emit_LPAREN (out)
    val () = emit_i0de (out, tmp)
    val () = emit_RPAREN (out)
  }
//
| ATSdynload1 (tmp) =>
  {
    val () = emit_nspc (out, ind)   
    val () = emit_text (out, "ATSdynload1")
    val () = emit_LPAREN (out)
    val () = emit_i0de (out, tmp)
    val () = emit_RPAREN (out)
  }
| ATSdynloadset (tmp) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "ATSdynloadset")
    val () = emit_LPAREN (out)
    val () = emit_i0de (out, tmp)
    val () = emit_RPAREN (out)
  }
//
| _ (*yet-to-be-done*) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "**INSTR**")
  }
//
end // end of [emit2_instr]

(* ****** ****** *)

implement
emit2_instr_ln
  (out, ind, ins) =
(
  emit2_instr (out, ind, ins); emit_newline (out)
) (* end of [emit2_instr_ln] *)

(* ****** ****** *)

implement
emit2_instrlst
(
  out, ind, inss
) = (
//
case+ inss of
| list_nil () => ()
| list_cons (ins, inss) =>
  {
    val () = emit2_instr (out, ind, ins)
    val () = emit_ENDL (out)
    val () = emit2_instrlst (out, ind, inss)
  }
//
) (* end of [emit2_instrlst] *)

(* ****** ****** *)

implement
emit2_ATSfunbodyseq
  (out, ind, ins) = let
//
val-ATSfunbodyseq (inss) = ins.instr_node
//
in
  emit2_instrlst (out, ind, inss)
end // end of [emit2_ATS2funbodyseq]

(* ****** ****** *)

implement
emit2_ATSINSmove_boxrec
  (out, ind, ins0) = let
//
fun
getarglst
(
  inss: instrlst
) : d0explst =
(
case+ inss of
| list_nil () => list_nil ()
| list_cons (ins, inss) => let
    val-ATSINSstore_boxrec_ofs (_, _, _, d0e) = ins.instr_node
    val d0es = getarglst (inss)
  in
    list_cons (d0e, d0es)
  end // end of [list_cons]
)
//
val-ATSINSmove_boxrec (inss) = ins0.instr_node
//
val-list_cons (ins, inss) = inss
val-ATSINSmove_boxrec_new (tmp, _) = ins.instr_node  
//
val d0es = getarglst (inss)
//
val () = emit_nspc (out, ind)
val () = emit_i0de (out, tmp)
val () = emit_text (out, " = ")
val () = emit_LPAREN (out)
val () = emit_d0explst (out, d0es)
val () = emit_RPAREN (out)
//
in
  // nothing
end // end of [emit2_ATSINSmove_boxrec]

(* ****** ****** *)
//
extern
fun emit2_tmpdec
  (out: FILEref, ind: int, td: tmpdec) : void
extern
fun emit2_tmpdeclst
  (out: FILEref, ind: int, tds: tmpdeclst) : void
//
(* ****** ****** *)

implement
emit_tmpdec
  (out, td) = emit2_tmpdec (out, 0(*ind*), td)
//
implement
emit2_tmpdec
  (out, ind, td) = let
in
//
case+
td.tmpdec_node of
//
| TMPDECnone (id) =>
  {
    val () = emit_nspc (out, ind)
    val () = (emit_SHARP (out); emit_i0de (out, id))
  }
| TMPDECsome (id, s0e) =>
  {
    val () = emit_nspc (out, ind)
    val () = (emit_i0de (out, id); emit_text (out, " = None"))
  }
end // end of [emit2_tmpdec]
//
(* ****** ****** *)

implement
emit2_tmpdeclst
(
  out, ind, tds
) = (
//
case+ tds of
| list_nil () => ()
| list_cons (td, tds) =>
  {
    val () = emit2_tmpdec (out, ind, td)
    val () = emit_ENDL (out)
    val () = emit2_tmpdeclst (out, ind, tds)
  }
//
) (* end of [emit2_tmpdeclst] *)

(* ****** ****** *)
//
extern
fun
emit_branchseq
  (out: FILEref, ins0: instr): void
extern
fun
emit_branchseqlst
  (out: FILEref, inss: instrlst): void
//
extern
fun
emit_fundef_nonlocal (out: FILEref): void
//
(* ****** ****** *)

local

fun auxlst
(
  out: FILEref, inss: instrlst
) : void = let
//
val-list_cons (ins, inss) = inss
val-ATSINSlab (lab) = ins.instr_node
//
val () = emit_nspc (out, 2)
val () = emit_text (out, "def")
val () = emit_SPACE (out)
val () = emit_label (out, lab)
val () = emit_text (out, "():\n")
//
val () = emit_fundef_nonlocal (out)
//
val () = emit_nspc (out, 4)
val () = emit_text (out, "tmplab_py = 0\n")
//
in
  auxlst2 (out, lab, inss)
end (* end of [auxlst] *)

and auxlst2
(
  out: FILEref, lab: label, inss: instrlst
) : void = let
in
//
case+ inss of
//
| list_nil ((*none*)) =>
  {
    val () = emit_nspc (out, 4)
    val () = emit_text (out, "return\n")  
  } (* end of [list_nil] *)
//
| list_cons
    (ins1, inss2) =>
  (
    case ins1.instr_node of
    | ATSINSlab (lab) =>
      {
        val () = emit_nspc (out, 4)
        val () = emit_label (out, lab)
        val () = emit_text (out, "()\n")
        val () = emit_nspc (out, 4)
        val () = emit_text (out, "return\n")
        val () = auxlst (out, inss)
      }
    | _ (*non-ATSINSlab*) =>
      {
        val () = (
          emit2_instr (out, 4, ins1); emit_ENDL (out)
        ) (* end of [val] *)
        val () = auxlst2 (out, lab, inss2)
      } (* end of [non-ATSINSlab] *)
  ) (* end of [list_cons] *)
//
end // (* end of [auxlst2] *)

in (* in-of-local *)

implement
emit_branchseq
  (out, ins0) = let
//
val-ATSbranchseq (inss) = ins0.instr_node
//
in
  auxlst (out, inss)
end // end of [emit_branchseq]

end // end of [local]

(* ****** ****** *)

fun
emit_branchseqlst
(
  out: FILEref, inss: instrlst
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons (ins, inss) =>
  {
    val () = emit_branchseq (out, ins)
    val () = emit_branchseqlst (out, inss)
  }
) (* end of [emit_branchseqlst] *)

(* ****** ****** *)

implement
emit_fundef_nonlocal
  (out) = () where
{
//
val f0as = the_f0arglst_get ()
val () = emit_f0arglst_nonlocal (out, f0as)
//
val tmpdecs = the_tmpdeclst_get ()
val () = emit_tmpdeclst_nonlocal (out, tmpdecs)
//
val () =
emit_nspc (out, 4(*ind*))
val () =
emit_text (out, "nonlocal funlab_py, tmplab_py\n")
//
val inss_caseof = the_caseofseqlst_get ()
val () = emit_mbranchlst_nonlocal (out, inss_caseof)
//
} // end of [emit_fundef_nonlocal]

(* ****** ****** *)
//
extern
fun
emit_caseofseq
  (out: FILEref, ins0: instr): void
extern
fun
emit_caseofseqlst
  (out: FILEref, inss: instrlst): void
//
(* ****** ****** *)

fun
emit_caseofseq
(
  out: FILEref, ins0: instr
) : void = let
//
val-ATScaseofseq(inss) = ins0.instr_node
//
val labs = caseofseq_get_tmplablst (ins0)
val ((*update*)) = the_branchlablst_set (labs)
//
in
  emit_branchseqlst (out, inss)
end // end of [emit_caseofseq]

(* ****** ****** *)

fun
emit_caseofseqlst
(
  out: FILEref, inss: instrlst
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons (ins, inss) =>
  {
    val () = emit_caseofseq (out, ins)
    val () = emit_caseofseqlst (out, inss)
  }
) (* end of [emit_caseofseqlst] *)

(* ****** ****** *)
//
extern
fun emit_f0arg : emit_type (f0arg)
extern
fun emit_f0marg : emit_type (f0marg)
extern
fun emit_f0head : emit_type (f0head)
//
extern
fun emit_f0body : emit_type (f0body)
extern
fun emit_f0body_0 : emit_type (f0body)
extern
fun emit_f0body_tlcal : emit_type (f0body)
extern
fun emit_f0body_tlcal2 : emit_type (f0body)
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
| F0ARGnone _ => emit_text (out, "__NONE__")
| F0ARGsome (id, s0e) => emit_i0de (out, id)
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
    (id, f0ma, res) =>
  {
    val () = emit_i0de (out, id)
    val () = emit_LPAREN (out)
    val () = emit_f0marg (out, f0ma)
    val () = emit_RPAREN (out)
    val () = emit_text (out, ":")
  }
//
end // end of [emit_f0head]

(* ****** ****** *)

implement
emit_f0body
  (out, fbody) = let
//
val knd = f0body_classify (fbody)
(*
val () = println! ("emit_f0body: knd = ", knd)
*)
//
val tmpdecs =
  f0body_get_tmpdeclst (fbody)
val inss_body =
  f0body_get_bdinstrlst (fbody)
val inss_caseof =
  f0body_collect_caseof (fbody)
//
val () = the_tmpdeclst_set (tmpdecs)
val () = the_funbodylst_set (inss_body)
val () = the_caseofseqlst_set (inss_caseof)
//
val () = emit_tmpdeclst_initize (out, tmpdecs)
//
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "funlab_py = None\n")
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "tmplab_py = None\n")
//
val () = emit_mbranchlst_initize (out, inss_caseof)
//
val () = emit_caseofseqlst (out, inss_caseof)
val () = emit_branchmaplst (out, inss_caseof)
//
in
//
case+ knd of
| 1 => emit_f0body_tlcal (out, fbody)
| 2 => emit_f0body_tlcal2 (out, fbody)
| _ (*0*) => emit_f0body_0 (out, fbody)
//
end // end of [emit_f0body]

(* ****** ****** *)

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
    val () = emit2_ATSfunbodyseq (out, 2(*ind*), ins0)
    val () = emit2_instr_ln (out, 2(*ind*), ins1)
  in
    auxlst (out, inss2)
  end // end of [list_cons]
//
) (* end of [auxlst] *)
//
in
//
case+
fbody.f0body_node of
//
| F0BODY (tds, inss) => auxlst (out, inss)
//
end // end of [emit_f0body_0]

(* ****** ****** *)

implement
emit_f0body_tlcal
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
    val () = emit2_ATSfunbodyseq (out, 4(*ind*), ins0)
    val () = emit_nspc (out, 4(*ind*))
    val () = emit_text (out, "if (funlab_py == 0): break\n")
    val () = emit2_instr_ln (out, 2(*ind*), ins1)
  in
    auxlst (out, inss2)
  end // end of [list_cons]
//
) (* end of [auxlst] *)
//
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "while (1):\n")
val () = emit_nspc (out, 4(*ind*))
val () = emit_text (out, "funlab_py = 0\n")
//
val () =
(
case+
fbody.f0body_node of
//
| F0BODY (tds, inss) => auxlst (out, inss)
//
)
//
in
  // nothing
end // end of [emit_f0body_tlcal]

(* ****** ****** *)
//
extern
fun
emit_mfundef_initize
  (out: FILEref, inss: instrlst): void
//
implement
emit_mfundef_initize
  (out, inss) = let
//
fun auxlst
(
  out: FILEref, xs: instrlst, i: int
) : void =
(
case+ xs of
| list_nil () => ()
| list_cons (x, xs) => let
    val fl =
      funbodyseq_get_funlab (x)
    val () =
    if i >= 2
      then emit_text (out, ", ")
    // end of [if]
    val () = emit_int (out, i)
    val () = emit_text (out, ": ")
    val () = emit_label (out, fl)
    val-list_cons (_, xs) = xs
  in
    auxlst (out, xs, i+1)
  end // end of [list_cons]
)
//
val () =
emit_nspc (out, 2(*ind*))
val () =
emit_text (out, "mfundef = { ")
val () = auxlst (out, inss, 1)
val () = emit_text (out, " }\n")
//
in
  // nothing
end // end of [emit_mfundef_initize]
//
(* ****** ****** *)
//
extern
fun
emit_the_funbodylst (out: FILEref): void
//
implement
emit_the_funbodylst
  (out) = let
//
fun auxfun
(
  out: FILEref, ins0: instr
) : void = let
//
val-ATSfunbodyseq(inss) = ins0.instr_node
//
val-list_cons (ins1, inss) = inss
val-ATSINSflab (fl) = ins1.instr_node
//
val () = emit_nspc (out, 2)
val () = emit_text (out, "def")
val () = emit_SPACE (out)
val () = emit_label (out, fl)
val () = emit_text (out, "():\n")
//
val () = emit_fundef_nonlocal (out)
//
val () = emit_nspc (out, 4)
val () = emit_text (out, "funlab_py = 0\n")
val () = emit2_instrlst (out, 4(*ind*), inss)
//
in
  // nothing
end // end of [auxfun]
//
fun auxlst
(
  out: FILEref, inss: instrlst
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons _ => let
    val-list_cons (ins0, inss) = inss
    val-list_cons (ins1, inss) = inss
    val () = auxfun (out, ins0)
    val () = emit2_instr_ln (out, 4(*ind*), ins1)
  in
    auxlst (out, inss)
  end // end of [auxlst]
) (* end of [auxlst] *)
//
val inss_body = the_funbodylst_get()
val () = auxlst (out, inss_body)
val () = emit_mfundef_initize (out, inss_body)
//
in
  // nothing
end // end of [emit_the_funbodylst]
//
(* ****** ****** *)

implement
emit_f0body_tlcal2
  (out, fbody) = let
//
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "tmpret_py = None\n")
//
val () = emit_the_funbodylst (out)
//
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "funlab_py = 1\n")
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "while (1):\n")
val () = emit_nspc (out, 4(*ind*))
val () = emit_text (out, "tmpret_py = mfundef.get(funlab_py)()\n")
val () = emit_nspc (out, 4(*ind*))
val () = emit_text (out, "if (funlab_py == 0): break\n")
val () = emit_nspc (out, 2(*ind*))
val () = emit_text (out, "return tmpret_py\n")
//
in
  // nothing
end // end of [emit_f0body_tlcal2]

(* ****** ****** *)

implement
emit_f0decl
  (out, fdec) = let
in
//
case+
fdec.f0decl_node of
| F0DECLnone (fhd) => () 
| F0DECLsome (fhd, fbody) =>
  {
    val () = emit_text (out, "def")
    val () = emit_SPACE (out)
    val () = emit_f0head (out, fhd)
    val () = emit_newline (out)
    val () = emit_f0body (out, fbody)
    val () = emit_newline (out)
  } (* end of [F0DECLsome] *)
//
end // end of [emit_f0decl]

(* ****** ****** *)

implement
emit_toplevel
  (out, d0cs) = let
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
in
  loop (out, d0cs)
end // end of [emit_toplevel]

(* ****** ****** *)

(* end of [atsparemit_emit_python.dats] *)
