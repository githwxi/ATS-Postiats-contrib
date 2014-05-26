(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/mythread.sats"

(* ****** ****** *)

staload "./../SATS/mutexvar.sats"
staload _ = "./../DATS/mutexvar.dats"

(* ****** ****** *)

implement
main0 () =
{
//
val () = 
println! ("test_mutexvar: enter")
//
val MTXV =
  mutexvar_create_exn<int> ()
//
val TICK =
  mutexvar_initiate<int> (MTXV)
//
val () =
mythread_create_cloptr (llam () => mutexvar_ticket_put (TICK, 1000000))
//
val-1000000 =
  mutexvar_waitfor (MTXV)
//
val () = mutexvar_destroy (MTXV)
//
val () = println! ("test_mutexvar: leave")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_mutexvar.dats] *)
