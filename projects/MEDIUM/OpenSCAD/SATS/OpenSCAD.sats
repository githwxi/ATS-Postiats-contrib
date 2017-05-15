(* ****** ****** *)
(*
** For implementing a DSL
** that supports ATS and OpenSCAD co-programming
*)
(* ****** ****** *)
//
#staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
//
datatype
scadexp =
//
| SCADEXPnil of ()
//
| SCADEXPint of (int)
| SCADEXPbool of (bool)
| SCADEXPfloat of (double)
//
(* ****** ****** *)
//
datatype
scadv2d =
| SCADV2D of (scadexp, scadexp)
//
datatype
scadv3d =
| SCADV3D of (scadexp, scadexp, scadexp)
//
(* ****** ****** *)
//
datatype
scadobj =
//
| SCADOBJcube of
    (scadv3d, scadexp(*center*))
//
| SCADOBJsphere of scadexp(*radius*)
//
| SCADOBJcylinder1 of
    (scadexp(*h*), scadexp(*r*), scadexp(*center*))
| SCADOBJcylinder2 of
    (scadexp(*h*), scadexp(*r1*), scadexp(*r2*), scadexp(*center*))
//
| SCADOBJunion of (scadobj, scadobj)
| SCADOBJdifference of (scadobj, scadobj)
| SCADOBJintersection of (scadobj, scadobj)
//
| SCADOBJxyzobj of (scadxyz, scadobj)
//
| SCADOBJhullize of (scadobj, scadobj)
| SCADOBJminkowski of (scadobj, scadobj)
// end of [scadobj]

and
scadxyz =
//
| SCADXYZid of ()
//
| SCADXYZscale of scadv3d
//
| SCADXYZrotate of scadv3d
//
| SCADXYZtranslate of scadv3d
//
| SCADXYZmirror of scadv3d
//
| SCADXYZcolor_name of
    (string, scadexp(*alpha*))
| SCADXYZcolor_rgba of
    (scadexp, scadexp, scadexp, scadexp)
//
| SCADXYZcompose of (scadxyz, scadxyz)
//
(* ****** ****** *)
//
fun
fprint_scadexp
  : fprint_type(scadexp)
fun
fprint_scadv2d
  : fprint_type(scadv2d)
fun
fprint_scadv3d
  : fprint_type(scadv3d)
fun
fprint_scadobj
  : fprint_type(scadobj)
fun
fprint_scadxyz
  : fprint_type(scadxyz)
//
(* ****** ****** *)
//
overload fprint with fprint_scadexp
overload fprint with fprint_scadv2d
overload fprint with fprint_scadv3d
overload fprint with fprint_scadobj
overload fprint with fprint_scadxyz
//
(* ****** ****** *)
//
fun{}
scadexp_femit
  (out: FILEref, scadexp): void
//
fun{}
scadv2d_femit
  (out: FILEref, scadv2d): void
fun{}
scadv3d_femit
  (out: FILEref, scadv3d): void
//
fun{}
scadobj_femit
  (out: FILEref, scadobj): void
//
fun{}
scadxyz_femit
  (out: FILEref, scadxyz): void
//
symintr femit
//
overload femit with scadexp_femit
overload femit with scadv2d_femit
overload femit with scadv3d_femit
overload femit with scadobj_femit
overload femit with scadxyz_femit
//
(* ****** ****** *)
//
fun{}
scadobj_cube_int3
  (x: int, y: int, z: int): scadobj
fun{}
scadobj_cube_int3_bool
  (x: int, y: int, z: int, ct: bool): scadobj
fun{}
scadobj_cube_float3
  (x: double, y: double, z: double): scadobj
fun{}
scadobj_cube_float3_bool
  (x: double, y: double, z: double, ct: bool): scadobj
//
symintr
scadobj_cube
//
overload
scadobj_cube with scadobj_cube_int3
overload
scadobj_cube with scadobj_cube_int3_bool
overload
scadobj_cube with scadobj_cube_float3
overload
scadobj_cube with scadobj_cube_float3_bool
//
(* ****** ****** *)
//
fun{}
scadobj_sphere_int3(int): scadobj
fun{}
scadobj_sphere_float3(double): scadobj
//
symintr
scadobj_sphere
//
overload
scadobj_sphere with scadobj_sphere_int3
overload
scadobj_sphere with scadobj_sphere_float3
//
(* ****** ****** *)
//
fun{}
scadobj_cylinder1_int2
  (h: int, r: int): scadobj
fun{}
scadobj_cylinder1_int2_bool
  (h: int, r: int, ct: bool): scadobj
fun{}
scadobj_cylinder1_float2
  (h: double, r: double): scadobj
