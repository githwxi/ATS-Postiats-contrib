(* ****** ****** *)
//
// ATS-parse-emit-cil
//
(* ****** ****** *)
//
// AS-2014-08-22: start
//
(* ****** ****** *)

staload "./atsparemit.sats"
staload "./atsparemit_syntax.sats"

(* ****** ****** *)
//
fun label_reset () : void
//
fun make_label
  (loc: loc_t) : label
//
fun
label_for_instrlst
  (inss: instrlst) : label
//
(* ****** ****** *)
