(*
** The M-N-K-game
*)

(* ****** ****** *)

#define
ATS_PACKNAME "M_N_K_game"

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)

implement
fprint_conf(out) =
{
  val M = game_conf_get_m ()
  val N = game_conf_get_n ()
  val K = game_conf_get_k ()
  val () = fprintln! (out, "M-N-K is ", M, "-", N, "-", K)
}
 
(* ****** ****** *)

staload M = {
//
typedef T = int
//
fun
initize (x: &T? >> T): void = x := 0
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
game_conf_get_m () = $M.get ()
implement
game_conf_set_m (m) = $M.set (m)

(* ****** ****** *)

staload N = {
//
typedef T = int
//
fun
initize (x: &T? >> T): void = x := 0
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
game_conf_get_n () = $N.get ()
implement
game_conf_set_n (n) = $N.set (n)

(* ****** ****** *)

staload K = {
//
typedef T = int
//
fun
initize (x: &T? >> T): void = x := 0
//
#define
HX_GLOBALS_targetloc
"\
$PATSHOME\
/contrib/atscntrb/atscntrb-hx-globals"
#include "{$HX_GLOBALS}/HATS/globvar.hats"
//
} (* end of [staload] *)

(* ****** ****** *)

implement
game_conf_get_k () = $K.get ()
implement
game_conf_set_k (k) = $K.set (k)

(* ****** ****** *)

(* end of [game_conf.dats] *)
