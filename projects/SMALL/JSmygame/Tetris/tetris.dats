(*
** Tetris
*)

(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "tetris__"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris_initize"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload (*opened*) "./tetris.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
%{^
//
var
theKeyDowns =
  $(document).asEventStream("keydown")
//
var
theKeyDowns =
theKeyDowns.doAction(".preventDefault")
//
%} // end of ...
//
(* ****** ****** *)
//
%{^
//
var theStage = 0;
var theStageNP = 0;
//
function
theGame_tick(event)
{
//
  theAutoplay_fact();
  thePiece_handle_if();
//
  theStage.update();
  theStageNP.update();
//
  return;
}
//
function
theGame_initize()
{
  theStage = new createjs.Stage("theGameCanvas_main");
  theStageNP = new createjs.Stage("theGameCanvas_np"); // theNextPiece
  createjs.Ticker.setInterval(25); // FPS=1000/25=40
  createjs.Ticker.addEventListener("tick", theGame_tick);
}
//
function
theScore_incby(delta)
{
    var
    score_well =
    document.getElementById("score_well");
    score_well.innerHTML =
    String(parseInt(score_well.innerHTML)+delta);
}
function
theScore_reset(score)
{
    document.getElementById("score_well").innerHTML = score;
}
//
%}
//
val () =
theGame_initize() where
  { extern fun theGame_initize(): void = "mac#" }
//
(* ****** ****** *)
//
%{^
//
function
theStage_addChild(x)
{
  theStage.addChild(x.createjs); return;
}
//
function
theStage_removeChild(x)
{
  theStage.removeChild(x.createjs); return;
}
//
function
theStageNP_addChild(x)
{
  theStageNP.addChild(x.createjs); return;
}
//
function
theStageNP_removeChild(x)
{
  theStageNP.removeChild(x.createjs); return;
}
//
%} // end of [%{^]
//
(* ****** ****** *)

local
//
val
theGameStatus = ref{int}(0)
//
in (* in-of-local *)

implement
theGameStatus_get() = theGameStatus[]
implement
theGameStatus_set(x) = theGameStatus[] := x

end // end of [local]  
  
(* ****** ****** *)

local
//
val
theGameTQuota0 = ref{double}(100.0)
val
theGameTQuota_left = ref{double}(100.0)
val
theGameTQuota_delta0 = ref{double}(15.0)
val
theGameTQuota_delta1 = ref{double}(15.0)
//
in
//
implement
theGameTQuota_get() = theGameTQuota_left[]
//
implement
theGameTQuota_reset
  ((*void*)) =
{
  val () = theGameTQuota_left[] := theGameTQuota0[]
}
implement
theGameTQuota_update
  ((*void*)) = let
  val left = theGameTQuota_left[]
in
  theGameTQuota_left[] := left - theGameTQuota_delta1[]
end // end of [theGameTQuota_update]
//
implement
theGameTQuota_delta_space
  ((*void*)) =
{
  val () = theGameTQuota_delta1[] := 101.0
}
implement
theGameTQuota_delta_reset
  ((*void*)) =
{
  val () = theGameTQuota_delta1[] := theGameTQuota_delta0[]
}
//
end // end of [local]

(* ****** ****** *)

local

val nprev = ref{int}(0)

in (* in-of-local *)

fun
theScore_getinc_delta
  ((*void*)): int = let
  val np = nprev[]
  val () = nprev[] := np + 1
in
  case+ np of
  | 1 => 20 | 2 => 40 | 3 => 80 | _ => 10
end // end-of-function

fun theScore_reset_delta(): void = nprev[] := 0

end // end of [local]

(* ****** ****** *)
//
extern
fun
thePiece_handle(): void = "mac#"
implement
thePiece_handle() = let
//
val P0 = thePiece_get()
//
val moved = Piece_ymove_dn(P0)
//
val () = if not(moved) then Piece_dump_blocks(P0)
val () = if not(moved) then theGameTQuota_delta_reset()
val () = if not(moved) then thePiece_theNextPiece_update()
//
in
  // nothing
end // end of [thePiece_handle]
//
extern
fun
thePiece_handle_if(): void = "mac#"
implement
thePiece_handle_if() = let
//
val status = theGameStatus_get()
//
in
//
if
status != 0
then let
//
val
rowdel = theGameBoard_rowdel_one()
//
in
//
if
(rowdel)
then let
  val delta = theScore_getinc_delta()
in
  $extfcall(void, "theScore_incby", delta)
end // end of [then]
else let
  val () =
    theScore_reset_delta()
  // end of [val]
  val () =
    theGameTQuota_update()
  // end of [val]
  val tq = theGameTQuota_get()
in
//
if
tq > 0.0
then ((*void*))
else (theGameTQuota_reset(); thePiece_handle())
//
end // end of [else]
//
end // end of [then]
//
end (* end of [thePiece_handle_if] *)
//
(* ****** ****** *)
//
(*
//
// HX-2015-05-11:
// This works, too!
//
dynload "tetris_block.dats"
dynload "tetris_piece.dats"
dynload "tetris_keyboard.dats"
dynload "tetris_autoplay.dats"
dynload "tetris_gameboard.dats"
*)
val () = tetris_block_initize()
val () = tetris_piece_initize()
val () = tetris_keyboard_initize()
val () = tetris_autoplay_initize()
val () = tetris_gameboard_initize()
//
(* ****** ****** *)
//
implement
theGame_play() = let
//
val status = theGameStatus_get()
//
val () =
if (status = 0) then
{
//
  val () = theGameBoard_clear()
  val () = theGameStatus_set(1)
//
  val () = thePiece_theNextPiece_update()
//
  val () = theScore_reset_delta()
//
  val () = $extfcall(void, "theScore_reset", 0)
//
} (* end of [if] *) // end of [val]
//
in
  if (status < 0) then theGameStatus_set(1)
end // end of [theGame_play]
//
(* ****** ****** *)
//
implement
theGame_auto() = let
//
val status = theGameStatus_get()
//
val () =
if (status = 0) then
{
//
  val () = theGameBoard_clear()
  val () = theGameStatus_set(~1)
//
  val () = thePiece_theNextPiece_update()
//
  val () = theScore_reset_delta()
//
  val () = $extfcall(void, "theScore_reset", 0)
//
} (* end of [if] *) // end of [val]
//
val () =
if (status > 0) then
{
//
val () = theGameStatus_set(~1)
val () = theGame_autoplay_piece(thePiece_get())
//
} (* end of [if] *) // end of [val]
//
in
  // nothing
end // end of [theGame_auto]
//
(* ****** ****** *)
//
implement
theGame_stop() =
{
  val () = theGameStatus_set(0)
  val () = thePiece_dump_blocks()
  val () = theGameTQuota_reset()
}
//
(* ****** ****** *)

(* end of [tetris.dats] *)
