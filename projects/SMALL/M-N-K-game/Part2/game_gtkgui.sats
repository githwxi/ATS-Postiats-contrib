(*
** The M-N-K-game
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload CHAN =
"{$LIBATSHWXI}\
/teaching/mythread-0.3.2/SATS/channel.sats"
//
(* ****** ****** *)

typedef
channel (a:t@ype) = $CHAN.channel (a)

(* ****** ****** *)

fun game_gtkgui_get_chan1 (): channel (int)
fun game_gtkgui_get_chan2 (): channel (int)

(* ****** ****** *)

fun game_gtkgui_enter (): void
fun game_gtkgui_return (): void

(* ****** ****** *)

fun game_gtkgui_enter_after (): void
fun game_gtkgui_return_before (): void

(* ****** ****** *)

fun the_buttonlst_reset ((*void*)): void

(* ****** ****** *)

(* end of [game_gtkgui.sats] *)
