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
(* ****** ****** *)
//
// mydraw:
// A simple drawing API
//
(* ****** ****** *)

(*
#ifndef JSMYDRAW_MYDRAW_DATS
#define JSMYDRAW_MYDRAW_DATS 1
*)

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
  (p1: point, p2: point, p3: point): void
// end of [draw3p]
  
(* ****** ****** *)

extern  
fun{}
draw4p
  (p1: point, p2: point, p3: point, p4: point): void
// end of [draw4p]

(* ****** ****** *)

(*
#endif // #ifndef(JSMYDRAW_MYDRAW_DATS)
*)

(* ****** ****** *)

(* end of [mydraw.dats] *)
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

(*
#include "./mydraw.dats"
extern fun int2double : int -> double  
*)

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
val fi = int2double(i)
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
val fj = int2double(j)
val p1 = p1 + fj * v14
val p4 = p1 + v14
val p2 = p2 + fj * v23
val p3 = p2 + v23
val () =
mydraw_matgraph$fcell<> (i, j, p1, p2, p3, p4)
//
in
//
if j + 1 < n then loop2 (j + 1) else ((*void*))
//
end // end of [loop2]
//
val ((*void*)) = loop2 (0)
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
(* end-of-php *)

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
