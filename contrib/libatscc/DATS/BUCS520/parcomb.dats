(*
** HX-2016-11-27:
** Parsing combinators for libatscc
*)

(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
staload
"libats/ML/SATS/list0.sats"
//
staload
"./../../SATS/BUCS520/parcomb.sats"
//
(* ****** ****** *)
//
implement
parser_satisfy
  {a}(pred) = lam(xs0) =>
(
  case+ !xs0 of
  | stream_nil() =>
    PAROUT(None_vt{a}(), xs0)
  | stream_cons(x1, xs1) =>
    if pred(x1)
      then PAROUT(Some_vt(x1), xs1)
      else PAROUT(None_vt{a}(), xs0)
    // end of [if[
) (* end of [parse_satisfy] *)
//
(* ****** ****** *)

implement
parser_map
{a}{t1,t2}
(
  p0, fopr
) = lam(inp0) => let
//
val+
~PAROUT(opt, inp1) = p0(inp0)
//
in
  case+ opt of
  | ~None_vt() =>
    PAROUT(None_vt{t2}(), inp0)
  | ~Some_vt(x) =>
    PAROUT(Some_vt(fopr(x)), inp1)
end // end of [parser_map]

(* ****** ****** *)

implement
parser_seq2
{a}{t1,t2}
  (p1, p2) = lam(inp0) => let
//
typedef t12 = $tup(t1, t2)
//
val+
~PAROUT(opt, inp1) = p1(inp0)
//
in
//
case+ opt of
| ~None_vt() =>
    PAROUT(None_vt{t12}(), inp0)
  // end of [None_vt]
| ~Some_vt(x1) => let
    val+
    ~PAROUT(opt, inp2) = p2(inp1)
  in
    case+ opt of
    | ~None_vt() =>
      PAROUT(None_vt{t12}(), inp0)
    | ~Some_vt(x2) =>
      PAROUT(Some_vt($tup(x1, x2)), inp2)
  end // end of [Some_vt]
//
end // end of [parser_seq2]

(* ****** ****** *)

implement
parser_repeat0
  {a}{t}
  (p0) = lam(inp0) => let
//
fun
auxlst
(
  inp: parinp(a), xs: List0_vt(t)
) : parout(a, list0(t)) = let
//
val+~PAROUT(opt, inp) = p0(inp)
//
in
  case+ opt of
  | ~None_vt() => let
      val xs = list_vt_reverse(xs)
    in
      PAROUT(Some_vt(g0ofg1(xs)), inp)
    end // end of [None_vt]
  | ~Some_vt(x) => auxlst(inp, list_vt_cons(x, xs))
end // end of [auxlst]
//
in
  auxlst(inp0, list_vt_nil((*void*)))
end // end of [parse_repeat0]

(* ****** ****** *)

implement
parser_repeat1
  {a}{t}
  (p0) = lam(inp0) => let
//
typedef ts = list0(t)
//
val+
~PAROUT(opt, inp1) = p0(inp0)
//
in
//
case+ opt of
| ~None_vt() =>
    PAROUT(None_vt{ts}(), inp0)
  // end of [None_vt]
| ~Some_vt(x) => let
    val+
    ~PAROUT
      (opt, inp2) = parser_repeat0(p0)(inp1)
    // end of [val]
    val-~Some_vt(xs) = opt
  in
    PAROUT(Some_vt(list0_cons(x, xs)), inp2)
  end // end of [Some_vt]
//
end // end of [parse_repeat1]

(* ****** ****** *)

(* end of [parcomb.dats] *)
