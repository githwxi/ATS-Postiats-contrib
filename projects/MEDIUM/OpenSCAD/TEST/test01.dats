(* ****** ****** *)
(*
** An example of
** ATS and OpenSCAD co-programming
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
#staload
"libats/libc/SATS/math.sats"
#staload _ =
"libats/libc/DATS/math.dats"
//
(* ****** ****** *)
//
#include "./../mylibies.hats"
//
#staload $OpenSCAD // opening it!
//
#include "./../mylibies_link.hats"
//
(* ****** ****** *)
//
extern
fun{}
beer_mug
(
x0: double, y0: double, z0: double
) : scadobj
//
(* ****** ****** *)

implement
{}(*tmp*)
beer_mug
  (x0, y0, z0) = let
//
val h = 1.0
val r = 0.5
//
val ball = 
  scadobj_sphere(sqrt(2.0)*r)
val cube =
  scadobj_centerize(scadobj_cube(h, h, h))
//
val cylinder =
  scadobj_centerize
  (scadobj_cylinder(1.1*h, 0.9*r))
val cylinder =
  scadxyzobj_translate(0.0, 0.0, 0.2, cylinder)
//
in
scadxyzobj_scale
(
  x0, y0, z0
, scadxyzobj_translate(0.0, 0.0, 0.5, (ball \cap cube) \diff cylinder)
) (* scadxyzobj_scale *)
end // end of [beer_mug]

(* ****** ****** *)

implement
main0() = () where
{
//
val obj =
beer_mug(10.0, 10.0, 17.5)
val ((*void*)) =
scadobj_femit(stdout_ref, obj)
val ((*void*)) =
fprint_newline(stdout_ref)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
