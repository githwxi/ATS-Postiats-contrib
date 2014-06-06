(*
** The Great Computer Language Shootout
** http://shootout.alioth.debian.org/
**
** contributed by Hongwei Xi (gmhwxiATgmailDOTcom)
*)

(* ****** ****** *)

/*
//
// compilation command:
//
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC \
  -pipe -O3 -fomit-frame-pointer -march=native -mfpmath=sse -msse2 $< -o $@ -lm -lpthread
//
*/

(* ****** ****** *)
//
// HX-2014-06-05
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

%{^
#include <emmintrin.h>
%} // end of [%{^]

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "libc/SATS/math.sats"
staload _ = "libc/DATS/math.dats"

(* ****** ****** *)
//
abst@ype __m128d = $extype"__m128d"
//
(* ****** ****** *)

%{^
//
ATSinline()
double
__m128d_get_fst
  (__m128d dd) { return ((double*)&dd)[0] ; }
//
ATSinline()
double
__m128d_get_snd
  (__m128d dd) { return ((double*)&dd)[1] ; }
//
%} // end of [%{^]
extern
fun __m128d_get_fst (__m128d): double = "mac#"
extern
fun __m128d_get_snd (__m128d): double = "mac#"

(* ****** ****** *)

extern
fun _mm_setzero_pd (): __m128d = "mac#"

extern
fun _mm_set_pd (double, double): __m128d = "mac#"
extern
fun _mm_add_pd (__m128d, __m128d): __m128d = "mac#"
extern
fun _mm_sub_pd (__m128d, __m128d): __m128d = "mac#"
extern
fun _mm_mul_pd (__m128d, __m128d): __m128d = "mac#"
extern
fun _mm_div_pd (__m128d, __m128d): __m128d = "mac#"

(* ****** ****** *)
//
extern
fun{} A (i:int, j: int): double
extern
fun{} mult_Av_all (v0: ptr, out: ptr, n: int): void
extern
fun{} mult_Av_one
  (v0: ptr, n: int, i: int, res: &double? >> _) : void
//
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
mult_Av_all
  (v0, out0, n) = let
//
implement
intrange_parallelize$loop<>
  (i, i2) = let
//
fun loop
(
  i: int, i2: int
) : void = let
in
//
if
i < i2
then let
  val out = ptr_add<double> (out0, i)
  val (pf, fpf | out) = $UN.ptr0_vtake{double}(out)
  val () = mult_Av_one (v0, n, i, !out)
  prval () = fpf (pf)
in
  loop (i+1, i2)
end // end of [then]
else () // end of [else]
//
end // end of [loop]
//
in
  loop (i, i2)
end // end of [intrange_parallelize$loop]
//
val nw = nwaiter_create_exn ()
val () = intrange_parallelize (0, n, 50(*CUTOFF*), nw)
val ((*freed*)) = nwaiter_destroy (nw)
//
in
  // nothing
end // end of [mult_Av_all]

implement
{}(*tmp*)
mult_Av_one(v0, n, i, res) =
{
//
fun loop (v: ptr, j: int, sum: __m128d): double =
(
  if j < n
    then let
      val v1 = ptr_succ<double> (v)
      val a = _mm_set_pd(A(i,j), A(i,j+1))
      val b = _mm_set_pd($UN.ptr0_get<double>(v), $UN.ptr0_get<double>(v1))
      val sum = _mm_add_pd (sum, _mm_div_pd (b, a))
    in
      loop (ptr_succ<double> (v1), j+2, sum)
    end // end of [then]
    else (__m128d_get_fst(sum)+__m128d_get_snd(sum))
  // end of [if]
)
//
val () = res := loop (v0, 0, _mm_setzero_pd())
//
} (* end of [mult_Av_one] *)

(* ****** ****** *)

extern
fun{}
mult_Av{n:int}
(
  v0: &array(double, n), out: &array(double, n), int(n)
) : void // end of [mult_Av]
extern
fun{}
mult_Atv{n:int}
(
  v0: &array(double, n), out: &array(double, n), int(n)
) : void // end of [mult_Atv]
extern
fun{}
mult_AtAv{n:int}
(
  v0: &array(double, n), out: &array(double, n), int(n), tmp: &array(double, n)
) : void // end of [mult_AtAv]

(* ****** ****** *)

implement
{}(*tmp*)
mult_Av (v0, out, n) = let
//
implement
A<> (i, j) = g0i2f ((i+j) * (i+j+1) / 2 + i + 1)
//
in
  mult_Av_all (addr@v0, addr@out, n)
end // end of [mult_Av]

(* ****** ****** *)

implement
{}(*tmp*)
mult_Atv (v0, out, n) = let
//
implement
A<> (j, i) = g0i2f ((i+j) * (i+j+1) / 2 + i + 1)
//
in
  mult_Av_all (addr@v0, addr@out, n)
end // end of [mult_Atv]

(* ****** ****** *)

implement
{}(*tmp*)
mult_AtAv (v0, out, n, tmp) =
{
  val () = mult_Av (v0, tmp, n)
  val () = mult_Atv(tmp, out, n)
}

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
main0 (argc, argv) = {
//
var n: int = 0
val () = if argc >= 2 then n := g0string2int(argv[1])
val [n:int] n = g1ofg0_int (n)
val () = assertloc (n >= 0)
val () = assertloc (n mod 2 = 0)
//
val ws0 =
workshop_create_cap<lincloptr> (i2sz(4))
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
val u = arrayptr_make_elt<double> (i2sz(n), 1.0)
val v = arrayptr_make_uninitized<double> (i2sz(n))
val tmp = arrayptr_make_uninitized<double> (i2sz(n))
//
#define NTIME 10
//
val (pf_u, fpf_u | p_u) = $UN.ptr0_vtake{array(double,n)}(ptrcast(u))
val (pf_v, fpf_v | p_v) = $UN.ptr0_vtake{array(double,n)}(ptrcast(v))
val (pf2_v, fpf2_v | p2_v) = $UN.ptr0_vtake{array(double,n)}(ptrcast(v))
val (pf_tmp, fpf_tmp | p_tmp) = $UN.ptr0_vtake{array(double,n)}(ptrcast(tmp))
//
val () = let
//
fun
loop{n:int}
(
  ntime: int
, u: &array(double, n)
, v: &array(double, n)
, n: int(n)
, tmp: &array(double, n)
) : void =
  if ntime > 0 then let
    val () = mult_AtAv(u, v, n, tmp)
    val () = mult_AtAv(v, u, n, tmp)
  in
    loop (ntime-1, u, v, n, tmp)
  end else () // end of [if]
//
in
  loop (NTIME, !p_u, !p_v, n, !p_tmp)
end (* end of [val *)
//
fun dotprod
(
  u: &array(double, n)
, v: &array(double, n)
, n: int(n), i: natLte(n), res: double
) : double =
  if i < n then dotprod (u, v, n, i+1, res+u[i]*v[i]) else res
//
val uv = dotprod (!p_u, !p_v, n, 0, 0.0)
val vv = dotprod (!p_v, !p2_v, n, 0, 0.0)
//
prval () = fpf_u (pf_u)
prval () = fpf_v (pf_v)
prval () = fpf2_v (pf2_v)
prval () = fpf_tmp (pf_tmp)
//
val () = arrayptr_free (u)
val () = arrayptr_free (v)
val () = arrayptr_free (tmp)
//
val err = $extfcall (int, "printf", "%.9f\n", sqrt(uv/vv))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [spectral-norm_smp.dats] *)
