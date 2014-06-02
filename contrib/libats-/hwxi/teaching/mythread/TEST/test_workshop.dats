(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)
  
staload "libc/SATS/unistd.sats"
  
(* ****** ****** *)

staload "libats/SATS/athread.sats"

(* ****** ****** *)

staload "./../SATS/nwaiter.sats"
staload "./../SATS/workshop.sats"

(* ****** ****** *)
  
staload _ = "libats/DATS/deqarray.dats"
  
(* ****** ****** *)

staload _ = "./../DATS/nwaiter.dats"
staload _ = "./../DATS/channel.dats"
staload _ = "./../DATS/workshop.dats"

(* ****** ****** *)

absvtype fworker = ptr
vtypedef fworker_def = () -<lincloptr1> void

(* ****** ****** *)
//  
implement
workshop_handle_job<fworker>
  (ws, x) = let
  val () = $UN.castvwtp0{fworker_def}(x)() in (0)
end (* end of [workshop_handle_job<fworker>] *)
//
(* ****** ****** *)
//
fun do_work
(
  NWT: nwaiter_ticket
) : void = let
  val _ = sleep(1u) in nwaiter_ticket_put (NWT)
end // end of [do_work]
//
(* ****** ****** *)

implement
main0 () =
{
//
val ws0 =
workshop_create_cap<fworker> (i2sz(2))
//
val err = workshop_add_worker<fworker> (ws0)
val err = workshop_add_worker<fworker> (ws0)
val err = workshop_add_worker<fworker> (ws0)
val err = workshop_add_worker<fworker> (ws0)
//
val nworker = workshop_get_nworker (ws0)
val ((*void*)) = println! ("nworker = ", nworker)
//
val NW = nwaiter_create_exn ()
val NWT1 = nwaiter_initiate (NW)
val NWT2 = nwaiter_ticket_split (NWT1)
val NWT3 = nwaiter_ticket_split (NWT1)
val NWT4 = nwaiter_ticket_split (NWT1)
//
val () =
workshop_insert_job<fworker>
  (ws0, $UN.castvwtp0{fworker}(llam () =<cloptr1> do_work (NWT1)))
val () =
workshop_insert_job<fworker>
  (ws0, $UN.castvwtp0{fworker}(llam () =<cloptr1> do_work (NWT2)))
val () =
workshop_insert_job<fworker>
  (ws0, $UN.castvwtp0{fworker}(llam () =<cloptr1> do_work (NWT3)))
val () =
workshop_insert_job<fworker>
  (ws0, $UN.castvwtp0{fworker}(llam () =<cloptr1> do_work (NWT4)))
//
val () = nwaiter_waitfor (NW)
//
val () = nwaiter_destroy (NW)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_workshop.dats] *)
