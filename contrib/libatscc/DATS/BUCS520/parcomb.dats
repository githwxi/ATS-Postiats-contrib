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
parinp2(xs1, xs2) =
(
case+ xs1 of
| list_nil() => PARINP1(xs2)
| list_cons _ => PARINP2(xs1, xs2)
)
//
(* ****** ****** *)
//
implement
parse_satisfy
  {a}(inp, pred) =
(
case+ inp of
| ~PARINP0() =>
    PAROUT(None_vt{a}(), PARINP0())
  // end of [PARINP0]
| ~PARINP1(xs2) =>
  (
    case+ !xs2 of
    | ~stream_vt_nil() =>
        PAROUT(None_vt{a}(), PARINP0())
    | ~stream_vt_cons(x2, xs2) =>
        if pred(x2)
          then PAROUT(Some_vt(x2), PARINP1(xs2))
          else PAROUT(None_vt{a}(), PARINP2(list_sing(x2), xs2))
        // end of [if]
  ) (* end of [PARINP1] *)
| ~PARINP2(xs1, xs2) => let
    val+list_cons(x1, xs1_tl) = xs1
  in
    if pred(x1)
      then PAROUT(Some_vt(x1), parinp2(xs1_tl, xs2))
      else PAROUT(None_vt{a}(), PARINP2(xs1, xs2))
    // end of [if]
  end // end of [PARINP2]
)
//
(* ****** ****** *)

implement
parse_repeat0
  {a}{t}
  (inp, parser) = let
//
fun
auxlst
(
  inp: parinp(a), xs: List0_vt(t)
) : parout(a, list0(t)) = let
//
val+~PAROUT(opt, inp) = parser(inp)
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
  auxlst(inp, list_vt_nil((*void*)))
end // end of [parse_repeat0]

(* ****** ****** *)

implement
parse_repeat1
  {a}{t}
  (inp, parser) = let
//
typedef ts = list0(t)
//
val+
~PAROUT(opt, inp) = parser(inp)
//
in
//
case+ opt of
| ~None_vt() =>
    PAROUT(None_vt{ts}(), inp)
  // end of [None_vt]
| ~Some_vt(x) => let
    val+
    ~PAROUT
      (opt, inp) = parse_repeat0(inp, parser)
    // end of [val]
    val-~Some_vt(xs) = opt
  in
    PAROUT(Some_vt(list0_cons(x, xs)), inp)
  end // end of [Some_vt]
//
end // end of [parse_repeat1]

(* ****** ****** *)

(* end of [parcomb.dats] *)
