//
// Animating Mergesort
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/array0.sats"
//
staload _ = "libats/ML/DATS/list0.dats"
staload _ = "libats/ML/DATS/array0.dats"
//
(* ****** ****** *)

extern
fun{
a:t@ype
} mergesort (A: array0 (a)): void

(* ****** ****** *)
//  
extern
fun{
a:t@ype
} mergesort2
  (A: array0 (a), i: int, j: int): void
// 
(* ****** ****** *)
//
implement
{a}(*tmp*)
mergesort (A) =
  mergesort2<a> (A, 0, sz2i(A.size()))
//
(* ****** ****** *)
//
extern
fun{
a:t@ype
} sortedmerge
  (A: array0 (a), i: int, split: int, j: int): void
//
(* ****** ****** *)

implement
{a}(*tmp*)
mergesort2
  (A, i, j) = let
//
val len = j - i
//
in
//
if
len >= 2
then let
  val split = i + half(len)
  val ((*void*)) = mergesort2 (A, i, split)
  val ((*void*)) = mergesort2 (A, split, j)
  val ((*void*)) = sortedmerge (A, i, split, j)
in
  // nothing
end // end of [then]
else () // end of [else]
//
end // end of [mergesort2]

(* ****** ****** *)

extern
fun snapshot_pop (): array0(int)
extern
fun snapshot_push (A: array0(int)): void
extern
fun snapshot_reverse ((*void*)): void

(* ****** ****** *)

local
//
val theSnapshots =
  ref<list0(array0(int))> (list0_nil)
//
in (* in of [local] *)

implement
snapshot_pop () = x where
{
  val-cons0(x, xs) = !theSnapshots
  val () = (
    case+ xs of cons0 _ => !theSnapshots := xs | nil0 () => ()
  ) : void (* end of [val] *)
}

implement
snapshot_push (A) = let
  val A = array0_copy (A)
in
  !theSnapshots := list0_cons{array0(int)}(A, !theSnapshots)
end // end of [snapshot_push]

implement
snapshot_reverse () = !theSnapshots := list0_reverse (!theSnapshots)

end // end of [local]

(* ****** ****** *)

extern
fun{
a:t@ype
} subcirculate
  (A: array0 (a), i: int, j: int): void

(* ****** ****** *)

implement
{a}(*tmp*)
subcirculate
  (A0, i, j) = let
//
val i = g1ofg0 (i)
val j = g1ofg0 (j)
val () = assertloc (i >= 0)
and () = assertloc (j >= 0)
val i = i2sz (i) and j = i2sz (j)
val [n:int] (A, n) = array0_get_refsize (A0)
val () = assertloc (i < n)
and () = assertloc (j < n)
//
val (vbox pf | p) = arrayref_get_viewptr (A)
//
in
  array_subcirculate (!p, i, j)
end // end of [subcirculate]

(* ****** ****** *)

implement
sortedmerge<int>
  (A, i, split, j) = let
in
//
if
i < split && split < j
then let
//
val sgn =
  gcompare_val_val<int> (A[i], A[split])
//
in
//
if sgn <= 0
  then let
    val () = snapshot_push (A)
  in
    sortedmerge<int> (A, i+1, split, j)
  end // end of [then]
  else let
    val () =
    subcirculate (A, i, split)
    val () = snapshot_push (A)
  in
    sortedmerge<int> (A, i, split+1, j)
  end // end of [else]
//
end // end of [then]
else () // end of [else]
//
end // end of [sortedmerge]

(* ****** ****** *)

#define MYMAX 100

(* ****** ****** *)

staload "{$CAIRO}/SATS/cairo.sats"

(* ****** ****** *)

fun
draw_array0
(
  cr: !xr1, A: array0 (int)
) : void = let
//
val n = A.size()
//
fun
loop{l:agz}
(
  cr: !xr(l), i: size_t
) : void = let
in
//
if i < n then let
  val Ai = A[i]
  val xul = $UN.cast{double}(i)
  val yul = 1.0 * g0i2f(MYMAX-Ai)
  val () = cairo_set_source_rgb (cr, 0.0, 0.0, 1.0)
  val () = cairo_rectangle (cr, xul, yul, 1.0, g0i2f(Ai))
  val () = cairo_fill (cr)
in
  loop (cr, succ(i))
end else () // end of [if]
//
end // end of [loop]
//
in
  loop (cr, i2sz(0))
end // end of [draw_array0]

(* ****** ****** *)

extern
fun mydraw_clock
(
  cr: !cairo_ref1, width: int, height: int
) : void // end of [mydraw_clock]

implement
mydraw_clock
  (cr, W, H) = let
//
val A = snapshot_pop ()
val asz = array0_get_size (A)
//
val sx = g0i2f(W) / $UN.cast{double}(asz)
val sy = g0i2f(H) / $UN.cast{double}(MYMAX)
//
val (pf | ()) = cairo_save (cr)
val () = cairo_scale (cr, sx, sy)
val () = draw_array0 (cr, A)
val ((*void*)) = cairo_restore (pf | cr)
//
in
end // [mydraw_clock]

(* ****** ****** *)

staload "libc/SATS/time.sats"
staload "libc/SATS/stdlib.sats"
staload "{$LIBATSHWXI}/testing/SATS/randgen.sats"
staload _ = "{$LIBATSHWXI}/testing/DATS/randgen.dats"

(* ****** ****** *)

%{^
typedef char **charptrptr ;
%} ;
abstype charptrptr = $extype"charptrptr"

(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/teaching/myGTK/SATS/gtkcairoclock.sats"
staload
_ = "{$LIBATSHWXI}/teaching/myGTK/DATS/gtkcairoclock.dats"
//
(* ****** ****** *)

implement
main0{n}
(
  argc, argv
) = let
//
val N = 96
val N = (
if argc >= 2
  then g0string2int(argv[1]) else N
// end of [if]
) : int // end of [val]
val N = g1ofg0_int(N)
val () = assertloc (N >= 0)
val N = i2sz (N)
//
val seed = time_get ()
val seed = $UN.cast{lint}(seed)
val ((*void*)) = srand48 (seed)
//
implement{
} randint{n}(n) =
  $UN.cast{natLt(n)}(0.99 * drand48 () * n)
//
implement randgen_val<int> () = 1+randint(MYMAX)
//
val A = randgen_arrayref (N)
val A = array0_make_arrayref (A, N)
//
val out = stdout_ref
//
val () = snapshot_push (A)
//
(*
val () = fprintln! (out, "A(bef) = ", A)
*)
val () = mergesort<int> (A)
(*
val () = fprintln! (out, "A(aft) = ", A)
*)
//
val () = snapshot_reverse ()
//
var argc: int = argc
var argv: charptrptr = $UN.castvwtp1{charptrptr}(argv)
//
val () = $extfcall (void, "gtk_init", addr@(argc), addr@(argv))
//
implement
gtkcairoclock_title<> () = stropt_some"QuicksortAnimation"
implement
gtkcairoclock_timeout_interval<> () = 100U // millisecs
implement
gtkcairoclock_mydraw<> (cr, width, height) = mydraw_clock (cr, width, height)
//
val ((*void*)) = gtkcairoclock_main ((*void*))
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [mergesort_anim.dats] *)
