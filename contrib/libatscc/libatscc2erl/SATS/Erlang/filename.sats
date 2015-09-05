(*
** Module [filename]
*)

(* ****** ****** *)
//
staload
"./../../basics_erl.sats"
//
(* ****** ****** *)

typedef filename = string

(* ****** ****** *)
//
fun
absname(filename): filename = "mac#%"
//
(* ****** ****** *)
//
fun
basename(filename): filename = "mac#%"
//
(* ****** ****** *)

fun split(filename): ERLlist(string) = "mac#%"

(* ****** ****** *)

(* end of [filename.sats] *)