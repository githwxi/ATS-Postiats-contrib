(*
** The M-N-K-game
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./game.sats"

(* ****** ****** *)

assume
board_type = mtrxszref (int)

(* ****** ****** *)
//
implement
board_make (m, n) =
  mtrxszref_make_elt<int> (i2sz(m), i2sz(n), 0)
//
(* ****** ****** *)

fun
pid2char (id: int): char =
(
case+ id of
| 0 => ' ' | 1 => 'X' | 2 => 'O' | _ => '#'
) (* end of [pid2char] *)

(* ****** ****** *)
//
implement
fprint_board
  (out, board) = let
//
implement
fprint_val<int>
  (out, id) = fprint (out, pid2char(id))
//
val () = fprint (out, "|")
val () = fprint_mtrxszref_sep (out, board, "|", "|\n|")
val () = fprint (out, "|")
//
in
  // nothing
end // end of [fprint_board]
//
(* ****** ****** *)
  
implement
board_mark_at
(
  board, pid, i, j
) = let
//
fun aux
(
// argless
) : bool = let
  val pid0 = board[i, j]
in
  if pid0 <= 0 then let
    val () = board[i, j] := pid in true
  end else false // end of [if]
end // end of [aux]
//
in
//
try aux () with ~MatrixSubscriptExn() => false
//
end // end of [board_mark_at]
  
(* ****** ****** *)

datatype dir = E | W | N | S | NE | SE | NW | SW 

(* ****** ****** *)

fun
dirnext
(
  dir: dir, i: int, j: int
): @(int, int) =
(
case+ dir of
| E ()  => (i+1, j  )
| W ()  => (i-1, j  )
| N ()  => (i  , j+1)
| S ()  => (i  , j-1)
| NE () => (i+1, j+1)
| SE () => (i+1, j-1)
| NW () => (i-1, j+1)
| SW () => (i-1, j-1)
) (* end of [dirnext] *)

(* ****** ****** *)
//
// HX-2014-05:
// This one is a bit technical: starting
// at the position (i, j), find the maximal
// number of pieces along the direction dir
// that are of the given kind pid.
//
extern
fun
board_dirmax
(
  board, pid: int, dir: dir, i: int, j: int
) : intGte(0)

implement
board_dirmax
(
  board, pid, dir, i, j
) = let
//
var nseq: int = 0
val p_nseq = addr@nseq
//
fun loop
(
  i: int, j: int
) : void = let
//
val pid2 = board[i, j]
//
in
  if pid = pid2
    then let
      val n = $UN.ptr1_get<int> (p_nseq)
      val () = $UN.ptr1_set<int> (p_nseq, n + 1)
      val (i, j) = dirnext (dir, i, j)
    in
      loop (i, j)
    end // end of [then]
  // end of [if]
end // end of [loop]
//
// HX-2014-05:
// [ptr_volatile] does nothing;
// gcc/clang -O1 bug is triggered if the
val () = ptr_volatile (p_nseq) // line is omitted
//
val () = try loop (i, j) with ~MatrixSubscriptExn () => ()
//
in
  $UN.cast{intGte(0)}(nseq)
end // end of [board_dirmax]

(* ****** ****** *)

local
//
exception FoundExn of ((*void*))
//
in (*in-of-local*)

implement
board_check_at
  (board, i, j) =
(
try let
//
val K =
  game_conf_get_k ()
//
val pid = board[i,j]
//
val nseq =
  board_dirmax (board, pid, E, i, j)
+ board_dirmax (board, pid, W, i, j)
val () = if nseq > K then $raise FoundExn ()
//
val nseq =
  board_dirmax (board, pid, N, i, j)
+ board_dirmax (board, pid, S, i, j)
val () = if nseq > K then $raise FoundExn ()
//
val nseq =
  board_dirmax (board, pid, NE, i, j)
+ board_dirmax (board, pid, SW, i, j)
val () = if nseq > K then $raise FoundExn ()
//
val nseq =
  board_dirmax (board, pid, SE, i, j)
+ board_dirmax (board, pid, NW, i, j)
val () = if nseq > K then $raise FoundExn ()
//
in
  false
end with
 | ~FoundExn () => true
 | ~MatrixSubscriptExn () => false
// end of [try]
) (* end of [board_check_at] *)

end // end of [local]

(* ****** ****** *)

(*
val () = // testing code
{
//
val () =
println! ("TESTING(game_board):")
//
val () =
println! ("TESTING(fprint_board): beg")
val board = board_make (3, 3)
val ((*void*)) = board[0,2] := 1
val ((*void*)) = board[1,1] := 1
val ((*void*)) = board[2,0] := 1
val ((*void*)) = fprint_board (stdout_ref, board)
val ((*void*)) = fprint_newline (stdout_ref)
val () =
println! ("TESTING(fprint_board): end")
//
val () = println! ("board_check_at (0, 0) = ", board_check_at (board, 0, 0))
val () = println! ("board_check_at (1, 1) = ", board_check_at (board, 1, 1))
val () = println! ("board_check_at (2, 2) = ", board_check_at (board, 2, 2))
val () = println! ("board_check_at (3, 3) = ", board_check_at (board, 3, 3))
//
} (* end of [val] *)
*)

(* ****** ****** *)

(* end of [game_board.dats] *)
