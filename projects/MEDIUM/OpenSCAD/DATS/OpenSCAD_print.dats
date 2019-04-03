(* ****** ****** *)
(*
** For implementing DSL
** that supports co-programming
** with ATS and OpenSCAD
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
#staload "./../SATS/OpenSCAD.sats"
//
(* ****** ****** *)

implement
fprint_val<scadarg> = fprint_scadarg
implement
fprint_val<scadexp> = fprint_scadexp
implement
fprint_val<scadobj> = fprint_scadobj

(* ****** ****** *)
//
implement
fprint_scadarg
  (out, arg) =
(
case+ arg of
| SCADARGexp(e) =>
  fprint!(out, "SCADARGexp(", e, ")")
| SCADARGlabexp(l, e) =>
  fprint!(out, "SCADARGlabexp(", l, "=", e, ")")
)
//
(* ****** ****** *)
//
implement
fprint_scadexp
  (out, exp) = let
(*
val () =
println! ("fprint_scadexp")
*)
in
//
case+ exp of
| SCADEXPnil() =>
  fprint!(out, "SCADEXPnil()")
| SCADEXPint(x) =>
  fprint!(out, "SCADEXPint(", x, ")")
| SCADEXPbool(x) =>
  fprint!(out, "SCADEXPbool(", x, ")")
| SCADEXPfloat(x) =>
  $extfcall(void, "fprintf", out, "SCADEXPfloat(%.2f)", x)
//
| SCADEXPextfcall(f, xs) =>
  fprint!(out, "SCADEXPextfcall(", f, "; ", xs, ")")
//
end // end of [fprint_scadexp]
//
(* ****** ****** *)
//
implement
fprint_scadvec
  (out, vec) =
(
case+ vec of
| SCADVEC(xs) =>
  fprint!(out, "SCADVEC(", xs, ")")
)
//
(* ****** ****** *)
//
implement
fprint_scadobj
  (out, obj) = let
//
(*
val =
println! ("fprint_scadobj")
*)
//
in
//
case+ obj of
//
| SCADOBJcube(v3d, ct) =>
  fprint!
  ( out
  , "SCADOBJcube(", v3d, ", ", ct, ")"
  ) (* fprint! *)
| SCADOBJsquare(v2d, ct) =>
  fprint!
  ( out
  , "SCADOBJsquare(", v2d, ", ", ct, ")"
  ) (* fprint! *)
//
| SCADOBJcircle(rad) =>
  fprint! (out, "SCADOBJcircle(", rad, ")")
| SCADOBJsphere(rad) =>
  fprint! (out, "SCADOBJsphere(", rad, ")")
//
| SCADOBJcylinder1(h, r, ct) =>
  fprint!
  (out, "SCADOBJcylinder1(", h, ", ", r, ", ", ct, ")")
| SCADOBJcylinder2(h, r1, r2, ct) =>
  fprint!
  ( out
  , "SCADOBJcylinder2(", h, ", ", r1, ", ", r2, ", ", ct, ")"
  ) (* fprint! *)
//
| SCADOBJunion(x1, x2) =>
  fprint! (out, "SCADOBJunion(", x1, ", ", x2, ")")
| SCADOBJdifference(x1, x2) =>
  fprint! (out, "SCADOBJdifference(", x1, ", ", x2, ")")
| SCADOBJintersection(x1, x2) =>
  fprint! (out, "SCADOBJintersection(", x1, ", ", x2, ")")
//
| SCADOBJxyzobj(x1, x2) =>
  fprint! (out, "SCADOBJxyzobj(", x1, ", ", x2, ")")
//
| SCADOBJhullize(x1, x2) =>
  fprint! (out, "SCADOBJhullize(", x1, ", ", x2, ")")
| SCADOBJminkowski(x1, x2) =>
  fprint! (out, "SCADOBJminkowski(", x1, ", ", x2, ")")
//
| SCADOBJextmcall(f, args) =>
  (
    fprint!(out, "SCADEXPextmcall(", f, "; ", args, ")")
  )
//
end (* end of [fprint_scadobj] *)

(* ****** ****** *)

implement
fprint_scadxyz
  (out, xyz) =
(
case+ xyz of
| SCADXYZid() =>
  fprint! (out, "SCADXYZid()")
//
| SCADXYZscale(v3d) =>
  fprint! (out, "SCADXYZscale(", v3d, ")")
//
| SCADXYZrotate(v3d) =>
  fprint! (out, "SCADXYZrotate(", v3d, ")")
//
| SCADXYZtranslate(v3d) =>
  fprint! (out, "SCADXYZtranslate(", v3d, ")")
//
| SCADXYZmirror(v3d) =>
  fprint! (out, "SCADXYZmirror(", v3d, ")")
//
| SCADXYZcolor_name(name, a) =>
  fprint! (out, "SCADXYZname(", name, ", ", a, ")")
| SCADXYZcolor_rgba(r, g, b, a) =>
  fprint! (out, "SCADXYZrgba(", r, ", ", g, ", ", b, ", ", a, ")")
//
| SCADXYZcompose (xyz1, xyz2) =>
  fprint! (out, "SCADXYZcompose(", xyz1, ", ", xyz2, ")")
//
) (* end of [fprint_scadxyz] *)

(* ****** ****** *)

(* end of [OpenSCAD_print.dats] *)
