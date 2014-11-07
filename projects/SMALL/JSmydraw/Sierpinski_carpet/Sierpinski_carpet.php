(* ****** ****** *)
//
// HX-2014-11-04:
//
// Drawing Sierpinski carpet
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
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
//
staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)
//
(* beg-of-php *)
<?php
//
include './../mydraw.dats';
//
?>(* end-of-php *)
//
(* ****** ****** *)

extern
fun{}
draw_Sierpinski
(
  p1: point, p2: point, p3: point, p4: point, n: int
) : void // end of [draw_Sierpinski]

(* ****** ****** *)

macdef C1 = 1.0 / 3
macdef C2 = 2.0 / 3

(* ****** ****** *)

implement
{}(*tmp*)
draw_Sierpinski
  (p1, p2, p3, p4, n) = let
//
macdef draw = draw_Sierpinski
//
in
//
if n >= 1 then let
//
  val v12 = p2 - p1
  val p12_1 = p1 + C1 * v12
  val p12_2 = p1 + C2 * v12
//
  val v23 = p3 - p2
  val p23_1 = p2 + C1 * v23
  val p23_2 = p2 + C2 * v23
//
  val v34 = p4 - p3
  val p34_1 = p3 + C1 * v34
  val p34_2 = p3 + C2 * v34
//
  val v41 = p1 - p4
  val p41_1 = p4 + C1 * v41
  val p41_2 = p4 + C2 * v41
//
  val p1_ = p12_1 + C1 * v23
  val p2_ = p12_2 + C1 * v23
  val p3_ = p34_1 + C1 * v41
  val p4_ = p34_2 + C1 * v41
//
  val () = draw4p (p1_, p2_, p3_, p4_)
  val () = draw_Sierpinski (p1, p12_1, p1_, p41_2, n-1)
  val () = draw_Sierpinski (p12_1, p12_2, p2_, p1_, n-1)
  val () = draw_Sierpinski (p12_2, p2, p23_1, p2_, n-1)
  val () = draw_Sierpinski (p2_, p23_1, p23_2, p3_, n-1)
  val () = draw_Sierpinski (p3_, p23_2, p3, p34_1, n-1)
  val () = draw_Sierpinski (p4_, p3_, p34_1, p34_2, n-1)
  val () = draw_Sierpinski (p41_1, p4_, p34_2, p4, n-1)
  val () = draw_Sierpinski (p41_2, p1_, p4_, p41_1, n-1)
//
in
  // nothing
end // end of [if]
//
end // end of [draw_Sierpinski]

(* ****** ****** *)

extern
fun
draw_Sierpinski_canvas
(
  ctx: canvas2d
, x1: double, y1: double
, x2: double, y2: double
, x3: double, y3: double
, x4: double, y4: double
, r0: double, g0: double, b0: double
, depth: int
) : void = "mac#" // end-of-function

(* ****** ****** *)

implement
draw_Sierpinski_canvas
(
  ctx, x1, y1, x2, y2, x3, y3, x4, y4, r0, g0, b0, depth
) = let
//
implement
draw4p<>
(
  p1, p2, p3, p4
) = let
//
val pf = ctx.save()
val () = ctx.beginPath()
val () = ctx.moveTo (p1.x, p1.y)
val () = ctx.lineTo (p2.x, p2.y)
val () = ctx.lineTo (p3.x, p3.y)
val () = ctx.lineTo (p4.x, p4.y)
val () = ctx.closePath()
val () = ctx.fill()
val () = ctx.restore (pf.0 | (*none*))
//
in
  // nothing
end // end of [draw3p]
//
val p1 = point_make_xy (x1, y1)
val p2 = point_make_xy (x2, y2)
val p3 = point_make_xy (x3, y3)
val p4 = point_make_xy (x4, y4)
val clr = color_make_rgb (r0, g0, b0)
//
macdef
floor(x) = JSmath_floor(,(x))
//
val r1 =
  floor(255 * r0)
and g1 =
  floor(255 * g0)
and b1 =
  floor(255 * b0)
val r1 = String(r1)
and g1 = String(g1)
and b1 = String(b1)
//
val ((*void*)) =
ctx.fillStyle("rgb("+r1+","+g1+","+b1+")")
//
in
  draw_Sierpinski (p1, p2, p3, p4, depth)
end // end of [draw_Sierpinski_canvas]

(* ****** ****** *)

%{$
//
var
canvas =
document.getElementById("Patsoptaas-Evaluate-canvas");
var ctx2d = canvas.getContext( '2d' );
//
var N = 6;
var theDepth = 0;
//
function
draw_anim()
{
//
var w = canvas.width
var h = canvas.height
var wh = Math.min (w, h)
var wh2 = 0.88 * wh
//
var depth = theDepth+1
//
ctx2d.save();
ctx2d.translate((w-wh2)/2, (h-wh2)/2);
//
ctx2d.beginPath();
ctx2d.moveTo(0, 0);
ctx2d.lineTo(0, wh2);
ctx2d.lineTo(wh2, wh2);
ctx2d.lineTo(wh2, 0);
ctx2d.closePath();
ctx2d.fillStyle = "#0000ff";
ctx2d.fill(/*void*/);
//
draw_Sierpinski_canvas
(
  ctx2d, 0, 0, 0, wh2, wh2, wh2, wh2, 0, 1.0, 1.0, 0.0, depth
); theDepth = depth % N;
//
ctx2d.restore();
//
setTimeout(draw_anim, 2000);
//
return;
//
} // end of [draw_anim]
//
jQuery(document).ready(function(){draw_anim();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Sierpinski_carpet.dats] *)
