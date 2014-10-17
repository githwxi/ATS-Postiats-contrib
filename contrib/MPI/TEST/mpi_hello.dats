(*
/******************************************************************************
 * FILE: mpi_hello.c
 * DESCRIPTION:
 *   MPI tutorial example code: Simple hello world program
 * AUTHOR: Blaise Barney
 * LAST REVISED: 03/05/10
 ******************************************************************************/
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "./../SATS/mpi.sats"
staload UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#define MASTER 0

(* ****** ****** *)

#define ATS_MAINATSFLAG 1

(* ****** ****** *)

extern
fun
main_fwork (): void = "mac#"

(* ****** ****** *)

implement
main_fwork () = let
/*
  int ntask, taskid, len;
  char hostname[MPI_MAX_PROCESSOR_NAME];
  MPI_Comm_size(MPI_COMM_WORLD, &ntask);
  MPI_Comm_rank(MPI_COMM_WORLD, &taskid);
  MPI_Get_processor_name(hostname, &len);
  printf ("Hello from task %d on %s!\n", taskid, hostname);
  if (taskid == MASTER)
    printf("MASTER: Number of MPI tasks is: %d\n",ntask);
*/
//
var len: int
var hostname =
  @[char][128]()
val p_hostname = addr@hostname
var ntask: int
var taskid: int
//
val _ = MPI_Comm_size(MPI_COMM_WORLD, ntask)
val _ = MPI_Comm_rank(MPI_COMM_WORLD, taskid)
val _ = MPI_Get_processor_name($UN.cast(p_hostname), len)
//
val () =
println!
(
  "Hello from task ", taskid, " on ", $UN.cast{string}(p_hostname)
) (* end of [val] *)
//
val () =
if (taskid = MASTER) then
(
  println! ("MASTER: Number of MPI tasks is: ", ntask)
) (* end of [if] *)
//
in
  // nothing
end // end of [main_fwork]

(* ****** ****** *)

%{$
//
int main
(
  int argc, char *argv[]
)
{
  MPI_Init(&argc, &argv); main_fwork (); MPI_Finalize();
}
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [mpi_hello.dats] *)
