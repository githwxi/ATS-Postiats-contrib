(*
** Tetris
*)

(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "tetris_"
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
//
function
theGame_tick(event)
{
  thePiece_handle_if(); theStage.update(); return;
}
//
function
theGame_initize()
{
  theStage = new createjs.Stage("theGameCanvas");
  createjs.Ticker.addEventListener("tick", theGame_tick);
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
theGameTQuota_init = ref{double}(100.0)
val
theGameTQuota_left = ref{double}(100.0)
val
theGameTQuota_delta = ref{double}(21.0)
//
in
//
implement
theGameTQuota_get() = theGameTQuota_left[]
//
implement
theGameTQuota_reset
  ((*void*)) =
(
  theGameTQuota_left[] := theGameTQuota_init[]
)
implement
theGameTQuota_update
  ((*void*)) = let
  val left = theGameTQuota_left[]
in
  theGameTQuota_left[] := left - theGameTQuota_delta[]
end // end of [theGameTQuota_update]
//
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
thePiece_handle_if() =
(
//
if
theGameStatus_get() > 0
then let
  val test = theGameBoard_rowdel_one()
in
//
if
not(test)
then let
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
end // end of [then]
//
end // end of [then]
//
) (* end of [thePiece_handle_if] *)
//
(* ****** ****** *)
//
val () = tetris_block_initize()
val () = tetris_piece_initize()
val () = tetris_keyboard_initize()
val () = tetris_gameboard_initize()
//
(* ****** ****** *)
//
implement
theGame_play() =
if
(theGameStatus_get() = 0)
then
{
  val () = theGameBoard_clear()
  val () = theGameStatus_set(1)
  val () = thePiece_start_out()
}
//
(* ****** ****** *)
//
implement
theGame_stop() =
{
  val () = theGameStatus_set(0)
  val () = theGameTQuota_reset()
}
//
(* ****** ****** *)

(* end of [tetris.dats] *)
