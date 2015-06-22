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
staload
UN = "prelude/SATS/unsafe.sats"
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
fun
power
(
  x: int, n: int
): int = (
//
if n >= 2
  then x * power(x, n-1) else (if n >= 1 then x else 1)
//
) (* end of [power] *)
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
(* ****** ****** *)
//
fun
theAutoBoard_rowful_at
  (y0: int): bool = let
//
fun loop(x: int): bool =
(
  if x < GCOLS then
    (if theAutoBoard[x, y0] > 0 then loop(x+1) else false)
  else true // end of [if]
)
//
in
  loop(0)
end // end of [theAutoBoard_rowful_at]
//
fun
theAutoBoard_rowdel_at
  (y0: int): void = let
//
fun
auxcol(x: int, y: int): void =
(
if
y > 0
then let
  val () =
    theAutoBoard[x, y] := theAutoBoard[x, y-1]
in
  auxcol(x, y-1)
end // end of [then]
else (theAutoBoard[x, y] := 0)
)
//
fun loop(x: int): void =
  if x < GCOLS then (auxcol(x, y0); loop(x+1)) else ()
//
in
  loop(0)
end // end of [theAutoBoard_rowdel_at]
//
(* ****** ****** *)

fun
theAutoBoard_rowdel_all
  ((*void*)): void = let
//
fun loop (y: int): void =
(
if
y < GROWS
then let
  val isful = theAutoBoard_rowful_at(y)
  val ((*void*)) = if isful then theAutoBoard_rowdel_at(y)
in
  loop(y+1)
end // end of [then]
else () // end of [else]
)
//
in
  loop(0)
end // end of [theAutoBoard_rowdel_all]
//
(* ****** ****** *)

fun
theAutoBoard_update() =
{
//
val () =
theGameBoard_iforeach
  (lam(i, j, b) => theAutoBoard[i,j] := bool2int0(b))
//
val () = theAutoBoard_rowdel_all()
//
} (* end of [theAutoBoard_update] *)

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
theAutoBoard_eval1
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
then (
  if theAutoBoard[i,j] = 0
    then loop2 (i, j+1, res)
    else loop2 (i, j+1, res + power(GROWS-j, 2))
  // end of [if]
) else loop1(i+1, res)
//
) (* end of [loop2] *)
//
in
  loop1 (0, 0.0)
end // end of [theAutoBoard_eval1]

(* ****** ****** *)

fun
theAutoBoard_eval2
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
then (
//
if theAutoBoard[i,j] = 0
  then loop2(i, j+1, res) else loop3(i, j+1, 0, res)
//
) else loop1(i+1, res)
//
) (* end of [loop2] *)
//
and
loop3
(
  i: int, j: int, n: int, res: double
) : double =
(
//
if
j < GROWS
then (
//
if theAutoBoard[i,j] > 0
  then loop3(i, j+1, n+1, res) else loop4(i, j, n+1, res)
//
) else loop1(i+1, res)
//
) (* end of [loop3] *)
//
and
loop4
(
  i: int, j: int, n: int, res: double
) : double =
(
//
if
j < GROWS
then (
//
if theAutoBoard[i,j] > 0
  then loop4(i, j+1, n, res)
  else loop4(i, j+1, n, res + n + power(GROWS-j, 2)*GCOLS)
//
) else loop1(i+1, res)
//
) (* end of [loop3] *)
//
in
  loop1 (0, 0.0)
end // end of [theAutoBoard_eval2]

(* ****** ****** *)

fun
theAutoBoard_eval3
  ((*void*)): double = let
//
fun
auxful
(
  j: int, i: int
) : bool =
(
//
if
i < GCOLS
then (
  if (theAutoBoard[i,j] > 0) then auxful(j, i+1) else false
) else true // end of [if]
//
) (* end of [auxful] *)
//
fun
loop(j: int, res: double): double =
(
if
j < GROWS
then (
  if auxful(j, 0)
    then loop(j+1, res + power(GROWS-j, 2)*GCOLS) else loop(j+1, res)
  // end of [if]
) else res // end of [if]
)
//
in
  loop(0, 0.0)
end // end of [theAutoBoard_eval3]

(* ****** ****** *)
//
fun
theAutoBoard_eval_all
  ((*void*)): double =
( 0
+ theAutoBoard_eval1()
+ theAutoBoard_eval2()
- theAutoBoard_eval3()
)
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
        if xmv1 > xmv2
          then true else (if xmv1 < xmv2 then false else (abs(rot1) <= abs(rot2)))
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
  val score = theAutoBoard_eval_all((*void*))
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
  val score = theAutoBoard_eval_all((*void*))
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

