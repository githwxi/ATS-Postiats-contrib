(*
** HX-2016-11-27:
** Parsing combinators for libatscc
*)

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

(* ****** ****** *)
//
datavtype
parinp(a: t@ype+) =
  | PARINP0 of ()
  | PARINP1 of stream_vt(a)
  | PARINP2 of (List1(a), stream_vt(a))
//
(* ****** ****** *)
//
fun
parinp2{a:t@ype}
  (List0(a), stream_vt(a)): parinp(a)
//
(* ****** ****** *)
//
datavtype
parout(a: t@ype, res:t@ype) =
  | PAROUT of (Option_vt(res), parinp(a))
//
(* ****** ****** *)

typedef parser
(
  a:t@ype, res:t@ype+
) = parinp(a) -<cloref1> parout(a, res)

(* ****** ****** *)
//
fun
parse_satisfy
  {a:t@ype}
  (parinp(a), cfun(a, bool)): parout(a, a)
//
(* ****** ****** *)
//
fun
parse_repeat0
  {a:t@ype}{t:t@ype}
  (parinp(a), parser(a, t)): parout(a, list0(t))
//
(* ****** ****** *)
//
fun
parse_repeat1
  {a:t@ype}{t:t@ype}
  (parinp(a), parser(a, t)): parout(a, list0(t))
//
(* ****** ****** *)

(* end of [parcomb.sats] *)
