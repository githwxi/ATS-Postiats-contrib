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
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"
staload "./atsparemit_parsing.sats"

(* ****** ****** *)

#define NULL the_null_ptr

(* ****** ****** *)

fun
token_null
(
// argumentless
) : token = $UN.cast{token}(NULL)

(* ****** ****** *)

implement
tokbuf_set_ntok_null
  (buf, n0) = let
  val () = tokbuf_set_ntok (buf, n0) in synent_null ()
end // end of [tokbuf_set_ntok_null]

(* ****** ****** *)

implement
ptoken_fun
(
  buf, bt, err, f, enode
) = let
  val tok = tokbuf_get_token (buf)
in
  if f (tok.token_node) then let
    val () = tokbuf_incby1 (buf) in tok
  end else let
    val loc = tok.token_loc
    val () = err := err + 1
    val () = the_parerrlst_add_ifnbt (bt, loc, enode)
  in
    token_null ()
  end // end of [_]
//
end // end of [ptoken_fun]

(* ****** ****** *)

implement
ptoken_test_fun
  (buf, f) = let
  val tok = tokbuf_get_token (buf)
in
//
if f(tok.token_node)
  then let
    val () = tokbuf_incby1 (buf) in true
  end // end of [then]
  else false // end of [else]
//
end // end of [ptoken_test_fun]

(* ****** ****** *)
//
implement
is_EOF (x) = case+ x of
  | T_EOF () => true | _ => false
//
implement
p_EOF (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_EOF, PARERR_EOF)
//
(* ****** ****** *)
//
implement
is_COMMA (x) = case+ x of
  | T_COMMA () => true | _ => false
//
implement
p_COMMA (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_COMMA, PARERR_COMMA)
//
implement
p_COMMA_test (buf) = ptoken_test_fun (buf, is_COMMA)
//
(* ****** ****** *)
//
implement
is_COLON (x) = case+ x of
  | T_COLON () => true | _ => false
//
implement
p_COLON (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_COLON, PARERR_COLON)
//
implement
p_COLON_test (buf) = ptoken_test_fun (buf, is_COLON)
//
(* ****** ****** *)
//
implement
is_SEMICOLON (x) = case+ x of
  | T_SEMICOLON () => true | _ => false
//
implement
p_SEMICOLON (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_SEMICOLON, PARERR_SEMICOLON)
//
implement
p_SEMICOLON_test (buf) = ptoken_test_fun (buf, is_SEMICOLON)
//
(* ****** ****** *)
//
implement
is_LPAREN (x) = case+ x of
  | T_LPAREN () => true | _ => false
implement
p_LPAREN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_LPAREN, PARERR_LPAREN)
//
implement
is_RPAREN (x) = case+ x of
  | T_RPAREN () => true | _ => false
implement
p_RPAREN (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_RPAREN, PARERR_RPAREN)
//
(* ****** ****** *)
//
implement
is_LBRACE (x) = case+ x of
  | T_LBRACE () => true | _ => false
implement
p_LBRACE (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_LBRACE, PARERR_LBRACE)
//
(* ****** ****** *)
//
implement
is_RBRACE (x) = case+ x of
  | T_RBRACE () => true | _ => false
implement
p_RBRACE (buf, bt, err) =
  ptoken_fun (buf, bt, err, is_RBRACE, PARERR_RBRACE)
//
(* ****** ****** *)

implement
ptest_fun{a}
  (buf, f, ent) = let
  var err: int = 0
  val () = ent := synent_encode (f (buf, 1(*bt*), err))
in
  err = 0
end // end of [ptest_fun]

(* ****** ****** *)
//
// HX: looping if [f] is nullable!
//
implement
pstar_fun{a}
  (buf, bt, f) = let
//
vtypedef res_vt = List0_vt (a)
//
fun
loop
(
  buf: &tokbuf >> _
, res: &res_vt? >> _, err: &int
) : void = let
  val x = f (buf, 1(*bt*), err)
