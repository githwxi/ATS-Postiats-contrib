(*
** BB-2014-08-13:
** trying out OpenMP for loops
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
  printf("sum: %d = closed form: %d\n", a_sum, a_closed);
  return 0;
}
*)

(* ****** ****** *)

// Could use $UN.cast, but here is an example of a custom castfn:
extern
castfn
arrayref_of_ptr0 {a:vt0p} {n:nat} (ptr):<> arrayref(a, n)

//
// For demonstrating calling an ATS function in C/OpenMP for loop
// 
extern
fun
square_int (x: int): int = "ext#"
//
implement
square_int (x) = x * x


implement
main0 () =
{
typedef tenv = int
typedef T = int
//

#define N 100
%{^
#define N 100
int a[N]; 
%}

macdef ap = $extval(ptr, "a")
val a = arrayref_of_ptr0{T}{N}(ap)

var a_sum: int = 0
  
%{^
extern int square_int(int);

#define OMP_FOR_TEST() \
_Pragma(atscntrb_openmp_STRINGIFY(omp parallel for)) \
for (int i = 1; i <= N; i++) { \
  a[i-1] = square_int(i); \
} // end of for
%}
val () = $extfcall (void, "OMP_FOR_TEST")

local
//
implement
array_iforeach$fwork<T><tenv> (i, x, env) = env := env + x
//
in
//
val _ = arrayref_iforeach_env<T><tenv> (a, g1i2u(N), a_sum)
// 
end

val a_closed = N*(N+1)*(2*N+1)/6

val () = println!("sum: ", a_sum, " = closed form: ", a_closed)

} (* end of [main0] *)

(* ****** ****** *)

(* end of [omp_hello.dats] *)
