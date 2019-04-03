(* ****** ****** *)
//
// Title:
// Concepts of Programming Languages
// Number: CAS CS 320
// Semester: Summer 2015
// Class Time: MTWR: 3:00-5:00
// Instructor: Hongwei Xi (hwxiATbuDOTedu)
// Teaching Fellow: Zhiqiang (Alex) Ren (arenATbuDOTedu)
//
(* ****** ****** *)

(*
** Drawing a digital clock
*)

(* ****** ****** *)
//
#define
ATS_MAINATSFLAG 1
//
#define
ATS_DYNLOADNAME
"myclock2__dynload"
//
#define
ATS_STATIC_PREFIX "myclock2__"
//
(* ****** ****** *)
//
#define
LIBATSCC2JS_targetloc
"$PATSHOME\
/contrib/libatscc2js/ATS2-0.3.2"
//
(* ****** ****** *)
//
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
//
staload
_ = "{$LIBATSCC2JS}/DATS/print.dats"
//
(* ****** ****** *)

#define NROW 9; #define NCOL 80

(* ****** ****** *)
//
val
theCanvas =
matrixref_make_elt{int}(NROW, NCOL, 0)
//
(* ****** ****** *)
//
fun
theCanvas_clear() =
matrixref_foreach_cloref
  (theCanvas, NROW, NCOL, lam(i, j) => (theCanvas[i,NCOL,j] := 0))
//
(* ****** ****** *)
//
fun
theCanvas_print() =
matrixref_foreach_cloref
(
  theCanvas
, NROW, NCOL
, lam(i, j) =>
  let
    val x = theCanvas[i,NCOL,j]
  in
    print_string(if x = 0 then " " else "X"); if j=NCOL-1 then print_newline()
  end // end of [let]
) (* end of [matrixref_foreach] *)
//
(* ****** ****** *)
//
extern
fun
draw_point(x: int, y: int): void
//
implement
draw_point(x, y) = let
//
val x = g1ofg0(x) and y = g1ofg0(y)
//
(*
val () = println! ("draw_point: x = ", x)
val () = println! ("draw_point: y = ", y)
*)
//
in
  if x < 0 then ()
  else if y < 0 then ()
  else if x >= NCOL then ()
  else if y >= NROW then ()
  else (theCanvas[y, NCOL, x] := 1)
end // end of [draw_point]
//
(* ****** ****** *)
//
extern
fun
draw_hline
  (x0: int, y0: int, n: int): void
extern
fun
draw_vline
  (x0: int, y0: int, n: int): void
//
(* ****** ****** *)

implement
draw_hline
  (x0, y0, n) = (
//
if
n > 0
then
{
  val () = draw_point(x0, y0)
  val () = draw_hline(x0+1, y0, n-1)
} (* end of [then] *)
else () // end of [else]
//
) (* end of [draw_hline] *)

(* ****** ****** *)

implement
draw_vline
  (x0, y0, n) = (
//
if
n > 0
then
{
  val () = draw_point(x0, y0)
  val () = draw_vline(x0, y0+1, n-1)
} (* end of [then] *)
else () // end of [else]
//
) (* end of [draw_vline] *)

(* ****** ****** *)

extern
fun print_colon(): void
extern
fun print_digit(d: int): void
extern
fun print_digit2(d2: int): void

(* ****** ****** *)

implement
print_colon() = print_string(":")

(* ****** ****** *)

implement
print_digit(d) = let
//
val () = assertloc (d >= 0)
val () = assertloc (d <= 9)
//
in
  print_int(d)
end // end of [print_digit]

(* ****** ****** *)

implement
print_digit2(dd) = let
//
val () = assertloc (dd >= 0)
val () = assertloc (dd <= 99)
//
in
  print_digit(dd/10); print_digit(dd%10)
end // end of [print_digit2]

(* ****** ****** *)

extern
fun
draw_0(X:int, Y:int, W:int, H:int): void
and
draw_1(X:int, Y:int, W:int, H:int): void
and
draw_2(X:int, Y:int, W:int, H:int): void
and
draw_3(X:int, Y:int, W:int, H:int): void
and
draw_4(X:int, Y:int, W:int, H:int): void
and
draw_5(X:int, Y:int, W:int, H:int): void
and
draw_6(X:int, Y:int, W:int, H:int): void
and
draw_7(X:int, Y:int, W:int, H:int): void
and
draw_8(X:int, Y:int, W:int, H:int): void
and
draw_9(X:int, Y:int, W:int, H:int): void

(* ****** ****** *)

extern
fun
draw_colon(X:int, Y:int, W:int, H:int): void
extern
fun
draw_digit(X:int, Y:int, W:int, H:int, d:int): void
extern
fun
draw_digit2(X:int, Y:int, W:int, H:int, dd:int): void

(* ****** ****** *)

implement
draw_0(X, Y, W, H) =
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+1, Y, H)
  val () = draw_vline(X+W-2, Y, H)
}

(* ****** ****** *)

implement
draw_colon
  (X, Y, W, H) = let
