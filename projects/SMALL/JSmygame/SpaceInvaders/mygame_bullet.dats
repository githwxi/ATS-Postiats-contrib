(*
** SpaceInvaders
*)

(* ****** ****** *)

#define ATS_STATIC_PREFIX "mygame_bullet_"

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "mygame_bullet_initize"

(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
staload "./mygame.sats"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)

%{^
//
function
bullet_new(i)
{
  var
  bullet = new createjs.Shape();
//
  bullet.x = 0;
  bullet.y = 0;
//
  var color = "";
  if (i === 0) color = "red";
  if (i === 1) color = "blue";
//
  bullet.graphics.beginFill(color).drawCircle(0, 0, 4);
  return { createjs: bullet, isadded: 0, vx: 0, vy: 0 };
//
}
//
%} // end of [%{]

(* ****** ****** *)
//
%{^
//
function
bullet_get_x(bullet, x) { return bullet.createjs.x ; }
function
bullet_get_y(bullet, y) { return bullet.createjs.y ; }
//
function
bullet_set_x(bullet, x) { bullet.createjs.x = x; return; }
function
bullet_set_y(bullet, y) { bullet.createjs.y = y; return; }
//
function
bullet_incby_x(bullet, dx) { bullet.createjs.x += dx; return; }
function
bullet_incby_y(bullet, dy) { bullet.createjs.y += dy; return; }
//
function
bullet_get_vx(bullet, vx) { return bullet.vx ; }
function
bullet_get_vy(bullet, vy) { return bullet.vy ; }
//
function
bullet_set_vx(bullet, vx) { bullet.vx = vx; return; }
function
bullet_set_vy(bullet, vy) { bullet.vy = vy; return; }
//
%} // end of [%{]
//
(* ****** ****** *)

local
//
val
thePlayerBullets =
  ref{List0(bullet)}(list_nil)
//
in (* in-of-local *)
//
implement
thePlayerBullets_get() = thePlayerBullets[]
//
implement
thePlayerBullets_add(x) =
  thePlayerBullets[] := list_cons(x, thePlayerBullets[])
//
end // end of [local]

(* ****** ****** *)

implement
thePlayerBullets_update
  () = let
//
fun
loop
(
  blts: List0(bullet)
) : void = let
in
//
case+ blts of
| list_nil() => ()
| list_cons(blt, blts) =>
  (
    bullet_incby_x(blt, BULLET_VX);
    bullet_incby_y(blt, ~BULLET_VY);
    loop(blts)
  )
//
end // end of [loop]
//
in
  loop(thePlayerBullets_get())
end // end of [thePlayerBullets_update]

(* ****** ****** *)
    
local
//
val
theEnemiesBullets =
  ref{List0(bullet)}(list_nil)
//
in (* in-of-local *)
//
implement
theEnemiesBullets_get() = theEnemiesBullets[]
//
implement
theEnemiesBullets_add(x) =
  theEnemiesBullets[] := list_cons(x, theEnemiesBullets[])
//
end // end of [local]

(* ****** ****** *)

implement
theEnemiesBullets_update () = ()

(* ****** ****** *)
    
(* end of [mygame_bullet.dats] *)
