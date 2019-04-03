(*
#
# ListOps
#
*)
(* ****** ****** *)
//
#define
ATS_DYNLOADFLAG 0
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
void *theList_get(/*void*/)
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
setup
(
// argless
) : void = "mac#"
//
implement
setup() = () where
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
  then
  (
    cons_vt(m, from(m+1, n))
  )
  else nil_vt(*void*)
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
  (out, x) = $extmcall(void, Serial, "print", x)
//
(* ****** ****** *)
//
implement
fprint_string (out, x) = ()
//
(* ****** ****** *)
//
extern
fun
loop
(
// argless
) : void = "mac#"
//
implement
loop() = myloop() where
{
//
fun
{a:t0p}
lrotate{n:int}
(
xs: list_vt(a, n)
) : list_vt(a, n) =
(
case+ xs of
| list_vt_nil() => xs
| list_vt_cons _ => let
    val
    (hd, tl) =
    list_vt_split_at(xs, 1)
  in
    list_vt_append<a>(tl, hd)
  end // end of [list_vt_cons]
)
//
fun
myloop(): void = let
//
val
out = $extval(FILEref, "0")
//
(*
val () =
Serial_ptr.println("myloop(bef)")
*)
//
val xs = theList_get()
val () = fprint_list_vt(out, xs)
val () = Serial_ptr.println()
//
extvar "theList" = lrotate<int>(xs)
//
(*
val () =
Serial_ptr.println("myloop(aft)")
*)
//
val () = digitalWrite(LEDPIN, 1)
val () = delay(250)
val () = digitalWrite(LEDPIN, 0)
val () = delay(1000)
//
in
  // nothing
end // end of [myloop]
//
} (* end of [loop] *)
//
(* ****** ****** *)

(* end of [ListOps.dats] *)