//
val () = draw_point(X+W/2, Y+H/2-1)
val () = draw_point(X+W/2, Y+H/2+1)
//
in
  // nothing
end // end of [draw_colon]

(* ****** ****** *)

implement
draw_digit
  (X, Y, W, H, d) = let
//
val () = assertloc (d >= 0)
val () = assertloc (d <= 9)
//
in
//
case+ d of
//
| 0 => draw_0 (X, Y, W, H)
| 1 => draw_1 (X, Y, W, H)
| 2 => draw_2 (X, Y, W, H)
| 3 => draw_3 (X, Y, W, H)
| 4 => draw_4 (X, Y, W, H)
| 5 => draw_5 (X, Y, W, H)
| 6 => draw_6 (X, Y, W, H)
| 7 => draw_7 (X, Y, W, H)
| 8 => draw_8 (X, Y, W, H)
| 9 => draw_9 (X, Y, W, H)
//
| _ (*deadcode*) => ()
//
end // end of [draw_digit]

(* ****** ****** *)

implement
draw_digit2
  (X, Y, W, H, dd) = let
//
val () = assertloc (dd >= 0)
val () = assertloc (dd <= 99)
//
val () = draw_digit(X, Y, W, H, dd/10)
val () = draw_digit(X+W, Y, W, H, dd%10)
//
in
  // nothing
end // end of [draw_digit2]

(* ****** ****** *)
//
// HX: 30 points
// Please replace
// the following dummy implementations:
//
(*
implement
draw_1(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_2(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_3(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_4(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_5(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_6(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_7(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_8(X, Y, W, H) = draw_0(X, Y, W, H)
implement
draw_9(X, Y, W, H) = draw_0(X, Y, W, H)
*)
//
(* ****** ****** *)

(*
implement
draw_1(X, Y, W, H) = 
{
  val () = draw_hline(X+1, Y, W-5)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+W-5, Y, H)
}
*)
implement
draw_1(X, Y, W, H) =
{
  val () = draw_vline(X+W-2, Y, H)
}

implement
draw_2(X, Y, W, H) =
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_hline(X+1, (Y+H)/2, W-2)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+1, Y+5, H)
  val () = draw_vline(X+W-2, Y-5, H)
}

implement
draw_3(X, Y, W, H) =
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_hline(X+1, (Y+H)/2, W-2)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+W-2, Y, H)
}

implement
draw_4(X, Y, W, H) = 
{
  val () = draw_hline(X+1, (Y+H)/2, W-2)
  val () = draw_vline(X+W-2, Y, H)
  val () = draw_vline(X+1, Y, H-5)
}

implement
draw_5(X, Y, W, H) = 
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_hline(X+1, (Y+H)/2, W-2)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+W-2, Y+5, H)
  val () = draw_vline(X+1, Y, H-5)
}

implement
draw_6(X, Y, W, H) = 
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_hline(X+1, (Y+H)/2, W-2)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+W-2, Y+5, H)
  val () = draw_vline(X+1, Y, H)
}

implement
draw_7(X, Y, W, H) = 
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_vline(X+W-2, Y, H)
}

implement
draw_8(X, Y, W, H) = 
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_hline(X+1, (Y+H)/2, W-2)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+W-2, Y, H)
  val () = draw_vline(X+1, Y, H)
}

implement
draw_9(X, Y, W, H) = 
{
  val () = draw_hline(X+1, Y, W-2)
  val () = draw_hline(X+1, (Y+H)/2, W-2)
  val () = draw_hline(X+1, Y+H-1, W-2)
  val () = draw_vline(X+W-2, Y, H)
  val () = draw_vline(X+1, Y-5, H)
}

(* ****** ****** *)
//
extern
fun
draw_time
(
  hh: int, mm: int, ss: int
) : void = "mac#" // end-of-fun
//
implement
draw_time
  (hh, mm, ss) =
{
//
val () = theCanvas_clear()
//
val X = 0
val Y = 0
val W = 9
val H = NROW
val () = draw_digit2 (X, Y, W, H, hh)
val X = X + W
val X = X + W
val () = draw_colon (X, Y, W, H)
val X = X + W
val () = draw_digit2 (X, Y, W, H, mm)
val X = X + W
val X = X + W
val () = draw_colon (X, Y, W, H)
val X = X + W
val () = draw_digit2 (X, Y, W, H, ss)
//
val () = theCanvas_print()
//
} (* end of [draw_time] *)

(* ****** ****** *)

%{$
//
function
draw2_time()
{
//
var date = new Date() ;
//
var hh = date.getHours()
var mm = date.getMinutes()
var ss = date.getSeconds()
//
ats2jspre_the_print_store_clear();
//
draw_time(hh, mm, ss);
//
document.getElementById("the_time_string").innerHTML = ats2jspre_the_print_store_join();
//
setTimeout(draw2_time, 500);
//
return;
//
} // end of [draw2_time]
//
jQuery(document).ready(function(){myclock2__dynload(); draw2_time();});
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [myclock2.dats] *)
