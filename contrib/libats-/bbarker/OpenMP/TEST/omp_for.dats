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
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  const int N = 100;
  int i, a[N], a_sum, a_closed;
  int nthreads;

  #pragma omp parallel for
  for (i = 1; i <= N; i++) {
    a[i] = i*i;
    if ( i == 50 ) {
      nthreads = omp_get_num_threads();
      printf("There are %d threads in total\n", nthreads);
    } /* end of [if] */
  }

  a_sum = 0;
  for (i = 1; i <= N; i++) {
    a_sum = a_sum + a[i];
  }

  a_closed = N*(N+1)*(2*N+1)/6;
  printf("sum: %d and closed form: %d\n", a_sum, a_closed);
  return 0;
}
*)

(* ****** ****** *)

implement
main0 () =
{
//
val (N: size_t 100, a_sum, a_closed) = (g1i2u(100), 0, 0)
val (a_pfat, a_pfgc | a) = array_ptr_alloc<int> (N)
val () = array_initize_elt(!a, N, 0)

local
  var i: size_t
  var im1: int
  var im1u: size_t
  var tmp: int
  
in
//
//val () = pragma_omp_parallel_for ()
//
// Just try direct c code first:
//
%{
#pragma omp parallel for
%}
val () = for (i := g1i2u(1); i <= N; i := i + g1i2u(1)) 
let
  val itmp = g1ofg0_int(g0u2i(i) - 1)
  val () = assertloc(itmp >= 0)
  val itmp = g1i2u(itmp)
  val () = assertloc(itmp < N)
  val a_i = g1ofg0_int(g0u2i(i) * g0u2i(i)) 
  val () = a->[itmp] := a_i
  val a_i = (a->[itmp]):int 
  val () = println!( a_i )
in end // of let
//
end // of val ()

val () = array_ptr_free (a_pfat, a_pfgc | a)

} (* end of [main0] *)

(* ****** ****** *)

(* end of [omp_hello.dats] *)
