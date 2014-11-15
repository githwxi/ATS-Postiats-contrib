(*
#
# ListMergeSort
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

staload _ = "prelude/DATS/list.dats"
staload _ = "prelude/DATS/list_vt.dats"

(* ****** ****** *)

%{^
typedef char *charptr;
%} // end of [%{^]
abstype charptr = $extype"charptr"

(* ****** ****** *)

%{^
#define ATS_MFREE free
#define ATS_MALLOC malloc
#define ATSextmcall(obj, mtd, funarg) obj.mtd funarg
%} // end of [%{^]

(* ****** ****** *)

%{^
void *theList = NULL;
void *theList_get ()
{
  void *res;
  res = theList; theList = NULL; return res;
} /* end of [theList_get] */
%} // end of [%{^]
//
extern
fun
theList_get(): List0_vt(int) = "mac#"
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
fun
from
(
  m: int, n: int
) : List0_vt(int) =
(
if m < n
  then cons_vt (m, from(m+1, n)) else nil_vt ()
// end of [if]
) (* end of [from] *)
//
extvar "theList" = from(0, 10)
//
} (* end of [setup] *)
//
(* ****** ****** *)
//
implement
fprint_val<int>
  (out, x) =
  $extmcall(void, Serial, "print", x)
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
fprint_list_vt$sep<> (out) = ()
//
(* ****** ****** *)

staload MS = "./list_vt_mergesort.dats"

(* ****** ****** *)
//
extern
fun
loop (): void = "mac#"
//
implement
loop () =
myloop(0) where
{
//
fun
mysort{n:int}
(
  xs: list_vt(int, n)
) : list_vt(int, n) = let
//
implement
$MS.list_vt_mergesort$cmp<int>
  (x1, x2, n1, n2) = compare (x1, x2)
//
in
  list_vt_mergesort (xs)
end // end of [mysort]
//
fun
myrand{n:int}
(
  xs: list_vt(int, n)
) : list_vt(int, n) = let
//
implement
$MS.list_vt_mergesort$cmp<int>
  (x1, x2, n1, n2) =
(
  $effmask_all(if random(n1+n2) < n1 then 0 else 1)
)
//
in
  list_vt_mergesort (xs)
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
val () = randomSeed($UN.cast{uint}(millis()))
*)
//
val xs = theList_get()
val () = fprint_list_vt (out, xs)
val () = Serial_ptr.println()
extvar "theList" =
  (if bit = 0 then myrand(xs) else mysort(xs)): List0_vt(int)
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

(* end of [ListMergeSort.dats] *)
