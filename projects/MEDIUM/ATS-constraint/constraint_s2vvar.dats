(*
** Implementing Untyped Functional PL
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./constraint.sats"

(* ****** ****** *)

typedef
s2Var_struct = @{
  s2Var_stamp= stamp,
  s2Var_szexp= s2zexp
} (* end of [s2Var_struct] *)

(* ****** ****** *)

local
//
staload
UN = "prelude/SATS/unsafe.sats"
//
assume s2Var_type = ref (s2Var_struct)
//
in (* in of [local] *)

implement
s2Var_make
  (stamp) = let
//
val (
  pfat, pfgc | p
) = ptr_alloc<s2Var_struct> ()
//
val () = p->s2Var_stamp := stamp
val () = p->s2Var_szexp := S2ZEbot ()
//
in
  $UN.castvwtp0{s2Var}((pfat, pfgc | p))
end // end of [s2Var_make]

implement
s2Var_get_stamp
  (s2v) = $effmask_ref
(
let
  val (vbox _ | p) = ref_get_viewptr (s2v)
in
  p->s2Var_stamp
end // end of [let]
) (* end of [s2Var_get_stamp] *)

implement
s2Var_get_szexp
  (s2V) = $effmask_ref
(
let
  val (vbox _ | p) = ref_get_viewptr (s2V)
in
  p->s2Var_szexp
end
) (* end of [s2Var_get_szexp] *)

implement
s2Var_set_szexp
  (s2V, szexp) = $effmask_all
(
let
  val (vbox _ | p) = ref_get_viewptr (s2V)
in
  p->s2Var_szexp := szexp
end
) (* end of [s2Var_set_szexp] *)


end // end of [local]

(* ****** ****** *)

implement
fprint_s2Var
  (out, s2V) =
  fprint! (out, "s2Var(", s2V.stamp, ")")
// end of [fprint_s2Var]

(* ****** ****** *)

(* end of [constraint_s2vvar.dats] *)
