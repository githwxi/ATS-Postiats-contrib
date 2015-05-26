(*
** Implementing stamps for static objects
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./constraint.sats"

(* ****** ****** *)

assume stamp_t0ype = int

(* ****** ****** *)

implement stamp_make (x) = x

(* ****** ****** *)

implement stamp_get_int (stmp) = stmp

(* ****** ****** *)

implement
fprint_stamp
  (out, stamp) = fprint_int (out, stamp)
// end of [fprint_stamp]

(* ****** ****** *)

implement
compare_stamp_stamp (s1, s2) = g0int_compare (s1, s2)

implement
equal_stamp_stamp (s1, s2) = compare (s1, s2) = 0

(* ****** ****** *)

local
  var the_stamp_counter : stamp = 0
  
  val the_stamp_counter = 
    ref_make_viewptr (view@ the_stamp_counter | addr@ the_stamp_counter)
in
  implement the_stamp_counter_parse_new (stamp) = let
    val (vbox pf | p) = ref_get_viewptr {stamp} (the_stamp_counter)
    val current = !p
  in
    if stamp > current then
      !p := stamp
  end
  
  implement the_stamp_counter_next () = let
    val (vbox pf | p) = ref_get_viewptr {stamp} (the_stamp_counter)
  in
    !p := succ(!p);
    !p
  end
end

(* ****** ****** *)

(* end of [constraint_stamp.dats] *)
