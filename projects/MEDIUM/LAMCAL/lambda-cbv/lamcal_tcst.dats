(*
** For studying
** lambda-calculus
** cbv: call-by-value
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
staload "./lamcal.sats"
//
(* ****** ****** *)
//
implement
fprint_val<tcst> = fprint_tcst
//
(* ****** ****** *)
//
datatype tcst =
  | TCSTint of int
  | TCSTsym of string
//
assume tcst_type = tcst
//
(* ****** ****** *)
//
implement
tvar_make_int(i0) = TCSTint(i0)
//
implement
tvar_make_name(name) = TCSTsym(name)
//
(* ****** ****** *)

(* end of [lamcal_tcst.dats] *)
