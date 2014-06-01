(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libats/SATS/athread.sats"

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
val tid1 =
athread_create_cloptr_exn (llam () => nwaiter_ticket_put (NWT1))
val tid2 =
athread_create_cloptr_exn (llam () => nwaiter_ticket_put (NWT2))
//
val () = nwaiter_waitfor (NW)
//
val () = nwaiter_destroy (NW)
//
val () = 
println! ("test_nwaiter: leave")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_nwaiter.dats] *)