in
//
if
err > 0
then (res := list_vt_nil)
else let
  val () =
    res := list_vt_cons{a}{0}(x, _)
  // end of [val]
  val+list_vt_cons(_, res1) = res
  val ((*void*)) = loop (buf, res1, err)
  prval () = fold@ (res)
in
  // nothing
end // end of [else]
//
end // end of [loop]
//
var res: ptr
var err: int = 0
val () = loop (buf, res, err)
//
in
  res (* properly ordered *)
end // end of [pstar_fun]

(* ****** ****** *)
//
// HX: looping if [f] is nullable!
//
implement
pstar_sep_fun{a}
  (buf, bt, sep, f) = let
//
vtypedef res_vt = List0_vt (a)
//
fun loop (
  buf: &tokbuf
, res: &res_vt? >> _
, err: &int
) : void = let
  val n0 = tokbuf_get_ntok (buf)
in
//
if sep(buf)
  then let
    val x = f (buf, 0(*bt*), err)
  in
    case+ 0 of
    | _ when err > 0 => let
        val () = tokbuf_set_ntok (buf, n0)
        val () = res := list_vt_nil ()
      in
        // nothing
      end
    | _ (*no-error*) => let
        val () =
        res := list_vt_cons{a}{0}(x, _)
        val+list_vt_cons (_, res1) = res
        val ((*void*)) = loop (buf, res1, err)
        prval ((*void*)) = fold@ (res)
      in    
        // nothing
      end
    // end of [case+]
 end // end of [then]
 else (res := list_vt_nil ())
//
end // end of [loop]
//
var res: ptr
var err: int = 0
val () = loop (buf, res, err)
//
in
  res (* properly ordered *)
end // end of [pstar_sep_fun]

(* ****** ****** *)
//
implement
pstar_COMMA_fun{a}
  (buf, bt, f) = pstar_sep_fun (buf, bt, p_COMMA_test, f)
//
(* ****** ****** *)

implement
pstar_fun0_sep
  (buf, bt, f, sep) = let
  var err: int = 0
  val x0 = f (buf, 1(*bt*), err)
in
//
case+ 0 of
| _ when err > 0 =>
    list_vt_nil ()
//
| _ (*no-error*) => let
    val xs =
      pstar_sep_fun (buf, 1(*bt*), sep, f)
    // end of [val]
  in
    list_vt_cons (x0, xs)
  end // end of [_]
//
end // end of [pstar_fun0_sep]

(* ****** ****** *)

implement
pstar_fun0_COMMA
  (buf, bt, f) =
  pstar_fun0_sep (buf, bt, f, p_COMMA_test)
// end of [pstar_fun0_COMMA]

(* ****** ****** *)

implement
pif_fun (
  buf, bt, err, f, err0
) = (
//
if err <= err0
  then f (buf, bt, err) else synent_null ((*void*))
//
) (* end of [pif_fun] *)

(* ****** ****** *)

implement
parse_i0de
  (buf, bt, err) = let
//
val tok =
  tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
//
| T_IDENT_alp (x) => let
    val () = incby1 () in i0de_make_string (loc, x)
  end // end of [T_IDENT_alp]
//
| _ => let
    val () = err := err + 1
    val () = the_parerrlst_add_ifnbt (bt, loc, PARERR_i0de)
  in
    synent_null ()
  end // end of [_]
//
end // end of [parse_i0de]

(* ****** ****** *)

infix ++
overload ++ with location_combine

(* ****** ****** *)

implement
parse_s0exp
  (buf, bt, err) = let
//
var err0 = err
var ent: synent?
//
val tok =
  tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+ 0 of
//
| _ when
    ptest_fun
    (
      buf, parse_i0de, ent
    ) => let
    val bt = 0
    val id = synent_decode2{i0de}(ent)
    val opt = parse_s0expargopt (buf, bt, err)
  in
    case+ opt of
    | None () => s0exp_ide (loc, id)
    | Some (s0e) => let
        val-S0Elist (s0es) = s0e.s0exp_node
      in
        s0exp_appid (loc ++ s0e.s0exp_loc, id, s0es)
      end
  end
