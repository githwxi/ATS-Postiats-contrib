(* ****** ****** *)
//
// HX-2015-03-20:
//
// Animating a variant of
// the Dining Philosophers problem
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
staload
"{$LIBATSCC2JS}/SATS/HTML/canvas-2d/canvas2d.sats"
//
(* ****** ****** *)
//
#define NPHIL 5
typedef nphil = natLt(NPHIL)
//
(* ****** ****** *)
//
extern
fun theCtx2d_get(): canvas2d = "mac#"
//
(* ****** ****** *)
//
extern
fun
cloref_app
(
  fwork: () -<cloref1> void
) : void = "mac#" // endfun
//
implement cloref_app(fwork) = fwork()
//
extern
fun
setTimeout_cloref
(
  fwork: () -<cloref1> void, ntime: double
) : void = "mac#" // end-of-function
//
(* ****** ****** *)
//
fun
rand_int2
(
  x0: int, len: intGte(0)
) : double =
(
  x0 + len * JSmath_random()
)
//
(* ****** ****** *)

extern
fun
phil_draw(id: nphil): void = "mac#"

(* ****** ****** *)
//
extern
fun
phil_pick_lfork(id: nphil): int = "mac#"
and
phil_pick_rfork(id: nphil): int = "mac#"
//
extern
fun
phil_return_lfork(id: nphil): void = "mac#"
and
phil_return_rfork(id: nphil): void = "mac#"
//
(* ****** ****** *)
//
extern
fun
phil_loop (id: nphil): void = "mac#"
//
extern
fun phil_think_beg (id: nphil): void
and phil_think_end (id: nphil): void
//
extern
fun phil_dine_start (id: nphil): void
and phil_dine_lfork (id: nphil): void
and phil_dine_rfork (id: nphil): void
and phil_dine_finish (id: nphil): void
//
(* ****** ****** *)
//
implement
phil_loop(id) =
  (phil_draw(id); phil_think_beg (id))
//
(* ****** ****** *)
//
implement
phil_think_beg
  (id) = let
//
val ntime = rand_int2(500, 2500)
//
in
//
setTimeout_cloref(lam() => phil_think_end(id), ntime)
//
end // end of [phil_think_beg]
//
implement phil_think_end(id) = phil_dine_start(id)
//
(* ****** ****** *)
//
implement
phil_dine_start
  (id) = phil_dine_lfork(id)
//
implement
phil_dine_lfork
  (id) = let
//
val ntime =
  rand_int2(250, 1000)
//
val lfork = phil_pick_lfork(id)
val ((*void*)) = if lfork > 0 then phil_draw(id)
//
in
//
if
lfork = 0
then setTimeout_cloref(lam() => phil_dine_lfork(id), ntime)
else setTimeout_cloref(lam() => phil_dine_rfork(id), ntime)
//
end // end of [phil_dine_lfork]
//
implement
phil_dine_rfork(id) = let
//
val ntime =
  rand_int2(250, 1000)
//
val rfork = phil_pick_rfork(id)
val ((*void*)) = if rfork > 0 then phil_draw(id)
//
in
//
if
rfork = 0
then setTimeout_cloref(lam() => phil_dine_rfork(id), ntime)
else setTimeout_cloref(lam() => phil_dine_finish(id), ntime)
//
end // end of [phil_dine_rfork]

implement
phil_dine_finish(id) =
(
  phil_return_lfork(id); phil_return_rfork(id); phil_loop(id)
)
//
(* ****** ****** *)

%{$
//
var
mycanvas =
document.getElementById
  ("Patsoptaas-Evaluate-canvas");
//
var
myctx2d0 = mycanvas.getContext( '2d' );
//
var theFks = [1, 1, 1, 1, 1]
//
var Ph0 = { lfork: 0, rfork: 0 }
var Ph1 = { lfork: 0, rfork: 0 }
var Ph2 = { lfork: 0, rfork: 0 }
var Ph3 = { lfork: 0, rfork: 0 }
var Ph4 = { lfork: 0, rfork: 0 }
var thePhs = [Ph0, Ph1, Ph2, Ph3, Ph4]
//
function
phil_pick_lfork
  (id0)
{
//
var
lf0 =
theFks[id0];
if(lf0 > 0)
{
  theFks[id0] = 0;
  thePhs[id0].lfork = 1;
}
return (lf0);
//
} // phil_pick_lfork
//
function
phil_pick_rfork
  (id0)
{
//
var id1 = (id0+1)%5;
var rf1 = theFks[id1];
if(rf1 > 0)
{
  theFks[id1] = 0;
  thePhs[id0].rfork = 1;
}
return (rf1);
//
} // phil_pick_rfork
//
function
phil_return_lfork
  (id0)
{
  var ph = thePhs[id0];
  ph.lfork = 0; theFks[id0] = 1; return;
}
function
phil_return_rfork
  (id0)
{
  var ph = thePhs[id0];
  var id1 = (id0+1)%5
  ph.rfork = 0; theFks[id1] = 1; return;
}
//
function
theCx_get() { return mycanvas.width/2; }
function
theCy_get() { return mycanvas.height/2; }
function
theRadius1_get() { return Math.min(mycanvas.width, mycanvas.height)/2; }
function
theRadius2_get() { return theRadius1_get() / 5; }
//
function
phil_Cx(id)
{
  var r1 = theRadius1_get();
  var r2 = theRadius2_get();
  var theta = Math.PI/2 + id*(2*Math.PI/5);
  return theCx_get() + (r1-r2) * Math.cos(theta);
}
function
phil_Cy(id)
{
  var r1 = theRadius1_get();
  var r2 = theRadius2_get();
  var theta = Math.PI/2 + id*(2*Math.PI/5);
  return theCy_get() - (r1-r2) * Math.sin(theta);
}
//
function
phil_draw(id)
{
  var ph = thePhs[id];
  var Cx = phil_Cx(id);
  var r2 = theRadius2_get();
  var Cy = phil_Cy(id) + 2*r2/5;
  var fg_color = "#000000"; // black
  var bg_color = "#ffffff"; // white
//
  var PI = Math.PI
  var rot = PI/2-id*(2*PI/5)
//
  myctx2d0.beginPath();
  myctx2d0.arc(Cx, Cy, r2, 0, 2*PI, true);
  myctx2d0.closePath();
  myctx2d0.fillStyle = bg_color; myctx2d0.fill();
//
  if (ph.lfork > 0)
  {
    myctx2d0.beginPath();
    myctx2d0.arc(Cx, Cy, r2, rot, rot+PI, true);
    myctx2d0.closePath();
    myctx2d0.fillStyle = fg_color; myctx2d0.fill();
  }
  if (ph.rfork > 0)
  {
    myctx2d0.beginPath();
    myctx2d0.arc(Cx, Cy, r2, rot+PI, rot+2*PI, true);
    myctx2d0.closePath();
    myctx2d0.fillStyle = fg_color; myctx2d0.fill();
  }
//
  return;
}
//
function
DininingPhil_initize()
{
  phil_loop(0);
  phil_loop(1);
  phil_loop(2);
  phil_loop(3);
  phil_loop(4); return;
}
/*
function
DininingPhil_initize() { alert("DininingPhil_initize"); }
*/
//
function
setTimeout_cloref(fwork, ntime)
{
  setTimeout(function(){cloref_app(fwork);return;}, ntime); return;
}
//
jQuery(document).ready(function(){DininingPhil_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [DiningPhil.php] *)
