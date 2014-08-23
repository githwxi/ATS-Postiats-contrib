(* ****** ****** *)
//
// ATS-parse-emit-js
//
(* ****** ****** *)
//
// HX-2014-08-20: start
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
staload "./atsparemit_typedef.dats"
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
//
implement
emit_PMVintrep
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVintrep]
//
(* ****** ****** *)

implement
emit_PMVbool
  (out, tfv) =
(
  emit_text (out, if tfv then "true" else "false")
) (* end of [emit_PMVbool] *)

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

implement
emit_d0exp
  (out, d0e0) = let
in
//
case+
d0e0.d0exp_node of
//
| D0Eide (id) => 
  {
    val () = emit_i0de (out, id)
  }
//
| D0Eappid (id, d0es) =>
  {
    val () = emit_i0de (out, id)
    val () = emit_LPAREN (out)
    val () = emit_d0explst (out, d0es)
    val () = emit_RPAREN (out)
  }
//
| ATSPMVint (int) => emit_PMVint (out, int)
| ATSPMVintrep (int) => emit_PMVintrep (out, int)
//
| ATSPMVbool (tfv) => emit_PMVbool (out, tfv)
//
| ATSPMVi0nt (int) => emit_PMVi0nt (out, int)
//
| ATSSELcon _ => emit_SELcon (out, d0e0)
//
| ATSSELrecsin _ => emit_text (out, "ATSSELrecsin(...)")
//
| ATSSELboxrec _ => emit_SELboxrec (out, d0e0)
//
| ATSSELfltrec _ => emit_text (out, "ATSSELfltrec(...)")
//
| _ (*rest-of-d0exp*) => fprint (out, d0e0)
//
end // end of [emit_d0exp]

(* ****** ****** *)

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
      if i > 0 then emit_text (out, ", ")
    // end of [val]
  in
    emit_d0exp (out, d0e); loop (out, d0es, i+1)
  end // end of [list_cons]
)

in (* in-of-local *)

implement
emit_d0explst (out, d0es) = loop (out, d0es, 0)
implement
emit_d0explst_1 (out, d0es) = loop (out, d0es, 1)

end // end of [local]

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

#define
ATSEXTCODE_BEG "/* ATSextcode_beg() */"
#define
ATSEXTCODE_END "/* ATSextcode_end() */\n"

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
    typedef_insert (id.i0de_sym, def)
  // end of [D0Ctypedef]
//
| D0Cdyncst_mac _ => ()
| D0Cdyncst_extfun _ => ()
//
| D0Cfundecl
    (fk, f0d) => emit_f0decl (out, f0d)
//
| D0Cextcode (toks) =>
  {
    val () = emit_text (out, ATSEXTCODE_BEG)
    val () = emit_extcode (out, toks)
    val () = emit_text (out, ATSEXTCODE_END)
  }
//
| D0Cclosurerize
  (
    fl, env, arg, res
  ) => emit_closurerize (out, fl, env, arg, res)
//
end // end of [emit_d0ecl]

(* ****** ****** *)
//
implement
emit_COMMENT_line (out) =
  emit_text (out, "// COMMENT_line\n")
//
implement
emit_COMMENT_block (out) = ((*ignored*))
//
(* ****** ****** *)

implement
emit_closurerize
(
  out, fl, env, arg, res
) =
(
//
emit_text (out, "emit_closurerize(...)")
//
) // end of [emit_closurerize]

(* ****** ****** *)

(* end of [atsparemit_emit_js.dats] *)