//
| _ => let
    val () = err := err + 1
    val () = the_parerrlst_add_ifnbt (bt, loc, PARERR_s0exp)
  in
    synent_null ()
  end (* end of [_] *)
//
end // end of [parse_s0exp]

(* ****** ****** *)

(*
//
s0expargopt =
  | /* empty */
  | '(' s0expseq ')'
//
*)
  
implement
parse_s0expargopt
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
//
| T_LPAREN () => let
    val bt = 0
    val () = incby1 ()
    val s0es =
      pstar_fun0_COMMA (buf, bt, parse_s0exp)
    val tok2 = p_RPAREN (buf, bt, err)
  in
    if err = err0
      then let
        val s2e =
        s0exp_list (loc ++ tok2.token_loc, list_vt2t(s0es))
      in
        Some (s2e)
      end // end of [then]
      else let
        val () = list_vt_free (s0es)
        val () = tokbuf_set_ntok (buf, n0)
      in
        None ()
      end // end of [else]
  end
//
| _(*non-LPAERN*) => None ()
//
end // end of [parse_s0expargopt]
  
(* ****** ****** *)

implement
parse_d0exp
  (buf, bt, err) = let
//
var err0 = err
var ent: synent?
//
val tok =
  tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+ 0 of
//
| _ when
    ptest_fun
    (
      buf, parse_i0de, ent
    ) => let
    val bt = 0
    val id = synent_decode2{i0de}(ent)
    val opt = parse_d0expargopt (buf, bt, err)
  in
    case+ opt of
    | None () => d0exp_ide (loc, id)
    | Some (d0e) => let
        val-D0Elist (d0es) = d0e.d0exp_node
      in
        d0exp_appid (loc ++ d0e.d0exp_loc, id, d0es)
      end
  end
//
| _ => let
    val () = err := err + 1
    val () = the_parerrlst_add_ifnbt (bt, loc, PARERR_d0exp)
  in
    synent_null ()
  end (* end of [_] *)
//
end // end of [parse_s0exp]

(* ****** ****** *)

(*
//
d0expargopt =
  | /* empty */
  | '(' d0expseq ')'
//
*)
  
implement
parse_d0expargopt
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
//
| T_LPAREN () => let
    val bt = 0
    val () = incby1 ()
    val d0es =
      pstar_fun0_COMMA (buf, bt, parse_d0exp)
    val tok2 = p_RPAREN (buf, bt, err)
  in
    if err = err0
      then let
        val s2e =
        d0exp_list (loc ++ tok2.token_loc, list_vt2t(d0es))
      in
        Some (s2e)
      end // end of [then]
      else let
        val () = list_vt_free (d0es)
        val () = tokbuf_set_ntok (buf, n0)
      in
        None ()
      end // end of [else]
  end
//
| _(*non-LPAERN*) => None ()
//
end // end of [parse_d0expargopt]

(* ****** ****** *)

implement
parse_f0arg
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
//
val ent1 = parse_s0exp (buf, bt, err)
val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
//
in
//
if
err = err0 
then f0arg_make (ent1, ent2)
else tokbuf_set_ntok_null (buf, n0)
//
end // end of [parse_f0arg]

(* ****** ****** *)

(*

f0marg = '(' f0argseq ')'

*)

implement
parse_f0marg
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
//
| T_LPAREN () => let
    val bt = 0
    val () = incby1 ()
    val ent2 =
      pstar_fun0_COMMA (buf, bt, parse_f0arg)
    val ent3 = p_RPAREN (buf, bt, err) // err = err0
  in
    if err = err0
      then f0marg_make (tok, list_vt2t(ent2), ent3)
      else let
        val () = list_vt_free (ent2) in synent_null ()
      end // end of [else]
    // end of [if]
  end // end of [T_LPAREN]
//
| _ (*error*) => let
    val () = err := err + 1 in synent_null ()
  end (* end of [_] *)
//
end // end of [parse_f0marg]

(* ****** ****** *)

