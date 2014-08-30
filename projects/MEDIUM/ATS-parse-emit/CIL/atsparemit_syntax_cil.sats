(* ****** ****** *)
//
// ATS-parse-emit-cil
//
(* ****** ****** *)
//
// AS-2014-08-22: start
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

(* ****** ****** *)
//
fun label_reset () : void
//
fun make_label
  (loc: loc_t) : label
//
fun
label_for_instrlst
  (inss: instrlst) : label
//
(* ****** ****** *)
//
fun
f0head_insert
  (name: symbol, def: f0head): void
//
fun
f0head_search_opt (name: symbol): Option_vt (f0head)
//
(*
datatype Type_base =
  | TBbool
  | TBchar
  | TBfloat32
  | TBfloat64
  | TBint8
  | TBint16
  | TBint32
  | TBint64
  | TBstring
  | TBuint8
  | TBuint16
  | TBuint32
  | TBuint64
  | TBvoid

datatype CILType =
  | CTbase of Type_base
  | CTobject
  | CTclass of CILTypeReference
  | CTmptr of CILType
  | CTuptr of CILType
  | CTvaluetype of CILType

and CILTypeReference =
  CILTypeRef of (CILResolutionScope, CILDottedName)

and CILResolutionScope =
  | CILModuleResolution of FileName
  | CILAssemblyResolution of FileName
*)

(* ****** ****** *)
