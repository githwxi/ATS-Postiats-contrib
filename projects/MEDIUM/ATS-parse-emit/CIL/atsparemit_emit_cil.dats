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
staload
STRING = "libc/SATS/string.sats"
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
//
#define
ATS_CLO_MTH "Execute"
#define
CLOSURE_TYPE "__closure_type"
//
(* ****** ****** *)
//
extern
fun
the_module_name_set : string -> void
//
extern
fun
the_module_name_get (): string
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
emit_DOT (out) = emit_text (out, ".")

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
emit_PMVintrep
  (out, tok) = let
//
val-T_INT(base, rep) = tok.token_node
//
in
  emit_text (out, rep)
end // end of [emit_PMVintrep]

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
extern
fun emit_ATSPMVfunlab : emit_type (label)
//
extern
fun emit_ATSPMVcfunlab
(
  out: FILEref,
  knd: int,
  fnlab: label,
  d0es: d0explst
) : void
//
extern
fun
emit_ATSfunclo
(
  out: FILEref,
  d0e: d0exp,
  d0es: d0explst,
  arg: s0exp,
  res: s0exp,
  clo: bool
): void
//
fun s0exp_is_void (s: s0exp): bool =
  case+ s.s0exp_node of
  | S0Eide(sym) => symbol_get_name(sym) = "atstype_void" || symbol_get_name(sym) = "atsvoid_t0ype"
  | _ => false
// end of [s0exp_is_void]
//
implement
  emit_ATSCKpat_con0
    (out, d0e, tag) =
{
  val () = emit_d0exp (out, d0e)
  val () = emit_ENDL (out)
  val () = emit_text (out, "ldc.i4")
  val () = emit_SPACE (out)
  val () = emit_int (out, tag)
  val () = emit_ENDL (out)
  val () = emit_text (out, "call ATSCKpat_con0")
} (* end of [emit_ATSCKpat_con0] *)

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
fun
env_get_s0exp
(
  fnlab: i0de,
  env: symbol
) : s0exp
//
extern
fun
emit_s0exp : emit_type (s0exp)
extern
fun
emit_s0explst : emit_type (s0explst)
//
extern
fun emit_tmpvar_ld (out: FILEref, tmp: i0de): void
//
extern
fun emit_tmpvar_st (out: FILEref, tmp: i0de): void
//
implement
  emit_tmpvar_ld (out, tmp) =
(
//
case+ 0 of
//
| _ when strstr(g1ofg0(symbol_get_name(tmp.i0de_sym)), "__dynloadflag") >= 0 =>
  {
    val () = emit_text (out, "ldsfld int32 ")
    val () = emit_text (out, the_clsname_get ())
    val () = emit_i0de (out, tmp)
  }
//
| _ when tmpvar_is_sta (tmp.i0de_sym) =>
{
  val () = emit_text (out, "ldsfld")
  val-~Some_vt(s0e) = statmps0exp_search_opt (tmp.i0de_sym)
  val () = emit_SPACE (out)
  val () = emit_s0exp (out, s0e)
  val () = emit_SPACE (out)
  val () = emit_text (out, the_clsname_get ())
  val () = emit_i0de (out, tmp)
}
//
| _ when tmpvar_is_arg (tmp.i0de_sym) || tmpvar_is_env (tmp.i0de_sym) =>
{
  val () = emit_text (out, "ldarg")
  val () = emit_SPACE (out)
  val () = emit_i0de (out, tmp)
}
//
| _ (*otherwise*) =>
{
  val () =  emit_text (out, "ldloc")
  val () = emit_SPACE (out)
  val () = emit_i0de (out, tmp)
}
//
) (* end of [emit_tmpvar_ld] *)
//
implement
  emit_tmpvar_st
    (out, tmp) =
(
//
case+ 0 of
//
| _ when strstr(g1ofg0(symbol_get_name(tmp.i0de_sym)), "__dynloadflag") >= 0 =>
//
{
  val () = emit_text (out, "stsfld int32 ")
  val () = emit_text (out, the_clsname_get ())
  val () = emit_i0de (out, tmp)
}
//
| _ when tmpvar_is_sta (tmp.i0de_sym) =>
//
{
  val () = emit_text (out, "stsfld")
  val-~Some_vt(s0e) = statmps0exp_search_opt (tmp.i0de_sym)
  val () = emit_SPACE (out)
  val () = emit_s0exp (out, s0e)
  val () = emit_SPACE (out)
  val () = emit_text (out, the_clsname_get ())
  val () = emit_i0de (out, tmp)
}
//
| _ when tmpvar_is_arg (tmp.i0de_sym) || tmpvar_is_env (tmp.i0de_sym) =>
//
{
  val () = emit_text (out, "starg")
  val () = emit_SPACE (out)
  val () = emit_i0de (out, tmp)
}
//
| _(*otherwise*) =>
//
{
  val () = emit_text (out, "stloc")
  val () = emit_SPACE (out)
  val () = emit_i0de (out, tmp)
}
//
) (* end of [emit_tmpvar_st] *)
//
(* ****** ****** *)
//
extern
fun emit_f0arg : emit_type (f0arg)
extern
fun emit_f0marg : emit_type (f0marg)
extern
fun emit_f0head (out: FILEref, f0h: f0head, full: bool): void
//
(* ****** ****** *)

implement
  env_get_s0exp (fnlab, env) = let
