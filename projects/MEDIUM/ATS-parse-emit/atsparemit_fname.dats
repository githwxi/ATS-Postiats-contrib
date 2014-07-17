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
datatype
filename = FNAME of (string)
//
assume filename_type = filename
//
(* ****** ****** *)

implement
filename_dummy = FNAME ("")
implement
filename_stdin = FNAME ("__STDIN__")

(* ****** ****** *)

implement
fprint_filename
  (out, fil) = let
//
val+FNAME (fname) = fil
//
in
  fprint_string (out, fname)
end // end of [fprint_filename]

(* ****** ****** *)

(* end of [atsparemit_fname.dats] *)
