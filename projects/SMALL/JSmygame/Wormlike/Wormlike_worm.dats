(* ****** ****** *)
//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Spring 2016
// Class Time: TR 12:30-2:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Hanwen Wu (hwwuATbuDOTedu)
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

staload "./Wormlike.sats"

(* ****** ****** *)
//
datatype
list0(a:t@ype) =
  | list0_nil of ()
  | list0_cons of (a, list0(a))
//
(* ****** ****** *)
//
extern
fun
worm_make_nil(): worm

(* ****** ****** *)
//
extern
fun
worm_decby1(worm): worm
extern
fun
worm_incby1(worm, wnode): worm
//
(* ****** ****** *)

assume
worm = list0(wnode)

(* ****** ****** *)

implement
worm_decby1(xs) = let
//
fun
aux
(
  x0: wnode
, xs: list0(wnode)
) : list0(wnode) =
(
case+ xs of
| list0_nil() => list0_nil()
| list0_cons(x, xs) =>
    list0_cons(x0, aux(x, xs))
  // end of [list0_cons]
)
//
in
//
case+ xs of
| list0_nil() => xs
| list0_cons(x0, xs1) =>
  (
    case+ xs1 of
    | list0_nil() => xs
    | list0_cons(x1, xs2) => list0_cons(x0, aux(x1, xs2))
  )
//
end // end of [worm_decby1]

implement
worm_incby1(xs, x0) = list0_cons(x0, xs)

(* ****** ****** *)

local

val
theWorm =
ref{worm}
(
  worm_make_nil()
) (* val *)

in (* in-of-local *)

implement
theWorm_get() = !theWorm

end // end of [local]

(* ****** ****** *)

(* end of [Wormlist_worm.dats] *)