//
val-~Some_vt('(s0e,_,_)) = f0decl_clo_get_sig (fnlab.i0de_sym)
val-S0Elist(s0es) = s0e.s0exp_node
//
val l0 = list_length (s0es)
//
val id = g1ofg0(symbol_get_name (env))
//
// [id] is of the form "env"i
val num = strip_prefix (id, "env")
//
val i = g0string2int (num)
//
fun
loop (s0es: s0explst, i: int) : s0exp =
(
//
case+
s0es of
| list_nil () => exit_errmsg (1, "env_get_s0exp: could not locate type for env")
| list_cons (s0e, s0es1) =>
  if i = 0 then s0e
  else loop (s0es1, i-1)
//
) (* end of [loop] *)
//
in
  loop (s0es, i)
end // end of [env_get_s0exp]

(* ****** ****** *)
//
implement
  emit_ATSfunclo (out, tmp, d0es, arg, res, clo) = let
//
fun loop0
(
  s0exps: s0explst,
  i: int
) : void =
(
case+ s0exps of
| list_nil () => ()
| list_cons (_, s0exps) =>
  (
    if i > 0 then emit_text (out, ",");
    emit_text (out, "!");
    emit_int (out, i);
    loop0 (s0exps, i+1)
  ) (* end of [list_cons] *)
) (* end of [loop0] *)
//
fun loop1
(
  s0exps: s0explst,
  i: int
) : void =
(
case+ s0exps of
| list_nil () => ()
| list_cons (s0e, s0exps) =>
  (
    if i > 0 then emit_text (out, ",");
    emit_s0exp (out, s0e);
    loop0 (s0exps, i+1)
  ) (* end of [list_cons] *)
) (* end of [loop1] *)
//
val d0es =
(
  case+ clo of
  | false => d0es
  | true => let
      val-list_cons (_(*env*), d0es) = d0es
    in
      d0es
    end // end of [let]
) : d0explst (* end of [val] *)
//
val-S0Elist(args) = arg.s0exp_node
val args =
(
  if clo = false then args
  else let
    val-list_cons (_(*env*), args) = args
  in
    args
  end // end of [let]
) : s0explst (* end of [val] *)
//
in
//
case+
s0exp_is_void (res) of
| true =>
{
//
  val () = emit_d0exp (out, tmp)
  val () = emit_ENDL (out)
  val () = emit_d0explst (out, d0es)
  val () = emit_ENDL (out)
  val () = emit_text (out, "callvirt")
  val () = emit_SPACE (out)
  val () = emit_text (out, "instance")
  val () = emit_SPACE (out)
  val () = emit_text (out, "void")
  val () = emit_SPACE (out)
  val () = emit_text (out, "class [mscorlib]System.Action")
  val arity = list_length (args)
  val () =
    if arity > 0 then
    (
      emit_text (out, "`");
      emit_int (out, arity);
      emit_text (out, "<");
      loop1 (args, 0);
      emit_text (out, ">")
    ) // end of [val]
  val () = emit_text (out, "::Invoke")
  val () = emit_LPAREN (out)
  val () = loop0 (args, 0)
  val () = emit_RPAREN (out)
}
//
| false =>
{
  val arity = list_length (args)
  val () = emit_d0exp (out, tmp)
  val () = emit_ENDL (out)
  val () = emit_d0explst (out, d0es)
  val () = emit_ENDL (out)
  val () = emit_text (out, "callvirt")
  val () = emit_SPACE (out)
  val () = emit_text (out, "instance")
  val () = emit_SPACE (out)
  val () = emit_text (out, "!")
  val () = emit_int (out, arity)
  val () = emit_SPACE (out)
  val () = emit_text (out, "class [mscorlib]System.Func")
  val () = emit_text (out, "`")
  val () = emit_int (out, arity+1)
  val () = emit_text (out, "<")
  val () = loop1 (args, 0)
  val () =
    if arity > 0 then emit_text (out, ",")
  // end of [val]
  val () = emit_s0exp (out, res)
  val () = emit_text (out, ">")
  val () = emit_text (out, "::Invoke")
  val () = emit_LPAREN (out)
  val () = loop0 (args, 0)
  val () = emit_RPAREN (out)
}
//
end (* end of [emit_ATSfunclo] *)
//
(* ****** ****** *)
local

//
fun loop
(
  out: FILEref,
  f0as: f0arglst,
  i: int
) : void =
(
case+ f0as of
| list_nil () => ()
| list_cons (f0a, f0as) => let
    val () =
      if i > 0 then emit_text (out, ",")
    // end of [val]
    val s0e =
      case+
      f0a.f0arg_node of
      | F0ARGnone s0e => s0e
      | F0ARGsome (_, s0e) => s0e
    // end of [val]    
  in
    emit_s0exp (out, s0e);
    loop (out, f0as, i+1)
  end // end of [let]
) (* end of [loop] *)
//
fun aux (out: FILEref, args: f0marg, rt: s0exp): void = let
//
val () = emit_text (out, "newobj ")
//
val arity = list_length (args.f0marg_node)
//
in
//
case+ s0exp_is_void (rt) of
//
| true =>
  {
    // action
    val () = emit_text (out, "void class [mscorlib]System.Action")
    val () =
      if arity > 0 then (
        emit_text (out, "`");
        emit_int (out, arity);
        emit_text (out, "<");
        loop (out, args.f0marg_node, 0);
        emit_text (out, ">")
      )
    // end of [val]
    val () = emit_text (out, "::.ctor(object, native int)")
  }
//
| false =>
  {
    // function
    val () = emit_text (out, "void class [mscorlib]System.Func")
    val () = emit_text (out, "`")
    val () = emit_int (out, arity+1)
    val () = emit_text (out, "<")
    val () =
      if arity > 0 then
        (loop (out, args.f0marg_node, 0); emit_text (out, ","))
    // end of [val]
    val () = emit_s0exp (out, rt)
    val () = emit_text (out, ">")
    val () = emit_text (out, "::.ctor(object, native int)")
  } (* end of [if] *)
//
end // end of [aux]
//
in // of [local]
//
implement
  emit_ATSPMVfunlab (out, fnlab) = {
//
val () = emit_text (out, "ldnull")
val () = emit_ENDL (out)
val f0head_opt = f0head_search_opt (fnlab.i0de_sym)
val () =
(
case+ f0head_opt of
//
| ~None_vt() =>
  {
    val () = emit_text (out, "ldftn")
    val () = emit_SPACE (out)
    // leave the identifier as-is, to be resolved manually by the programmer
    val () = emit_symbol (out, fnlab.i0de_sym)
    val () = emit_text (out, "**DELEGATE**") // FIXME
  }
//
| ~Some_vt(fhd) =>
  {
    val () = emit_text (out, "ldftn")
    val () = emit_SPACE (out)
    val () = emit_f0head (out, fhd, true)
    val () = emit_ENDL (out)
    val+F0HEAD(id,f0ma,res) = fhd.f0head_node
    val () = aux (out, f0ma, res)
  }
//
) (* end of [val] *)
//
} // end of [ATSPMVfunlab]
//
end // end of [local]
//
local
//
fun loop
//
(
  out: FILEref,
  f0as: s0explst,
  i: int
) : void =
(
case+ f0as of
| list_nil () => ()
| list_cons (s0e, f0as) => let
    val () =
      if i > 0 then emit_text (out, ",")
    // end of [val]    
  in
    emit_s0exp (out, s0e);
    loop (out, f0as, i+1)
  end // end of [let]
) (* end of [loop] *)
//
fun aux (out: FILEref, args: s0explst, rt: s0exp): void = let
//
val () = emit_text (out, "newobj ")
//
val arity = list_length (args)
//
in
//
case+ s0exp_is_void (rt) of
//
| true =>
  {
    // action
    val () = emit_text (out, "void class [mscorlib]System.Action")
    val () =
      if arity > 0 then (
        emit_text (out, "`");
        emit_int (out, arity);
        emit_text (out, "<");
        loop (out, args, 0);
        emit_text (out, ">")
      )
    // end of [val]
    val () = emit_text (out, "::.ctor(object, native int)")
  }
//
| false =>
  {
    // function
    val () = emit_text (out, "void class [mscorlib]System.Func")
    val () = emit_text (out, "`")
    val () = emit_int (out, arity+1)
    val () = emit_text (out, "<")
    val () =
      if arity > 0 then
        (loop (out, args, 0); emit_text (out, ","))
    // end of [val]
    val () = emit_s0exp (out, rt)
    val () = emit_text (out, ">")
    val () = emit_text (out, "::.ctor(object, native int)")
  } (* end of [if] *)
//
end // end of [aux]
//
in // of [local]
//
implement
  emit_ATSPMVcfunlab (out, knd, fnlab, d0es) =
{
//
  fun loop_fldenv (flds: s0explst, i: int): void =
  (
    case+ flds of
    | list_nil () => ()
    | list_cons (s0e, flds) =>
      {
        val () =
          if i > 0 then emit_text (out, ", ")
        // end of [val]
        val () = emit_s0exp (out, s0e)
        val () = loop_fldenv (flds, i+1)
      } (* end of [list_cons] *)
  ) (* end of [loop_fldenv] *)
//
fun loop1
(
  s0exps: s0explst,
  i: int
) : void =
(
case+ s0exps of
| list_nil () => ()
| list_cons (s0e, s0exps) =>
  (
    if i > 0 then emit_text (out, ",");
    emit_s0exp (out, s0e);
    loop1 (s0exps, i+1)
  ) (* end of [list_cons] *)
) (* end of [loop1] *)
//
  val-~Some_vt('(env,arg,res)) = f0decl_clo_get_sig (fnlab.i0de_sym)
//
  val () = emit_d0explst (out, d0es)
//
  val clsname = symbol_get_name (fnlab.i0de_sym)
  val clsname = strptr2string (string0_append (clsname, CLOSURE_TYPE))
  val () = the_clsname_push (the_namesp_get (), clsname)
//
  val () = emit_text (out, "newobj instance void class ")
  val () = emit_text (out, the_clsname_get ())
  val () = emit_text (out, ".ctor")
  val () = emit_LPAREN (out)
  val-S0Elist (flds) = env.s0exp_node
  val () = loop_fldenv (flds, 0)
  val () = emit_RPAREN (out)
  val () = emit_ENDL (out)

  val f0head_opt = f0head_search_opt (fnlab.i0de_sym)
  val () =
  (
  case+ f0head_opt of
  //
  | ~None_vt() => emit_text (out, "**DELEGATE**") // FIXME
  | ~Some_vt(fhd) =>
    {
      val () = emit_text (out, "ldftn")
      val () = emit_SPACE (out)
      //
      val () = emit_SPACE (out)
      val () = emit_s0exp (out, res)
      val () = emit_SPACE (out)
      val () = emit_text (out, the_clsname_get ())
      val () = emit_text (out, ATS_CLO_MTH)
      val () = emit_LPAREN (out)
      val-S0Elist(env) = env.s0exp_node
      val-S0Elist(args) = arg.s0exp_node
      val () = loop1 (args, 0)
      val () = emit_RPAREN (out)
      val () = emit_ENDL (out)
      val () = aux (out, args, res)
    }
  //
  ) (* end of [val] *)
  val _ = the_clsname_pop ()
} (* end of [emit_ATSPMVfunlab] *)
//
end // end of [local]
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
  (out: FILEref, inss: instrlst, labbeg: label, labend: label, marklab: bool) : void
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
| S0Eide (id) => emit_symbol (out, id)
| S0Elist (s0es) => () // shouldn't happen? marked as "temp"
| S0Eappid (id, s0es) =>
    // FIXME: what about other types? e.g. array types? struct types?
(
  case+ symbol_get_name (id.i0de_sym) of
  | "atstkind_t0ype" =>
    {
      // unboxed type, of sort t@ype in ATS
      val-list_cons (s0e, list_nil ()) = s0es
      val-S0Eide (id) = s0e.s0exp_node
      val () = emit_symbol (out, id)
    } (* end of [atstkind_t0ype] *)
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
val the_module_name = ref<string> ("MODULE")
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
the_module_name_set (clsname) = !the_module_name := clsname
implement
the_module_name_get () = !the_module_name

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
    val f0head_opt = f0head_search_opt (id.i0de_sym)
  in
    case+ f0head_opt of
    | ~None_vt() =>
      {
        val () =
        (
          case+ symbol_get_name (id.i0de_sym) of
          //
          | "ATSCKnot" =>
            {
              val () = emit_text (out, "not")
            }
          //
          | "ATSCKiseqz" =>
            {
              val () = emit_text (out, "ldc.i4.0")
              val () = emit_ENDL (out)
              val () = emit_text (out, "ceq")
            }
          //
          | "ATSCKisneqz" =>
            {
              val () = emit_text (out, "ldc.i4.0")
              val () = emit_ENDL (out)
              val () = emit_text (out, "ceq")
              val () = emit_ENDL (out)
              val () = emit_text (out, "not")
            }
          //
          | "ATSCKptriscons" =>
            {
              val L0 = make_label (id.i0de_loc)
              val L1 = make_label (id.i0de_loc)
              val () = emit_text (out, "brtrue")
              val () = emit_SPACE (out)
              val () = emit_label (out, L0)
              val () = emit_ENDL (out)
              
              val () = emit_text (out, "ldc.i4.0")
              val () = emit_ENDL (out)
              val () = emit_text (out, "br")
              val () = emit_SPACE (out)
              val () = emit_label (out, L1)
              val () = emit_ENDL (out)
              
              val () = emit_label_mark (out, L0)
              val () = emit_text (out, "ldc.i4.1")
              val () = emit_ENDL (out)
              val () = emit_label_mark (out, L1)
            }
          //
          | "ATSCKptrisnull" =>
            {
              val L0 = make_label (id.i0de_loc)
              val L1 = make_label (id.i0de_loc)
              val () = emit_text (out, "brfalse")
              val () = emit_SPACE (out)
              val () = emit_label (out, L0)
              val () = emit_ENDL (out)
              
              val () = emit_text (out, "ldc.i4.0")
              val () = emit_ENDL (out)
              val () = emit_text (out, "br")
              val () = emit_SPACE (out)
              val () = emit_label (out, L1)
              val () = emit_ENDL (out)
              
              val () = emit_label_mark (out, L0)
              val () = emit_text (out, "ldc.i4.1")
              val () = emit_ENDL (out)
              val () = emit_label_mark (out, L1)
            }
          //
          // TODO: ATSCKpat_(con*|exn*)
          //
          | "ATSPMVempty" => ((*nothing*))
          | _ when strstr(g1ofg0(symbol_get_name(id.i0de_sym)), "__dynload") >= 0 =>
            {
              val () = emit_text (out, "call void ")
              val () = emit_text (out, the_clsname_get ())
              val () = emit_i0de (out, id)
              val () = emit_text (out, "()")
            } // end of [dynload]
          | _ =>
            {
              val () = emit_text (out, "call")
              val () = emit_SPACE (out)
              // leave the identifier as-is, to be resolved manually by the programmer
              val () = emit_i0de (out, id)
            }
        ) (* end of [val] *)
      }
    | ~Some_vt(fhd) =>
      {
        val () = emit_text (out, "call")
        val () = emit_SPACE (out)
        val () = emit_f0head (out, fhd, true)
      }
  end // end of [D0Eappid]
//
| D0Eappexp (d0e, d0es) =>
  (
    case-
    d0e.d0exp_node of
    | ATSfunclo_fun (d0e, args, res) => emit_ATSfunclo (out, d0e, d0es, args, res, false(*fun*))
    | ATSfunclo_clo (d0e, args, res) => emit_ATSfunclo (out, d0e, d0es, args, res, true(*clo*))
  ) (* end of [D0Eappexp] *)
//
// TODO: D0Elist
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
| ATSPMVintrep (int) =>
  {
    val () = emit_text (out, "ldc.i4")
    val () = emit_SPACE (out)
    val () = emit_PMVintrep (out, int)
  }
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
    val () = emit_text (out, "ldc.r4")
    val () = emit_SPACE (out)
    val () = emit_text (out, rep)
  }
//
| ATSPMVempty (x) => () (* of type [void] in ATS *)
//
| ATSPMVfunlab (fnlab) => emit_ATSPMVfunlab (out, fnlab)
//
| ATSPMVcfunlab (knd, fnlab, d0es) => emit_ATSPMVcfunlab (out, knd, fnlab, d0es)
//
| ATSCKpat_con0
    (d0e, tag) => emit_ATSCKpat_con0 (out, d0e, tag)
//
| ATSSELcon _ => emit_SELcon (out, d0e)
//
| ATSSELboxrec _ => emit_SELboxrec (out, d0e)
//
(*
| ATSfunclo_fun (d0e, args, res) => emit_ATSfunclo_fun (out, d0e, args, res)
*)
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
  (out, fhd, full) = let
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
    val () =
      if full then emit_text (out, the_clsname_get ())
    // end of [val]
    val () = emit_i0de (out, id)
    // end of [val]
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
fun emit_ATSINSmove_boxrec
  (out: FILEref, ins0: instr): void
//
implement
emit_ATSINSmove_boxrec
  (out, ins0) = let
//
fun
pushargs
(
  inss: instrlst
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons (ins, inss) => let
    val-ATSINSstore_boxrec_ofs (_(*tmp*), _(*s0exp*), _(*lab*), d0e) = ins.instr_node
    val () = emit_d0exp (out, d0e)
    val () = emit_ENDL (out)
  in
    pushargs (inss)
  end // end of [list_cons]
) (* end of [pushargs] *)
//
fun loop_sig
(
  xs: tyfldlst, i: int
) : void =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (id, s0e) = x.tyfld_node
    val () =
      if i > 0 then (emit_text (out, ", "))
    // end of [val]
    val () = emit_s0exp (out, s0e)
  in
    loop_sig (xs, i+1)
  end // end of [list_cons]
| list_nil ((*void*)) => ()
) (* end of [loop_sig] *)
//
val-ATSINSmove_boxrec (inss) = ins0.instr_node
//
val-list_cons (ins, inss) = inss
val-ATSINSmove_boxrec_new (tmp, s0e) = ins.instr_node
val-S0Eide(name) = s0e.s0exp_node
val-~Some_vt (s0rec) = typedef_search_opt (name)
val () = the_clsname_push (the_namesp_get (), symbol_get_name(name))
//
val () = pushargs (inss)
//
val () = emit_text (out, "newobj instance void class ")
val () = emit_text (out, the_clsname_get ())
val () = emit_text (out, "'.ctor'")
val () = emit_LPAREN (out)
val () = loop_sig (s0rec.tyrec_node, 0)
val () = emit_RPAREN (out)
val () = emit_ENDL (out)
//
val () = emit_text (out, "stloc ")
val () = emit_i0de (out, tmp)
val () = emit_ENDL (out)
//
val _ = the_clsname_pop ()
//
in
  // nothing
end (* end of [emit_ATSINSmove_boxrec] *)

(* ****** ****** *)

//
extern
fun emit_ATSINSmove_con1
  (out: FILEref, ins0: instr): void
//
implement
emit_ATSINSmove_con1
  (out, ins0) = let
//
fun
pushargs
(
  inss: instrlst
) : void =
(
case+ inss of
| list_nil () => ()
| list_cons (ins, inss) => let
    val-ATSINSstore_con1_ofs (_(*tmp*), _(*s0exp*), _(*lab*), d0e) = ins.instr_node
    val () = emit_d0exp (out, d0e)
    val () = emit_ENDL (out)
  in
    pushargs (inss)
  end // end of [list_cons]
) (* end of [pushargs] *)
//
fun loop_sig
(
  xs: tyfldlst, i: int
) : void =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (id, s0e) = x.tyfld_node
    val () =
      if i > 0 then (emit_text (out, ", "))
    // end of [val]
    val () = emit_s0exp (out, s0e)
  in
    loop_sig (xs, i+1)
  end // end of [list_cons]
| list_nil ((*void*)) => ()
) (* end of [loop_sig] *)
//
fun extract_tag
(
  inss: instrlst
): instrlst =
(
//
case+
inss of
| list_cons (ins0, inss1) =>
  (
    case+
    ins0.instr_node of
    | ATSINSstore_con1_tag (_, tok) => inss1
    | _ => inss
  )
| list_nil () => inss
//
) (* end of [extract_tag] *)
//
val-ATSINSmove_con1 (inss) = ins0.instr_node
//
val-list_cons (ins, inss) = inss
val-ATSINSmove_con1_new (tmp, s0e) = ins.instr_node
//
val inss = extract_tag (inss)
val-S0Eide(name) = s0e.s0exp_node
val-~Some_vt (s0rec) = typedef_search_opt (name)
val () = the_clsname_push (the_namesp_get (), symbol_get_name(name))
//
val () = pushargs (inss)
//
val () = emit_text (out, "newobj instance void class ")
val () = emit_text (out, the_clsname_get ())
val () = emit_text (out, "'.ctor'")
val () = emit_LPAREN (out)
val () = loop_sig (s0rec.tyrec_node, 0)
val () = emit_RPAREN (out)
val () = emit_ENDL (out)
//
val () = emit_text (out, "stloc ")
val () = emit_i0de (out, tmp)
val () = emit_ENDL (out)
//
val _ = the_clsname_pop ()
//
in
// nothing
end (* end of [emit_ATSINSmove_con1] *)

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
    val () = emit_text (out, "ret\n")
  }
