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
datavtype
parout(a:t@ype+, res:t@ype) =
  | PAROUT of (Option_vt(res), parinp(a))
//
(* ****** ****** *)

typedef
parser(
  a:t@ype, res:t@ype
) = parinp(a) -<cloref1> parout(a, res)

(* ****** ****** *)
//
fun
parser_satisfy
  {a:t@ype}
  (pred: cfun(a, bool)): parser(a, a)
//
(* ****** ****** *)

fun
parser_map
  {a:t@ype}
  {t1,t2:t@ype}
(
p0: parser(a, t1), fopr: (t1) -<cloref1> t2
) : parser(a, t2) // end of [parser_map]

(* ****** ****** *)
//
fun
parser_seq2
  {a:t@ype}
  {t1,t2:t@ype}
(
p1: parser(a, t1),
p2: parser(a, t2)
) : parser(a, $tup(t1, t2)) // end-of-function
//
(* ****** ****** *)
//
fun
parser_repeat0
  {a:t@ype}{t:t@ype}
  (p0: parser(a, t)): parser(a, list0(t))
//
(* ****** ****** *)
//
fun
parser_repeat1
  {a:t@ype}{t:t@ype}
  (p0: parser(a, t)): parser(a, list0(t))
//
(* ****** ****** *)

(* end of [parcomb.sats] *)
