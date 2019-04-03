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
fun
beer_mug
(
x0: double, y0: double, z0: double
) : scadobj
//
(* ****** ****** *)

implement
beer_mug
  (x0, y0, z0) = let
//
val h = 1.0
val r = 0.5
//
val ball = 
  scadobj_sphere(sqrt(2.0)*r)
(*
val cube =
  scadobj_centerize(scadobj_cube(h))
*)
//
val arg1 =
  SCADARGexp(SCADEXPfloat(h))
val arg2 =
  SCADARGlabexp("center", SCADEXPbool(true))
val cube =
  SCADOBJextmcall("cube", $list(arg1, arg2))
//
val red =
  scadxyz_color_name("red", 1.0)
val blue =
  scadxyz_color_name("blue", 1.0)
//
val ball = SCADOBJxyzobj(red, ball)
val cube = SCADOBJxyzobj(blue, cube)
//
val cylinder =
  scadobj_centerize
  (scadobj_cylinder(h, 0.9*r))
val cylinder =
  scadxyzobj_translate(0.0, 0.0, 0.1, cylinder)
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
val out = stdout_ref
//
val obj =
beer_mug(10.0, 10.0, 17.5)
//
val () =
fprintln!
(out, "\
/*
The code is automatically
generated from [test01.dats]
*/\n\
")
val () =
fprintln!
(out, "$fa=0.1; $fs=0.1;")
//
val () =
scadobj_femit(out, 0(*nsp*), obj)
//
val () =
fprint! (out, "\n")
val () =
fprintln!
(out, "/* end of [test01_dats.scad] */")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
