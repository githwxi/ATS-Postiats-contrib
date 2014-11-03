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
(* ****** ****** *)
//
// mydraw:
// A simple drawing API
//
(* ****** ****** *)

abstype point_type = ptr
typedef point = point_type
abstype vector_type = ptr
typedef vector = vector_type

(* ****** ****** *)
//
extern
fun
point_make_xy
  (x: double, y: double) : point
//
(* ****** ****** *)
//
extern
fun
point_get_x (point): double
and
point_get_y (point): double
//
overload .x with point_get_x
overload .y with point_get_y
//  
(* ****** ****** *)

local
//
assume
point_type =
  $tup(double, double)
//
in (*in-of-local*)
//
implement
point_make_xy (x, y) = $tup(x, y)
//
implement point_get_x (p) = p.0
implement point_get_y (p) = p.1
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
vector_make_xy
  (vx: double, vy: double): vector
//
(* ****** ****** *)
//    
extern
fun
vector_get_x (vector): double
and
vector_get_y (vector): double
//
overload .x with vector_get_x
overload .y with vector_get_y
//    
(* ****** ****** *)

local
//
assume
vector_type =
  $tup(double, double)
//
in (*in-of-local*)
//
implement
vector_make_xy (x, y) = $tup(x, y)
//
implement vector_get_x (v) = v.0
implement vector_get_y (v) = v.1
//
end // end of [local]

(* ****** ****** *)
//
extern
fun
add_pvp (point, vector): point
extern
fun
sub_ppv (p1: point, p2: point): vector
//
overload + with add_pvp
overload - with sub_ppv
//
(* ****** ****** *)
//
implement
add_pvp (p, v) =
  point_make_xy (p.x + v.x, p.y + v.y)
implement
sub_ppv (p1, p2) =
  vector_make_xy (p1.x - p2.x, p1.y - p2.y)
//
(* ****** ****** *)
//
extern
fun
add_vvv (v1: vector, v2: vector): vector
and
sub_vvv (v1: vector, v2: vector): vector
//
(* ****** ****** *)
//
implement
add_vvv (v1, v2) =
  vector_make_xy (v1.x + v2.x, v1.y + v2.y)
implement
sub_vvv (v1, v2) =
  vector_make_xy (v1.x - v2.x, v1.y - v2.y)
//
(* ****** ****** *)
//
extern
fun
mul_kvv (k: double, v: vector): vector
and
div_vkv (v: vector, k: double): vector
//
overload + with add_vvv
overload - with sub_vvv
overload * with mul_kvv
overload / with div_vkv
//
(* ****** ****** *)
//
implement
mul_kvv (k, v) = vector_make_xy (k * v.x, k * v.y)
implement
div_vkv (v, k) = vector_make_xy (v.x / k, v.y / k)
//
(* ****** ****** *)

abstype color_type = ptr
typedef color = color_type

(* ****** ****** *)
//
extern
fun
color_make_rgb
(
  r: double, g: double, b: double
) : color // end-of-function
//
(* ****** ****** *)
//
extern
fun color_get_r : color -> double
and color_get_g : color -> double
and color_get_b : color -> double
//  
overload .r with color_get_r
overload .g with color_get_g
overload .b with color_get_b
//
(* ****** ****** *)

local
//
assume
color_type =
  $tup(double, double, double)
//
in (*in-of-local*)
//
implement
color_make_rgb (r, g, b) = $tup(r, g, b)
//
implement color_get_r (c) = c.0
implement color_get_g (c) = c.1
implement color_get_b (c) = c.2
//
end // end of [local]

(* ****** ****** *)

extern
fun{}
draw3p
  (p1: point, p2: point, p3: point, color): void
// end of [draw3p]
  
(* ****** ****** *)

extern  
fun{}
draw4p
  (p1: point, p2: point, p3: point, p4: point, color): void
// end of [draw4p]

(* ****** ****** *)

(* end of [mydraw.dats] *)
(* end-of-php *)
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
