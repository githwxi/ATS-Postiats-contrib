(*
** ATS-extsolve:
** For solving ATS-constraints
** with external SMT-solvers
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
"./patsolve_constraint3.sats"
//
(* ****** ****** *)

assume stamp_t0ype = int

(* ****** ****** *)

implement
fprint_stamp
  (out, loc) = fprint_int (out, loc)
// end of [fprint_stamp]

(* ****** ****** *)
//
implement
eq_stamp_stamp(x1, x2) =
  (compare_stamp_stamp(x1, x2) = 0)
implement
neq_stamp_stamp(x1, x2) =
  (compare_stamp_stamp(x1, x2) != 0)
//
(* ****** ****** *)
//
implement
compare_stamp_stamp(x1, x2) = g0int_compare (x1, x2)
//
(* ****** ****** *)

local
//
var theCount: stamp = 0
val theCount =
  ref_make_viewptr{stamp}(view@theCount | addr@theCount)
//
in
//
implement
theStamp_getinc
  ((*void*)) = n0 where
{
  val n0 = theCount[]
  val () = theCount[] := n0 + 1
}
//
implement
theStamp_update
  (n) = let
  val n0 = theCount[]
in
  if n0 <= n then theCount[] := n+1
end // end of [theStamp_update]
//
end // end of [local]

(* ****** ****** *)

(* end of [patsolve_constraint3_stamp.dats] *)
