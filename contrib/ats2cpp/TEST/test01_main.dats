(*
** For testing ats2cpp
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
staload "./test01.dats"
//
implement
main0() =
println! ("fact(10) = ", fact(10))
//
(* ****** ****** *)

(* end of [test01_main.dats] *)
