(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./../SATS/mythread.sats"

(* ****** ****** *)

staload "./../SATS/nwaiter.sats"
staload _ = "./../DATS/nwaiter.dats"

(* ****** ****** *)

implement
main0 () =
{
//
val () = 
println! ("test_nwaiter: enter")
//
val NW = nwaiter_create_exn ()
val NWT1 = nwaiter_initiate (NW)
val NWT2 = nwaiter_ticket_split (NWT1)
//
val () =
mythread_create_cloptr (llam () => nwaiter_ticket_put (NWT1))
val () =
mythread_create_cloptr (llam () => nwaiter_ticket_put (NWT2))
//
val () = nwaiter_waitfor (NW)
//
prval ((*leaked*)) = $UNSAFE.castview0 (NW)
//
val () = 
println! ("test_nwaiter: leave")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_nwaiter.dats] *)
