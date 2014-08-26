(* ****** ****** *)
//
// ATS-parse-emit
//
(* ****** ****** *)
//
// AS-2014-08-17: start
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_parsing.sats"
staload "./atsparemit_emit.sats"

(* ****** ****** *)
//
dynload "./atsparemit.sats"
dynload "./atsparemit_syntax.sats"
dynload "./atsparemit_parsing.sats"
dynload "./atsparemit_emit.sats"
//
(* ****** ****** *)
//
dynload "./atsparemit_mylib.dats"
//
(* ****** ****** *)
//
dynload "./atsparemit_error.dats"
//
dynload "./atsparemit_print.dats"
//
dynload "./atsparemit_symbol.dats"
//
dynload "./atsparemit_fname.dats"
dynload "./atsparemit_posloc.dats"
//
dynload "./atsparemit_global.dats"
//
dynload "./atsparemit_syntax.dats"
//
dynload "./atsparemit_lexerr.dats"
dynload "./atsparemit_lexbuf.dats"
dynload "./atsparemit_lexing.dats"
//
dynload "./atsparemit_tokbuf.dats"
//
dynload "./atsparemit_parerr.dats"
dynload "./atsparemit_parsing.dats"
dynload "./atsparemit_parsing_d0exp.dats"
dynload "./atsparemit_parsing_d0ecl.dats"
dynload "./atsparemit_parsing_instr.dats"
//
(* ****** ****** *)

dynload "./atsparemit_typedef.dats"

(* ****** ****** *)

dynload "./atsparemit_syntax_cil.dats"

(* ****** ****** *)

dynload "./atsparemit_emit_cil.dats"

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val () =
println!
(
  "Hello from ATS-parse-emit-cil!"
) (* end of [val] *)
//
val d0cs = parse_from_fileref (stdin_ref)
(*
val ((*void*)) = fprint! (stdout_ref, "d0cs =\n", d0cs)
*)
//
val () = emit_toplevel (stdout_ref, d0cs)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [atsparemit_main_cil.dats] *)
