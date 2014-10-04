(*
**
** A simple GTK/CAIRO-clock
**
** Author: Hongwei Xi
** Authoremail: hwxiATcsDOTbuDOTedu
** Start Time: April, 2010
**
*)

(* ****** ****** *)

(*
** Ported to ATS2 by Hongwei Xi, September, 2013
*)

(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

local
//
#define B 1
#define R 2
#define BR 3
//
val MSZ = mtrxszref_make_elt<int> (i2sz(6), i2sz(6), 0)
//
val () = MSZ[0,0] := B
val () = MSZ[0,1] := B
val () = MSZ[0,2] := B
val () = MSZ[0,3] := B
val () = MSZ[0,4] := B
val () = MSZ[0,5] := B
//
val () = MSZ[1,0] := BR
val () = MSZ[1,1] := BR
val () = MSZ[1,2] := BR
val () = MSZ[1,3] := BR
val () = MSZ[1,4] := BR
val () = MSZ[1,5] := BR
//
val () = MSZ[2,0] := 0
val () = MSZ[2,1] := 0
val () = MSZ[2,2] := BR
val () = MSZ[2,3] := BR
val () = MSZ[2,4] := 0
val () = MSZ[2,5] := 0
//
val () = MSZ[3,0] := R
val () = MSZ[3,1] := R
val () = MSZ[3,2] := BR
val () = MSZ[3,3] := BR
val () = MSZ[3,4] := R
val () = MSZ[3,5] := R
//
val () = MSZ[4,0] := R
val () = MSZ[4,1] := 0
val () = MSZ[4,2] := BR
val () = MSZ[4,3] := B
val () = MSZ[4,4] := 0
val () = MSZ[4,5] := R
//
val () = MSZ[5,0] := R
val () = MSZ[5,1] := R
val () = MSZ[5,2] := BR
val () = MSZ[5,3] := BR
val () = MSZ[5,4] := R
val () = MSZ[5,5] := R
//
in (*in-of-local*)

val the_MSZ = MSZ

end // end of [local]

(* ****** ****** *)
//
staload "{$CAIRO}/SATS/cairo.sats"
//
staload "{$LIBATSHWXI}/teaching/mydraw/SATS/mydraw.sats"
staload "{$LIBATSHWXI}/teaching/mydraw/SATS/mydraw_cairo.sats"
//
staload "{$LIBATSHWXI}/teaching/mydraw/DATS/mydraw_matgraph.dats"
//
staload _(*anon*) = "{$LIBATSHWXI}/teaching/mydraw/DATS/mydraw.dats"
staload _(*anon*) = "{$LIBATSHWXI}/teaching/mydraw/DATS/mydraw_cairo.dats"
//
(* ****** ****** *)

extern
fun
cairo_draw_mtrxszref
(
  cr: !cairo_ref1
, point, point, point, point, mtrxszref(int)
) : void // end of [cairo_draw_mtrxszref]

(* ****** ****** *)

implement
cairo_draw_mtrxszref
(
  cr, p1, p2, p3, p4, MSZ
) = let
//
val p_cr = ptrcast (cr)
//
implement
mydraw_get0_cairo<> () = let
//
extern
castfn
__takeout{l:addr}(ptr(l)): vttakeout (void, cairo_ref(l))
//
in
  __takeout (p_cr)
end // end of [mydraw_get0_cairo]
//
implement
mydraw_matgraph$color<>
  (i, j) = let
  val x = MSZ[i,j]
in
//
case+ x of
| 1 => color_make (0.0, 0.0, 0.0)
| 2 => color_make (0.0, 0.0, 0.0)
| 3 => color_make (0.0, 0.0, 0.0)
| _ => color_make (1.0, 1.0, 1.0)
// end of [if]
//
end // end of [mydraw_matgraph$color]
//
val nrow = MSZ.nrow
val nrow = g1ofg0(nrow)
val () = assertloc (nrow > 0)
val nrow = sz2i (nrow)
val ncol = MSZ.ncol
val ncol = g1ofg0(ncol)
val () = assertloc (ncol > 0)
val ncol = sz2i (ncol)
//
in
  mydraw_matgraph (nrow, ncol, p1, p2, p3, p4)
end // end of [cairo_draw_matrix0]

(* ****** ****** *)

extern
fun
mydraw_clock
  (cr: !cairo_ref1, width: int, height: int): void
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
val p1 = point_make (0. , 0.) + v0
val p2 = point_make (0. , WH) + v0
val p3 = point_make (WH , WH) + v0
val p4 = point_make (WH , 0.) + v0
//
val (pf | ()) = cairo_save (cr)
//
val ((*void*)) =
  cairo_draw_mtrxszref (cr, p1, p2, p3, p4, the_MSZ)
//
val ((*void*)) = cairo_restore (pf | cr)
//
in
  // nothing
end // [mydraw_clock]

(* ****** ****** *)

%{^
typedef char **charptrptr ;
%} ;
abstype charptrptr = $extype"charptrptr"

(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/teaching/myGTK/SATS/gtkcairoclock.sats"
staload _ =
"{$LIBATSHWXI}/teaching/myGTK/DATS/gtkcairoclock.dats"
//
(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
var argc: int = argc
var argv: charptrptr = $UN.castvwtp1{charptrptr}(argv)
//
val () = $extfcall (void, "gtk_init", addr@(argc), addr@(argv))
//
implement
gtkcairoclock_title<> () = stropt_some"gtkcairoclock"
implement
gtkcairoclock_timeout_interval<> () = 500U // millisecs
implement
gtkcairoclock_mydraw<> (cr, width, height) = mydraw_clock (cr, width, height)
//
val ((*void*)) = gtkcairoclock_main ((*void*))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [myclock2.dats] *)
