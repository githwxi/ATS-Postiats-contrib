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
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

%{^
#include <pthread.h>
%} // end of [%{^]

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
staload
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
  val b22 = i2u(test_inness(h_r, w_r, x, y))
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
//
staload
"{$LIBATSHWXI}/teaching/mythread/SATS/nwaiter.sats"
staload
"{$LIBATSHWXI}/teaching/mythread/SATS/parallelize.sats"
//
(* ****** ****** *)

implement
{}(*tmp*)
mandelbrot (h, w) = let
//
implement
intrange_parallelize$loop<>
  (y, y2) = let
//
fun loop (y: int, y2: int): void =
  if y < y2 then (row_process (h, w, y); loop (y+1, y2))
//
in
  loop (y, y2)
end // end of [intrange_parallelize$loop]
//
val _ =
$extfcall (int, "printf", "P4\n%i %i\n", h, w)
//
val nw = nwaiter_create_exn ()
val () = intrange_parallelize (0, h, 16(*CUTOFF*), nw)
val ((*freed*)) = nwaiter_destroy (nw)
//
in 
  // nothing
end // end of [mandelbrot]

(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/teaching/mythread/SATS/workshop.sats"
//  
(* ****** ****** *)
//
staload _ = "libats/DATS/deqarray.dats"
staload _ =
"{$LIBATSHWXI}/teaching/mythread/DATS/channel.dats"
//
staload _ =
"{$LIBATSHWXI}/teaching/mythread/DATS/nwaiter.dats"
staload _ =
"{$LIBATSHWXI}/teaching/mythread/DATS/parallelize.dats"
//
staload _ =
"{$LIBATSHWXI}/teaching/mythread/DATS/workshop.dats"
//
staload _ = "libats/DATS/athread.dats"
staload _ = "libats/DATS/athread_posix.dats"
//
(* ****** ****** *)

implement
main0 (argc, argv) = let
//
val () = assertloc (argc >= 2)
val i0 = g1ofg0(g0string2int(argv[1]))
val () =
assert_errmsg (i0 >= 2, "The input integer needs to be at least 2.\n")
//
val ws0 =
workshop_create_cap<lincloptr> (i2sz(2))
//
val nworker =
  workshop_add_nworker<lincloptr> (ws0, 4)
//
(*
val nworker = workshop_get_nworker (ws0)
val ((*void*)) = println! ("nworker = ", nworker)
*)
//
implement
intrange_parallelize$submit<> (fwork) =
(
  workshop_insert_job<lincloptr> (ws0, $UN.castvwtp0{lincloptr}(fwork))
) (* end of [intrange_parallelize$submit] *)
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
