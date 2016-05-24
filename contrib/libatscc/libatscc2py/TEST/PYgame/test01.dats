(* ****** ****** *)
//
// Trying libatscc2py/Pygame
//
(* ****** ****** *)
//
(*
#include
"share/atspre_define.hats"
*)
//
#include"./../../staloadall.hats"
//
(* ****** ****** *)
//
staload "./../../SATS/PYgame/pygame.sats"
//
(* ****** ****** *)
//
extern
fun
test01_main
(
// argless
) : void = "mac#"
//
implement
test01_main() =
{
//
val npnf = pygame_init_ret()
val ((*void*)) = println! ("np = ", npnf.0)
val ((*void*)) = println! ("nf = ", npnf.1)
//
val ((*void*)) = pygame_quit((*void*))
//
} (* end of [test01_main] *)
//
(* ****** ****** *)

%{^
######
from libatscc2py_all import *
######
from ats2py_PYgame_pyame_cats import *
######
sys.setrecursionlimit(1000000)
######
%} // end of [%{^]

(* ****** ****** *)

%{$
if __name__ == '__main__': test01_main()
%} // end of [%{$]

(* ****** ****** *)

(* end of [test01.dats] *)
