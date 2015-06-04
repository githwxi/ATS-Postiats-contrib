//
// Animating Quicksort
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
//
staload "libats/SATS/hashfun.sats"
staload "libats/SATS/hashtbl_chain.sats"
//
staload _ = "libats/DATS/hashfun.dats"
staload _ = "libats/DATS/hashtbl_chain.dats"
//
(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/testing/SATS/randgen.sats"
staload _ =
"{$LIBATSHWXI}/testing/DATS/randgen.dats"
//
(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/teaching/BUCS/DATS/BUCS.dats"
//
(* ****** ****** *)

#define MYMAX 100

(* ****** ****** *)

typedef int2 = (int, int)

(* ****** ****** *)

local
//
val theExchlst =
  ref<list0(int2)> (nil0())
//
in (* in-of-local *)

fun
theExchlst_add
  (i1: int, i2: int): void =
(
  !theExchlst := cons0 ((i1, i2), !theExchlst)
)

fun
theExchlst_get_all
(
// argumentlst
) : list0(int2) = let
  val xys = !theExchlst
  val ((*void*)) = !theExchlst := nil0((*void*))
in
  list0_reverse (xys)
end // end of [theExchlst_get_all]

end // end of [local]

(* ****** ****** *)

extern
fun{
a:t@ype
} array0_swap
  (A: array0 (a), i: size_t, j: size_t): void
// end of [array0_swap]

(* ****** ****** *)
  
implement
{a}(*tmp*)
array0_swap
  (A, i, j) =
{
  val tmp = A[i]
  val () = A[i] := A[j]
  val () = A[j] := tmp
  val () = theExchlst_add (sz2i(i), sz2i(j))
}
  
(* ****** ****** *)

extern
fun{
a:t@ype
} quicksort (A: array0 (a)): void

(* ****** ****** *)

extern
fun{
a:t@ype
} quicksort2
(
  A: array0 (a), st: size_t, len: size_t
) : void // end of [quicksort2]

(* ****** ****** *)

extern
fun{a:t@ype}
qsort_partition
(
  A: array0 (a), st: size_t, len: size_t
) : size_t // end of [qsort_partition]

(* ****** ****** *)
//
implement
{a}(*tmp*)
quicksort (A) =
  quicksort2 (A, i2sz(0), A.size())
//
(* ****** ****** *)

implement
{a}(*tmp*)
quicksort2 (A, st, len) =
(
if
len >= 2
then let
  val len_f = qsort_partition<a> (A, st, len)
  val ((*void*)) = quicksort2<a> (A, st, len_f)
  val len_r = len - len_f
  val ((*void*)) = quicksort2<a> (A, succ(st+len_f), pred(len_r))
in
  // nothing
end // end of [then]
else () // end of [else]
//
) (* end of [qsort] *)

(* ****** ****** *)

implement
{a}(*tmp*)
qsort_partition
  (A, st, len) = let
//
val len = g1ofg0 (len)
val () = assertloc (len > 0)
val last = pred (st + len)
val pind = st + i2sz(randint(sz2i(len)))
val () = array0_swap (A, pind, last)
val pivot = A[last]
//
fun loop
(
  k1: size_t, k2: size_t
) : size_t =
  if k2 < last then let
    val sgn = gcompare_val_val<a> (pivot, A[k2])
  in
    if sgn <= 0
      then loop (k1, succ(k2))
      else (array0_swap(A, k1, k2); loop (succ(k1), succ(k2)))
    // end of [if]
  end else (k1) // end of [loop]
//
val k1 = loop (st, st)
val () = array0_swap (A, k1, last)
//
in
  (k1 - st)
end // end of [qort_partition]

(* ****** ****** *)

local

implement
randgen_val<int> () = randint (MYMAX)

in (* in-of-local *)

fun
genScript{n:int}
(
  out: FILEref, asz: size_t(n)
) :
(
  array0 (int), list0(int2)
) = let
//
val A =
randgen_arrayref<int> (asz)
//
val A = array0 (A, asz)
val A2 = array0_copy (A)
//
val () = quicksort (A2)
//
(*
val () = fprint (out, A, asz)
val () = fprint_newline (out)
val () = fprint (out, A2, asz)
val () = fprint_newline (out)
*)
//
in
  (A, theExchlst_get_all ())
end (* end of [genScript] *)

end // end of [local]

(* ****** ****** *)
//
staload "{$CAIRO}/SATS/cairo.sats"
//
staload "{$LIBATSHWXI}/teaching/mydraw/SATS/mydraw.sats"
staload "{$LIBATSHWXI}/teaching/mydraw/SATS/mydraw_cairo.sats"
//
staload "{$LIBATSHWXI}/teaching/mydraw/DATS/mydraw_bargraph.dats"
//
staload _(*anon*) = "{$LIBATSHWXI}/teaching/mydraw/DATS/mydraw.dats"
staload _(*anon*) = "{$LIBATSHWXI}/teaching/mydraw/DATS/mydraw_cairo.dats"
//
(* ****** ****** *)
//
staload "{$LIBATSHWXI}/teaching/myGTK/SATS/gtkcairotimer.sats"
staload "{$LIBATSHWXI}/teaching/myGTK/DATS/gtkcairotimer/gtkcairotimer_toplevel.dats"
//
staload CP = "{$LIBATSHWXI}/teaching/myGTK/DATS/gtkcairotimer/ControlPanel.dats"
staload DP = "{$LIBATSHWXI}/teaching/myGTK/DATS/gtkcairotimer/DrawingPanel.dats"
staload MAIN = "{$LIBATSHWXI}/teaching/myGTK/DATS/gtkcairotimer/gtkcairotimer_main.dats"
staload TIMER = "{$LIBATSHWXI}/teaching/myGTK/DATS/gtkcairotimer/gtkcairotimer_timer.dats"
//
(* ****** ****** *)

dynload "./gtkcairotimer_toplevel.dats"

(* ****** ****** *)

local
//
val () = srandom_with_time ()
//
val xy0 = ref<int2> ((~1, 0))
//
val (A0, xys0) =
  genScript (stdout_ref, i2sz(96))
//
val theExchlst2 = ref<list0(int2)> (xys0)
//
in (* in-of-local *)

val ASZ = array0_copy (A0)

extern
fun
ASZ_reset (): void
implement
ASZ_reset () = {
//
val () = srandom_with_time ()
//
var i: size_t
val () = !xy0 := ((~1, 0))
val () = for (i := i2sz(0); i < A0.size(); i := succ(i)) ASZ[i] := A0[i]
val () = !theExchlst2 := xys0
//
} (* end of [ASZ_reset] *)

extern
fun
ASZ_update (): void
implement
ASZ_update () = let
//
  val ij = !xy0
  val xys = !theExchlst2
//
  val () = (
    case+ xys of
    | nil0 () => !xy0 := ((~1, 0))
    | cons0 (xy, xys) => (!xy0 := xy; !theExchlst2 := xys)
  ) (* end of [val] *)
//
  val i = ij.0 and j = ij.1
//
in
  if i >= 0 then array0_interchange (ASZ, g0i2u(i), g0i2u(j))
end (* end of [ASZ_update] *)

end // end of [local]

(* ****** ****** *)

implement
the_timer_reset_after<> () = ASZ_reset ()

(* ****** ****** *)

extern
fun
cairo_draw_array0
(
  cr: !cairo_ref1
, point, point, point, point, array0(int)
) : void // end-of-fun

(* ****** ****** *)
//
extern
fun
colorgen (x: int): color
//
implement
colorgen (x) = let
//
  val x = $UN.cast{uint32}(x)
  val hval = $extfcall (uint32, "atslib_inthash_jenkins", x)
  val hval = $UN.cast{uint}(hval)
//
  val r = $UN.cast{int}(hval mod 256u)
  val hval = hval / 256u
  val g = $UN.cast{int}(hval mod 256u)
  val hval = hval / 256u
  val b = $UN.cast{int}(hval mod 256u)
//
in
  color_make (r/256.0, g/256.0, b/256.0)
end // end of [colorgen]
//
(* ****** ****** *)

implement
cairo_draw_array0
(
  cr, p1, p2, p3, p4, ASZ
) = let
//
val p_cr = ptrcast (cr)
//
implement
mydraw_get0_cairo<> () = let
//
extern
castfn __cast {l:addr} (ptr(l)): vttakeout (void, cairo_ref(l))
//
in
  __cast (p_cr)
end // end of [mydraw_get0_cairo]
//
implement
mydraw_bargraph$color<> (i) = colorgen (ASZ[i])

implement
mydraw_bargraph$height<> (i) = 1.0 * (ASZ[i]+1) / MYMAX
//
val asz = ASZ.size()
val asz = sz2i (asz)
val asz = ckastloc_gintGt (asz, 0)
//
in
  mydraw_bargraph (asz, p1, p2, p3, p4)
end // end of [cairo_draw_array0]

(* ****** ****** *)

extern
fun
mydraw_clock
  (cr: !cairo_ref1, width: int, height: int) : void
// end of [mydraw_clock]

(* ****** ****** *)

implement
mydraw_clock
  (cr, W, H) = let
//
val W =
g0int2float_int_double(W)
and H =
g0int2float_int_double(H)
//
val WH = min (W, H)
//
val xm = (W - WH) / 2
val ym = (H - WH) / 2
//
val v0 = vector_make (xm, ym)
//
val p1 = point_make (0. , WH) + v0
val p2 = point_make (WH , WH) + v0
val p3 = point_make (WH , 0.) + v0
val p4 = point_make (0. , 0.) + v0
//
val () =
if the_timer_is_running () then ASZ_update ()
//
val (pf | ()) = cairo_save (cr)
val () = cairo_draw_array0 (cr, p1, p2, p3, p4, ASZ)
val ((*void*)) = cairo_restore (pf | cr)
//
in
  // nothing
end // [mydraw_clock]

(* ****** ****** *)
//
%{^
typedef char **charptrptr ;
%} ;
abstype charptrptr = $extype"charptrptr"
//
(* ****** ****** *)

implement
main0{n}
(
  argc, argv
) = let
//
var argc: int = argc
var argv: charptrptr = $UN.castvwtp1{charptrptr}(argv)
//
val () = $extfcall (void, "gtk_init", addr@(argc), addr@(argv))
//
implement
gtkcairotimer_title<>
(
// argumentless
) = stropt_some"QuicksortAnimation"
implement
gtkcairotimer_timeout_interval<> () = 100U // millisecs
implement
gtkcairotimer_mydraw<> (cr, width, height) = mydraw_clock (cr, width, height)
//
val ((*void*)) = gtkcairotimer_main ((*void*))
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [quicksort_anim2.dats] *)