//
| ATSreturn_void (tmp) =>
  {
    val () = emit_text (out, "ret\n")
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
        val () = emit_instrlst (out, inss, L0, brlab, true)
        val () = emit_label_mark (out, brlab)
        val () = emit_text (out, "br")
        val () = emit_SPACE (out)
        val () = emit_label (out, labnext)
        val () = emit_ENDL (out)
        val () = emit_instrlst (out, inss2, L1, labnext, true)
      }
    | None () =>
      {
        val () = emit_text (out, "brfalse")
        val () = emit_SPACE (out)
        val () = emit_label (out, labnext)
        val () = emit_ENDL (out)
        val brlab = make_label (ins0.instr_loc)
        val () = emit_instrlst (out, inss, brlab, labnext, true)
      }
  )
//
| ATSifthen (d0e, inss2) =>
  {
//
    val L1 = label_for_instrlst (inss2)
//
    val () = emit_d0exp (out, d0e)
    val () = emit_ENDL (out)
    val () = emit_text (out, "brfalse")
    val () = emit_SPACE (out)
    val () = emit_label (out, labnext)
    val () = emit_ENDL (out)
    val () = emit_instrlst (out, inss2, L1, labnext, true)
  }
| ATSifnthen (d0e, inss2) =>
  {
//
    val L1 = label_for_instrlst (inss2)
//
    val () = emit_d0exp (out, d0e)
    val () = emit_ENDL (out)
    val () = emit_text (out, "brtrue")
    val () = emit_SPACE (out)
    val () = emit_label (out, labnext)
    val () = emit_ENDL (out)
    val () = emit_instrlst (out, inss2, L1, labnext, true)
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
    val () = emit_text (out, "ret\n")
  }
