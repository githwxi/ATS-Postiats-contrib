(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_parsing.sats"

(* ****** ****** *)
//
implement
parerr_make (loc, node) =
  '{ parerr_loc= loc, parerr_node= node }
//
(* ****** ****** *)

implement
the_parerrlst_add_ifnbt
  (bt, loc, node) = let
in
//
if (bt = 0)
  then the_parerrlst_insert (parerr_make (loc, node)) else ()
//
end // end of [the_parerrlst_add_if0]

(* ****** ****** *)

(* end of [atsparemit_parerr.dats] *)
