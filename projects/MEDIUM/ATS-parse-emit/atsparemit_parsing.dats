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
lexbuf_process
(
  buf: &lexbuf
) : void = let
//
val tok = lexbuf_get_token (buf)
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
    val () =  lexbuf_process (buf)
  } (* end of [_] *)
//
end // end of [lexbuf_process]

(* ****** ****** *)

implement
parse_from_fileref
  (inp) = let
//
var buf: lexbuf
val () =
  lexbuf_initize_fileref (buf, inp)
//
val () = lexbuf_process (buf)
//
val () = lexbuf_uninitize (buf)
//
in
  // nothing
end // end of [parse_from_fileref]

(* ****** ****** *)

(* end of [atsparemit_parsing.dats] *)