//
| ATSreturn_void (tmp) =>
  {
    val () = emit_text (out, "ret\n")
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
    // TODO: if [tmp] is env variable
    // and if we're emitting closure function,
    // then insert [ldarg.0], also remove
    // the FIXME in emit_tmpvar_st
    val () = emit_d0exp (out, d0e)
    val () = emit_newline (out)
    val () = emit_tmpvar_st (out, tmp)
  } (* end of [ATSINSmove] *)
//
| ATSINSmove_void (_, d0e) =>
  {
    val () = emit_d0exp (out, d0e)
  } (* end of [ATSINSmove_void] *)
//
| ATSINSmove_nil (tmp) =>
  {
    val () = emit_text (out, "ldnull")
    val () = emit_ENDL (out)
    val () = emit_tmpvar_st (out, tmp)
  }
//
| ATSINSmove_con0 (tmp, tag) =>
  {
    val () = emit_text (out, "ldc.i4")
    val () = emit_SPACE (out)
    val () = emit_PMVint (out, tag)
    val () = emit_ENDL (out)
    val () = emit_text (out, "box ats2enum")
    val () = emit_ENDL (out)
    val () = emit_tmpvar_st (out, tmp)
  }
//
| ATSINSmove_con1 _ =>
  {
    val () = emit_ATSINSmove_con1 (out, ins0)
  }
