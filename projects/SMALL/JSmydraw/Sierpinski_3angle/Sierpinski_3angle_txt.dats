(*
** Poorman's Drawing
** Sierpinski triangles
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"Sierpinski_3angle_txt__dynload"
//
#define
ATS_STATIC_PREFIX "Sierpinski_3angle_txt__"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
//
staload
_ = "{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)

#define NROW 48
#define NCOL 80

(* ****** ****** *)
//
val
theCanvas =
matrixref_make_elt{int}(NROW, NCOL, 0)
//
(* ****** ****** *)
//
fun
theCanvas_clear() =
matrixref_foreach_cloref
  (theCanvas, NROW, NCOL, lam(i, j) => (theCanvas[i,NCOL,j] := 0))
//
(* ****** ****** *)
//
fun
theCanvas_print() =
matrixref_foreach_cloref
(
  theCanvas
, NROW, NCOL
, lam(i, j) =>
  let
    val x = theCanvas[i,NCOL,j]
  in
    print_string(if x = 0 then " " else "*"); if j=NCOL-1 then print_newline()
  end // end of [let]
) (* end of [matrixref_foreach] *)
//
(* ****** ****** *)
//
extern
fun
draw_point(x: int, y: int): void
//
implement
draw_point(x, y) = let
//
val x = g1ofg0(x) and y = g1ofg0(y)
//
(*
val () = println! ("draw_point: x = ", x)
val () = println! ("draw_point: y = ", y)
*)
//
in
  if x < 0 then ()
  else if y < 0 then ()
  else if x >= NCOL then ()
  else if y >= NROW then ()
  else (theCanvas[y, NCOL, x] := 1)
end // end of [draw_point]
//
(* ****** ****** *)

typedef
point = $tup(int, int)

(* ****** ****** *)
//
extern
fun
midpoint(p1: point, p2: point): point
//
(* ****** ****** *)

implement
midpoint(p1, p2) = $tup((p1.0+p2.0)/2, (p1.1+p2.1)/2)

(* ****** ****** *)
//
extern
fun
draw_hline
  (x1: int, x2: int, y: int): void
//
(* ****** ****** *)

implement
draw_hline
  (x1, x2, y) = let
//
fun loop (x1: int): void =
  if x1 <= x2
    then (draw_point(x1, y); loop(x1+1)) else ()
  // end of [if]
//
in
  loop (x1)
end // end of [draw_hline]
//
(* ****** ****** *)
//
extern
fun
draw_triangle_0
  (p1: point, p2: point, p3: point): void
extern
fun
draw_triangle_1
  (p1: point, p2: point, p3: point): void
//
(* ****** ****** *)

implement
draw_triangle_0
  (p1, p2, p3) = let
//
val x1 = p1.0 and y1 = p1.1
val x2 = p2.0 and y2 = p2.1
val x3 = p3.0 and y3 = p3.1
//
val () = assertloc (y2 = y3)
val () = assertloc (x1 + x1 = x2 + x3)
//
val dir =
  (if y1 >= y2 then 1 else ~1): int
//
fun
loop
(
  x2: int, x3: int, y2: int
) : void = let
//
val () = draw_point(x2, y2)
val () = draw_point(x3, y2)
//
in
  if y1 != y2
    then loop(x2+1, x3-1, y2+dir) else ()
  // end of [if]
end // end of [loop]
//
in
  draw_hline(x2+1, x3-1, y2); loop (x2, x3, y2)
end // end of [draw_triangle_0]

(* ****** ****** *)

implement
draw_triangle_1
  (p1, p2, p3) = let
//
val x1 = p1.0 and y1 = p1.1
val x2 = p2.0 and y2 = p2.1
val x3 = p3.0 and y3 = p3.1
//
val () = assertloc (y2 = y3)
val () = assertloc (x1 + x1 = x2 + x3)
//
val dir =
  (if y1 >= y2 then 1 else ~1): int
//
fun
loop
(
  x2: int, x3: int, y2: int
) : void = let
//
val () = draw_hline(x2, x3, y2)
//
in
  if y1 != y2 then loop(x2+1, x3-1, y2+dir) else ()
end // end of [loop]
//
in
  loop (x2, x3, y2)
end // end of [draw_triangle_1]

(* ****** ****** *)
//
extern
fun
draw_sierpinski
  (p1: point, p2: point, p3: point, n: int): void
extern
fun
draw_sierpinski_aux
  (p1: point, p2: point, p3: point, n: int): void
//
(* ****** ****** *)

implement
draw_sierpinski
  (p1, p2, p3, n) =
(
  if n > 0
    then draw_sierpinski_aux(p1, p2, p3, n)
    else ()
  // end of [if]
) (* end of [draw_sierpinski] *)

implement
draw_sierpinski_aux
  (p1, p2, p3, n) = let
//
  val p12 = midpoint(p1, p2)
  val p23 = midpoint(p2, p3)
  val p31 = midpoint(p3, p1)
//
  val () = draw_triangle_1(p23, p12, p31)
  val () = draw_sierpinski(p1, p12, p31, n-1)
  val () = draw_sierpinski(p12, p2, p23, n-1)
  val () = draw_sierpinski(p31, p23, p3, n-1)
//
in
  // nothing
end // end of [draw_sierpinski_aux]

(* ****** ****** *)
//
extern
fun
draw_sierpinski_demo
  (level: int): void = "mac#"
//
(* ****** ****** *)

implement
draw_sierpinski_demo
  (level) = let
//
val p1 = $tup(32, 0 )
val p2 = $tup(0 , 32)
val p3 = $tup(64, 32)
//
val () = theCanvas_clear()
val () = draw_triangle_0(p1, p2, p3)
val () = draw_sierpinski(p1, p2, p3, level)
val () = theCanvas_print()
//
in
  // nothing
end // end of [draw_sierpinski_demo]

(* ****** ****** *)

%{$
//
var theLevel = 0;
var theLevelMax = 5;

function
draw2_sierpinski_demo()
{
//
var
level = theLevel;
//
theLevel = (level+1)%theLevelMax;
//
var _ =
ats2jspre_the_print_store_clear();
//
var _ = draw_sierpinski_demo(level);
//
document.getElementById("theDrawingString").innerHTML = ats2jspre_the_print_store_join();
//
setTimeout(draw2_sierpinski_demo, 1000);
//
return;
//
} // end of [draw2_sierpinski_demo]
//
jQuery(document).ready(function(){Sierpinski_3angle_txt__dynload(); draw2_sierpinski_demo();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Sierpinski_3angle_txt.dats] *)