implement
parse_f0kind
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
| T_KWORD
  (
    ATSglobaldec()
  ) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then f0kind_global (tok, ent2)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end
| T_KWORD
  (
    ATSstaticdec()
  ) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then f0kind_static (tok, ent2)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end
| _ (*error*) => let
    val () = err := err + 1 in synent_null ()
  end (* end of [_] *)
//
end // end of [parse_f0kind]

(* ****** ****** *)

implement
parse_f0head
  (buf, bt, err) = let
//
val err0 = err
val ntok0 = tokbuf_get_ntok (buf)
//
val ent1 = parse_f0kind (buf, bt, err)
val ent2 = pif_fun (buf, bt, err, parse_s0exp, err0)
val ent3 = pif_fun (buf, bt, err, parse_i0de, err0)
val ent4 = pif_fun (buf, bt, err, parse_f0marg, err0)
//
in
//
if
err = err0
then f0head_make (ent1, ent2, ent3, ent4)
else tokbuf_set_ntok_null (buf, ntok0)
//
end // end of [parse_f0head]

(* ****** ****** *)

implement
parse_tmpdec
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
| T_KWORD(ATStmpdec()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_s0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then tmpdec_make (tok, ent2, ent4, ent5)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [T_KWORD(ATStmpdec)]
| _ (*error*) => let
    val () = err := err + 1 in synent_null ()
  end (* end of [_] *)
//
end // end of [parse_tmpdec]

(* ****** ****** *)
//
implement
parse_tmpdecs
  (buf, bt, err) =
  list_vt2t (pstar_fun (buf, bt, parse_tmpdec))
//
(* ****** ****** *)

extern fun parse_ATSthen : parser (instr)
extern fun parse_ATSelseopt : parser (instropt)

(* ****** ****** *)

implement
parse_instr
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
//
| T_KWORD(ATSINSlab()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_COLON, err0)
  in
    if err = err0
      then ATSINSlab_make (tok, ent2, ent4)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [T_KWORD(ATSINSlab)]
//
| T_KWORD(ATSINSmove()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent6 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then ATSINSmove_make (tok, ent2, ent4, ent5)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [T_KWORD(ATSINSmove)]
//
| T_KWORD(ATSif()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, parse_ATSthen, err0)
    val ent5 = pif_fun (buf, bt, err, parse_ATSelseopt, err0)
  in
    if err = err0
      then ATSif_make (tok, ent2, ent4, ent5)
      else tokbuf_set_ntok_null (buf, n0)
  end // end of [T_KWORD(ATSif)]
//
| T_KWORD(ATSreturn()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then ATSreturn_make (tok, ent2, ent4)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [T_KWORD(ATSreturn)]
| T_KWORD(ATSreturn_void()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_i0de, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent4 = pif_fun (buf, bt, err, p_SEMICOLON, err0)
  in
    if err = err0
      then ATSreturn_void_make (tok, ent2, ent4)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [T_KWORD(ATSreturn_void)]
//
| _ (*error*) => let
    val () = err := err + 1 in synent_null ()
  end (* end of [_] *)
//
end // end of [parse_instr]

(* ****** ****** *)
//
implement
parse_instrseq
  (buf, bt, err) =
  list_vt2t (pstar_fun (buf, bt, parse_instr))
//
(* ****** ****** *)

implement
parse_ATSthen
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
| T_KWORD(ATSthen()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, p_LBRACE, err0)
    val ent4 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent5 = pif_fun (buf, bt, err, p_RBRACE, err0)
  in
    if err = err0
      then ATSthen_make (tok, ent4, ent5)
      else tokbuf_set_ntok_null (buf, n0)
  end // end of [T_KWORD(ATSthen)]
//
| _ (*error*) => let
    val () = err := err + 1 in synent_null ()
  end (* end of [_] *)
//
end // end of [parse_ATSthen]

(* ****** ****** *)

implement
parse_ATSelseopt
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
| T_KWORD(ATSelse()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_RPAREN, err0)
    val ent3 = pif_fun (buf, bt, err, p_LBRACE, err0)
    val ent4 = pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent5 = pif_fun (buf, bt, err, p_RBRACE, err0)
  in
    if err = err0
      then Some(ATSelse_make (tok, ent4, ent5)) else None()
    // end of [if]
  end // end of [T_KWORD(ATSelse)]
//
| _ (*non-ATSelse*) => None ()
//
end // end of [parse_ATSelseopt]

(* ****** ****** *)

implement
parse_f0body
  (buf, bt, err) = let
//
val err0 = err
val n0 = tokbuf_get_ntok (buf)
val tok = tokbuf_get_token (buf)
val loc = tok.token_loc
//
macdef incby1 () = tokbuf_incby1 (buf)
//
in
//
case+
tok.token_node of
| T_LBRACE () => let
    val bt = 0
    val () = incby1 ()
    val ent1 =
      pif_fun (buf, bt, err, parse_tmpdecs, err0)
    val ent2 =
      pif_fun (buf, bt, err, parse_instrseq, err0)
    val ent3 = pif_fun (buf, bt, err, p_RBRACE, err0)
  in
    if err = err0
      then f0body_make (tok, ent1, ent2, ent3)
      else tokbuf_set_ntok_null (buf, n0)
  end // end of [T_LBRACE]
| _ (*error*) => let
    val () = err := err + 1 in synent_null ()
  end (* end of [_] *)
//
end // end of [parse_f0body]

(* ****** ****** *)

implement
parse_f0decl
  (buf, bt, err) = let
//
val err0 = err
var ent: synent?
val ntok0 = tokbuf_get_ntok (buf)
//
val ent1 = parse_f0head (buf, bt, err)
//
in
//
if (
err = err0
) then (
case+ 0 of
| _ when
    p_SEMICOLON_test (buf) => f0decl_none (ent1)
| _ when
    ptest_fun
    (
      buf, parse_f0body, ent
    ) => let
      val ent2 = synent_decode2{f0body}(ent)
    in
      f0decl_some (ent1, ent2)
    end // ...
| _ (*error*) => tokbuf_set_ntok_null (buf, ntok0)
) else (
  tokbuf_set_ntok_null (buf, ntok0)
) (* end of [if] *)
//
end // end of [parse_f0decl]

(* ****** ****** *)

implement
parse_from_string
  (inp, f) = let
//
var buf: tokbuf
val () = tokbuf_initize_string (buf, inp)
//
var nerr: int = 0
val res = f (buf, 0(*bt*), nerr)
val _(*EOF*) = p_EOF (buf, 0, nerr) // HX: all tokens need to consumed
//
val () = tokbuf_uninitize (buf)
//
in
  if nerr = 0 then Some_vt (res) else None_vt ()
end // end of [parser_from_string]

(* ****** ****** *)

fun
tokbuf_process
(
  buf: &tokbuf >> _
) : void = let
//
val tok = tokbuf_getinc_token (buf)
//
in
//
case+
tok.token_node
of (* case+ *)
| T_EOF () => ()
| _ (*non-EOF*) =>
  {
    val () =
    println! ("tok = ", tok)
    val () =  tokbuf_process (buf)
  } (* end of [_] *)
//
end // end of [tokbuf_process]

(* ****** ****** *)

implement
parse_from_tokbuf
  (buf) = let
//
val () = the_lexerrlst_clear ()
val () = the_parerrlst_clear ()
//
val ((*void*)) = tokbuf_process (buf)
//
val nerr1 = the_lexerrlst_print_free ((*void*))
val nerr2 = the_parerrlst_print_free ((*void*))
//
in
  // nothing
end // end of [parse_from_tokbuf]

(* ****** ****** *)

implement
parse_from_fileref
  (inp) = let
//
var buf: tokbuf
val () =
  tokbuf_initize_fileref (buf, inp)
//
val () = parse_from_tokbuf (buf)
//
val () = tokbuf_uninitize (buf)
//
in
  // nothing
end // end of [parse_from_fileref]

(* ****** ****** *)

(* end of [atsparemit_parsing.dats] *)
