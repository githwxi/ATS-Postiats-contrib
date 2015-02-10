(*
#
# Permute
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

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
%{^
typedef char *charptr;
%} // end of [%{^]
//
abstype charptr = $extype"charptr"
//
(* ****** ****** *)
//
%{^
#define N 10
int theArray[N] =
{
  0,1,2,3,4,5,6,7,8,9
} ;
%} // end of [%{^]
#define N 10
macdef theArray =
  $extval(arrayref(int,N),"theArray")
//
(* ****** ****** *)
//
extern
fun
permute_next
  {n:pos}
  (A: arrayref(int, n), asz: int(n)): void
//
implement
permute_next
  {n}(A, asz) = let
//
fun
loop
(
  i: natLt(n)
) : natLt(n) =
(
if
i > 0
then
  if A[i] < A[i-1] then loop (i-1) else i
else 0
) (* end of [loop] *)
//
val n0 = asz
val i0 = loop (n0-1)
//
val () = let
  val (vbox pf | p) =
    arrayref_get_viewptr (A)
in
  array_subreverse (!p, i2sz(i0), i2sz(n0))
end // end of [val]
//
in
//
if
i0 > 0
then let
  val i1 = i0 - 1
  fun loop2
    (i: natLt(n), x1: int): void =
    if x1 < A[i]
      then (A[i1] := A[i]; A[i] := x1)
      else loop2 ($UN.cast{natLt(n)}(i+1), x1)
    // end of [if]
in
  loop2 (i0, A[i1])
end // end of [then]
else () // end of [else]
//
end // end of [permute_next]
//
(* ****** ****** *)

macdef LEDPIN = 13
macdef BAUD_RATE = 9600

(* ****** ****** *)
//
extern
fun
setup (): void = "mac#"
//
implement
setup () = () where
{
//
val () = pinMode(LEDPIN, OUTPUT)
val () = Serial_ptr._begin(BAUD_RATE)
//
} (* end of [setup] *)
//
(* ****** ****** *)
//
implement
fprint_val<int>
  (out, x) = Serial_ptr.print(x)
//
(* ****** ****** *)
//
(*
implement
fprint_string (out, x) = Serial_ptr.print(x)
*)
(* ****** ****** *)
//
implement
fprint_array$sep<> (out) = ()
//
(* ****** ****** *)
//
extern
fun loop (): void = "mac#"
//
implement
loop () =
myloop() where
{
fun
myloop(): void = let
//
val
out = $extval (FILEref, "0")
//
(*
val () =
randomSeed($UN.cast{uint}(millis()))
*)
//
val A = theArray
val () = fprint_arrayref (out, A, i2sz(N))
val () = Serial_ptr.println()
//
val () = permute_next (A, N)
//
val () = digitalWrite(LEDPIN, 1)
val () = delay(250)
val () = digitalWrite(LEDPIN, 0)
val () = delay(1000)
//
in
  myloop ()
end // end of [myloop]
//
} (* end of [loop] *)
//
(* ****** ****** *)

(* end of [Permute.dats] *)
