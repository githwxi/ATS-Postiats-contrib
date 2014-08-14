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
staload "./atsparemit.sats"
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
emit_EOL (out) = emit_text (out, "\n")

(* ****** ****** *)

implement
emit_SPACE (out) = emit_text (out, " ")

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
| ATSSELcon _ => emit_text (out, "ATSSELcon(...)")
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
fun emit2_instr
  (out: FILEref, ind: int, ins: instr) : void
extern
fun emit2_instrlst
  (out: FILEref, ind: int, inss: instrlst) : void
//
(* ****** ****** *)
//
extern
fun emit2_INSmove_boxrec
  (out: FILEref, ind: int, ins: instr) : void
//
(* ****** ****** *)
//
implement
emit_instr
  (out, ins) = emit2_instr (out, 0(*ind*), ins)
//
implement
emit2_instr
  (out, ind, ins) = let
in
//
case+
ins.instr_node of
//
| ATSif
  (
    d0e, inss, inssopt
  ) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "if")
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
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "if")
    val () = emit_LPAREN (out)
    val () = emit_d0exp (out, d0e)
    val () = emit_RPAREN (out)
    val () = emit_text (out, ":\n")
    val () = emit2_instrlst (out, ind+2, inss)
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#endif")
  }
| ATSifnthen (d0e, inss) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "if not")
    val () = emit_LPAREN (out)
    val () = emit_d0exp (out, d0e)
    val () = emit_RPAREN (out)
    val () = emit_text (out, ":\n")
    val () = emit2_instrlst (out, ind+2, inss)
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#endif")
  }
//
| ATScaseofseq (inss) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#caseofbeg")
    val () = emit_EOL (out)
    val () = emit2_instrlst (out, ind, inss)
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#caseofend")
  }
//
| ATSbranchseq (inss) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#branchbeg")
    val () = emit_EOL (out)
    val () = emit2_instrlst (out, ind, inss)
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#branchend")
  }
//
| ATSreturn (tmp) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "return")
    val () = emit_LPAREN (out)
    val () = emit_i0de (out, tmp)
    val () = emit_RPAREN (out)
  }
| ATSreturn_void (tmp) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "return")
  }
//
| ATSINSlab (lab) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#")
    val () = emit_label (out, lab)
  }
//
| ATSINSflab (lab) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#")
    val () = emit_label (out, lab)
  }
| ATSINSfgoto (flab) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#")
    val () = emit_label (out, flab)
    val () = emit_text (out, "\n")
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "continue")
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
    emit2_INSmove_boxrec (out, ind, ins)
//
| ATStailcalseq (inss) =>
  {
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#tailcalbeg")
    val () = emit_EOL (out)
    val () = emit2_instrlst (out, ind, inss)
    val () = emit_nspc (out, ind)
    val () = emit_text (out, "#tailcalend")
  
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
    val () = emit_EOL (out)
    val () = emit2_instrlst (out, ind, inss)
  }
//
) (* end of [emit2_instrlst] *)

(* ****** ****** *)

implement
emit2_INSmove_boxrec
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
end // end of [emit2_INSmove_boxrec]

(* ****** ****** *)
//
extern
fun emit_f0arg : emit_type (f0arg)
extern
fun emit_f0marg : emit_type (f0marg)
extern
fun emit_f0head : emit_type (f0head)
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
in
//
case+
fhd.f0head_node of
| F0HEAD
    (id, args, res) =>
  {
    val () = emit_i0de (out, id)
    val () = emit_LPAREN (out)
    val () = emit_f0marg (out, args)
    val () = emit_RPAREN (out)
    val () = emit_text (out, ":")
  }
//
end // end of [emit_f0head]

(* ****** ****** *)

implement
emit_f0body
  (out, fbody) = let
in
//
case+
fbody.f0body_node of
//
| F0BODY (tmpdecs, inss) =>
  {
    val () = emit_nspc (out, 2)
    val () = emit_text (out, "while(1):\n")
    val () = emit2_instrlst (out, 4(*ind*), inss)
    val () = emit_nspc (out, 2)
    val () = emit_text (out, "#endwhile\n")
  }
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
| F0DECLnone (fhd) => () 
| F0DECLsome (fhd, fbody) =>
  {
    val () =
    emit_text (out, "def ")
    val () = emit_f0head (out, fhd)
    val () = emit_EOL (out)
    val () = emit_f0body (out, fbody)
    val () = emit_EOL (out)
    val () = emit_flush (out)
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
