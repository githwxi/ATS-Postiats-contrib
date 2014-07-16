(* ****** ****** *)
//
// ATS-parsemit
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

(* ****** ****** *)

implement
parse_from_fileref
  (inp) = let
//
var buf: lexbuf
val () =
  lexbuf_initize_fileref (buf, inp)
//
val () = println! (lexbuf_get_token (buf))
val () = println! (lexbuf_get_token (buf))
//
val () = lexbuf_uninitize (buf)
//
in
  // nothing
end // end of [parse_from_fileref]

(* ****** ****** *)

(* end of [atsparemit_parsing.dats] *)
