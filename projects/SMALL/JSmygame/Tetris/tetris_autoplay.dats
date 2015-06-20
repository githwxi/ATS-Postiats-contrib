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
theAutoPiece = mtrxszref_make_elt(PDIM, PDIM, 0)
//
val
theAutoBoard = mtrxszref_make_elt(GCOLS, GROWS, 0)
//
(* ****** ****** *)
//
fun
theAutoPiece_update
  (nrot: natLt(4)) = (
//
case+ nrot of
| 0 =>
  (
    thePiece_iforeach
      (lam(i, j, b) => theAutoPiece[i,j] := (if b then 1 else 0))
    // end of [thePiece_iforeach]
  )
| 1 =>
  (
    thePiece_iforeach
      (lam(i, j, b) => theAutoPiece[PDIM-j,i] := (if b then 1 else 0))
    // end of [thePiece_iforeach]
  )
| 2 =>
  (
    thePiece_iforeach
      (lam(i, j, b) => theAutoPiece[PDIM-i,PDIM-j] := (if b then 1 else 0))
    // end of [thePiece_iforeach]
  )
| 3 =>
  (
    thePiece_iforeach
      (lam(i, j, b) => theAutoPiece[j,PDIM-i] := (if b then 1 else 0))
    // end of [thePiece_iforeach]
  )
//
)
(* ****** ****** *)
//
fun
theAutoBoard_update() =
theGameBoard_iforeach
  (lam(i, j, b) => theAutoBoard[i,j] := (if b then 1 else 0))
//
(* ****** ****** *)
    
(* end of [tetris_autoplay.dats] *)
