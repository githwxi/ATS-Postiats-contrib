(* ****** ****** *)
//
// Author: Hongwei Xi
//
// A stream of keyboard inputs
// that may be terminated due to a
// chosen number of seconds of inactivity.
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "libats/libc/SATS/unistd.sats"

(* ****** ****** *)

fun
kbstream
(
  inp: FILEref
, nwait: intGte(0)
) : stream_vt(char) =
(
if fileref_is_eof(inp)
  then stream_vt_make_nil() else kbstream_main(inp, nwait)
) (* end of [kbstream] *)

and
kbstream_main
(
  inp: FILEref
, nwait: intGte(0)
) : stream_vt(char) = $ldelay
(
let
//
var
nlen: int
val
nbyte = i2sz(1024)
//
val
(pf | _) =
alarm_set(g1i2u(nwait))
//
val
[l:addr,n:int] line = $extfcall
(
  Strnptr0
, "atspre_fileref_get_line_string_main2", nbyte, inp, addr@(nlen)
)
//
val
nlen = $UN.cast{int(n)}(nlen)
//
val
isnot = strnptr_isnot_null(line)
//
val cinp =
  (if nlen > 0 then line[0] else '_'): char
//
val ((*freed*)) = strnptr_free(line)
//
val leftover = alarm_cancel(pf | (*void*))
//
in
//  
if
isnot
then
(
  stream_vt_cons(cinp, kbstream(inp, nwait))
) (* end of [then] *)
else
(
  stream_vt_nil((*void*))
) (* end of [else] *)
//
end
) (* end of [kbstream_main] *)

(* ****** ****** *)

(* end of [kbstream.dats] *)
