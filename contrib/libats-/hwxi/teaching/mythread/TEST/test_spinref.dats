(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "libc/SATS/unistd.sats"

(* ****** ****** *)

staload "./../SATS/mythread.sats"

(* ****** ****** *)
//
staload "./../SATS/spinref.sats"
//
staload _ = "./../DATS/spinvar.dats"
staload _ = "./../DATS/spinref.dats"
//
(* ****** ****** *)

fun
spinref_incby
  (spnr: spinref(int)): void = let
//
implement(env)
spinref_process$fwork<int><env> (x, env) = x := x + 1
//
in
  spinref_process<int> (spnr)
end // end of [spinref_incby]

(* ****** ****** *)

implement
main0 () =
{
//
val () = 
println! ("test_spinref: enter")
//
val SPNR = spinref_create_exn<int> (0)
//
val () =
mythread_create_cloptr
(
llam () =>
  (fix loop(x: spinref(int)): void => (ignoret(sleep(1u)); spinref_incby(x); loop(x)))(SPNR)
)
val () = println! ("The first thread has been created.")
//
val () =
mythread_create_cloptr
(
llam () =>
  (fix loop(x: spinref(int)): void => (ignoret(sleep(1u)); spinref_incby(x); loop(x)))(SPNR)
)
val () = println! ("The second thread has been created.")
//
val () =
( fix loop
  (
    spnr: spinref(int)
  ) : void =>
{
  val n = spinref_get (spnr)
  val () = if n < 2 then (ignoret(sleep(1u)); loop (spnr))
} ) (SPNR) // end of [val]
//
val () = 
println! ("test_spinref: leave")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_spinref.dats] *)
