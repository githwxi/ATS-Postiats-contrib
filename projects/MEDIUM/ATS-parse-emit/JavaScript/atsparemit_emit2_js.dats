(* ****** ****** *)
//
// ATS-parse-emit-python
//
(* ****** ****** *)
//
// HX-2014-08-04: start
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_emit.sats"
//
(* ****** ****** *)
//
staload "./atsparemit_typedef.dats"
//
(* ****** ****** *)

implement
emit_f0decl
  (out, fdec) = let
in
//
emit_text (out, "emit_f0decl(...)\n")
//
end // end of [emit_f0decl]

(* ****** ****** *)

implement
emit_toplevel
  (out, d0cs) = let
//
fun
loop
(
  out: FILEref, d0cs: d0eclist
) : void =
(
//
case+ d0cs of
| list_nil () => ()
| list_cons
    (d0c, d0cs) => let
  in
    emit_d0ecl (out, d0c); loop (out, d0cs)
  end // end of [list_cons]
//
)
//
in
  loop (out, d0cs)
end // end of [emit_toplevel]

(* ****** ****** *)

(* end of [atsparemit_emit2_js.dats] *)
