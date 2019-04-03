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
{}(*tmp*)
scadarg_femit
  (out, arg) = let
//
fun
fprint_scadexp
( out: FILEref, exp: scadexp
) : void = scadexp_femit(out, exp)
//
overload fprint with fprint_scadexp of 10
//
in
//
case+ arg of
| SCADARGexp(exp) =>
  fprint!(out, exp)
| SCADARGlabexp(lab, exp) =>
  fprint!(out, lab, "=", exp)
//
end // end of [scadarg_femit]

(* ****** ****** *)

implement
{}(*tmp*)
scadexp_femit
  (out, exp) = let
//
implement
fprint_val<scadarg>
  (out, arg) = scadarg_femit(out, arg)
//
in
//
case+ exp of
| SCADEXPnil() =>
  fprint!(out)
//
| SCADEXPint(i) =>
  fprint!(out, i)
//
| SCADEXPbool(b) =>
  fprint!(out, b)
//
| SCADEXPfloat(f) =>
  $extfcall(void, "fprintf", out, "%.2f", f)
//
| SCADEXPextfcall(f, xs) =>
  fprint!(out, f, "(", xs, ")")
//
end // end of [scadexp_femit]

(* ****** ****** *)

implement
{}(*tmp*)
scadvec_femit
  (out, vec) = let
//
(*
fun
xfprint_scadexp
( out: FILEref, exp: scadexp
) : void = scadexp_femit(out, exp)
//
implement // HX: this is buggy
fprint_val<scadexp> = xfprint_scadexp
implement // HX: this seems okay
fprint_val<scadexp>
  (out, e) = xfprint_scadexp(out, e)
*)
//
implement
fprint_val<scadexp>
  (out, exp) = scadexp_femit(out, exp)
//
in
//
case+ vec of
| SCADVEC(es) => fprint! (out, "[", es, "]")
end // end of [scadvec_femit]

(* ****** ****** *)
//
implement
{}(*tmp*)
scadind_femit
(
  out, nsp
) = loop(0) where
{
//
fun loop(i: int): void =
  if i < nsp then (fprint!(out, ' '); loop(i+1))
//
} (* end of [scadind_femit] *)
//
(* ****** ****** *)

implement
{}(*tmp*)
scadobj_femit
  (out, nsp, obj) = let
//
fun
fprint_scadexp
( out: FILEref, exp: scadexp
) : void = scadexp_femit(out, exp)
fun
fprint_scadvec
( out: FILEref, vec: scadvec0
) : void = scadvec_femit(out, vec)
//
implement
fprint_val<scadarg>
  (out, arg) = scadarg_femit(out, arg)
//
overload fprint with fprint_scadexp of 10
overload fprint with fprint_scadvec of 10
//
in
//
case+ obj of
//
| SCADOBJcube
    (v3d, ct) => let
    val () =
    scadind_femit(out, nsp)
  in
    case+ ct of
    | SCADEXPnil() =>
      fprint!(out, "cube(", v3d, ");\n")
    | _(*non-SCADEXPnil*) =>
      fprint!(out, "cube(", v3d, ", center=", ct, ");\n")
  end // end of [SCADOBJcube]
//
| SCADOBJsquare
    (v2d, ct) => let
    val () =
    scadind_femit(out, nsp)
  in
    case+ ct of
    | SCADEXPnil() =>
      fprint!(out, "square(", v2d, ");\n")
    | _(*non-SCADEXPnil*) =>
      fprint!(out, "square(", v2d, ", center=", ct, ");\n")
  end // end of [SCADOBJsquare]
//
| SCADOBJcircle(rad) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "circle(", rad, ");\n")
  )
| SCADOBJsphere(rad) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "sphere(", rad, ");\n")
  )
//
| SCADOBJcylinder1
    (h, r, ct) => let
    val () =
    scadind_femit(out, nsp)
  in
    case+ ct of
    | SCADEXPnil() =>
      fprint!(out, "cylinder(", "h=", h, ", r=", r, ");\n")
    | _(*non-SCADEXPnil*) =>
      fprint!
      ( out
      , "cylinder(", "h=", h, ", r=", r, ", center=", ct, ");\n"
      ) (* fprintln! *)
  end // end of [SCADOBJcylinder1]
