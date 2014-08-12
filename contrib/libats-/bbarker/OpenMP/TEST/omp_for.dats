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

staload UN = "prelude/SATS/unsafe.sats"

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

%{^
#define N 100
int a[N]; 
int varTest = 8888;
%}

//#define N $extval(size_t, "N")
macdef N = $extval(size_t, "N")
#define N N 
macdef a = $extval(@[int?][N], "a")


val (a_sum, a_closed) = (0, 0)
//val (a_pfat, a_pfgc | a) = array_ptr_alloc<int> (N)
//val () = array_initize_elt(!a, N, 0)


macdef varTest = $extval(ptr, "&varTest")
val () = println!($UN.ptr0_get<int>(varTest))
val () = $UN.ptr0_set<int> (varTest, 5)
val () = println!($UN.ptr0_get<int>(varTest))
  
(* %{^ *)
(* #define OMP_FOR_TEST() \ *)
(* _Pragma(atscntrb_openmp_STRINGIFY(omp parallel for)) \ *)
(* for (int i = 1; i <= 75; i++) { \ *)
(*   printf("%d\n", i); \ *)
(* } // end of for  *)
(* %} *)
(* val () = $extfcall (void, "OMP_FOR_TEST")  *)

//val () = array_ptr_free (a_pfat, a_pfgc | a)

} (* end of [main0] *)

(* ****** ****** *)

(* end of [omp_hello.dats] *)
