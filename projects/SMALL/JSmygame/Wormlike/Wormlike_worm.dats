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

#define
ATS_STATIC_PREFIX "Wormlike_worm_"

(* ****** ****** *)

#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "Wormlike_worm_initize"

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
//
implement
worm_make_nil() = list0_nil()
//
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

extern
fun
theWorm_set(xs: worm): void

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
theWorm_get() = theWorm[]
implement
theWorm_set(xs) = theWorm[] := xs

end // end of [local]

(* ****** ****** *)
//
extern
fun
Worm_length: worm -> int
//
implement
Worm_length
  (xs) = aux(xs) where
{
//
fun
aux
(
  xs: list0(wnode)
) : int =
  case+ xs of
  | list0_nil() => 0
  | list0_cons(_, xs) => aux(xs) + 1
//
} (* end of [Worm_length] *)
//
implement
theWorm_length() = Worm_length(theWorm_get())
//
(* ****** ****** *)

implement
theWorm_insert
  ((*void*)) = let
//
val G = theGamebd_get()
//
fun
aux(xs: worm): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons
    (x, xs) => let
    val+WN(i, j) = x
    val () = G[i,j] := XN1(0)
  in
    aux(xs)
  end // end of [aux]
)
//
in
  aux(theWorm_get())
end // end of [theWorm_insert]
  
(* ****** ****** *)

implement
theWorm_remove
  ((*void*)) = let
//
val G = theGamebd_get()
//
fun
aux(xs: worm): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons
    (x, xs) => let
    val+WN(i, j) = x
    val () = G[i,j] := XN0()
  in
    aux(xs)
  end // end of [aux]
)
//
in
  aux(theWorm_get())
end // end of [theWorm_remove]

(* ****** ****** *)

//
extern
fun
theWorm_next
(
  d0: int, di: int, dj: int
) : Option(wnode)
//
implement
theWorm_next
  (d0, di, dj) = let
//
val xs = theWorm_get()
val G0 = theGamebd_get()
//
in
//
case+ xs of
| list0_nil
    () => Some(WN(0, 0))
  // list0_nil
| list0_cons
    (x0, _) => let
    val WN(i, j) = x0
    val i1 =
    (
    if di > 0
      then (if d0 > 0 then succ_row(i) else pred_row(i)) else i
    // end of [if]
    ) : int // end of [val]
    val j1 =
    (
    if dj > 0
      then (if d0 > 0 then succ_col(j) else pred_col(j)) else j
    // end of [if]
    ) : int // end of [val]
    val xn = G0[i1, j1]
  in
    case+ xn of
    | XN0() => Some(WN(i1, j1))
    | XN1(knd) => (if knd <= 0 then None() else Some(WN(i1, j1)))
  end // list0_cons
//
end // end of [Worm_next]
//
(* ****** ****** *)
//
extern
fun
theWorm_next_rand
  (): Option(wnode)
//
implement
theWorm_next_rand() = let
//
fun dirget(): int =
  if JSmath_random() < 0.5 then 0 else 1
//
val d0 = dirget()
val di = dirget()
val dj = (1 - di)
//
in
  theWorm_next(d0, di, dj)
end // end of [Worm_next_rand]
//
(* ****** ****** *)

fun
theWorm_move_with
  (opt: Option(wnode)) = let
//
val xs = theWorm_get()
//
val () = theWorm_remove()
//
(*
val () = alert("theWorm_move_with")
*)
//
in
//
case+ opt of
| None() => let
    val () =
    (
      theWorm_set(worm_decby1(xs))
    ) : void
//
//  val () = alert("theWorm_move_with: None")
//
  in
    theWorm_insert(); 0(*stay*)
  end // end of [None]
| Some(x0) => let
    val n0 = Worm_length(xs)
    val xs = worm_incby1(xs, x0)
    val () =
    (
      if n0 <= NWORM
        then theWorm_set(xs) else theWorm_set(worm_decby1(xs))
    ) : void // end of [val]
//
//  val () = alert("theWorm_move_with: Some")
//
  in
    theWorm_insert(); 1(*move*)
  end // end of [Some]
//
end // end of [theWorm_move_with]

(* ****** ****** *)

implement
theWorm_move_up() = theWorm_move_with(theWorm_next(0, 1, 0))
implement
theWorm_move_down() = theWorm_move_with(theWorm_next(1, 1, 0))

implement
theWorm_move_left() = theWorm_move_with(theWorm_next(0, 0, 1))
implement
theWorm_move_right() = theWorm_move_with(theWorm_next(1, 0, 1))

(* ****** ****** *)

implement
theWorm_move_rand() = theWorm_move_with(theWorm_next_rand())

(* ****** ****** *)

(* end of [Wormlist_worm.dats] *)
