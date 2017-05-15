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
fprint_val<scadexp> = fprint_scadexp
implement
fprint_val<scadobj> = fprint_scadobj

(* ****** ****** *)
//
implement
fprint_scadexp
  (out, exp) =
(
case+ exp of
| SCADEXPnil() =>
  fprint!(out, "SCADEXPnil()")
| SCADEXPint(x) =>
  fprint!(out, "SCADEXPint(", x, ")")
| SCADEXPbool(x) =>
  fprint!(out, "SCADEXPbool(", x, ")")
| SCADEXPfloat(x) =>
  $extfcall(void, "fprintf", out, "SCADEXPfloat(%.2f)", x)
)
//
(* ****** ****** *)
//
implement
fprint_scadv2d
  (out, v2d) =
(
case+ v2d of
| SCADV2D(x0, x1) =>
  fprint!(out, "SCADV2D(", x0, ", ", x1, ")")
)
//
(* ****** ****** *)
//
implement
fprint_scadv3d
  (out, v3d) =
(
case+ v3d of
| SCADV3D(x0, x1, x2) =>
  fprint!(out, "SCADV3D(", x0, ", ", x1, ", ", x2, ")")
)
//
(* ****** ****** *)
//
implement
fprint_scadobj
  (out, obj) =
(
case+ obj of
| SCADOBJcube(v3d, ct) =>
  fprint!
  (out, "SCADOBJcube(", v3d, ", ", ct, ")")
//
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
)

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
