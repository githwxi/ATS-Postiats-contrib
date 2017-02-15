(* ****** ****** *)
//
// HX-2014-11-09:
//
// Animating quick-sort
//
// Note that the partitioning approach
// is bi-directional, which is different
// from the uni-directional one in K&R
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
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
//
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
  point_make_xy (p.x() + v.x(), p.y() + v.y())
implement
sub_ppv (p1, p2) =
  vector_make_xy (p1.x() - p2.x(), p1.y() - p2.y())
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
  vector_make_xy (v1.x() + v2.x(), v1.y() + v2.y())
implement
sub_vvv (v1, v2) =
  vector_make_xy (v1.x() - v2.x(), v1.y() - v2.y())
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
mul_kvv (k, v) = vector_make_xy (k * v.x(), k * v.y())
implement
div_vkv (v, k) = vector_make_xy (v.x() / k, v.y() / k)
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
// HX-2014-11-05:
// it is adapted from
// previous code made for teaching
//
(* ****** ****** *)

(*
#include "./mydraw.dats"
*)

(* ****** ****** *)
//
// HX-2014-11-05:
// p1, p2, p3 and p4 are positioned CCW
//
extern
fun{
} mydraw_bargraph
(
  n: intGte(1)
, p1: point, p2: point, p3: point, p4: point
) : void // end of [mydraw_bargraph]
//
extern
fun{}
mydraw_bargraph$fcell
(
  i: intGte(0)
, p1: point, p2: point, p3: point, p4: point
) : void // end-of-function
//
(* ****** ****** *)

implement
{}(*tmp*)
mydraw_bargraph
  (n, p1, p2, p3, p4) = let
//
val a = 1.0 / n
val v12 = a * (p2 - p1)
val v43 = a * (p3 - p4)
//
prval
[n:int]
EQINT() = eqint_make_gint (n)
//
fun loop
  {i:nat | i < n}
(
  i: int (i), p1: point, p4: point
) : void = let
//
val p1_new = p1 + v12
val p4_new = p4 + v43
//
val () =
mydraw_bargraph$fcell (i, p1, p1_new, p4_new, p4)
//
val i1 = i + 1
//
in
  if i1 < n then loop (i1, p1_new, p4_new) else ()
end // end of [loop]
//
in
  loop (0, p1, p4)
end // end of [mydraw_bargraph]

(* ****** ****** *)

(* end of [mydraw_bargraph.dats] *)
(* end-of-php *)
//
(* ****** ****** *)

#define N 64

(* ****** ****** *)
//
val
theArray = A where
{
//
val A =
arrayref_make_elt{double}(N, 0.0)
val () =
arrayref_foreach_cloref(A, N, lam(i) => A[i] := JSmath_random())
//
} (* end of [val] *)
//
(* ****** ****** *)
//
extern
fun
sort_theArray (): void = "mac#"
//
(* ****** ****** *)
//
extern
fun
theCtx2d_get(): canvas2d = "mac#"
//
extern
fun
draw_theArray(ctx: canvas2d): void = "mac#"
//
(* ****** ****** *)
//
extern
fun
interchange
  (natLt(N), natLt(N)): void
//
implement
interchange
  (i, j) = let
  val A = theArray
  val tmp = A[i] in A[i] := A[j]; A[j] := tmp
end // end of [interchange]
//
(* ****** ****** *)

fun
sort_final
(
// argumentless
) : void = alert ("Sorting is completed.")

