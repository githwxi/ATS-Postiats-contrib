(*
** libatscc-common
*)

(* ****** ****** *)

(*
//
staload "./basics.sats"
//
staload UN = "prelude/SATS/unsafe.sats"
//
*)

(* ****** ****** *)
//
implement
cloref0_app (cf) = cf()
implement
cloref1_app (cf, x) = cf(x)
implement
cloref2_app (cf, x1, x2) = cf(x1, x2)
implement
cloref3_app (cf, x1, x2, x3) = cf(x1, x2, x3)
//
(* ****** ****** *)

(* end of [basics.dats] *)