//
| ATSdynload (dummy) =>
  {
    // TODO: map to static constructor?
    val () = emit_text (out, "/* ATSdynload() */\n")
  }
//
| ATSdynloadset (flag) =>
  {
    val () = emit_text (out, "/* ATSdynloadset */\n")
    val () = emit_text (out, "ldc.i4.1")
    val () = emit_ENDL (out)
    val () = emit_text (out, "stsfld int32 ")
    val () = emit_text (out, the_clsname_get ())
    val () = emit_i0de (out, flag)
  }
//
| ATSdynloadflag_sta (flag) =>
  {
    val () = emit_text (out, "/* ATSdynloadflag_sta */\n")
  }
//
| ATSdynloadflag_ext (flag) =>
  {
    val () = emit_text (out, "/* ATSdynloadflag_ext */\n")
  }
//
| ATSINSmove_boxrec _ =>
    emit_ATSINSmove_boxrec (out, ins0)
//
| ATStailcalseq (inss) =>
  {
    val () = emit_text (out, "// ATStailcalseq_beg")
    val () = emit_ENDL (out)
    val () = emit_instrlst (out, inss, labthis, labnext, false)
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
    val () = emit_instrlst (out, inss, labthis, labnext, true)
    val () = emit_text (out, "/* ATSbranch_end */\n")
  } // end of [ATSbranchseq]
//
end (* end of [auxseq] *)
//
fun auxseqlst
(
  out: FILEref
, inss: instrlst
, labthis: label
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
    val () = auxseq (out, ins, labthis, labnext)
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
  out, inss, labthis, lablast, marklab
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
        emit_instrlst (out, inss, label, lablast, marklab)
      )
    | ATSINSflab (label) =>
      (
        emit_instrlst (out, inss, label, lablast, marklab)
      )
    | ATSlinepragma (line, file) =>
      {
        val () = emit_ENDL (out)
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
        val () = emit_instrlst (out, inss, labthis, lablast, marklab)
      }
    | _(*other*) =>
      {
        val () = (if marklab then emit_label_mark (out, labthis))
        val labnext =
        (
          case+ inss of
          | list_nil () => lablast
          | _ => label_for_instrlst (inss)
        ) (* end of [val] *)
        val () = emit_instr (out, ins0, labthis, labnext)
        val () = emit_ENDL (out)
        val () = emit_instrlst (out, inss, labnext, lablast, true(*mark the next instruction*))
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
  emit_instrlst (out, inss, L1, labnext, true);
  emit_ENDL (out)
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
// TODO: compute .maxstack
// emit locals
val () =
  case+ tmpdecs of
  | list_nil() => ()
  | _ => {
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
  }
// end of [val]
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
| F0DECLsome (fhd, fbody) => let
  //
    val-F0HEAD(id, _, _) = fhd.f0head_node
  //
  in
    {
      val () = emit_text (out, ".method")
      val () = emit_SPACE (out)
      val () = emit_text (out, "static")
      // TODO: public/private?
      // static -> private
      val () = emit_SPACE (out)
      val access = "public"
      val () = emit_text (out, access)
      val () = emit_SPACE (out)
      val () = f0head_insert (id.i0de_sym, fhd)
      val () = emit_f0head (out, fhd, false)
      val () = emit_SPACE (out)    
      val () = emit_text (out, "cil")
      val () = emit_SPACE (out)
      val () = emit_text (out, "managed")
      val () = emit_newline (out)
      val () = emit_f0body (out, fbody)
      val () = emit_newline (out)
    } (* end of [if] *)
  end // end of [F0DECLsome]
//
end // end of [emit_f0decl]

(* ****** ****** *)

//
extern
fun
emit_typedef
  (out: FILEref, id: i0de, tr: tyrec): void
//
implement
emit_typedef
  (out, id, tyrec) = {
//
fun loop_fld
(
  xs: tyfldlst, i: int
) : void =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (id, s0e) = x.tyfld_node
    val () = emit_text (out, ".field public")
    val () = emit_SPACE (out)
    val () = emit_s0exp (out, s0e)
    val () = emit_SPACE (out)
    val () = emit_i0de (out, id)
    val () = emit_ENDL (out)
  in
    loop_fld (xs, i+1)
  end // end of [list_cons]
| list_nil ((*void*)) => ()
) (* end of [loop_fld] *)
//
fun loop_sig
(
  xs: tyfldlst, i: int
) : void =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (id, s0e) = x.tyfld_node
    val () =
      if i > 0 then (emit_text (out, ", "))
    // end of [val]
    val () = emit_s0exp (out, s0e)
  in
    loop_sig (xs, i+1)
  end // end of [list_cons]
| list_nil ((*void*)) => ()
) (* end of [loop_sig] *)
//
fun loop_stfld
(
  xs: tyfldlst, i: int
) : void =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (lab, s0e) = x.tyfld_node
    val () = emit_text (out, "ldarg.0\n")
    val () = emit_text (out, "ldarg")
    val () = emit_SPACE (out)
    val () = emit_int (out, i+1(*0 is the 'this' ptr*))
    val () = emit_ENDL (out)
    val () = emit_text (out, "stfld")
    val () = emit_SPACE (out)
    val () = emit_s0exp (out, s0e)
    val () = emit_SPACE (out)
    val () = emit_text (out, the_clsname_get ())
    val () = emit_i0de (out, lab)
    val () = emit_ENDL (out)
  in
    loop_stfld (xs, i+1)
  end // end of [list_cons]
