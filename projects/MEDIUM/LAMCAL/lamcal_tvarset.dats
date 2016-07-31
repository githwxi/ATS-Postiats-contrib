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
implement
$FS.compare_elt_elt<elt>(x, y) = compare(x, y)
//
in (* in-of-local *)

#include "libats/ML/HATS/myfunset.hats"

end // end of [local]

(* ****** ****** *)

assume tvarset_type = myset

(* ****** ****** *)
//
implement
tvarset_make_nil() = myfunset_make_nil()
implement
tvarset_make_sing(x) = myfunset_make_sing(x)
//
(* ****** ****** *)

implement
tvarset_is_nil(xs) = xs.is_nil()

(* ****** ****** *)
//
implement
tvarset_is_member(xs, x) = xs.is_member(x)
//
(* ****** ****** *)
//
implement
tvarset_add(xs, x) =
let
  var xs = xs in ignoret(xs.insert(x)); xs
end // end of [tvarset_add]
//
implement
tvarset_remove(xs, x) =
let
  var xs = xs in ignoret(xs.remove(x)); xs
end // end of [tvarset_remove]
//
(* ****** ****** *)
//
implement
tvarset_union(xs, ys) = myfunset_union(xs, ys)
//
(* ****** ****** *)

(* end of [lamcal_tvarset.dats] *)
