(*
** trying out MPI
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

staload "./../SATS/mpi.sats"

(* ****** ****** *)

#define MASTER 0

(* ****** ****** *)

implement
main0 (argc, argv) = 
{
//
var taskid: int?
var ntask: int?
var len: int?
//
val (
  pfat, pfgc | hostname
) = malloc_gc (g1ofg0(MPI_MAX_PROCESSOR_NAME))
  
val _ = MPI_Init(argc, argv)
  
val _ = MPI_Comm_size(MPI_COMM_WORLD, ntask)  
val _ = MPI_Comm_rank(MPI_COMM_WORLD, taskid)  
  
val _ = MPI_Get_processor_name(hostname, len)

val _ = println!("Hello from task ", taskid, " on ___!") 

val _ = if (taskid = MASTER) then  
  println!("MASTER: Number of MPI tasks is: ", ntask)
   
val () = mfree_gc (pfat, pfgc | hostname)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mpi_hello.dats] *)
