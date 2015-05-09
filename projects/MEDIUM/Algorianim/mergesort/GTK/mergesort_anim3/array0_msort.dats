(* ****** ****** *)
//
// An implementation of mergesort
// for the purpose of animating the algorithm
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atslib_staload_libc.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/array0.sats"
//
(* ****** ****** *)
//
extern
fun{}
randint{n:pos}
  (n: int(n)): natLt(n)
implement
{}(*tmp*)
randint{n}(n) = let
  val x = $STDLIB.random()
in
  $UNSAFE.cast{natLt(n)}(x mod g0i2i(n))
end // end of [randint]
//
(* ****** ****** *)

typedef int2 = (int, int)

(* ****** ****** *)

extern
fun{a:t@ype}
array0_msort (A: array0(a)): list0 (int2)

(* ****** ****** *)

extern
fun{a:t@ype}
array0_msort2
  (A: array0(a), i: int, j: int): list0 (int2)

(* ****** ****** *)

implement
{a}(*tmp*)
array0_msort (A) =
  array0_msort2<a> (A, 0, sz2i(A.size))

(* ****** ****** *)

extern
fun{
a:t@ype
} subcirculate
  (A: array0 (a), i: int, j: int): int2

(* ****** ****** *)
//
implement
{a}(*tmp*)
subcirculate
  (A0, i, j) = let
//
val i = g1ofg0 (i)
val j = g1ofg0 (j)
val () = assertloc (i >= 0)
and () = assertloc (j >= 0)
val isz = i2sz (i) and jsz = i2sz (j)
val [n:int] (A, n) = array0_get_refsize (A0)
val () = assertloc (isz < n)
and () = assertloc (jsz < n)
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
val ((*void*)) = array_subcirculate (!p, isz, jsz)
//
in
  (i, j)
end // end of [subcirculate]
//
(* ****** ****** *)

extern
fun{
a:t@ype
} list0_merge_random
  (xs: list0(a), ys: list0(a)): list0(a)
//
implement
{a}(*tmp*)
list0_merge_random
  (xs, ys) = let
in
//
case+ xs of
| nil0 () => ys
| cons0 (x, xs1) =>
  (
    case+ ys of
    | nil0 () => xs
    | cons0 (y, ys1) => let
        val dice = randint (2)
      in
        if dice = 0
          then cons0 (x, list0_merge_random (xs1, ys))
          else cons0 (y, list0_merge_random (xs, ys1))
        // end of [if]
      end // end of [cons0]
  ) (* end of [cons0] *)
//
end // end of [list0_merge_random]
  
(* ****** ****** *)

extern
fun{
a:t@ype
} sortedmerge
  (A: array0 (a), i: int, split: int, j: int): list0(int2)
//
(* ****** ****** *)

implement
{a}(*tmp*)
array0_msort2
  (A, i, j) = let
//
val len = j - i
val xys = nil0 ()
//
in
//
if len >= 2 then let
//
val split = i + half(len)
val xys1 = array0_msort2 (A, i, split)
val xys2 = array0_msort2 (A, split, j)
val xys12 = list0_merge_random<int2> (xys1, xys2)
val xys_merge = sortedmerge (A, i, split, j)
//
in
  list0_append (xys12, xys_merge)
end else (xys) // end of [if]
//
end // end of [array0_msort2]

(* ****** ****** *)

implement
{a}(*tmp*)
sortedmerge
  (A, i, split, j) = let
in
//
if
i < split && split < j
then let
//
val sgn =
  gcompare_val_val<a> (A[i], A[split])
//
in
//
if sgn <= 0
  then let
    val xy = (i, i)
    val xys = sortedmerge<a> (A, i+1, split, j)
  in
    list0_cons{int2}(xy, xys)
  end // end of [then]
  else let
    val xy = subcirculate (A, i, split)
    val xys = sortedmerge<a> (A, i, split+1, j)
  in
    list0_cons{int2}(xy, xys)
  end // end of [else]
//
end // end of [then]
else list0_nil // end of [else]
//
end // end of [sortedmerge]

(* ****** ****** *)

(* end of [array0_msort.dats] *)