| list_nil ((*void*)) =>
  {
    // object initialization
    val () = emit_text (out, "ldarg.0\n")
    val () = emit_text (out, "call instance void object::'.ctor'()\n")
    val () = emit_text (out, "ret\n")
  } (* end of [list_nil] *)
) (* end of [loop_stfld] *)
//
  val namesp = the_namesp_get ()
  val () = the_clsname_push (namesp, symbol_get_name(id.i0de_sym))
//
  val () = emit_text (out, ".namespace ")
  val () = emit_text (out, namesp)
  val () = emit_LBRACE (out)
  val () = emit_ENDL (out)
//
  val () = emit_text (out, ".class")
  val () = emit_SPACE (out)
  val () = emit_text (out, "public auto ansi") // TODO: figure out what [auto] and [ansi] mean
  val () = emit_SPACE (out)
  val () = emit_i0de (out, id)
  val () = emit_SPACE (out)
  val () = emit_LBRACE (out)
  val () = emit_ENDL (out)
  // fields
  val () = loop_fld (tyrec.tyrec_node, 0)
  val () = emit_ENDL (out)
  // constructor
  val () = emit_text (out, ".method public hidebysig specialname rtspecialname instance default void '.ctor'")
  val () = emit_LPAREN (out)
  val () = loop_sig (tyrec.tyrec_node, 0)
  val () = emit_RPAREN (out)
  val () = emit_text (out, " cil managed ")
  val () = emit_LBRACE (out) // beg of constructor
  val () = emit_ENDL (out)
  val () = loop_stfld (tyrec.tyrec_node, 0)
  val () = emit_RBRACE (out) // end of constructor
  val () = emit_ENDL (out)
  val () = emit_RBRACE (out) // end of class
  val () = emit_ENDL (out)
//
  val () = emit_RBRACE (out) // end of [namespace]
  val () = emit_ENDL (out)
//
  val _ = the_clsname_pop ()
} (* end of [emit_typedef] *)

(* ****** ****** *)

//
extern
fun
tyrec_labs0exp
  (tyrec: tyrec, lab: symbol): s0exp
//
implement
tyrec_labs0exp
  (tyrec, lab) = let
//
fun loop
(
  xs: tyfldlst, i: int
) : s0exp =
(
case+ xs of
| list_cons (x, xs) => let
    val TYFLD (id, s0e) = x.tyfld_node
  in
    if lab = id.i0de_sym then s0e else loop (xs, i+1)
  end // end of [list_cons
| list_nil ((*void*)) => exit(1)
)
//
in
  loop (tyrec.tyrec_node, 0)
end // end of [tyrec_labs0exp]
//
(* ****** ****** *)

implement
emit_SELcon
  (out, d0e) = let
//
val-ATSSELcon
  (d0rec, s0e, id) = d0e.d0exp_node
//
val-S0Eide (name) = s0e.s0exp_node
val-~Some_vt (s0rec) = typedef_search_opt (name)
//
val lab_s0exp = tyrec_labs0exp (s0rec, id.i0de_sym)
//
val () =
  emit_d0exp (out, d0rec)
//
val () = emit_ENDL (out)
val () = emit_text (out, "ldfld")
val () = emit_SPACE (out)
val () = emit_s0exp (out, lab_s0exp)
val () = emit_SPACE (out)
val () = emit_text (out, the_namesp_get ())
val () = emit_text (out, ".")
val () = emit_symbol (out, name)
val () = emit_text (out, "::")
val () = emit_i0de (out, id)
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
val lab_s0exp = tyrec_labs0exp (s0rec, id.i0de_sym)
//
val () =
  emit_d0exp (out, d0rec)
//
val () = emit_ENDL (out)
val () = emit_text (out, "ldfld")
val () = emit_SPACE (out)
val () = emit_s0exp (out, lab_s0exp)
val () = emit_SPACE (out)
val () = emit_text (out, the_namesp_get ())
val () = emit_text (out, ".")
val () = emit_symbol (out, name)
val () = emit_text (out, "::")
val () = emit_i0de (out, id)
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
//
extern
fun
emit_d0eclist
(
  out: FILEref, d0cs: d0eclist
) : void
//
extern
fun
emit_closurerize
(
  out: FILEref,
  id: i0de,
  env: s0exp,
  arg: s0exp,
  res: s0exp,
  fdecl: f0head
) : void
//
(* ****** ****** *)

implement
  emit_closurerize (out, id(*name*), env(*env type*), arg(*argument type*), res(*result type*), fhd) = let
//
  val clsname = strptr2string (string0_append (symbol_get_name (id.i0de_sym), CLOSURE_TYPE))
  val namesp = the_namesp_get ()
  val () = the_clsname_push (namesp, clsname)
//
  val () = emit_text (out, ".namespace ")
  val () = emit_text (out, namesp)
  val () = emit_LBRACE (out)
  val () = emit_ENDL (out)
//
  val () = emit_text (out, ".class public auto ansi beforefieldinit ")
  val () = emit_text (out, clsname)
  val () = emit_text (out, " extends [mscorlib]System.Object")
  val () = emit_ENDL (out)
  val () = emit_LBRACE (out)
  val () = emit_ENDL (out)
//  
  fun loop_fldenv (flds: s0explst, i: int): void =
  (
    case+ flds of
    | list_nil () => ()
    | list_cons (s0e, flds) => let
      val () = emit_text (out, ".field assembly ")
      val () = emit_s0exp (out, s0e)
      val () = emit_text (out, " ")
      val () = emit_text (out, "env")
      val () = emit_int (out, i)
      val () = emit_ENDL (out)
    in
      loop_fldenv (flds, i+1)
    end // end of [let]
  ) (* end of [loop_fldenv] *)
//  
  fun loop_argenv (flds: s0explst, i: int): void =
  (
  case+ flds of
  | list_cons (s0e, flds) =>
    {
      val () =
        if i > 0 then emit_text (out, ", ")
      // end of [val]
      val () = emit_s0exp (out, s0e)
      val () = emit_SPACE (out)
      val () = emit_text (out, "arg")
      val () = emit_int (out, i+1) // 0 is 'this' ptr
      val () = loop_argenv (flds, i+1)
    } (* end of [list_cons] *)
  | list_nil () => ()
  ) (* end of [loop_argenv] *)
