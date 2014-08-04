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
staload "./atsparemit_syntax.sats"
staload "./atsparemit_parsing.sats"

(* ****** ****** *)

infix ++
overload ++ with location_combine

(* ****** ****** *)

implement
parse_d0exp
  (buf, bt, err) = let
//
var err0 = err
var ent: synent?
//
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
      end // end of [Some]
  end
//
| T_KWORD(ATSPMVi0nt()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, p_INT, err0)
    val ent3 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then ATSPMVi0nt_make (tok, ent2, ent3)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSPMVi0nt]
//
| T_KWORD(ATSSELcon()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_s0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent6 = pif_fun (buf, bt, err, parse_label, err0)
    val ent7 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then ATSSELcon_make (tok, ent2, ent4, ent6, ent7)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSSELcon]
//
| T_KWORD(ATSSELboxrec()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_s0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent6 = pif_fun (buf, bt, err, parse_label, err0)
    val ent7 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then ATSSELboxrec_make (tok, ent2, ent4, ent6, ent7)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSSELboxrec]
| T_KWORD(ATSSELfltrec()) => let
    val bt = 0
    val () = incby1 ()
    val ent1 = p_LPAREN (buf, bt, err)
    val ent2 = pif_fun (buf, bt, err, parse_d0exp, err0)
    val ent3 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent4 = pif_fun (buf, bt, err, parse_s0exp, err0)
    val ent5 = pif_fun (buf, bt, err, p_COMMA, err0)
    val ent6 = pif_fun (buf, bt, err, parse_label, err0)
    val ent7 = pif_fun (buf, bt, err, p_RPAREN, err0)
  in
    if err = err0
      then ATSSELfltrec_make (tok, ent2, ent4, ent6, ent7)
      else tokbuf_set_ntok_null (buf, n0)
    // end of [if]
  end // end of [ATSSELfltrec]
//
| _ => let
    val () = err := err + 1
    val () = the_parerrlst_add_ifnbt (bt, loc, PARERR_d0exp)
  in
    synent_null ()
  end (* end of [_] *)
//
end // end of [parse_d0exp]

(* ****** ****** *)

extern
fun parse_d0expseq : parser (d0explst)
implement
parse_d0expseq
  (buf, bt, err) =
  list_vt2t(pstar_fun0_COMMA (buf, bt, parse_d0exp))
// end of [parse_d0expseq]

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
    val d0es = parse_d0expseq (buf, bt, err)
    val tok2 = p_RPAREN (buf, bt, err)
  in
    if err = err0
      then let
        val d2e =
        d0exp_list (loc ++ tok2.token_loc, d0es)
      in
        Some (d2e)
      end // end of [then]
      else let
        val () = tokbuf_set_ntok (buf, n0) in None ()
      end // end of [else]
  end
//
| _ (*non-LPAERN*) => None ()
//
end // end of [parse_d0expargopt]

(* ****** ****** *)

(* end of [atsparemit_parsing_d0exp.dats] *)
