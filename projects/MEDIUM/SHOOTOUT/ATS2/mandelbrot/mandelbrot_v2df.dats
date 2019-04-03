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
//
#define
LIBATSHWXI_targetloc
"$PATSCONTRIB/contrib/libats-hwxi"
//
#staload
"{$LIBATSHWXI}/SIMD/SATS/v2df.sats"
//
(* ****** ****** *)

#define TIMES 50
#define LIMIT2 (2.0 * 2.0)

(* ****** ****** *)

%{^
ATSinline()
int
lte_v2df_v2df_bit2
(
  v2df x, v2df y
)
{
  int bit2 ;
  v2df lte2 ;
  lte2 = __builtin_ia32_cmplepd(x, y) ;
  bit2 = __builtin_ia32_movmskpd(lte2) ;
  return bit2 ;
}
%} // end of [%{^]
extern
fun lte_v2df_v2df_bit2 (v2df, v2df): natLt(4) = "mac#"

(* ****** ****** *)
//
extern
fun{}
mandelbrot
  (h: intGte(2), w: intGte(2)): void = "ext#"
//
(* ****** ****** *)
//
extern
fun{}
print_byte
  (i: int, y: int, byte: uint): void
//
(* ****** ****** *)

val LIMIT22 = v2df_make (LIMIT2, LIMIT2)

(* ****** ****** *)

fun
test_inness
(
  h_r: double
, w_r: double
, x: int, y: int
) : natLt(4) = let
//
val Cr0 = (2 * w_r) * x - 1.5
and Ci0 = (2 * h_r) * y - 1.0
val Cr1 = (2 * w_r) * (x+1) - 1.5
and Ci1 = Ci0
val Crv = v2df_make (Cr1, Cr0)
val Civ = v2df_make (Ci1, Ci0)
//
fun loop2
(
  Cr: v2df, Ci: v2df, r: v2df, i: v2df, n: int
) : natLt(4) = let
  val r2 = r * r
  and i2 = i * i
  val b22 = lte_v2df_v2df_bit2 (r2+i2, LIMIT22)
(*
  val () = println! ("test_inness: b22 = ", b22)
*)
in
  if n > 0 then (
    if b22 > 0
      then loop2 (Cr, Ci, r2-i2+Cr, r*i+r*i+Ci, n-1) else (0)
    // end of [if]
  ) else (b22) // end of [if]
end // end of [loop2]
//
in
  loop2 (Crv, Civ, v2df_0_0, v2df_0_0, TIMES)
end // end of [test_inness]

(* ****** ****** *)
//
extern
fun{}
row_process
(
  h: intGte(2), w: intGte(2), y: int
) : void = "ext#"
//
implement
{}(*tmp*)
row_process
  (h, w, y) = let
//
val h_r = 1.0 / h and w_r = 1.0 / w
//
fun
loop
(
  i: int, x: int, byte: uint, n: natLte(8)
): void =
if
x < w
then let
  val b22 = i2u(test_inness (h_r, w_r, x, y))
in
  if n >= 2
    then
      loop (i, x+2, (byte << 2) + b22, n-2)
    else let
      val () = print_byte (i, y, byte) in loop (i+1, x+2, b22, 6)
    end // end of [else]
  // end of [if]
end // end of [then]
else let
  val () = print_byte (i, y, byte << n)
in
  // nothing
end // end of [else]
//
in
  loop (0, 0, 0u, 8)
end // end of [row_process]

(* ****** ****** *)

implement
{}(*tmp*)
mandelbrot (h, w) = let
//
var y: int
//
val _ =
$extfcall (int, "printf", "P4\n%i %i\n", h, w)
//
in 
  for (y := 0; y < h; y := y+1) row_process (h, w, y)
end // end of [mandelbrot]

(* ****** ****** *)

implement
main0 (argc, argv) = let
//
val () = assertloc (argc >= 2)
val i0 = g1ofg0(g0string2int(argv[1]))
val () =
assert_errmsg (i0 >= 2, "The input integer needs to be at least 2.\n")
//
val m = (i0 + 7) >> 3
val mn = $UN.cast{Size}(m * i0)
//
val M = $UN.castvwtp0{ptr}(array_ptr_alloc<uint8>(mn))
//
implement
{}(*tmp*)
print_byte
  (i, y, byte) = let
  val p = ptr_add<uint8> (M, y * m + i)
in
  $UN.ptr0_set<uint8> (p, $UN.cast{uint8}(byte))
end // end of [print_byte]
//
val () = mandelbrot (i0, i0)
//
val nwrit = $extfcall (size_t, "fwrite", M, sizeof<uint8>, mn, stdout_ref)
//
in
  // nothing
end (* end of [main0] *)

(* ****** ****** *)

(* end of [mandelbrot_v2df.dats] *)
