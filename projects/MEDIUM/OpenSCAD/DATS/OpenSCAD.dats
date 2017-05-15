(* ****** ****** *)
(*
** For implementing a DSL
** that supports ATS and OpenSCAD co-programming
*)
(* ****** ****** *)
//
#staload
"./../SATS/OpenSCAD.sats"
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadobj_cube_int1
  (x) =
(
scadobj_cube_int3<>(x, x, x)
)
//
implement
{}(*tmp*)
scadobj_cube_int3
  (x, y, z) =
(
SCADOBJcube
(
SCADV3D
(
SCADEXPint(x), SCADEXPint(y), SCADEXPint(z)
)
,
SCADEXPnil()
) (* SCADOBJcube *)
)
implement
{}(*tmp*)
scadobj_cube_int3_bool
  (x, y, z, ct) =
(
SCADOBJcube
(
SCADV3D
(
SCADEXPint(x), SCADEXPint(y), SCADEXPint(z)
)
,
SCADEXPbool(ct)
) (* SCADOBJcube *)
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadobj_cube_float1
  (x) =
(
scadobj_cube_float3<>(x, x, x)
)
//
implement
{}(*tmp*)
scadobj_cube_float3
  (x, y, z) =
(
SCADOBJcube
(
SCADV3D
(
SCADEXPfloat(x), SCADEXPfloat(y), SCADEXPfloat(z)
)
,
SCADEXPnil()
) (* SCADOBJcube *)
)
implement
{}(*tmp*)
scadobj_cube_float3_bool
  (x, y, z, ct) =
(
SCADOBJcube
(
SCADV3D
(
SCADEXPfloat(x), SCADEXPfloat(y), SCADEXPfloat(z)
)
,
SCADEXPbool(ct)
) (* SCADOBJcube *)
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadobj_sphere_int3
  (rad) =
(
SCADOBJsphere(SCADEXPint(rad))
)
implement
{}(*tmp*)
scadobj_sphere_float3
  (rad) =
(
SCADOBJsphere(SCADEXPfloat(rad))
)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadobj_cylinder1_int2
  (h, r) =
(
SCADOBJcylinder1
  (SCADEXPint(h), SCADEXPint(r), SCADEXPnil())
) (* SCADOBJcylinder1 *)
implement
{}(*tmp*)
scadobj_cylinder1_int2_bool
  (h, r, ct) =
(
SCADOBJcylinder1
  (SCADEXPint(h), SCADEXPint(r), SCADEXPbool(ct))
) (* SCADOBJcylinder1 *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadobj_cylinder1_float2
  (h, r) =
(
SCADOBJcylinder1
  (SCADEXPfloat(h), SCADEXPfloat(r), SCADEXPnil())
) (* SCADOBJcylinder1 *)
implement
{}(*tmp*)
scadobj_cylinder1_float2_bool
  (h, r, ct) =
(
SCADOBJcylinder1
  (SCADEXPfloat(h), SCADEXPfloat(r), SCADEXPbool(ct))
) (* SCADOBJcylinder1 *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadobj_cylinder2_int3
  (h, r1, r2) =
(
SCADOBJcylinder2
(
SCADEXPint(h), SCADEXPint(r1), SCADEXPint(r2), SCADEXPnil()
)
) (* SCADOBJcylinder2 *)
//
implement
{}(*tmp*)
scadobj_cylinder2_float3
  (h, r1, r2) =
(
SCADOBJcylinder2
(
SCADEXPfloat(h), SCADEXPfloat(r1), SCADEXPfloat(r2), SCADEXPnil()
)
) (* SCADOBJcylinder2 *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadobj_union2
  (obj1, obj2) = SCADOBJunion(obj1, obj2)
//
implement
{}(*tmp*)
scadobj_differ
  (obj1, obj2) = SCADOBJdifference(obj1, obj2)
//
implement
{}(*tmp*)
scadobj_inter2
  (obj1, obj2) = SCADOBJintersection(obj1, obj2)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadxyzobj_scale_int3
  (x, y, z, obj) = let
//
val
xyz =
scadxyz_scale_int3(x, y, z)
//
in
  SCADOBJxyzobj(xyz, obj)
end // end of [scadxyzobj_scale_int]
//
implement
{}(*tmp*)
scadxyzobj_scale_float3
  (x, y, z, obj) = let
//
val
xyz =
scadxyz_scale_float3(x, y, z)
//
in
  SCADOBJxyzobj(xyz, obj)
end // end of [scadxyzobj_scale_float]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadxyzobj_rotate_int3
  (x, y, z, obj) = let
//
val
xyz =
scadxyz_rotate_int3(x, y, z)
//
in
  SCADOBJxyzobj(xyz, obj)
end // end of [scadxyzobj_rotate_int]
//
implement
{}(*tmp*)
scadxyzobj_rotate_float3
  (x, y, z, obj) = let
//
val
xyz =
scadxyz_rotate_float3(x, y, z)
//
in
  SCADOBJxyzobj(xyz, obj)
end // end of [scadxyzobj_rotate_float]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadxyzobj_translate_int3
  (x, y, z, obj) = let
//
val
xyz =
scadxyz_translate_int3(x, y, z)
//
in
  SCADOBJxyzobj(xyz, obj)
end // end of [scadxyzobj_translate_int]
//
implement
{}(*tmp*)
scadxyzobj_translate_float3
  (x, y, z, obj) = let
//
val
xyz =
scadxyz_translate_float3(x, y, z)
//
in
  SCADOBJxyzobj(xyz, obj)
end // end of [scadxyzobj_translate_float]
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadxyz_scale_int3
  (x, y, z) =
(
SCADXYZscale
(
SCADV3D(SCADEXPint(x), SCADEXPint(y), SCADEXPint(z))
) (* SCADXYZscale *)
) (* end of [scadxyz_scale_int] *)
//
implement
{}(*tmp*)
scadxyz_scale_float3
  (x, y, z) =
(
SCADXYZscale
(
SCADV3D(SCADEXPfloat(x), SCADEXPfloat(y), SCADEXPfloat(z))
) (* SCADXYZscale *)
) (* end of [scadxyz_scale_float] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadxyz_rotate_int3
  (x, y, z) =
(
SCADXYZrotate
(
SCADV3D(SCADEXPint(x), SCADEXPint(y), SCADEXPint(z))
) (* SCADXYZrotate *)
) (* end of [scadxyz_rotate_int] *)
//
implement
{}(*tmp*)
scadxyz_rotate_float3
  (x, y, z) =
(
SCADXYZrotate
(
SCADV3D(SCADEXPfloat(x), SCADEXPfloat(y), SCADEXPfloat(z))
) (* SCADXYZrotate *)
) (* end of [scadxyz_rotate_float] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadxyz_translate_int3
  (x, y, z) =
(
SCADXYZtranslate
(
SCADV3D(SCADEXPint(x), SCADEXPint(y), SCADEXPint(z))
) (* SCADXYZtranslate *)
) (* end of [scadxyz_translate_int] *)
//
implement
{}(*tmp*)
scadxyz_translate_float3
  (x, y, z) =
(
SCADXYZtranslate
(
SCADV3D(SCADEXPfloat(x), SCADEXPfloat(y), SCADEXPfloat(z))
) (* SCADXYZtranslate *)
) (* end of [scadxyz_translate_float] *)
//
(* ****** ****** *)
//
implement
{}(*tmp*)
scadxyz_color_name
  (name, alpha) =
(
SCADXYZcolor_name(name, SCADEXPfloat(alpha))
)
implement
{}(*tmp*)
scadxyz_color_rgba
  (r, g, b, alpha) =
(
SCADXYZcolor_rgba
(
SCADEXPfloat(r), SCADEXPfloat(g), SCADEXPfloat(b),
SCADEXPfloat(alpha)
)
)
//
(* ****** ****** *)

implement
{}(*tmp*)
scadobj_centerize
  (obj) =
(
case+ obj of
//
| SCADOBJcube(v3d, ct) =>
  SCADOBJcube(v3d, SCADEXPbool(true))
//
| SCADOBJcylinder1(h, r, ct) =>
  SCADOBJcylinder1(h, r, SCADEXPbool(true))
| SCADOBJcylinder2(h, r1, r2, ct) =>
  SCADOBJcylinder2(h, r1, r2, SCADEXPbool(true))
//
| _(* rest-of-scadobj *) => obj
) (* end of [scadobj_centerize] *)

(* ****** ****** *)

(* end of [OpenSCAD.dats] *)
