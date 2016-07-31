(*
** For studying
** lambda-calculus
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
staload _ = "./lamcal_tvar.dats"
//
(* ****** ****** *)

local
//
typedef elt = tvar
//
staload
FS = "libats/ML/SATS/funset.sats"
//
in (* in-of-local *)

#include "libats/ML/HATS/myfunset.hats"

end // end of [local]

(* ****** ****** *)

implement TVARSET = myfunset_make_module()

(* ****** ****** *)

(* end of [lamcal_tvarset.dats] *)