fun{}
scadobj_cylinder1_float2_bool
  (h: double, r: double, ct: bool): scadobj
//
fun{}
scadobj_cylinder2_int3
  (h: int, r1: int, r2: int): scadobj
fun{}
scadobj_cylinder2_int3_bool
  (h: int, r1: int, r2: int, ct: bool): scadobj
fun{}
scadobj_cylinder2_float3
  (h: double, r1: double, r2: double): scadobj
fun{}
scadobj_cylinder2_float3_bool
  (h: double, r1: double, r2: double, ct: bool): scadobj
//
symintr
scadobj_cylinder
symintr
scadobj_cylinder1
symintr
scadobj_cylinder2
//
overload
scadobj_cylinder1 with scadobj_cylinder1_int2
overload
scadobj_cylinder1 with scadobj_cylinder1_int2_bool
overload
scadobj_cylinder1 with scadobj_cylinder1_float2
overload
scadobj_cylinder1 with scadobj_cylinder1_float2_bool
//
overload
scadobj_cylinder2 with scadobj_cylinder2_int3
overload
scadobj_cylinder2 with scadobj_cylinder2_int3_bool
overload
scadobj_cylinder2 with scadobj_cylinder2_float3
overload
scadobj_cylinder2 with scadobj_cylinder2_float3_bool
//
overload scadobj_cylinder with scadobj_cylinder1
overload scadobj_cylinder with scadobj_cylinder2
//
(* ****** ****** *)
//
fun{}
scadobj_union2
  (obj1: scadobj, obj2: scadobj): scadobj
fun{}
scadobj_inter2
  (obj1: scadobj, obj2: scadobj): scadobj
//
fun{}
scadobj_differ
  (obj1: scadobj, obj2: scadobj): scadobj
//
(* ****** ****** *)
//
overload cup with scadobj_union2
overload cap with scadobj_inter2
//
overload diff with scadobj_differ
//
(* ****** ****** *)
//
fun{}
scadxyz_scale_int3
  (x: int, y: int, z: int): scadxyz
fun{}
scadxyz_scale_float3
  (x: double, y: double, z: double): scadxyz
//
symintr
scadxyz_scale
//
overload scadxyz_scale with scadxyz_scale_int3
overload scadxyz_scale with scadxyz_scale_float3
//
(* ****** ****** *)
//
fun{}
scadxyz_rotate_int3
  (x: int, y: int, z: int): scadxyz
fun{}
scadxyz_rotate_float3
  (x: double, y: double, z: double): scadxyz
//
symintr
scadxyz_rotate
//
overload scadxyz_rotate with scadxyz_rotate_int3
overload scadxyz_rotate with scadxyz_rotate_float3
//
(* ****** ****** *)
//
fun{}
scadxyz_translate_int3
  (x: int, y: int, z: int): scadxyz
fun{}
scadxyz_translate_float3
  (x: double, y: double, z: double): scadxyz
//
symintr
scadxyz_translate
//
overload
scadxyz_translate with scadxyz_translate_int3
overload
scadxyz_translate with scadxyz_translate_float3
//
(* ****** ****** *)
//
fun{}
scadxyzobj_scale_int3
  (x: int, y: int, z: int, obj: scadobj): scadobj
fun{}
scadxyzobj_scale_float3
  (x: double, y: double, z: double, obj: scadobj): scadobj
//
symintr
scadxyzobj_scale
//
overload
scadxyzobj_scale with scadxyzobj_scale_int3
overload
scadxyzobj_scale with scadxyzobj_scale_float3
//
(* ****** ****** *)
//
fun{}
scadxyzobj_rotate_int3
  (x: int, y: int, z: int, obj: scadobj): scadobj
fun{}
scadxyzobj_rotate_float3
  (x: double, y: double, z: double, obj: scadobj): scadobj
//
symintr
scadxyzobj_rotate

overload
scadxyzobj_rotate with scadxyzobj_rotate_int3
overload
scadxyzobj_rotate with scadxyzobj_rotate_float3
//
(* ****** ****** *)
//
fun{}
scadxyzobj_translate_int3
  (x: int, y: int, z: int, obj: scadobj): scadobj
fun{}
scadxyzobj_translate_float3
  (x: double, y: double, z: double, obj: scadobj): scadobj
//
symintr
scadxyzobj_translate
//
overload
scadxyzobj_translate with scadxyzobj_translate_int3
overload
scadxyzobj_translate with scadxyzobj_translate_float3
//
(* ****** ****** *)
//
fun{}
scadobj_centerize(obj: scadobj): scadobj
//
(* ****** ****** *)

(* end of [OpenSCAD.sats] *)
