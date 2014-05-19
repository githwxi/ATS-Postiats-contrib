(*
** The M-N-K-game
*)

(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)

#include "share/atspre_staload.hats"

(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)
//
implement ptr_volatile (p) = ()
// this is for circumventing a gcc-O1 bug
//
(* ****** ****** *)

implement
string_get_int (inp) = let
//
fun loop
(
  inp: string
) : string = let
  val p = string2ptr(inp)
  val c = $UN.ptr0_get<char> (p)
in
  if c != '\000' then
    (if isdigit (c) then inp else loop ($UN.cast{string}(ptr_succ<char>(p))))
  else inp // end of [if]
end (* end of [loop] *)
//
fun loop2
(
  inp: string, res: &int >> _
) : string = let
  val p = string2ptr(inp)
  val c = $UN.ptr0_get<char> (p)
in
  if isdigit (c) then let
    val () = res := 10 * res + (c - '0')
  in
    loop2 ($UN.cast{string}(ptr_succ<char>(p)), res)
  end else inp // end of [if]
end
//
var res: int = 0
val inp2 = loop (inp)
val ((*void*)) = inp := loop2 (inp2, res)
//
in
  res
end // end of [string_get_int]

(* ****** ****** *)

local
//
#include "prelude/DATS/filebas.dats"
//
in (*in-of-local*)
//
end // end of [local]
  
(* ****** ****** *)

(* end of [game_mylib.dats] *)
