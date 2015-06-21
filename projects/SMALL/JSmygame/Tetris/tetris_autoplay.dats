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
theAutoBoard =
  mtrxszref_make_elt{int}(GCOLS, GROWS, 0)
//
fun
theAutoBoard_update() =
theGameBoard_iforeach
  (lam(i, j, b) => theAutoBoard[i,j] := bool2int0(b))
//
(* ****** ****** *)
//
val
theAutoPiece = mtrxszref_make_elt{int}(PDIM, PDIM, 0)
//
fun
theAutoPiece_update
  (nrot: natLt(4)) = (
//
case+ nrot of
| 0 =>
  thePiece_iforeach
    (lam(i, j, b) => theAutoPiece[i     ,j    ] := bool2int0(b))
  // thePiece_iforeach
| 1 =>
  thePiece_iforeach
    (lam(i, j, b) => theAutoPiece[PDIM-j,i    ] := bool2int0(b))
  // thePiece_iforeach
| 2 =>
  thePiece_iforeach
    (lam(i, j, b) => theAutoPiece[PDIM-i,PDIM-j] := bool2int0(b))
  // thePiece_iforeach
| 3 =>
  thePiece_iforeach
    (lam(i, j, b) => theAutoPiece[j     ,PDIM-i] := bool2int0(b))
  // thePiece_iforeach
//
)
(* ****** ****** *)
//
fun
theAutoBoard_isset_at
  (i: int, j: int): bool =
  (i < 0 || i >= GCOLS) || (j < 0 || j >= GROWS) || (theAutoBoard[i,j] > 0)
//
(* ****** ****** *)

fun
theAutoPiece_collide_at
  (x0: int, y0: int) =
(
//
mtrxszref_exists_cloref
( theAutoPiece
, lam(i, j) =>
  if theAutoPiece[i,j] > 0
    then theAutoBoard_isset_at(x0+i, y0+j) else false
  // end of [if]
) (* mtrxszref_exists_cloref *)
//
) (* end of [theAutoPiece_collide_at] *)

(* ****** ****** *)

fun
theAutoPiece_maxfall_at
  (x0: int, y0: int) = let
//
fun
loop(y: int): int =
if theAutoPiece_collide_at(x0, y+1) then y else loop(y+1)
//
in
  if theAutoPiece_collide_at(x0, y0) then ~1 else loop(y0)
end // end of [theAutoPiece_maxfall_at]

(* ****** ****** *)

fun
theAutoPiece_dump_at
  (x0: int, y0: int) =
(
mtrxszref_foreach_cloref
( theAutoPiece
, lam(i, j) =>
  if theAutoPiece[i,j] > 0
    then let
      val x = x0+i and y = y0+j in
      theAutoBoard[x,y] := theAutoBoard[x,y] + 1
    end // end of [then]
  // end of [if]
) (* mtrxszref_foreach_cloref *)
) (* end of [theAutoPiece_dump_at] *)

(* ****** ****** *)
    
fun
theAutoPiece_undump_at
  (x0: int, y0: int) =
(
mtrxszref_foreach_cloref
( theAutoPiece
, lam(i, j) =>
  if theAutoPiece[i,j] > 0
    then let
      val x = x0+i and y = y0+j in
      theAutoBoard[x,y] := theAutoBoard[x,y] - 1
    end // end of [then]
  // end of [if]
) (* mtrxszref_foreach_cloref *)
) (* end of [theAutoPiece_undump_at] *)

(* ****** ****** *)
    
(* end of [tetris_autoplay.dats] *)
