(*
** The M-N-K-game
*)

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)

implement
game_initize () =
{
//
val () = println! ("game_initize: enter")
//
val inp = "3-3-3"
var inp : string = inp
//
val M = string_get_int (inp)
val N = string_get_int (inp)
val K = string_get_int (inp)
//
val () = game_conf_set_m (M)
val () = game_conf_set_n (N)
val () = game_conf_set_k (K)
//
val () = println! ("game_initize: leave")
//
} (* end of [game_initize] *)

(* ****** ****** *)

(* end of [game_initize.dats] *)