#define DONE 0
#define XMV_L 1
#define XMV_R 2
#define ROT_L 3
#define ROT_R 4

(* ****** ****** *)

local

typedef
fact = () -<cloref1> void

val
theFact =
ref{fact}($UN.cast{fact}(0))

val
theROTXMVlist =
arrszref_make_elt{int}(GCOLS+2, 0)

fun
fact_spawn(fact: fact) = theFact[] := fact

fun
theROTXMVlist_add_end
  (i: int): int = let
  val () = theROTXMVlist[i] := DONE
in
  i+1
end // end of [theROTXMVlist_add_end]

fun
theROTXMVlist_add_rot
  (rot: int, i: int): int =
(
case+ rot of
| _ when
    rot =  1 => i+1 where
  {
    val () = theROTXMVlist[i] := ROT_R
  }
| _ when
    rot = ~1 => i+1 where
  {
    val () = theROTXMVlist[i] := ROT_L
  }
| _ when
    rot =  2 => i+2 where
  {
    val () = theROTXMVlist[i+0] := ROT_R
    val () = theROTXMVlist[i+1] := ROT_R
  }
| _ (* rot = 0 *) => i
)

fun
theROTXMVlist_add_xmv
  (xmv: int, i: int): int =
(
//
case+ 0 of
| _ when xmv > 0 => let
    val () =
      theROTXMVlist[i] := XMV_R
    // end of [val]
  in
    theROTXMVlist_add_xmv (xmv-1, i+1)
  end
| _ when xmv < 0 => let
    val () =
      theROTXMVlist[i] := XMV_L
    // end of [val]
  in
    theROTXMVlist_add_xmv (xmv+1, i+1)
  end
| _ (* xmv = 0 *) => i
//
) (* end of [theROTXMVlist_add_xmv] *)

fun
theROTXMVlist_add_rotxmv
(
  rot: int, xmv: int, i: int
) : int = let
//
  val i = theROTXMVlist_add_rot(rot, i)
  val i = theROTXMVlist_add_xmv(xmv, i)
//
in
  theROTXMVlist_add_end(i)
end // end of [theROTXMVlist_add_rotxmv]

fun
theROTXMVlist_autoplay
  (P0: Piece, i: int) = let
//
val act = theROTXMVlist[i]
//
(*
val () = alert("theROTXMVlist_autoplay:i="+String(i)+";act="+String(act))
*)
//
in
//
case 0 of
//
| _ when
    (act = ROT_L) => let
    val acted = Piece_lrotate(P0)
  in
    if acted then
      fact_spawn (lam() => theROTXMVlist_autoplay(P0, i+1))
    // end of [if]
  end // end of [ROT_L]
//
| _ when
    (act = ROT_R) => let
    val acted = Piece_rrotate(P0)
  in
    if acted then
      fact_spawn (lam() => theROTXMVlist_autoplay(P0, i+1))
    // end of [if]
  end // end of [ROT_R]
//
| _ when
    (act = XMV_L) => let
    val acted = Piece_xmove_l(P0)
  in
    if acted then
      fact_spawn (lam() => theROTXMVlist_autoplay(P0, i+1))
    // end of [if]
  end // end of [XMV_L]
//
| _ when
    (act = XMV_R) => let
    val acted = Piece_xmove_r(P0)
  in
    if acted then
      fact_spawn (lam() => theROTXMVlist_autoplay(P0, i+1))
    // end of [if]
  end // end of [XMV_R]
//
| _(* DONE *) => theGameTQuota_delta_space()
//
end // end of [theROTXMVlist_autoplay]

in (* in-of-local *)

fun
autoplay2_rotxmv
(
  P0: Piece
, xmv: int, rot: int
) : void = let
//
val
_(*i*) =
theROTXMVlist_add_rotxmv
  (rot, xmv, 0)
//
in
  theROTXMVlist_autoplay(P0, 0)
end // end of [autoplay2_rotxmv]

implement
theAutoplay_fact
  ((*void*)) = let
  val fact = theFact[]
  val ((*void*)) =
    theFact[] := $UN.cast{fact}(0)
  // end of [val]
in
  if $UN.cast{int}(fact) != 0 then fact()
end // end of [theAutoplay_fact]

end // end of [local]

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
(*
| SITSCORE1(score, xmv, rot) => autoplay_rotxmv(P0, xmv, rot)
*)
| SITSCORE1(score, xmv, rot) => autoplay2_rotxmv(P0, xmv, rot)
//
end // end of [theGame_autoplay_piece]

(* ****** ****** *)
    
(* end of [tetris_autoplay.dats] *)
