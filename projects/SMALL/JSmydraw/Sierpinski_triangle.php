(* ****** ****** *)
//
// Drawing Sierpinski triangle
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
include './mydraw.dats'
//
?>(* end-of-php *)
//
(* ****** ****** *)

fun
mid_ppp (
  p1: point, p2: point
) : point = p1 + (p2 - p1)/2.0
  
(* ****** ****** *)

extern
fun{}
draw_Sierpinski
(
  p1: point, p2: point, p3: point, clr: color, n: int
) : void = "mac#" // end of [draw_Sierpinski]

(* ****** ****** *)

implement
{}(*tmp*)
draw_Sierpinski
(
  p1, p2, p3, clr, n
) = let
//
macdef mid = mid_ppp
//
in
//
if
n >= 1
then let
  val p12 = (p1 \mid p2)
  val p23 = (p2 \mid p3)
  val p31 = (p3 \mid p1)
  val () = draw3p (p12, p23, p31, clr)
  val () = draw_Sierpinski (p1, p12, p31, clr, n-1)
  val () = draw_Sierpinski (p12, p2, p23, clr, n-1)
  val () = draw_Sierpinski (p31, p23, p3, clr, n-1)
in
  // nothing
end // end of [then]
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
, r0: double, g0: double, b0: double
, depth: int
) : void = "mac#" // end-of-function

(* ****** ****** *)

implement
draw_Sierpinski_canvas
(
  ctx, x1, y1, x2, y2, x3, y3, r0, g0, b0, depth
) = let
//
implement
draw3p<>
(
  p1, p2, p3, clr
) = let
//
val pf = ctx.save()
val () = ctx.beginPath()
val () = ctx.moveTo (p1.x, p1.y)
val () = ctx.lineTo (p2.x, p2.y)
val () = ctx.lineTo (p3.x, p3.y)
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
val clr = color_make_rgb (r0, g0, b0)
//
val r1 = 255 * r0
and g1 = 255 * g0
and b1 = 255 * b0
val r1 = String(r1)
and g1 = String(g1)
and b1 = String(b1)
val clr1 = "rgb(" + r1 + "," + g1 + "," + b1 + ")"
val ((*void*)) = ctx.fillStyle (clr1)
//
in
  draw_Sierpinski (p1, p2, p3, clr, depth)
end // end of [draw_Sierpinski_canvas]

(* ****** ****** *)

%{$
//
var
canvas =
document.getElementById("Patsoptaas-Evaluate-canvas");
var context = canvas.getContext( '2d' );
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
context.save();
context.translate((w-wh2)/2, (h-wh2)/2);
//
context.beginPath();
context.moveTo(0, wh2);
context.lineTo(wh2, wh2);
context.lineTo(wh2/2, 0);
context.closePath();
context.fillStyle = "#0000ff";
context.fill(/*void*/);
//
draw_Sierpinski_canvas
(
  context, 0, wh2, wh2, wh2, wh2/2, 0, 1.0, 1.0, 0.0, depth
); theDepth = depth % N;
//
context.restore();
//
setTimeout(draw_anim, 1000);
//
return;
//
} // end of [draw_anim]
//
jQuery(document).ready(function(){draw_anim();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Sierpinski_triangle.dats] *)
