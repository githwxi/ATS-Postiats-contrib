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
#define PDIM1 (PDIM-1)
//
val
theAutoPiece = mtrxszref_make_elt{int}(PDIM, PDIM, 0)
//
fun
theAutoPiece_update
  (P0: Piece, nrot: natLt(4)) = (
//
case+ nrot of
| 0 =>
  Piece_iforeach
    (P0, lam(i, j, b) => theAutoPiece[i      ,j    ] := bool2int0(b))
  // Piece_iforeach
| 1 =>
  Piece_iforeach
    (P0, lam(i, j, b) => theAutoPiece[PDIM1-j,i    ] := bool2int0(b))
  // Piece_iforeach
| 2 =>
  Piece_iforeach
    (P0, lam(i, j, b) => theAutoPiece[PDIM1-i,PDIM1-j] := bool2int0(b))
  // Piece_iforeach
| 3 =>
  Piece_iforeach
    (P0, lam(i, j, b) => theAutoPiece[j      ,PDIM1-i] := bool2int0(b))
  // Piece_iforeach
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
theAutoBoard_eval
  ((*void*)): double = let
//
fun
loop1
(
  i: int, res: double
) : double =
(
if i < GCOLS
  then loop2(i, 0, res) else res
)
//
and
loop2
(
  i: int, j: int, res: double
) : double =
(
//
if
j < GROWS
then let
  val res = res + theAutoBoard[i,j] * (GROWS-j)
in
  loop2(i, j+1, res)
end // end of [then]
else loop1(i+1, res)
//
) (* end of [loop2] *)
//
in
  loop1 (0, 0.0)
end // end of [theAutoBoard_eval]

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
  (x0: int, y0: int): int = let
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
//
datatype
sitscore =
| SITSCORE0 of ()
| SITSCORE1 of
    (double, int(*xmove*), int(*rotate*))
  // end of [SITSCORE1]
//
(* ****** ****** *)
//
extern
fun
lte_sitscore_scorexmvrot
  (sitscore, score2: double, xmv2: int, rot2: int): bool = "mac#"
//
implement
lte_sitscore_scorexmvrot
  (ss1, score2, xmv2, rot2) =
(
case+ ss1 of
| SITSCORE0() => false
| SITSCORE1(score1, xmv1, rot1) =>
  (
    case+ 0 of
    | _ when
        score1 < score2 => true
    | _ when
        score1 > score2 => false
    | _ (* score1 = score2 *) => let
        val xmv1 = abs(xmv1)
        val xmv2 = abs(xmv2)
      in
        if xmv1 < xmv2
          then true else (if xmv1 > xmv2 then false else (abs(rot1) <= abs(rot2)))
        // end of [if]
      end // end of [score1 = score2]
  ) (* end of [SITSCORE1] *)
)
//
(* ****** ****** *)
//
extern
fun
theAutoplay_eval
  (Piece, x0: int, y0: int): sitscore = "mac#"
//
(* ****** ****** *)

implement
theAutoplay_eval
  (P0, x0, y0) = let
//
fun
auxmin_l
(
  ss: sitscore, xmv: int, rot: int
) : sitscore = let
//
val x1 = x0 + xmv
val y1 = theAutoPiece_maxfall_at(x1, y0)
//
(*
val () = alert("auxmin_l: y1 = " + String(y1))
*)
//
in
//
if y1 < 0 then ss else let
  val () = theAutoPiece_dump_at(x1, y1)
  val score = theAutoBoard_eval((*void*))
(*
  val () = alert("auxmin_l: score = " + String(score))
*)
  val () = theAutoPiece_undump_at(x1, y1)
  val test2 =
    lte_sitscore_scorexmvrot(ss, score, xmv, rot)
  // end of [val]
in
  if test2
    then auxmin_l(ss, xmv-1, rot)
    else auxmin_l(SITSCORE1(score, xmv, rot), xmv-1, rot)
  // end of [if]
end // end of [else] // end of [if]
//
end // end of [auxmin_l]
//
fun
auxmin_r
(
  ss: sitscore, xmv: int, rot: int
) : sitscore = let
//
val x1 = x0 + xmv
val y1 = theAutoPiece_maxfall_at(x1, y0)
//
(*
val () = alert("auxmin_r: y1 = " + String(y1))
*)
//
in
//
if y1 < 0 then ss else let
  val () = theAutoPiece_dump_at(x1, y1)
  val score = theAutoBoard_eval((*void*))
(*
  val () = alert("auxmin_r: score = " + String(score))
*)
  val () = theAutoPiece_undump_at(x1, y1)
  val test2 =
    lte_sitscore_scorexmvrot(ss, score, xmv, rot)
  // end of [val]
in
  if test2
    then auxmin_r(ss, xmv+1, rot)
    else auxmin_r(SITSCORE1(score, xmv, rot), xmv+1, rot)
  // end of [if]
end // end of [else] // end of [if]
//
end // end of [auxmin_r]
//
fun
auxmin2
(
  ss: sitscore, nrot: natLte(4)
) : sitscore = (
//
if
nrot < 4
then let
//
val () =
  theAutoPiece_update(P0, nrot)
//
val rot =
(
  if nrot <= 2
    then nrot else (nrot-4)
  // end of [if]
) : int // end of [val]
val ss_r = auxmin_r(ss, 0, rot)
val ss_r_l = auxmin_l(ss_r, ~1, rot)
//
in
  auxmin2 (ss_r_l, nrot + 1)
end // end of [then]
else ss // end of [else]
//
) (* end of [auxmin2] *)
//
in
  auxmin2 (SITSCORE0(), 0)
end // end of [theAutoplay_eval]

(* ****** ****** *)

fun
autoplay_xmv
  (P0: Piece, xmv: int) = let
//
(*
val () =
  alert("autoplay_xmove: xmv = "+String(xmv))
*)
//
in
//
case+ 0 of
| _ when xmv > 0 => let
    val moved = Piece_xmove_r(P0)
  in
    if moved then autoplay_xmv (P0, xmv - 1)
  end
| _ when xmv < 0 => let
    val moved = Piece_xmove_l(P0)
  in
    if moved then autoplay_xmv (P0, xmv + 1)
  end
| _ (* xmv = 0 *) => ((*void*))
//
end (* end of [autoplay_xmv] *)

(* ****** ****** *)

fun
autoplay_rot
(
  P0: Piece, rot: int
) : void =
(
case+ rot of
| _ when rot = 1 =>
  {
    val _ = Piece_rrotate(P0)
  }
| _ when rot = ~1 =>
  {
    val _ = Piece_lrotate(P0)
  }
| _ when rot = 2 =>
  {
    val _ = Piece_rrotate(P0)
    val _ = Piece_rrotate(P0)
  }
| _ (* rot = 0 *) => ()
)

(* ****** ****** *)

fun
autoplay_rotxmv
(
  P0: Piece
, xmv: int, rot: int
) : void =
{
  val () = autoplay_rot (P0, rot)
  val () = autoplay_xmv (P0, xmv)
  val () = theGameTQuota_delta_space()
}

(* ****** ****** *)

implement
theGame_autoplay_piece
  (P0) = let
//
(*
val () =
  alert("theGame_autoplay_piece")
*)
//
val x0 = Piece_get_x(P0)
val y0 = Piece_get_y(P0)
//
val () = theAutoBoard_update()
val ss = theAutoplay_eval(P0, x0, y0)
//
(*
val () =
  alert("theGame_autoplay_piece: x0 = "+String(x0))
val () =
  alert("theGame_autoplay_piece: y0 = "+String(y0))
*)
//
in
//
case+ ss of
| SITSCORE0() => ()
| SITSCORE1(score, xmv, rot) => autoplay_rotxmv(P0, xmv, rot)
//
end // end of [theGame_autoplay_piece]

(* ****** ****** *)
    
(* end of [tetris_autoplay.dats] *)