//  
  fun loop_initenv (flds: s0explst, i: int): void =
  (
  case+ flds of
  | list_cons (s0e, flds) => let
      val () = emit_text (out, "ldarg.0\n")
      val () = emit_text (out, "ldarg")
      val () = emit_SPACE (out)
      val () = emit_int (out, i+1) // arg 0 is "this"
      val () = emit_ENDL (out)
      val () = emit_text (out, "stfld")
      val () = emit_SPACE (out)
      val () = emit_s0exp (out, s0e)
      val () = emit_SPACE (out)
      val () = emit_text (out, the_clsname_get ())
      val () = emit_text (out, "env")
      val () = emit_int (out, i)
      val () = emit_ENDL (out)
    in
      loop_initenv (flds, i+1)
    end // end of [list_cons]
  | list_nil () =>
    {
      // object initialization
      val () = emit_text (out, "ldarg.0")
      val () = emit_ENDL (out)
      val () = emit_text (out, "call instance void object::.ctor()")
      val () = emit_ENDL (out)
      val () = emit_text (out, "ret")
      val () = emit_ENDL (out)
    } (* end of [list_nil] *)
  ) (* end of [loop_initenv] *)
//  
  // emit fields
  val-S0Elist (flds) = env.s0exp_node
  val () = loop_fldenv (flds, 0)
//
  // emit constructor
  val () = emit_text (out, ".method public hidebysig specialname rtspecialname instance default void .ctor")
  val () = emit_LPAREN (out)
  val () = loop_argenv (flds, 0)
  val () = emit_RPAREN (out)
  val () = emit_text (out, " cil managed ")
  val () = emit_LBRACE (out)
  val () = emit_ENDL (out)  
  val () = loop_initenv (flds, 0)  
  val () = emit_RBRACE (out)
  val () = emit_text (out, " /* end of [.ctor] */")
  val () = emit_ENDL (out)
//
  val-S0Elist(args) = arg.s0exp_node
//
  val () = emit_text (out, ".method assembly instance ")
  val () = emit_s0exp (out, res)
  val () = emit_SPACE (out)
  val () = emit_text (out, ATS_CLO_MTH)
//
fun loop1
(
  s0exps: s0explst,
  i: int
) : void =
(
case+ s0exps of
| list_nil () => ()
| list_cons (s0e, s0exps) =>
  (
    if i > 0 then emit_text (out, ",");
    emit_s0exp (out, s0e);
    loop1 (s0exps, i+1)
  ) (* end of [list_cons] *)
) (* end of [loop1] *)
//
  val () = emit_LPAREN (out)
  val () = loop1 (args, 0)
  val () = emit_RPAREN (out)
  val () = emit_text (out, " cil managed")
  val () = emit_ENDL (out)
  val () = emit_LBRACE (out)
  val () = emit_ENDL (out)
//
  fun loop_loadenv (flds: s0explst, i: int): void =
  (
  case+ flds of
  | list_cons (s0e, flds) => let
      val () = emit_text (out, "ldarg.0\n")
      val () = emit_text (out, "ldfld")
      val () = emit_SPACE (out)
      val () = emit_s0exp (out, s0e)
      val () = emit_SPACE (out)
      val () = emit_text (out, the_clsname_get ())
      val () = emit_text (out, "env")
      val () = emit_int (out, i)
      val () = emit_ENDL (out)
    in
      loop_loadenv (flds, i+1)
    end // end of [list_cons]
  | list_nil () => ()
  ) (* end of [loop_loadenv] *)
//
  fun loop_loadarg (flds: s0explst, i: int): void =
  (
  case+ flds of
  | list_cons (s0e, flds) => let
      val () = emit_text (out, "ldarg")
      val () = emit_SPACE (out)
      val () = emit_int (out, i)
      val () = emit_ENDL (out)
    in
      loop_loadarg (flds, i+1)
    end // end of [list_cons]
  | list_nil () => ()
  ) (* end of [loop_loadarg] *)
//
  val () = loop_loadenv (flds, 0)
  val () = loop_loadarg (args, 1)
  //
  val () = the_clsname_push (the_namesp_get (), the_module_name_get ())
  val () = emit_text (out, "call") // call id // fully qualified
  val () = emit_SPACE (out)
  val () = emit_s0exp (out, res)
  val () = emit_SPACE (out)
  val () = emit_text (out, the_clsname_get ())
  val () = emit_i0de (out, id)
  val _ = the_clsname_pop ()
  val () = emit_LPAREN (out)
  val () = loop1 (flds, 0)
  val () = loop1 (args, if list_is_cons(flds) then 1 else 0)
  val () = emit_RPAREN (out)
  val () = emit_ENDL (out)
  //
  val () = emit_text (out, "ret\n")
  val () = emit_RBRACE (out) // end of method
  val () = emit_ENDL (out)
//
  val () = emit_RBRACE (out) // end of class
  val () = emit_text (out, "/* end of [")
  val () = emit_text (out, clsname)
  val () = emit_text (out, "] */")
  val () = emit_ENDL (out)
//
  val () = emit_RBRACE (out) // end of [namespace]
  val () = emit_ENDL (out)
//
  val _ = the_clsname_pop ()
//
in
  //
end // end of [emit_closurerize]

(* ****** ****** *)
//
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
    val () =
    (
      case- include.token_node of
      | T_STRING(filnam) => emit_text (out, filnam)
      | T_IDENT_alp(filnam) => emit_text (out, filnam)
    ) (* end of [val] *)
    val () = emit_newline (out)
  }
//
| D0Cifdef (i0de, d0eclist) =>
  {
    val () = emit_text (out, "#ifdef")
    val () = emit_SPACE (out)
    val () = emit_i0de (out, i0de)
    val () = emit_newline (out)

    val () = emit_d0eclist (out, d0eclist)

    val () = emit_text (out, "#endif")
    val () = emit_text (out, " /* end of [")
    val () = emit_i0de (out, i0de)
    val () = emit_text (out, "] */")
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
    // check to see if [def] contains any field with type atstyvar_type(X)
    val () = typedef_insert (id.i0de_sym, def)
    val () = println!("emitting typedef")
    val () = emit_typedef (out, id, def)
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
    // type of external function
    // TODO: make use of this
    // i0de: identifier
    // s0explst: types of arguments
    // s0exp: return type
    // how to obtain fully-qualified CIL name? probably by prefix? e.g. ats2cilpre_ -> ats2cilpre.
  }
//
| D0Cstatmp
    (tmp, opt) =>
  (
    case+ opt of
    | Some s0e =>
      (
        statmps0exp_insert (tmp.i0de_sym, s0e);
        emit_text (out, ".field static private ");
        emit_s0exp (out, s0e);
        emit_SPACE (out);
        emit_i0de (out, tmp);
        emit_ENDL (out)
      ) (* end of [Some] *)
    | None () =>
      (
        emit_text (out, "//");
        emit_text (out, ".field static void ");
        emit_i0de (out, tmp);
        emit_ENDL (out)
      ) (* end of [None] *)
  ) (* end of [D0Cstatmp] *)
