(* ****** ****** *)
//
// ATS-parsemit
//
(* ****** ****** *)
//
// HX-2014-07-02: start
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)

vtypedef
lexbuf_struct =
@{
//
lexbuf_ntot= int
lexbuf_nrow= int
lexbuf_ncol= int
//
lexbuf_cstream= cstream
lexbuf_strigbuf= stringbuf
//
} // end of [lexbuf_struct]

(* ****** ****** *)

(* end of [atsparemit_lexbuf.dats] *)
