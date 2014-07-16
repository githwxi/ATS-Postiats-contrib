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
//
staload
SBF = "libats/SATS/stringbuf.sats"
stadef
stringbuf = $SBF.stringbuf
//
staload _ = "libats/DATS/stringbuf.dats"
//
(* ****** ****** *)
//
staload
CS = "{$LIBATSHWXI}/cstream/SATS/cstream.sats"
stadef cstream = $CS.cstream
//
staload _ = "{$LIBATSHWXI}/cstream/DATS/cstream.dats"
//
(* ****** ****** *)

vtypedef
lexbuf_struct =
@{
//
lexbuf_ntot= int
,
lexbuf_nrow= int
,
lexbuf_ncol= int
,
//
lexbuf_nspace= int
//
,
//
lexbuf_cstream= cstream
//
,
lexbuf_nback= int
,
lexbuf_stringbuf= stringbuf
//
} // end of [lexbuf]

(* ****** ****** *)

assume lexbuf_vt0ype = lexbuf_struct

(* ****** ****** *)

implement
lexbuf_get_position
  (buf, pos) = () where
{
  val () = pos.pos_ntot := buf.lexbuf_ntot
  val () = pos.pos_nrow := buf.lexbuf_nrow
  val () = pos.pos_ncol := buf.lexbuf_ncol
}

implement
lexbuf_set_position
  (buf, pos) = () where
{
  val () = buf.lexbuf_ntot := pos.pos_ntot
  val () = buf.lexbuf_nrow := pos.pos_nrow
  val () = buf.lexbuf_ncol := pos.pos_ncol
}

(* ****** ****** *)
//
implement
lexbuf_get_nspace (buf) = buf.lexbuf_nspace
implement
lexbuf_set_nspace (buf, n) = buf.lexbuf_nspace := n
//
(* ****** ****** *)

implement
lexbuf_get_char
  (buf) = let
//
val nb = g1ofg0 (buf.lexbuf_nback)
//
in
//
if nb <= 0
then let
  val i = $CS.cstream_get_char (buf.lexbuf_cstream)
  val () =
  if i > 0 then
  {
    val c = int2char0(i)
    val c = $UN.cast{charNZ}(c)
    val _(*1*) = $SBF.stringbuf_insert_char (buf.lexbuf_stringbuf, c)
  } (* end of [val] *)
in
  i(*inserted*)
end // end of [then]
else let
  val nb1 = pred (nb)
  val () = buf.lexbuf_nback := nb1
in
  $SBF.stringbuf_get_at (buf.lexbuf_stringbuf, i2sz(nb1))
end // end of [else]
//
end (* end of [lexbuf_get_char] *)

(* ****** ****** *)

implement
lexbuf_clear
  (buf) = () where
{
//
val () = $CS.cstream_free (buf.lexbuf_cstream)
val () = $SBF.stringbuf_free (buf.lexbuf_stringbuf)
//
} (* end of [lexbuf_clear] *)

(* ****** ****** *)

implement
lexbufpos_get_location
  (buf, pos2) = let
  var pos1: position
  val ((*void*)) = lexbuf_get_position (buf, pos1)
in
  location_make_pos_pos (pos1, pos2)
end // end of [lexbufpos_get_location]

(* ****** ****** *)

(* end of [atsparemit_lexbuf.dats] *)
