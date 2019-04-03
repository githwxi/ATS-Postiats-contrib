(*
** The Great Computer Language Shootout
** http://shootout.alioth.debian.org/
**
** contributed by Hongwei Xi (gmhwxiATgmailDOTcom)
**
** compilation command:
**   patscc -O3 -msse2 -o mandelbrot mandelbrot.dats
*)

(* ****** ****** *)
//
// HX-2014-06-04
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#define TIMES 50
#define LIMIT2 (2.0 * 2.0)

(* ****** ****** *)

extern
fun mandelbrot (h: intGte(2), w: intGte(2)): void

(* ****** ****** *)

extern fun{} h_recip (): double
extern fun{} w_recip (): double

(* ****** ****** *)
//
extern
fun{}
print_byte
  (x: int, y: int, byte: uint): void
//
(* ****** ****** *)

fun{}
test_inness
(
  h_r: double
, w_r: double
, x: int, y: int
) : natLt(2) = let
//
val Cr = (2 * w_r) * x - 1.5
and Ci = (2 * h_r) * y - 1.0
//
fun loop
(
  r: double, i: double, n: int
) : natLt(2) = let
  val r2 = r * r and i2 = i * i
in
  if r2+i2 <= LIMIT2
    then (
      if n > 0 then loop (r2-i2+Cr, 2.0*r*i+Ci, n-1) else 1
    ) (* end of [then] *)
    else (0) // end of [else]
  // end of [if]
end
//
in
  loop (0.0, 0.0, TIMES)
end // end of [test_inness]

(* ****** ****** *)

fun{}
row_process
(
  w: intGte(2), y: int
) : void = let
//
val h_r = h_recip ()
and w_r = w_recip ()
//
fun
loop
(
  x: int, byte: uint, n: natLte(8)
): void =
if
x < w
then let
  val b2 = i2u(test_inness (h_r, w_r, x, y))
in
  if n > 0
    then
      loop (x+1, (byte << 1) + b2, n-1)
    else let
      val () = print_byte (x, y, byte) in loop (x+1, b2, 7)
    end // end of [else]
  // end of [if]
end // end of [then]
else let
  val () = print_byte (x, y, byte << n)
in
  // nothing
end // end of [else]
//
in
  loop (0, 0u, 8)
end // end of [row_process]

(* ****** ****** *)

implement
print_byte<> (x, y, i) = print($UN.cast{uchar}(i))

(* ****** ****** *)

implement
mandelbrot (h, w) = let
//
implement h_recip<> () = 1.0 / h
implement w_recip<> () = 1.0 / w
//
var y: int
//
val _ =
$extfcall (int, "printf", "P4\n%i %i\n", h, w)
//
in 
  for (y := 0; y < h; y := y+1) row_process (w, y)
end // end of [mandelbrot]

(* ****** ****** *)

implement
main0 (argc, argv) = let
  val () = assertloc (argc >= 2)
  val i0 = g1ofg0(g0string2int(argv[1]))
  val () = assert_errmsg (i0 >= 2, "The input integer needs to be at least 2.\n")
in
  mandelbrot (i0, i0)
end (* end of [main0] *)

(* ****** ****** *)

(* end of [mandelbrot.dats] *)
