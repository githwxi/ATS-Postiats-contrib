(*
** HX-2014-06-15:
** trying out OpenMP
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"


(* ****** ****** *)

staload "./../SATS/omp.sats"

(* ****** ****** *)

(*
#if(0)

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
 
int main
(
  int argc, char *argv[]
) {
  int tid, nthreads;
  #pragma omp parallel private(tid)
  {
    tid = omp_get_thread_num();
    printf("Hello World from thread %d\n", tid);
    #pragma omp barrier
    if ( tid == 0 ) {
      nthreads = omp_get_num_threads();
      printf("There are %d threads in total\n", nthreads);
    } /* end of [if] */
  }
  return EXIT_SUCCESS;
} /* end of [main] */

#endif // end of [#if(0)]
*)

(* ****** ****** *)

implement
main0 () =
{
//
var tid: int?
//
val (pf | ()) =
pragma_omp_parallel_private_beg(tid)
//
val () = tid := omp_get_thread_num ()
val ((*void*)) =
  println! ("Hello from thread [", tid, "]!")
//
val (pf2 | ()) =
pragma_omp_barrier_beg ()
//
val ((*void*)) =
if (tid = 0) then let
  val nthreads = omp_get_num_threads ()
in
  println! ("There are [", nthreads, "] threads in total")
end // end of [then] // end of [val]
//
val ((*void*)) = 
pragma_omp_barrier_end (pf2 | (*void*))
//
val ((*void*)) =
pragma_omp_parallel_private_end (pf | (*void*))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [omp_hello.dats] *)
