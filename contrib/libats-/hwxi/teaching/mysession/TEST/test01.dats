(*
** Testing session types
*)

(* ****** ****** *)

%{^
//
#include <pthread.h>
//
%} // end of [%{^]

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./../SATS/basis.sats"
//
(* ****** ****** *)

staload
_ = "libats/DATS/deqarray.dats"

(* ****** ****** *)
//
staload
_ = "libats/DATS/athread.dats"
staload
_ = "libats/DATS/athread_posix.dats"
//
(* ****** ****** *)
//
staload _ = "./../DATS/basis_uchan.dats"
staload _ = "./../DATS/basis_chan0.dats"
//
staload _ = "./../DATS/basis_ssntyp.dats"
//
(* ****** ****** *)

implement
main0
(
  argc, argv
) = let
//
val chn =
channeg_create_exn
(
llam(chp) => let
//
val a0 =
  chanpos_recv_val<int> (chp)
val a1 =
  chanpos_recv_val<int> (chp)
val () = chanpos_send<int> (chp, a0+a1)
//
in chanpos_nil_wait(chp) end
) (* end of [val] *)
//
val a0 = 101
val a1 = 1010
val () = channeg_recv<int> (chn, a0)
val () = channeg_recv<int> (chn, a1)
val sum = channeg_send_val<int> (chn)
//
val () = println! (a0, "+", a1, " = ", sum)
//
in
  channeg_nil_close(chn)
end // end of [main0]

(* ****** ****** *)

(* end of [test01.dats] *)
