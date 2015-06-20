(*
** Tetris
*)

(* ****** ****** *)

#define
ATS_STATIC_PREFIX "tetris_autoplay__"

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris_autoplay_initize"

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
(* ****** ****** *)
//
staload (*opened*) "./tetris.sats"
//
(* ****** ****** *)
//
#include "{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
typedef
matrix0(a:t@ype) = mtrxszref(a)
//
(* ****** ****** *)
//
val
theAutoBoard = mtrxszref_make_elt(GCOLS, GROWS, 0)
//
(* ****** ****** *)

fun
theAutoBoard_update() =
theGameBoard_iforeach(lam(i, j, b) => theAutoBoard[i,j] := (if b then 1 else 0))

(* ****** ****** *)
    
(* end of [tetris_autoplay.dats] *)
