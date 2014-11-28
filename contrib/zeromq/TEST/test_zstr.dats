(*
**
** A simple ZMQ/CZMQ example
**
** Author: Hongwei Xi (hwxiATgmailDOTcom)
** Start time: November, 2014
**
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload UN = $UNSAFE
//
(* ****** ****** *)

staload "./../SATS/czmq.sats"

(* ****** ****** *)

implement
main0 () =
{
//
val inp =
zsock_new_pair (">inproc://test_zstr")
val ((*void*)) = assertloc (ptrcast(inp) > 0)
val out =
zsock_new_pair ("@inproc://test_zstr")
val ((*void*)) = assertloc (ptrcast(out) > 0)
//
val () =
loop(out, 0) where
{
//
fun
loop
(
  out: !zsock1, i: int
) : void = (
//
if
i < 10
then let
//
val () = 
$extfcall
(
  void, "zstr_sendf", ptrcast(out), "this is string %d", i
) (* end of [val] *)
//
in
  loop (out, i+1)
end // end of [then]
else () // end of [else]
//
) // end of [loop]
//
} (* end of [val] *)
//
val () =
$extfcall
(
  void, "zstr_sendx"
, ptrcast(out), "This", "is", "almost", "the", "very", "END", 0
) (* end of [val] *)
//
val ntot =
loop2(inp, 0) where
{
//
fun
loop2
(
  inp: !zsock1, i: int
) : int = let
  val str = zstr_recv (inp)
  val ((*void*)) = assertloc(ptrcast(str) > 0)
  val isEND = ($UN.castvwtp1{string}(str) = "END")
  val ((*freed*)) = zstr_free_val (str)
in
  if isEND then i else loop2 (inp, i+1)
end // end of [loop2]
//
} (* end of [val] *)
//
val () = assertloc (ntot = 15)
//
val ((*void*)) = zsock_destroy_val (inp)
val ((*void*)) = zsock_destroy_val (out)
//
val () = println! ("Congratulations: [test_zstr] has finished successfully!")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_zstr.dats] *)
