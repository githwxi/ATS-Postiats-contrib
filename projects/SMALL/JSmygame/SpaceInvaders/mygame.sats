(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

#define XPLAYER 32
#define YPLAYER 32
#define XSCREEN 640
#define YSCREEN 640

(* ****** ****** *)

abstype player

(* ****** ****** *)

fun player_new (): player = "mac#"

(* ****** ****** *)

fun player_get_createjs(player): JSobj = "mac#"

(* ****** ****** *)
//
fun
player_get_x (player): int(*x*) = "mac#"
fun
player_set_x (player, x: int): void = "mac#"
fun
player_incby_x (player, dx: int): void = "mac#"
//
fun
player_get_y (player): int(*y*) = "mac#"
fun
player_set_y (player, y: int): void = "mac#"
fun
player_incby_y (player, dy: int): void = "mac#"
//
(* ****** ****** *)
//
overload .x with player_get_x
overload .x with player_set_x
//
overload .y with player_get_y
overload .y with player_set_y
//
(* ****** ****** *)

fun thePlayer_get (): Option(player) = "mac#"

(* ****** ****** *)
//
fun
theStage_addChild{a:type}(x: a): void = "mac#"
//
(* ****** ****** *)
//
fun
theKeyDowns_handle(fwork: int -<cloref1> void): void = "mac#"
//
(* ****** ****** *)

fun mygame_keybd_initize(): void = "mac#"
fun mygame_player_initize(): void = "mac#"

(* ****** ****** *)

(* end of [mygame.sats] *)
