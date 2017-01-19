(*
#
# ArrayQuickSort
#
*)
(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
//
(* ****** ****** *)
//
#define
ARDUINO_targetloc "./../.."
//
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
myloop(0) where
{
//
fun
mysort{n:nat}
(
  A: arrayref(int, n)
, n: int(n)
) : void = let
//
val
(
  vbox pf | p
) =
  arrayref_get_viewptr(A)
in
  array_quicksort (!p, i2sz(n))
end // end of [mysort]
//
fun
myrand{n:int}
(
  A: arrayref(int, n), n: int(n)
) : void = let
//
val
(
  vbox pf | p
) =
  arrayref_get_viewptr(A)
//
prval () = lemma_arrayref_param(A)
//
implement
array_permute$randint<>
  {n}(n) =
(
  $UN.cast{sizeLt(n)}(random(sz2i(n)))
) (* end of [array_permute$randint] *)
//
in
  $effmask_ref(array_permute (!p, i2sz(n)))
end // end of [myrand]
//
fun
myloop
(
  bit: int
) : void = let
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
val () =
(
  if bit = 0 then myrand(A, N) else mysort(A, N)
) : void // end of [val]
//
val () = digitalWrite(LEDPIN, 1)
val () = delay(250)
val () = digitalWrite(LEDPIN, 0)
val () = delay(1000)
//
in
  myloop (1-bit)
end // end of [myloop]
//
} (* end of [loop] *)
//
(* ****** ****** *)

(* end of [ArrayQuickSort.dats] *)
