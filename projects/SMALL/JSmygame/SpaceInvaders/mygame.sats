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

#define XBULLET 8
#define YBULLET 8
#define XPLAYER 32
#define YPLAYER 32
#define XSCREEN 640
#define YSCREEN 640

(* ****** ****** *)

#define BULLET_VX 0
#define BULLET_VY 16

(* ****** ****** *)
//
fun
theStage_addChild{a:type}(x: a): void = "mac#"
//
(* ****** ****** *)

abstype bullet

(* ****** ****** *)
//
fun
bullet_new
  (kind: int): bullet = "mac#"
//
fun
bullet_get_x (bullet): int(*x*) = "mac#"
fun
bullet_get_y (bullet): int(*y*) = "mac#"
fun
bullet_set_x (bullet, x: int): void = "mac#"
fun
bullet_set_y (bullet, y: int): void = "mac#"
//
fun
bullet_incby_x (bullet, dx: int): void = "mac#"
fun
bullet_incby_y (bullet, dy: int): void = "mac#"
//
(* ****** ****** *)

fun
bullet_get_vx (bullet): int(*vx*) = "mac#"
fun
bullet_get_vy (bullet): int(*vy*) = "mac#"
fun
bullet_set_vx (bullet, vx: int): void = "mac#"
fun
bullet_set_vy (bullet, vy: int): void = "mac#"

(* ****** ****** *)
//
overload .x with bullet_get_x
overload .x with bullet_set_x
overload .y with bullet_get_y
overload .y with bullet_set_y
//
(* ****** ****** *)
//
overload .vx with bullet_get_vx
overload .vx with bullet_set_vx
overload .vy with bullet_get_vy
overload .vy with bullet_set_vy
//
(* ****** ****** *)
//
fun
thePlayerBullets_get (): List0(bullet)
//
fun
thePlayerBullets_add (bullet): void = "mac#"
//
fun
thePlayerBullets_update ((*void*)): void = "mac#"
//
(* ****** ****** *)
//
fun
theEnemiesBullets_get (): List0(bullet)
//
fun
theEnemiesBullets_add (bullet): void = "mac#"
//
fun
theEnemiesBullets_update ((*void*)): void = "mac#"
//
(* ****** ****** *)

abstype enemy

(* ****** ****** *)

fun enemy_new (): enemy = "mac#"

(* ****** ****** *)
//
fun
enemy_get_x (enemy): int(*x*) = "mac#"
fun
enemy_set_x (enemy, x: int): void = "mac#"
fun
enemy_incby_x (enemy, dx: int): void = "mac#"
//
fun
enemy_get_y (enemy): int(*y*) = "mac#"
fun
enemy_set_y (enemy, y: int): void = "mac#"
fun
enemy_incby_y (enemy, dy: int): void = "mac#"
//
(* ****** ****** *)
//
overload .x with enemy_get_x
overload .x with enemy_set_x
//
overload .y with enemy_get_y
overload .y with enemy_set_y
//
(* ****** ****** *)

fun
enemy_fire_bullet(enemy): void = "mac#"

(* ****** ****** *)

abstype player

(* ****** ****** *)

fun player_new (): player = "mac#"

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

fun
player_fire_bullet(player): void = "mac#"

(* ****** ****** *)

fun thePlayer_get (): Option(player) = "mac#"

(* ****** ****** *)
//
fun
theKeyDowns_handle(fwork: int -<cloref1> void): void = "mac#"
//
(* ****** ****** *)

fun mygame_keybd_initize(): void = "mac#"
fun mygame_bullet_initize(): void = "mac#"
fun mygame_enemy_initize(): void = "mac#"
fun mygame_player_initize(): void = "mac#"

(* ****** ****** *)

(* end of [mygame.sats] *)
