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

(* ****** ****** *)

fun
tokbuf_process
(
  buf: &tokbuf >> _
) : void = let
//
val tok = tokbuf_getinc_token (buf)
//
in
//
case+
tok.token_node
of (* case+ *)
| T_EOF () => ()
| _ (*non-EOF*) =>
  {
    val () =
    println! ("tok = ", tok)
    val () =  tokbuf_process (buf)
  } (* end of [_] *)
//
end // end of [tokbuf_process]

(* ****** ****** *)

implement
parse_from_tokbuf
  (buf) = let
//
val () = the_lexerrlst_clear ()
//
val ((*void*)) = tokbuf_process (buf)
//
val nerr = the_lexerrlst_print_free ((*void*))
//
in
  // nothing
end // end of [parse_from_tokbuf]

(* ****** ****** *)

implement
parse_from_fileref
  (inp) = let
//
var buf: tokbuf
val () =
  tokbuf_initize_fileref (buf, inp)
//
val () = parse_from_tokbuf (buf)
//
val () = tokbuf_uninitize (buf)
//
in
  // nothing
end // end of [parse_from_fileref]

(* ****** ****** *)

(* end of [atsparemit_parsing.dats] *)
