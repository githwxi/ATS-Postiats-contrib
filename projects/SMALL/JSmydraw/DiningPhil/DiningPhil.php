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
  fwork: () -<cloref1> void, ntime: int
) : void = "mac#" // end-of-function
//
(* ****** ****** *)
//
extern
fun
phil_loop
  (id: nphil, state: int): void
//
(* ****** ****** *)
//
extern
fun phil_loop_dine(id: nphil): void
//
extern
fun phil_loop_think(id: nphil): void
//
(* ****** ****** *)

#define DINE 0
#define DINE_L0 1
#define DINE_L1 2
#define DINE_R0 3
#define DINE_R1 4
#define THINK 5

(* ****** ****** *)

implement
phil_loop
  (id, state) = let
in
//
case+ state of
| 0 => phil_loop_dine(id)
| 1 => phil_loop_think(id)
| _ => setTimeout_cloref(lam() => phil_loop(id, state), 1000)
//
end // end of [phil_loop]

(* ****** ****** *)

implement
phil_loop_dine(id) = ()

(* ****** ****** *)

implement
phil_loop_think(id) = let
//
val ntime =
  double2int(100 + 500 * JSmath_random())
//
in
  setTimeout_cloref(lam() => phil_loop(id, DINE), ntime)
end // end of [phil_loop_think]

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
function
DininingPhil_initize() { }
/*
function
DininingPhil_initize() { alert("DininingPhil_initize"); }
*/
//
fun
setTimeout_cloref(fwork, ntime)
{
  setTimeout(function(){cloref_app(fwork);return;}, ntime); return;
}
//
function
do_snapshot_loop()
{
  do_snapshot();
  setTimeout(function(){do_snapshot();return;}, 100);
  return/*void*/;
}
//
jQuery(document).ready(function(){DininingPhil_initize();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [DiningPhil.php] *)
