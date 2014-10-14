(*
//
An example of atscc2js: Wall Clock
//
Author: Hongwei Xi
Authoremail: hwxi AT cs DOT bu DOT edu
Start Time: September, 2014
//
This example is essentially translated from
the JS code at the following site:
//
http://www.neilwallis.com/projects/html5/clock/
//
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
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

macdef PI = JSmath_PI
macdef sin = JSmath_sin and cos = JSmath_cos

(* ****** ****** *)

fun
draw_mark
(
  ctx: canvas2d, i: int
) : void = {
//
val a = PI/30*i
val sa = sin(a)
val ca = cos(a)
val sx = 110 * sa
val sy = 110 * ca
val ex = 120 * sa
val ey = 120 * ca
//
val () = ctx.lineWidth(2)
//
val () = ctx.beginPath()
val () = ctx.moveTo(sx, sy)
val () = ctx.lineTo(ex, ey)
val () = ctx.closePath()
//
val () = ctx.stroke()
//
} (* end of [draw_mark] *)

(* ****** ****** *)

fun
draw_mark2
(
  ctx: canvas2d, i: int
) : void = {
//
val a = PI/30*i
val sa = sin(a)
val ca = cos(a)
val sx =  95 * sa
val sy = ~95 * ca
val ex =  120 * sa
val ey = ~120 * ca
val nx =  80 * sa
val ny = ~80 * ca
//
val () = ctx.fillText(toString(i/5), nx, ny)
//
val () = ctx.lineWidth(8)
//
val () = ctx.beginPath()
val () = ctx.moveTo(sx, sy)
val () = ctx.lineTo(ex, ey)
val () = ctx.closePath()
//
val () = ctx.stroke()
//
} (* end of [draw_mark2] *)

(* ****** ****** *)
//
extern
fun
draw_clock
(
  ctx: canvas2d
, nhr: double, nmin: double, nsec: double
) : void = "mac#" // end-of-fun
//
implement
draw_clock
(
  ctx, nhr, nmin, nsec
) = () where {
//
val () = ctx.clearRect(0.0, 0.0, 300.0, 300.0)
//
// Define gradients for 3D-shadow effect
//
val g1 = ctx.createLinearGradient(0.0, 0.0, 300.0, 300.0)
val () = g1.addColorStop(0.0, "#D83040")
val () = g1.addColorStop(1.0, "#801020")
//
val g2 = ctx.createLinearGradient(0.0, 0.0, 300.0, 300.0)
val () = g2.addColorStop(0.0, "#801020")
val () = g2.addColorStop(1.0, "#D83040")
//
val () = ctx.font("bold 20px arial")
val () = ctx.textAlign("center")
val () = ctx.textBaseline("middle")
val () = ctx.lineWidth(1)
//
val () = ctx.strokeStyle_gradient(g1)
val () = ctx.lineWidth(10)
//
val pf = ctx.save()
val () = ctx.beginPath()
val () = ctx.arc(150.0, 150.0, 138.0, 0.0, 2*PI, true)
val () = ctx.closePath()
val () = ctx.shadowBlur(6)
val () = ctx.shadowOffsetX(4)
val () = ctx.shadowOffsetY(4)
val () = ctx.shadowColor("rgba(0,0,0,0.6)")
val () = ctx.stroke()
val () = ctx.restore(pf.0 | (*none*))
//
val () = ctx.strokeStyle_gradient(g2)
val () = ctx.lineWidth(10)
//
val pf = ctx.save()
val () = ctx.beginPath()
val () = ctx.arc(150.0, 150.0, 129.0, 0.0, 2*PI, true);
val () = ctx.closePath()
val () = ctx.stroke()
val () = ctx.restore(pf.0 | (*none*))
//
val () = ctx.strokeStyle("#222")
//
val pf = ctx.save()
//
val () = ctx.translate(150.0, 150.0)
//
val () = let
//
fun loop
(
  ctx: canvas2d, i: int
) : void =
(
if
i <= 60
then let
  val () =
  (
    if i % 5 != 0
      then draw_mark (ctx, i) else draw_mark2 (ctx, i)
    // end of [if]
  ) : void // end of [val]
in
  loop (ctx, i+1)
end // end of [then]
else () // end of [else]
) (* end of [loop] *)
//
in
  loop (ctx, 1)
end // end of [val]
//
val ampm =
  (if (nhr < 12.0) then "AM" else "PM"): string
//
val () = ctx.strokeStyle("#000")
val () = ctx.lineWidth(1)
val () = ctx.strokeRect(21.0, ~14.0, 44.0, 27.0)
val () = ctx.fillText(ampm, 43.0, 0.0)
val () = ctx.lineWidth(6)
//
val () =
{
  val pf = ctx.save()
  val () = ctx.rotate(nhr*PI/6)
  val () = ctx.beginPath()
  val () = ctx.moveTo(0.0, 10.0)
  val () = ctx.lineTo(0.0, ~60.0)
  val () = ctx.closePath()
  val () = ctx.stroke()
  val () = ctx.restore(pf.0 | (*none*))
} (* end of [val] *)
//
val () =
{
  val pf = ctx.save()
  val () = ctx.rotate(nmin*PI/30)
  val () = ctx.beginPath()
  val () = ctx.moveTo(0.0, 20.0)
  val () = ctx.lineTo(0.0, ~110.0)
  val () = ctx.closePath()
  val () = ctx.stroke()
  val () = ctx.restore(pf.0 | (*none*))
} (* end of [val] *)
//
val () = ctx.lineWidth (3)
val () = ctx.strokeStyle("#E33")
//
val () =
{
  val pf = ctx.save()
  val () = ctx.rotate(nsec*PI/30)
  val () = ctx.beginPath()
  val () = ctx.moveTo(0.0, 20.0)
  val () = ctx.lineTo(0.0, ~110.0)
  val () = ctx.closePath()
  val () = ctx.stroke()
  val () = ctx.restore(pf.0 | (*none*))
} (* end of [val] *)
//
val () = ctx.fillStyle("#000")
//
val () =
{
  val pf = ctx.save()
  val () = ctx.beginPath()
  val () = ctx.arc(0.0, 0.0, 6.5, 0.0, 2*PI, true)
  val () = ctx.closePath()
  val () = ctx.fill()
  val () = ctx.restore(pf.0 | (*none*))
} (* end of [val] *)
//
val () = ctx.restore (pf.0 | (*none*))
//
} (* end of [where] *) // [draw_clock]
//
(* ****** ****** *)

%{$
//
var
canvas =
document.getElementById("Patsoptaas-Evaluate-Canvas");
var context = canvas.getContext( '2d' );
//
var w = 920.0
var h = 600.0
var mn = Math.min (w, h)
var xc = w / 2
var yc = h / 2
var alpha = mn / 300
//
function
draw2_clock()
{
var date = new Date() ;
var secs = date.getSeconds()
var mins = date.getMinutes()
var mins = mins + secs / 60.0
var hours = date.getHours()
var hours = hours + mins / 60.0
//
context.save();
context.translate(xc-mn/2, yc-mn/2);
context.scale (alpha, alpha);
draw_clock(context, hours, mins, secs);
context.restore();
//
setTimeout(draw2_clock, 500);
//
return;
//
} // end of [draw2_clock]
//
jQuery(document).ready(function(){draw2_clock();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [myclock1-2.dats] *)
