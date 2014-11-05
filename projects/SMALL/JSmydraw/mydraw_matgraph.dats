(* ****** ****** *)
//
// mydraw_matgraph:
// For drawing matrices
//
(* ****** ****** *)
//
// HX-2014-11-04:
// it is adapted from
// previous code made for teaching
//
(* ****** ****** *)

staload "./mydraw.dats"

(* ****** ****** *)
//
// HX-2014-11-04:
// p1, p2, p3 and p4 are positioned CCW
//
extern
fun{}
mydraw_matgraph
(
  m: intGte(1), n: intGte(1)
, p1: point, p2: point, p3: point, p4: point
) : void // end of [mydraw_matgraph]
//
extern
fun{}
mydraw_matgraph$fcell
(
  i: intGte(0), j: intGte(0)
, p1: point, p2: point, p3: point, p4: point
) : void // end-of-function
//
(* ****** ****** *)

implement
{}(*tmp*)
mydraw_matgraph
(
  m, n, p1, p2, p3, p4
) = let
//
val a = 1.0 / m
val b = 1.0 / n
val v12 = a * (p2 - p1)
val v43 = a * (p3 - p4)
//
fun loop
(
  i: intGte(0)
) : void = let
//
val fi = g0i2f(i)
val p1 = p1 + fi * v12
val p2 = p1 + v12
val p4 = p4 + fi * v43
val p3 = p4 + v43
val v23 = b * (p3 - p2)
val v14 = b * (p4 - p1)
//
fun loop2
(
  j: intGte(0)
) : void = let
//
val fj = g0i2f(j)
val p1 = p1 + fj * v14
val p4 = p1 + v14
val p2 = p2 + fj * v23
val p3 = p2 + v23
val () =
mydraw_matgraph$fcell (i, j, p1, p2, p3, p4)
//
in
//
if j + 1 < n then loop2 (j + 1) else ((*void*))
//
end // end of [loop2]
//
val () = loop2 (0)
//
in
//
if succ(i) < m then loop (succ(i)) else ((*void*))
//
end // end of [loop]
//
in
  loop (0)
end // end of [mydraw_matgraph]

(* ****** ****** *)

(* end of [mydraw_matgraph.dats] *)