| SCADOBJcylinder2
    (h, r1, r2, ct) => let
    val () =
    scadind_femit(out, nsp)
  in
    case+ ct of
    | SCADEXPnil() =>
      fprint!
      ( out
      , "cylinder(", "h=", h, ", r1=", r1, ", r2=", r2, ");\n"
      ) (* fprintln! *)
    | _(*non-SCADEXPnil*) =>
      fprint!
      ( out
      , "cylinder(", "h=", h, ", r1=", r1, ", r2=", r2, "center=", ct, ");\n"
      ) (* fprintln! *)
  end // end of [SCADOBJcylinder2]
//
| SCADOBJunion
    (obj1, obj2) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "union(){\n");
    scadobj_femit(out, nsp+2, obj1);
    scadobj_femit(out, nsp+2, obj2);
    scadind_femit(out, nsp); fprint!(out, "}\n");
  )
| SCADOBJdifference
    (obj1, obj2) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "difference(){\n");
    scadobj_femit(out, nsp+2, obj1);
    scadobj_femit(out, nsp+2, obj2);
    scadind_femit(out, nsp); fprint!(out, "}\n");
  )
| SCADOBJintersection
    (obj1, obj2) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "intersection(){\n");
    scadobj_femit(out, nsp+2, obj1);
    scadobj_femit(out, nsp+2, obj2);
    scadind_femit(out, nsp); fprint!(out, "}\n");
  )
//
| SCADOBJxyzobj(xyz1, obj2) =>
  (
    scadxyz_femit(out, nsp, xyz1);
    scadobj_femit(out, nsp, obj2);
  )
//
| SCADOBJhullize(obj1, obj2) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "hull(){\n");
    scadobj_femit(out, nsp+2, obj1);
    scadobj_femit(out, nsp+2, obj2);
    scadind_femit(out, nsp); fprint!(out, "}\n");
  )
| SCADOBJminkowski(obj1, obj2) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "minkowski(){\n");
    scadobj_femit(out, nsp+2, obj1);
    scadobj_femit(out, nsp+2, obj2);
    scadind_femit(out, nsp); fprint!(out, "}\n");
  )
//
| SCADOBJextmcall(f, xs) =>
  (
    scadind_femit(out, nsp); fprint!(out, f, "(", xs, ");\n");
  )
//
end (* end of [scadobj_femit] *)

(* ****** ****** *)

implement
{}(*tmp*)
scadxyz_femit
(
out, nsp, xyz
) = let
//
fun
fprint_scadexp
( out: FILEref, exp: scadexp
) : void = scadexp_femit(out, exp)
fun
fprint_scadvec
( out: FILEref, vec: scadvec0
) : void = scadvec_femit(out, vec)
//
overload fprint with fprint_scadexp of 10
overload fprint with fprint_scadvec of 10
//
in
//
case+ xyz of
//
| SCADXYZid() =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "/* ident() */\n")
  )
//
| SCADXYZscale(v3d) => 
  (
    scadind_femit(out, nsp);
    fprint!(out, "scale(", v3d, ")\n")
  )
//
| SCADXYZrotate(v3d) => 
  (
    scadind_femit(out, nsp);
    fprint!(out, "rotate(", v3d, ")\n")
  )
//
| SCADXYZtranslate(v3d) => 
  (
    scadind_femit(out, nsp);
    fprint!(out, "translate(", v3d, ")\n")
  )
//
| SCADXYZmirror(v3d) => 
  (
    scadind_femit(out, nsp);
    fprint!(out, "mirror(", v3d, ")\n")
  )
//
| SCADXYZcompose(xyz1, xyz2) =>
  (
    scadxyz_femit(out, nsp+2, xyz1);
    scadxyz_femit(out, nsp+2, xyz2);
  )
//
| SCADXYZcolor_name(name, a) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "color(\"", name, "\"", ", ", a, ")\n")
  )
| SCADXYZcolor_rgba(r, g, b, a) =>
  (
    scadind_femit(out, nsp);
    fprint!(out, "color([", r, ", ", g, ", ", b, ", ", a, "])\n");
  )
//
end (* end of [scadxyz_femit] *)

(* ****** ****** *)

(* end of [OpenSCAD_emit.dats] *)
