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
emit_flush (out) = fileref_flush (out)

(* ****** ****** *)
//
implement
emit_text
  (out, x) = fprint_string (out, x)
//
(* ****** ****** *)
//
implement
emit_symbol (out, x) =
  fprint_string (out, symbol_get_name (x))
//
(* ****** ****** *)

implement
emit_i0nt
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_i0nt]

(* ****** ****** *)

implement
emit_s0tring
  (out, tok) = let
//
val-T_STRING(rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_s0tring]

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
| ATSPMVint (tok) => emit_i0nt (out, tok)
//
| ATSPMVstring (tok) => emit_s0tring (out, tok)
//
| ATSPMVi0nt (tok) => emit_i0nt (out, tok)
//
| ATSPMVf0loat (tok) => emit_text (out, "ATSPMVf0loat(...)")
//
| ATSSELcon _ => emit_text (out, "ATSSELcon(...)")
| ATSSELrecsin _ => emit_text (out, "ATSSELrecsin(...)")
| ATSSELboxrec _ => emit_text (out, "ATSSELboxrec(...)")
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
| D0Ctypedef _ => ()
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
fun emit_indent
  (out: FILEref, ind: int): void
//
implement
emit_indent
  (out, ind) =
(
//
if ind > 0 then
  (emit_text (out, " "); emit_indent (out, ind-1))
//
) (* end of [emit_indent] *)
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
implement
emit_instr
  (out, ins) = emit2_instr (out, 0(*ind*), ins)
//
implement
emit2_instr
  (out, ind, ins) = let
//
val () = emit_indent (out, ind)
//
in
//
case+
ins.instr_node of
//
| ATSif (d0e, inss, inssopt) =>
  {
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
          val () = emit_indent (out, ind)
          val () = emit_text (out, "else:\n")
          val () = emit2_instrlst (out, ind+2, inss)
        }
      | None((*void*)) => ()
    )
    val () = emit_indent (out, ind)
    val () = emit_text (out, "#endif")
  } (* end of [ATSif] *)
//
| ATSreturn (tmp) =>
  {
    val () = emit_text (out, "return")
    val () = emit_LPAREN (out)
    val () = emit_i0de (out, tmp)
    val () = emit_RPAREN (out)
  }
//
| ATSINSflab (lab) =>
  {
    val () = emit_text (out, "#")
    val () = emit_label (out, lab)
  }
//
| ATSINSmove (tmp, d0e) =>
  {
    val () = emit_i0de (out, tmp)
    val () = emit_text (out, " = ")
    val () = emit_d0exp (out, d0e)
  } (* end of [ATSINSmove] *)
//
| _ (*yet-to-be-done*) => emit_text (out, "**INSTR**")
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
| F0BODY (tmpdecs, inss) => emit2_instrlst (out, 2(*ind*), inss)
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
    val () = emit_text (out, "def")
    val ((*void*)) = emit_SPACE (out)
    val () = emit_f0head (out, fhd)
    val ((*void*)) = emit_EOL (out)
    val () = emit_f0body (out, fbody)
    val ((*void*)) = emit_flush (out)
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
