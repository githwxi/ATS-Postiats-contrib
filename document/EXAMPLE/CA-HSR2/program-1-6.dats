//
// Iterative function for sum
//
(* ****** ****** *)
//
// HX-2012-07:
//
// Note that 'iterative' is also referred
// to as 'tail-recursive' in the literature.
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

fun
Sum
{n:int} .<>.
(
  A: &array(float, n), n: int n
) : float = let
//
prval () =
lemma_array_param (A)
//
fun
loop
{n:int}
{i:nat | i <= n} .<n-i>.
(
  A: &array(float, n), n: int n, i: int i, res: float
) :<> float = let
in
  if i < n then loop(A, n, i+1, res+A.[i]) else res
end // end of [loop]
//
in
  loop(A, n, 0, 0.0f)
end // end of [Sum]

(* ****** ****** *)
//
#define
HX_MYTESTING_targetloc
"\
$PATSHOME/contrib\
/atscntrb/atscntrb-hx-mytesting"
//
(* ****** ****** *)
//
staload RG =
"{$HX_MYTESTING}/SATS/randgen.sats"
staload _(*RG*) =
"{$HX_MYTESTING}/DATS/randgen.dats"
//
(* ****** ****** *)
//
%{^
//
// HX: excluded from c99
//
extern double drand48(/*void*/) ;
%}
//
staload "libats/libc/SATS/stdlib.sats"
//
(* ****** ****** *)

implement
main0((*void*)) =
{
//
#define N 1000
typedef T = float
//
val asz = g1int2uint(N)
//
implement
$RG.randgen_val<T>
  () =
(
  g0float2float(drand48())
)
//
  val A =
  $RG.randgen_arrayptr<T>(asz)
//
  val p0 = arrayptr2ptr(A)
prval pfarr = arrayptr_takeout(A)
//
  val sum = Sum (!p0, N)
prval () = arrayptr_addback(pfarr | A)
  val () = arrayptr_free(A)
  val () =
  (
    print "sum of the array = "; print sum; print_newline()
  ) // end of [val]
//
} // end of [main0]

(* ****** ****** *)

(* end of [program-1-6.dats] *)
