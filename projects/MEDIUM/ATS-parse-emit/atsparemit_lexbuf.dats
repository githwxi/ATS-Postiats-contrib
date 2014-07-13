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
//
(* ****** ****** *)

staload "./atsparemit.sats"

(* ****** ****** *)
//
staload
SBF = "libats/SATS/stringbuf.sats"
stadef
stringbuf = $SBF.stringbuf
//
(* ****** ****** *)

staload
CS = "{$LIBATSHWXI}/cstream/SATS/cstream.sats"
stadef cstream = $CS.cstream

(* ****** ****** *)

vtypedef
lexbuf = @{
//
lexbuf_ntot= int
,
lexbuf_nrow= int
,
lexbuf_ncol= int
,
//
lexbuf_cstream= cstream
,
lexbuf_stringbuf= stringbuf
//
} // end of [lexbuf]

(* ****** ****** *)
//
extern
fun
lexbuf_get_char
  (buf: &lexbuf, pos: &position): int
//
extern
fun
lexbuf_add_char (buf: &lexbuf, c: charNZ): void
//
(* ****** ****** *)

implement
lexbuf_get_char
  (buf, pos) = i where
{
//
val i =
$CS.cstream_get_char (buf.lexbuf_cstream)
val c = int2char0(i)
//
val () = buf.lexbuf_ntot := buf.lexbuf_ntot + 1
val () = (
case+ 0 of
| _ when c = '\n' =>
  {
    val () = buf.lexbuf_ncol := 0
    val () = buf.lexbuf_nrow := buf.lexbuf_nrow + 1
  }
| _ when i >= 0 =>
  {
    val () = buf.lexbuf_ncol := buf.lexbuf_ncol + 1
  }
| _ (* end-of-file *) => ()
) : void // end of [val]
//
} (* end of [lexbuf_get_char] *)

(* ****** ****** *)

implement
lexbuf_add_char
  (buf, c) = () where
{
//
val _(*1*) =
$SBF.stringbuf_insert_char (buf.lexbuf_stringbuf, c)
//
} (* end of [lexbuf_add_char] *)

(* ****** ****** *)

(* end of [atsparemit_lexbuf.dats] *)
