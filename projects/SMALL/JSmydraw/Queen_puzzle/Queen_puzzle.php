(* ****** ****** *)
//
// HX-2014-11-05:
//
// Solving the Queen-puzzle
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

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

(* beg-of-php *)
<?php
//
include "./../mydraw.dats";
include "./../mydraw_matgraph.dats";
//
?>(* end-of-php *)

(* ****** ****** *)

#define N 8
#define N1 %(N-1)

(* ****** ****** *)
//
val theBoard =
  arrayref_make_elt{int}(N, ~1)
//
(* ****** ****** *)
//
extern
fun
theCtx2d_get (): canvas2d = "mac#"
//
(* ****** ****** *)
//
extern
fun
draw_theBoard (canvas2d): void = "mac#"
//
(* ****** ****** *)
//
extern
fun
configSearch (i: natLte(N)): void = "mac#"
and
configSearch_ (i: natLte(N)): void = "mac#"
//
(* ****** ****** *)

fun
safetyTest
(
  i0: natLt(N), j0: int
) : bool = let
//
fun
loop(i: intGte(0)): bool =
//
if
i < i0
then let
  val j = theBoard[i]
in
//
if j = j0
  then false
  else (
    if abs(i0 - i) = abs(j0 - j) then false else loop(i+1)
  ) (* end of [else] *)
// end of [if]
end // end of [then]
else true // end of [else]
//
in
  loop (0)
end // end of [safetyTest]

(* ****** ****** *)

fun
configSearch2
(
  i: natLt(N), j: int
) : void = let
in
//
if
j < N
then
(
//
if
safetyTest(i, j)
then let
//
val () = theBoard[i] := j
val () = draw_theBoard (theCtx2d_get())
//
in
  configSearch_(i+1)
end // end of [then]
else
(
  configSearch2(i, j+1)
) (* end of [else] *)
//
) (* end of [then] *)
else let
//
val () = theBoard[i] := ~1
val () = draw_theBoard (theCtx2d_get())
//
in
//
if i > 0
  then configSearch_(i-1) else configSearch_final ()
//
end // end of [else]
//  
end // end of [configSearch2]

and
configSearch_found (): void = let
//
val yn =
  confirm("A solution is found. Continue?")
//
in
  if yn then configSearch2 (N1, theBoard[N1]+1)
end // end of [configSearch_found]

and
configSearch_final (): void =
(
  alert("There is no more solution to be found.")
) (* end of [configSearch_final] *)

(* ****** ****** *)

implement
configSearch (i) =
(
//
if
i = N
then configSearch_found ()
else configSearch2 (i, theBoard[i]+1)
//
) (* end of [configSearch] *)

(* ****** ****** *)

local
//
val theP1 = ref{point}($UN.cast{point}(0))
val theP2 = ref{point}($UN.cast{point}(0))
val theP3 = ref{point}($UN.cast{point}(0))
val theP4 = ref{point}($UN.cast{point}(0))
//
in (* in-of-local *)
//
extern
fun theP1_get (): point
extern
fun theP2_get (): point
extern
fun theP3_get (): point
extern
fun theP4_get (): point
//
extern
fun theP1_set (x: double, y: double): void = "mac#"
extern
fun theP2_set (x: double, y: double): void = "mac#"
extern
fun theP3_set (x: double, y: double): void = "mac#"
extern
fun theP4_set (x: double, y: double): void = "mac#"
//
implement
theP1_get () = theP1[]
implement
theP2_get () = theP2[]
implement
theP3_get () = theP3[]
implement
theP4_get () = theP4[]
//
implement
theP1_set (x, y) = theP1[] := point_make_xy (x, y)
implement
theP2_set (x, y) = theP2[] := point_make_xy (x, y)
implement
theP3_set (x, y) = theP3[] := point_make_xy (x, y)
implement
theP4_set (x, y) = theP4[] := point_make_xy (x, y)
//
end // end of [local]

(* ****** ****** *)

fun
draw_queen
(
  ctx: canvas2d
, p1: point, p2: point, p3: point, p4: point
) : void =
{
//
val rgb = "rgb(240, 240, 200)"
val ((*void*)) = ctx.fillStyle(rgb)
//
val xc = (p1.x+p2.x+p3.x+p4.x)/4
val yc = (p1.y+p2.y+p3.y+p4.y)/4
//
val dx = ((p1.x+p2.x)-(p3.x+p4.x))/2
val dy = ((p1.y+p2.y)-(p3.y+p4.y))/2
//
val rad = 0.425*JSmath_sqrt(dx*dx+dy*dy)
//
val () = ctx.beginPath()
val () = ctx.arc (xc, yc, rad, 0.0, 2*JSmath_PI, true)
val () = ctx.closePath()
//
val ((*void*)) = ctx.fill((*void*))
}

(* ****** ****** *)
//
implement
draw_theBoard
  (ctx) = let
//
val p1 = theP1_get()
val p2 = theP2_get()
val p3 = theP3_get()
val p4 = theP4_get()
//
implement
mydraw_matgraph$fcell<>
(
  i, j, p1, p2, p3, p4
) = let
//
macdef
floor = JSmath_floor
//
val a = 0.40*((i+j)%2)
val c = String(32+floor(a * 255))
//
val rgb = "rgb("+c+","+c+","+c+")"
val ((*void*)) = ctx.fillStyle(rgb)
//
val () = ctx.beginPath()
val () = ctx.moveTo(p1.x, p1.y)
val () = ctx.lineTo(p2.x, p2.y)
val () = ctx.lineTo(p3.x, p3.y)
val () = ctx.lineTo(p4.x, p4.y)
val () = ctx.closePath()
//
val ((*void*)) = ctx.fill((*void*))
//
val i = $UN.cast{natLt(N)}(i)
val () = if (theBoard[i] = j) then draw_queen (ctx, p1, p2, p3, p4)
//
in
  // nothing
end // end of [mydraw_matgraph$fcell]
//
in
//
mydraw_matgraph<> (N, N, p1, p2, p3, p4)
//
end // end of [draw_theBoard]
//
(* ****** ****** *)

%{$
//
my_dynload();
//
var
canvas =
document.getElementById("Patsoptaas-Evaluate-canvas");
var
ctx2d =
  canvas.getContext( '2d' );
//
function
theCtx2d_get() { return ctx2d; }
//
function
initize()
{
//
var w = canvas.width
var h = canvas.height
var wh = 0.88 * Math.min (w, h)
//
theP1_set(0, 0); theP2_set(0, wh); theP3_set(wh, wh); theP4_set(wh, 0);
//
ctx2d.save();
ctx2d.translate((w-wh)/2, (h-wh)/2);
//
return;
}
//
function
configSearch_(i)
{
  setTimeout(function(){initize();configSearch(i);ctx2d.restore();return;}, 400);
}
//
function
draw_main()
{
//
initize();
draw_theBoard(ctx2d);
ctx2d.restore();
//
configSearch_(0);
//
return;
//
} // end of [draw_main]
//
jQuery(document).ready(function(){draw_main();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Queen_puzzle.dats] *)
