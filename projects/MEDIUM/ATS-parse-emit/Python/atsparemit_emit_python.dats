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
emit_LPAREN (out) = emit_text (out, "(")
implement
emit_RPAREN (out) = emit_text (out, ")")

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
    val () = if i > 0 then emit_text (out, ", ")
  in
    emit_d0exp (out, d0e); emit_d0explst (out, d0es)
  end // end of [list_cons]
)
//
in
  loop (out, d0es, 0)
end // end of [emit_d0explst]

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
| ATSINSmove (tmp, d0e) =>
  {
    val () = emit_i0de (out, tmp)
    val () = emit_text (out, " = ")
    val () = emit_d0exp (out, d0e)
  }
//
| _ (*yet-to-be-done*) => ()
//
end // end of [emit2_instr]

(* ****** ****** *)

(* end of [atsparemit_emit_python.dats] *)
