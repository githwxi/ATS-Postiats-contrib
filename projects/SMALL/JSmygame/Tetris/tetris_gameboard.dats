(*
** Tetris
*)

(* ****** ****** *)
//
#define
ATS_STATIC_PREFIX "tetris_gameboard__"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "tetris_gameboard_initize"

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
assume
GameBoard_type =
matrixref(Block, GCOLS, GROWS)
//
(* ****** ****** *)

local
//
val
theGameBoard =
matrixref_make_elt
  (GCOLS, GROWS, Block_null())
//
in (* in-of-local *)

implement
theGameBoard_get () = theGameBoard

implement
theGameBoard_set_at
  (x, y, b0) = let
//
val x = g1ofg0(x)
val y = g1ofg0(y)
//
in
//
if x < 0 then () else
if y < 0 then () else
if x >= GCOLS then () else
if y >= GROWS then () else
  theGameBoard[x,GROWS,y] := b0
//
end // end of [theGameBoard_set_at]

end // end of [local]

(* ****** ****** *)
//
extern
fun
GameBoard_clear(GameBoard): void = "mac#"
//
(* ****** ****** *)
//
implement
GameBoard_clear(board) =
(
//
matrixref_foreach_cloref
(
  board
, GCOLS, GROWS
, lam(i, j) =>
  let
    val b = board[i,GROWS,j]
  in
    if isneqz(b)
      then (
        board[i,GROWS,j] := Block_null();
        $extfcall(void, "theStage_removeChild", b)
      ) (* end of [then] *)
    // end of [if]
  end // end of [let] // end of [lam]
)
//
) (* end of [GameBoard_clear] *)
//
implement
theGameBoard_clear
  ((*void*)) = GameBoard_clear(theGameBoard_get())
//
(* ****** ****** *)

implement
GameBoard_isset_at
  (board, x, y) = let
//
val x = g1ofg0(x)
val y = g1ofg0(y)
//
in
//
if x < 0 then true else
if y < 0 then true else
if x >= GCOLS then true else
if y >= GROWS then true else isneqz(board[x,GROWS,y])
//
end // end of [GameBoard_isset_at]

(* ****** ****** *)
//
extern
fun
GameBoard_rowful_at
  (GameBoard, y: natLt(GROWS)): bool = "mac#"
//
(* ****** ****** *)

implement
GameBoard_rowful_at
  (board, y) = let
//
val m = GCOLS and n = GROWS
//
fun
loop
(
  i: natLte(GCOLS)
) : bool =
(
if i < GCOLS
  then (
    if isneqz(board[i,n,y]) then loop(i+1) else false
  ) else true
) (* end of [loop] *)
//
in
  loop(0)
end // end of [GameBoard_rowful_at]

(* ****** ****** *)
//
extern
fun
GameBoard_rowdel_at
  (GameBoard, y: natLt(GROWS)): void = "mac#"
//
(* ****** ****** *)

implement
GameBoard_rowdel_at
  (board, y) = let
//
#define m GCOLS; #define n GROWS
//
fun
loop
(
  i: natLte(m)
) : void =
(
if
i < m
then let
  val () =
    Block_unstage(board[i,n,y])
  // end of [val]
in
  board[i,n,y] := Block_null(); loop(i+1)
end // end of [then]
)
//
fun
loop1
(
  i: natLte(m)
) : void =
(
if i < m then loop2(i, 0) else ()
)
//
and
loop2
(
  i: natLt(m)
, j: natLte(n)
) : void =
(
if
j < n
then let
  val y0j = y-j
  val y1j = y0j-1
in
//
if y1j >= 0
  then let
    val b = board[i,n,y1j]
  in
    Block_drop1(b); board[i,n,y0j] := b; loop2(i, j+1)
  end // end of [then]
  else (
    if (y0j >= 0)
      then board[i,n,y0j] := Block_null(); loop2(i, j+1)
    // end of [if]
  ) (* end of [else] *)
// end of [if]
//
end // end of [then]
else loop1 (i+1) // end of [else]
)
//
in
  loop(0); loop1(0)
end (* end of [GameBoard_rowdel_at] *)

(* ****** ****** *)
//
extern
fun
GameBoard_rowdel_one
  (GameBoard): bool = "mac#"
//
(* ****** ****** *)
//
implement
GameBoard_rowdel_one(board) = let
//
fun
loop
(
  y: natLte(GROWS)
) : bool =
(
if
(y < GROWS)
then (
  if GameBoard_rowful_at(board, y)
    then (GameBoard_rowdel_at(board, y); true)
    else loop(y+1)
) (* end of [then] *)
else false // end of [else]
)
//
in
  loop (0)
end // end of [GameBoard_rowdel_one]
//
implement
theGameBoard_rowdel_one
  ((*void*)) = GameBoard_rowdel_one(theGameBoard_get())
//
(* ****** ****** *)

implement
theGameBoard_iforeach
  (fwork) = let
//
val board =
  theGameBoard_get()
//
fun loop1(i: int): void =
  if i < GCOLS
    then (loop2(i, 0); loop1(i+1)) else ()
  // end of [if]
and loop2(i: int, j: int): void =
  if j < GROWS
    then (fwork(i, j, GameBoard_isset_at(board, i, j)); loop2(i, j+1))
    else ()
  // end of [if]
//
in
  loop1(0)
end // end of [the_GameBoard_iforeach]

(* ****** ****** *)

(* end of [tetris_gameboard.dats] *)
