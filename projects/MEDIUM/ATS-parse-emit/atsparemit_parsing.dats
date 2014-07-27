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
  if f (tok.token_node) then let
    val () = tokbuf_incby1 (buf) in true
  end else false
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
  end
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
    val id = synent_decode2{i0de}(ent)
    val opt = parse_s0exparg (buf, bt, err)
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
  
implement
parse_s0exparg
  (buf, bt, err) = let
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
| T_LPAREN () => let
    val err0 = err
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
end // end of [parse_s0exparg]
  
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
