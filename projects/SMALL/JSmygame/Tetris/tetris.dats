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
  if theGameStatus_get() > 0 then thePiece_handle()
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
extern
fun
theGame_play(): void = "mac#"
//
implement
theGame_play() =
{
  val () = theGameStatus_set(1)
  val () = GameBoard_clear(theGameBoard_get())
  val () = thePiece_start_out()
}
//
(* ****** ****** *)
//
extern
fun
theGame_stop(): void = "mac#"
//
implement
theGame_stop() =
{
  val () = theGameStatus_set(0)
}
//
(* ****** ****** *)

(* end of [tetris.dats] *)
