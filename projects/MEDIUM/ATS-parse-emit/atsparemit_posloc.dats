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
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
implement
position_incby1
  (pos) = position_incby (pos, 1)
//
(* ****** ****** *)

implement
position_decby
  (pos, n) =
{
//
val () = pos.pos_ntot := pos.pos_ntot - n
val () = pos.pos_ncol := pos.pos_ncol - n
//
} (* end of [position_decby] *)

(* ****** ****** *)

implement
position_incby
  (pos, n) =
{
//
val () = pos.pos_ntot := pos.pos_ntot + n
val () = pos.pos_ncol := pos.pos_ncol + n
//
} (* end of [position_incby] *)

(* ****** ****** *)

assume
location_type =
'{
  fil= fil_t
, beg_ntot= int // beginning char position
, beg_nrow= int
, beg_ncol= int
, end_ntot= int // finishing char position
, end_nrow= int
, end_ncol= int
} (* end of [location_type] *)

(* ****** ****** *)

implement
location_dummy =
'{
  fil= filename_dummy
, beg_ntot= ~1, beg_nrow= ~1
, beg_ncol= ~1, end_ntot= ~1
, end_nrow= ~1, end_ncol= ~1
} (* end of [location_dummy] *)

(* ****** ****** *)

implement
fprint_location
  (out, loc) = let
//
val fil = loc.fil
val ((*void*)) = fprint_filename (out, fil)
//
in
  fprint_string (out, ": "); fprint_locrange (out, loc)
end (* end of [fprint_location] *)

(* ****** ****** *)

implement
fprint_locrange
  (out, loc) = () where {
//
val () = fprint_int (out, loc.beg_ntot+1)
val () = fprint_string (out, "(line=")
val () = fprint_int (out, loc.beg_nrow+1)
val () = fprint_string (out, ", offs=")
val () = fprint_int (out, loc.beg_ncol+1)
val () = fprint_string (out, ")")
//
val () = fprint_string (out, " -- ")
//
val () = fprint_int (out, loc.end_ntot+1)
val () = fprint_string (out, "(line=")
val () = fprint_int (out, loc.end_nrow+1)
val () = fprint_string (out, ", offs=")
val () = fprint_int (out, loc.end_ncol+1)
val () = fprint_string (out, ")")
//
} (* end of [fprint_locrange] *)

(* ****** ****** *)
  
implement
position_incby_char
  (pos, c) = let
//
val () = pos.pos_ntot := pos.pos_ntot+1
//
in
//
case+ c of
| '\n' =>
  {
    val () = pos.pos_ncol := 0
    val () = pos.pos_nrow := pos.pos_nrow+1
  }
| _ (*rest*) =>
  {
    val () = pos.pos_ncol := pos.pos_ncol+1
  }
//
end // end of [position_incby_char]
  
(* ****** ****** *)

implement
location_make_pos_pos
  (p1, p2) = let
//
val fil = the_filename_get ()
//
in
  location_make_fil_pos_pos (fil, p1, p2)
end // end of [location_make_pos_pos]

(* ****** ****** *)

implement
location_make_fil_pos_pos
  (fil, p1, p2) =
'{
  fil= fil
, beg_ntot= p1.pos_ntot
, beg_nrow= p1.pos_nrow
, beg_ncol= p1.pos_ncol
, end_ntot= p2.pos_ntot
, end_nrow= p2.pos_nrow
, end_ncol= p2.pos_ncol
} (* end of [location_make_fil_pos_pos] *)

(* ****** ****** *)

(* end of [atsparemit_posloc.dats] *)