//
| D0Cextcode (toks) =>
  {
    val () = emit_text (out, ATSEXTCODE_BEG)
    val () = emit_extcode (out, toks)
    val () = emit_text (out, ATSEXTCODE_END)
    val () = emit_ENDL (out)
  }
//
| D0Cfundecl (fk, f0d) => emit_f0decl (out, f0d)
//
| D0Cdynloadflag_init (flag) =>
  (
    emit_text (out, "// dynloadflag_init\n");
    emit_text (out, ".field static int32 ");
    emit_i0de (out, flag);
    emit_ENDL (out)
  )
//
| D0Cclosurerize _ => ()
//
end // end of [emit_d0ecl]

(* ****** ****** *)

implement
emit_d0eclist
(
  out, d0cs
) =
(
//
case+ d0cs of
| list_nil () => ()
| list_cons
    (d0c, d0cs) => let
  in
    emit_d0ecl (out, d0c); emit_d0eclist (out, d0cs)
  end // end of [list_cons]
//
) (* end of [emit_d0eclist] *)

(* ****** ****** *)

implement
emit2_toplevel
  (out, d0cs, fname, namespace) = let
(*
fun
loop0_closurerize
(id: i0de, d0cs: d0eclist) : f0decl = let
//
fun
strip_env (f0as: f0arglst): f0arglst =
(
  case+
  f0as of
  | list_nil () => f0as
  | list_cons (f0a, f0as1) =>
  (
    case+
    f0a.f0arg_node of
    | F0ARGnone (s0e) => f0as
    | F0ARGsome(id, s0e) when tmpvar_is_env (id.i0de_sym) => strip_env (f0as1)
    | _ => f0as
  )
) (* end of [strip_env] *)
//
in
//
(
case- d0cs of
| list_cons (d0c, d0cs1) =>
  (
    case+ d0c.d0ecl_node of
    | D0Cfundecl (_, fdecl) =>
      (
        case+ fdecl.f0decl_node of
        | F0DECLnone _ => loop0_closurerize (id, d0cs1)
        | F0DECLsome (fhead, fbody) => let
          val-F0HEAD (id_fun, arg, ret) = fhead.f0head_node
        in
          if id_fun.i0de_sym = id.i0de_sym then let
            // remove all [env] arguments
            val args = arg.f0marg_node
            val args = strip_env (args)
            val arg = '{f0marg_loc= arg.f0marg_loc, f0marg_node= args}
            val fhead = '{f0head_loc= fhead.f0head_loc, f0head_node= F0HEAD (id_fun, arg, ret)}
            val () = f0head_insert (id.i0de_sym, fhead)
          in
            '{f0decl_loc= fdecl.f0decl_loc, f0decl_node= F0DECLsome (fhead, fbody)}
          end else loop0_closurerize (id, d0cs1)
        end // end of [let]
      ) (* end of [D0Cfundecl] *)
    | _ => loop0_closurerize (id, d0cs1)
  ) (* end of [list_cons] *)
)
//
end // end of [loop0_closurerize]
*)
//
fun f0decl_is_none (fd: f0decl): bool =
(
  case+ fd.f0decl_node of
  | F0DECLnone _ => true
  | F0DECLsome _ => false
) (* end of [f0decl_is_none] *)
//
fun
loop0
(
  out: FILEref, d0cs: d0eclist
) : d0eclist =
(
case+ d0cs of
| list_nil () => d0cs
| list_cons
    (d0c, d0cs1) =>
  (
    case+
    d0c.d0ecl_node of
    | D0Cinclude _ => (emit_d0ecl (out, d0c); loop0 (out, d0cs1))
    | D0Cifdef _ => (emit_d0ecl (out, d0c); loop0 (out, d0cs1))
    | D0Cifndef _ => (emit_d0ecl (out, d0c); loop0 (out, d0cs1))
    | D0Ctypedef _ => (emit_d0ecl (out, d0c); loop0 (out, d0cs1))
    | D0Cdyncst_mac _ => (emit_d0ecl (out, d0c); loop0 (out, d0cs1))
    | D0Cdyncst_extfun _ => (emit_d0ecl (out, d0c); loop0 (out, d0cs1))
    | D0Cfundecl (fk, fd) when f0decl_is_none (fd) => (emit_d0ecl (out, d0c); loop0 (out, d0cs1))
    | D0Cclosurerize (i0de, env, arg, res) => let
        val () = f0decl_clo_insert (i0de.i0de_sym, '(env, arg, res))
        val-~Some_vt(fhead) = f0head_search_opt (i0de.i0de_sym)
        val () = emit_closurerize (out, i0de, env, arg, res, fhead)
      in
        loop0 (out, d0cs1)
      end // end of [let]
    | _ => d0cs
  ) // end of [list_cons]
) (* end of [loop0] *)
//
// TODO: for the main file, emit assembly manifest (assembly references, etc.)
// TODO: for all modules, emit .module extern for other modules?
// TODO: handle entry point
//
//
val clsname = strip_suffix (g1ofg0(fname), g1ofg0("_dats.c"))

val () = emit_text (out, ".assembly extern mscorlib { .ver 2:0:0:0 }\n")
val () = emit_text (out, ".assembly ")
val () = emit_text (out, clsname) // TODO: should it be the same as the output file name?
val () = emit_text (out, " { .ver 1:0:0:0 }")
val () = emit_ENDL (out)

val () = emit_text (out, ".module")
val () = emit_SPACE (out)
val () = emit_text (out, "'")
val () = emit_text (out, fname)
val () = emit_text (out, "'")
val () = emit_ENDL (out)
//
val () = the_namesp_push (namespace)
val () = the_module_name_set (clsname)
val d0cs = loop0 (out, d0cs) // all preprocessor definitions, types
//
val () = emit_text (out, ".namespace")
val () = emit_SPACE (out)
val () = emit_text (out, namespace)
val () = emit_SPACE (out)
val () = emit_LBRACE (out)
val () = emit_ENDL (out)
//
val () = the_clsname_push (namespace, clsname)
//
val () = emit_text (out, ".class")
val () = emit_SPACE (out)
val () = emit_text (out, clsname)
val () = emit_SPACE (out)
val () = emit_LBRACE (out)
val () = emit_ENDL (out)
val () = emit_d0eclist (out, d0cs)
val () = emit_RBRACE (out) (* end of [class] definition *)
val () = emit_text (out, "/* end of class */")
//
val () = emit_ENDL (out)
val () = emit_RBRACE (out) (* end of [namespace] definition *)
val () = emit_text (out, "/* end of namespace */")
val () = emit_ENDL (out)
//
val _ = the_clsname_pop ()
val _ = the_namesp_pop ()
//
in
  (*empty*)
end // end of [emit2_toplevel]

(* ****** ****** *)

(* end of [atsparemit_emit_cil.dats] *)