(* ****** ****** *)
//
typedef
interval = $tup
(
  natLte(N), natLte(N)
) (* end-of-typedef *)
//
typedef
intervalist = List0(interval)
//
extern
fun
sort_aux1 (intervalist): void = "mac#"
and
sort_aux1_ (intervalist): void = "mac#"
//
extern
fun
sort_aux2
{i,j:int |
 0 <= i; i+2 <= j; j <= N
} (int(i), int(j), intervalist): void = "mac#"
//
extern
fun
sort_aux3
{i,j,i1,j1:int |
 0 <= i; i+2 <= j; j <= N;
 0 <= i1; i1 <= j1; j1 <= j-1
} (int(i), int(j), int(i1), int(j1), intervalist): void = "mac#"
and
sort_aux3_
{i,j,i1,j1:int |
 0 <= i; i+2 <= j; j <= N;
 0 <= i1; i1 <= j1; j1 <= j-1
} (int(i), int(j), int(i1), int(j1), intervalist): void = "mac#"
and
sort_aux4
{i,j,i1,j1:int |
 0 <= i; i+2 <= j; j <= N;
 0 <= i1; i1 <= j1; j1 <= j-1
} (int(i), int(j), int(i1), int(j1), intervalist): void = "mac#"
//
(* ****** ****** *)
//
implement
sort_theArray () =
  sort_aux1 (list_cons{interval}( '(0,N), list_nil ))
//
(* ****** ****** *)

implement
sort_aux1 (xs) =
(
case+ xs of
| list_nil () =>
    sort_final ()
| list_cons (x, xs) => let
    val i = x.0 and j = x.1
  in
    if i + 2 <= j
      then sort_aux2 (i, j, xs) else sort_aux1 (xs)
    // end of [if]
  end // end of [list_cons]
) (* end of [sort_aux1] *)

(* ****** ****** *)

implement
sort_aux2
  (i, j, xs) = let
//
val k = i+half(j-i)
//
val () =
  interchange (k, j-1)
val ctx2d = theCtx2d_get()
val () =
  draw_theArray(ctx2d)
//
in
  sort_aux3_ (i, j, i, j-1, xs)
end // end of [sort_aux2]

(* ****** ****** *)

implement
sort_aux3
(
  i, j, i1, j1, xs
) = let
  val A = theArray
  val i2 = i1 + 1
in
//
if
i2 <= j1
then
(
if
A[i1] < A[j-1]
then sort_aux3 (i, j, i2, j1, xs)
else sort_aux4 (i, j, i1, j1, xs)
) (* end of [then] *)
else let
  val () = interchange (i1, j-1)
  val () = draw_theArray(theCtx2d_get())
in
  sort_aux1_ (list_cons ( '(i, i1), list_cons ( '(i1+1, j), xs ) ))
end // end of [else]
//
end // end of [sort_aux3]

(* ****** ****** *)

implement
sort_aux4
(
  i, j, i1, j1, xs
) = let
  val A = theArray
in
//
if
i1 < j1
then
(
if
A[j1-1] >= A[j-1]
then sort_aux4 (i, j, i1, j1-1, xs)
else let
  val () = interchange (i1, j1-1)
  val () = draw_theArray(theCtx2d_get())
  prval () =
  __assert (i1, j1) where
  {
    extern
    praxi __assert{x,y:int}(int(x), int(y)):<> [x != y-1] void
  } (* end of [where] *) // end of [prval]
in
  sort_aux3_ (i, j, i1+1, j1-1, xs)
end // end of [else]
)
else let
  val () = interchange (i1, j-1)
  val () = draw_theArray(theCtx2d_get())
in
  sort_aux1_ (list_cons ( '(i, i1), list_cons ( '(i1+1, j), xs ) ))
end // end of [else]
//
end // end of [sort_aux4]

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
//
implement
draw_theArray
  (ctx) = let
//
val p1 = theP1_get()
val p2 = theP2_get()
val p3 = theP3_get()
val p4 = theP4_get()
//
implement
mydraw_bargraph$fcell<>
(
  i, p1, p2, p3, p4
) = let
//
val i =
$UN.cast{natLt(N)}(i)
val a = theArray[i]
//
macdef
floor = JSmath_floor
//
val c = String(floor(a * 192))
//
val rgb = "rgb("+c+","+c+","+c+")"
val ((*void*)) = ctx.fillStyle(rgb)
//
val p3 = p2+a*(p3-p2)
val p4 = p1+a*(p4-p1)
//
val () = ctx.beginPath()
val () = ctx.moveTo(p1.x(), p1.y())
val () = ctx.lineTo(p2.x(), p2.y())
val () = ctx.lineTo(p3.x(), p3.y())
val () = ctx.lineTo(p4.x(), p4.y())
val () = ctx.closePath()
//
val ((*void*)) = ctx.fill((*void*))
//
in
  // nothing
end // end of [mydraw_bargraph$fcell]
//
val () = $extfcall(void, "theCtx2d_clear")
val () = mydraw_bargraph<> (N, p1, p2, p3, p4)
//
in
  // nothing
end // end of [draw_theArray]
//
(* ****** ****** *)

%{$
//
my_dynload();
//
var
canvas =
document.getElementById
(
  "Patsoptaas-Evaluate-canvas"
);
//
var
ctx2d = canvas.getContext('2d');
//
function
theCtx2d_get() { return ctx2d; }
//
function
theCtx2d_clear ()
{
  return ctx2d.clearRect(0, 0, canvas.width, canvas.height);
}
//
function
initize()
{
//
var w = canvas.width
var h = canvas.height
var w2 = 0.88 * w
var h2 = 0.88 * h
//
theP1_set(0, h2); theP2_set(w2, h2); theP3_set(w2, 0); theP4_set(0, 0);
//
ctx2d.save();
ctx2d.translate((w-w2)/2, (h-h2)/2);
//
return;
}
//
function
sort_aux1_(xs)
{
  setTimeout(function(){initize();sort_aux1(xs);ctx2d.restore();return;}, 200);
}
function
sort_aux3_(i,j,i1,j1,xs)
{
  setTimeout(function(){initize();sort_aux3(i,j,i1,j1,xs);ctx2d.restore();return;}, 200);
}
//
function
draw_main()
{
//
initize();
draw_theArray(ctx2d);
sort_theArray();
ctx2d.restore();
//
return;
//
} // end of [draw_main]
//
jQuery(document).ready(function(){draw_main();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [Sorting_quick2.php] *)
