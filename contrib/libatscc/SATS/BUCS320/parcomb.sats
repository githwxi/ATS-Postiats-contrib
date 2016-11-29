(*
** HX-2016-11-27:
** Parsing combinators for libatscc
*)

(* ****** ****** *)

staload "libats/ML/SATS/basis.sats"

(* ****** ****** *)
//
typedef
parinp(a:t@ype) = stream(a)
//
(* ****** ****** *)
//
datatype
parout(a:t@ype+, res:t@ype) =
  | PAROUT of (Option(res), parinp(a))
//
(* ****** ****** *)

typedef
parser(
  a:t@ype, res:t@ype
) = parinp(a) -<cloref1> parout(a, res)

(* ****** ****** *)
//
fun
parser_fail
  {a:t@ype}{t:t@ype}(): parser(a, t)
fun
parser_succeed
  {a:t@ype}{t:t@ype}(x0: t): parser(a, t)
//
(* ****** ****** *)
//
fun
parser_satisfy
  {a:t@ype}
  (pred: cfun(a, bool)): parser(a, a)
//
(* ****** ****** *)
//
fun
parser_join2
  {a:t@ype}
  {t1,t2:t@ype}
(
p1: parser(a, t1),
p2: parser(a, t2)
) : parser(a, $tup(t1, t2)) // end-of-function
//
fun
parser_join3
  {a:t@ype}
  {t1,t2,t3:t@ype}
(
p1: parser(a, t1),
p2: parser(a, t2),
p3: parser(a, t3)
) : parser(a, $tup(t1, t2, t3)) // end-of-function
//
(* ****** ****** *)
//
fun
parser_tup2_fst
  {a:t@ype}
  {t1,t2:t@ype}
(
p1: parser(a, t1), p2: parser(a, t2)
) : parser(a, t1) // end-of-function
fun
parser_tup2_snd
  {a:t@ype}
  {t1,t2:t@ype}
(
p1: parser(a, t1), p2: parser(a, t2)
) : parser(a, t2) // end-of-function
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
parser_map
  {a:t@ype}
  {t:t@ype}{u:t@ype}
(
p0: parser(a, t), fopr: (t) -<cloref1> u
) : parser(a, u) // end of [parser_map]
//
fun
parser_map2
  {a:t@ype}
  {t1,t2:t@ype}{u3:t@ype}
(
p1: parser(a, t1),
p2: parser(a, t2), fopr: (t1, t2) -<cloref1> u3
) : parser(a, u3) // end of [parser_map2]
//
(* ****** ****** *)
//
fun
parser_orelse
  {a:t@ype}{t:t@ype}
  (p1: parser(a, t), p2: parser(a, t)): parser(a, t)
//
(* ****** ****** *)
//
fun
parser_repeat0
  {a:t@ype}{t:t@ype}(parser(a, t)): parser(a, list0(t))
//
(* ****** ****** *)
//
fun
parser_repeat1
  {a:t@ype}{t:t@ype}(parser(a, t)): parser(a, list0(t))
//
(* ****** ****** *)

(* end of [parcomb.sats] *)
