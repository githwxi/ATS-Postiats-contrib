(* ****** ****** *)
//
// An implementation of quicksort
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
array0_qsort (A: array0(a)): list0 (int2)

(* ****** ****** *)

extern
fun{a:t@ype}
array0_qsort2
  (A: array0(a), i: int, j: int): list0 (int2)

(* ****** ****** *)

implement
{a}(*tmp*)
array0_qsort (A) =
  array0_qsort2<a> (A, 0, sz2i(A.size))

(* ****** ****** *)
//
extern
fun{
a:t@ype
} array0_swap
  (A: array0 (a), i: int, j: int): int2
//
implement
{a}(*tmp*)
array0_swap
  (A, i, j) = let
  val x = A[i]
  val () = A[i] := A[j]
  val () = A[j] := x
in
  (i, j)
end // end of [array0_swap]
//
(* ****** ****** *)
//
extern
fun{
a:t@ype
} pivot_choose
  (A: array0(a), i: int, j: int): int
//
implement
{a}(*tmp*)
pivot_choose
  (A, i, j) = let
  val len = g1ofg0 (j - i)
  val ((*void*)) = assertloc (len >= 1)
in
  i + randint (len)
end // end of [pivot_choose]
//
(* ****** ****** *)
//
extern
fun{
a:t@ype
} partition
(
  A: array0(a), i: int, j: int, xys: list0(int2)
) : (int, list0(int2))
//
(* ****** ****** *)

implement
{a}(*tmp*)
partition
(
  A, i, j, xys
) = let
//
val last = j-1
val pivot = A[last]
//
fnx loop1
(
  i: int, j: int, xys: list0(int2)
) : (int, list0(int2)) = let
in
//
if
i < j
then let
  val sgn = gcompare_val_val<a> (A[i], pivot)
in
//
if sgn < 0
  then loop1 (i+1, j, xys) else loop2 (i, j, xys)
//
end // end of [then]
else (i, xys) // end of [else]
//
end // end of [loop1]

and loop2
(
  i: int, j: int, xys: list0(int2)
) : (int, list0(int2)) = let
in
//
if
i < j
then let
  val sgn = gcompare_val_val<a> (pivot, A[j-1])
in
//
if sgn <= 0
  then loop2 (i, j-1, xys)
  else loop1 (i+1, j-1, cons0 (array0_swap (A, i, j-1), xys))
//
end // end of [then]
else (i, xys) // end of [else]
//
end // end of [loop2]
//
in
  loop1 (i, j-1, xys)
end // end of [partition]

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

implement
{a}(*tmp*)
array0_qsort2
  (A, i, j) = let
//
val xys = nil0 ()
//
in
//
if j-i >= 2 then let
//
val pind =
  pivot_choose (A, i, j)
val xy = array0_swap (A, pind, j-1)
val xys = cons0{int2}(xy, xys)
val (split, xys) = partition (A, i, j, xys)
val xy = array0_swap (A, split, j-1)
val xys = cons0{int2}(xy, xys)
//
val xys0 = list0_reverse (xys)
//
val xys1 = array0_qsort2 (A, i, split)
and xys2 = array0_qsort2 (A, split+1, j)
val xys12 = list0_merge_random<int2> (xys1, xys2)
//
in
  list0_append (xys0, xys12)
end else (xys) // end of [if]
//
end // end of [array0_qsort2]

(* ****** ****** *)

(* end of [array0_qsort.dats] *)

