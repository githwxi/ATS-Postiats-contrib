(* ****** ****** *)
//
// ATS-parse-emit-cil
//
(* ****** ****** *)
//
// AS-2014-08-22: start
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

(* ****** ****** *)
//
fun{}
string_skip{n:int}(str: string(n), ofs: sizeLte(n)): string
//
fun
strip_suffix{n1,n2:int}(str: string (n1), suf: string (n2)): string
//
fun
strip_prefix{n1,n2:int}(str: string(n1), pre: string(n2)): string
//
(* ****** ****** *)
//
fun label_reset () : void
//
fun make_label
  (loc: loc_t) : label
//
fun
label_for_instrlst
  (inss: instrlst) : label
//
(* ****** ****** *)
//
fun
f0head_insert
  (name: symbol, def: f0head): void
//
fun
f0head_search_opt (name: symbol): Option_vt (f0head)
//
(* ******* ****** *)
//
fun
statmps0exp_insert
  (name: symbol, s0e: s0exp): void
//
fun
statmps0exp_search_opt (name: symbol): Option_vt (s0exp)
//
(* ****** ****** *)
//
fun
f0decl_clo_insert
  (name: symbol, env: '(s0exp,s0exp,s0exp)): void
//
fun
f0decl_clo_get (name: symbol): bool
//
fun
f0decl_clo_get_sig (name: symbol): Option_vt('(s0exp,s0exp,s0exp))
//
(* ****** ****** *)

(* end of [atsparemit_syntax_cil.sats] *)
