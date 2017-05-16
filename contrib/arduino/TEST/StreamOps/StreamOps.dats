(*
#
# StreamOps
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

staload _ = "prelude/DATS/stream_vt.dats"

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
void *theStream = 0;
void *theStream_get()
{
  void *res;
  res = theStream; theStream = NULL;
  return res;
} /* end of [theStream_get] */
%} // end of [%{^]
//
extern
fun
theStream_get(): stream_vt(int) = "mac#"
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
) : stream_vt(int) = $ldelay
(
if m >= n
  then
  (
    stream_vt_nil((*void*))
  )
  else
  (
    stream_vt_cons(m, from(m+1, n))
  )
// end of [if]
) (* end of [from] *)
//
extvar "theStream" = from(0, 10)
//
} (* end of [setup] *)
//
(* ****** ****** *)
//
implement
fprint_val<int>
  (out, x) =
(
$extmcall
  (void, Serial, "print", x)
)
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
loop() =
myloop() where
{
//
val
out = $extval(FILEref, "0")
//
fun
lrotate
(
xs: stream_vt(int)
) : stream_vt(int) = $ldelay
(
case+ !xs of
| ~stream_vt_nil() =>
    stream_vt_nil()
| ~stream_vt_cons(x, xs) => let
    val () = fprint_val<int>(out, x)
  in
    !(stream_vt_append(xs, stream_vt_make_sing(x)))
  end // end of [stream_vt_cons]
,
~(xs) // called if the stream is freed
)
//
fun
myloop(): void = let
//
(*
val () =
Serial_ptr.println("myloop(bef)")
*)
//
val xs = theStream_get()
//
extvar "theStream" = lrotate(xs)
val () = Serial_ptr.println()
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

(* end of [StreamOps.dats] *)
