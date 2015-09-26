(*
#
# For testing LedControl
#
*)
(* ****** ****** *)

#define ATS_DYNLOADFLAG 0

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$ARDUINO}/staloadall.hats"
//
(* ****** ****** *)

staload "./../LedControl.sats"

(* ****** ****** *)

%{^
LedControl theLC;
%} // end of [%{^]

(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
implement
setup () =
{
//
extvar
"theLC" =
LedControl(12,11,10,1)
//
val lc =
$extval
  (LedControl_ptr, "theLC")
//
val () = lc.shutdown(0, false)
val () = lc.setIntensity(0, 8)
val () = lc.clearDisplay(  0  )
}
//
(* ****** ****** *)
//
macdef DELAY_TIME = 100UL
//
macdef
B00000000 = $extval(byte, "0")
macdef
B10100000 = $extval(byte, "B10100000")
//
(* ****** ****** *)

(*
void rows() {
  for(int row=0;row<8;row++) {
    delay(delaytime);
    lc.setRow(0,row,B10100000);
    delay(delaytime);
    lc.setRow(0,row,(byte)0);
    for(int i=0;i<row;i++) {
      delay(delaytime);
      lc.setRow(0,row,B10100000);
      delay(delaytime);
      lc.setRow(0,row,(byte)0);
    }
  }
}
*)
extern
fun
loop_rows
(
  LedControl_ptr
) : void = "mac#"
implement
loop_rows(lc) = let
//
fun
doWork(row: int): void =
{
//
val () = delay(DELAY_TIME)
val () = lc.setRow(0, row, B10100000)
val () = delay(DELAY_TIME)
val () = lc.setRow(0, row, B00000000)
//
} (* end of [doWork] *)
//
fun
loop1
(
  row: natLte(8)
) : void =
(
if
row < 8
then (doWork(row); loop2(row, 0); loop1(row+1))
else ()
)
and
loop2
(
  row: int, i: int
) : void =
(
  if i < row then (doWork(row); loop2(row, i+1)) else ()
)
//
in
  loop1 (0)
end // end of [loop_rows]

(* ****** ****** *)

(*
void columns() {
  for(int col=0;col<8;col++) {
    delay(delaytime);
    lc.setColumn(0,col,B10100000);
    delay(delaytime);
    lc.setColumn(0,col,(byte)0);
    for(int i=0;i<col;i++) {
      delay(delaytime);
      lc.setColumn(0,col,B10100000);
      delay(delaytime);
      lc.setColumn(0,col,(byte)0);
    }
  }
}
*)
extern
fun
loop_cols
(
  LedControl_ptr
) : void = "mac#"
implement
loop_cols(lc) = let
//
fun
doWork(col: int): void =
{
//
val () = delay(DELAY_TIME)
val () = lc.setColumn(0, col, B10100000)
val () = delay(DELAY_TIME)
val () = lc.setColumn(0, col, B00000000)
//
} (* end of [doWork] *)
//
fun
loop1
(
  col: natLte(8)
) : void =
(
if
col < 8
then (doWork(col); loop2(col, 0); loop1(col+1))
else ()
)
and
loop2
(
  col: int, i: int
) : void =
(
  if i < col
    then (doWork(col); loop2(col, i+1)) else ()
  // end of [if]
)
//
in
  loop1 (0)
end // end of [loop_cols]

(* ****** ****** *)
//
(*
void single() {
  for(int row=0;row<8;row++) {
    for(int col=0;col<8;col++) {
      delay(delaytime);
      lc.setLed(0,row,col,true);
      delay(delaytime);
      for(int i=0;i<col;i++) {
        lc.setLed(0,row,col,false);
        delay(delaytime);
        lc.setLed(0,row,col,true);
        delay(delaytime);
      }
    }
  }
}
*)
extern
fun
loop_single
(
  LedControl_ptr
) : void = "mac#"
implement
loop_single(lc) = let
//
fun
doWork
(
  row: int, col: int
) : void =
{
val () = delay(DELAY_TIME)
val () = lc.setLed(0,row,col,true)
val () = delay(DELAY_TIME)
} (* end of [doWork] *)
//
fun
loop_doWork
(
  row: int, col: int, i: int
) : void = (
//
if
i < col
then (
  lc.setLed
  (
    0, row, col, false
  ) ; doWork(row, col) ;
  loop_doWork(row, col, i+1)
) (* end of [then] *)
//
) (* end of [loop] *)
//
implement(env)
intrange2_foreach$fwork<env>
  (row, col, env) =
(
  doWork(row, col); loop_doWork(row, col, 0)
)
//
in
  intrange2_foreach(0, 8, 0, 8)
end // end of [loop_single]
//
(* ****** ****** *)
//
extern
fun
loop(): void = "mac#"
implement
loop() =
{
  val lc = $extval(LedControl_ptr, "theLC")
  val () = $extfcall(void, "writeArduinoOnMatrix", lc)
  val () = loop_rows(lc)
  val () = loop_cols(lc)
  val () = loop_single(lc)
} (* end of [loop] *)
//
(* ****** ****** *)

(* end of [LCDemoMatrix.dats] *)
