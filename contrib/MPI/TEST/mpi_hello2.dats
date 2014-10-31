(*
// HX-2014-10-17:
// it is taken from
// Pacheco's book on PPwMPI
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

#define BUFSZ 128
typedef msg_t = arrayref(char, BUFSZ)

(* ****** ****** *)

extern
fun
fprocess_0 (ntask: int, p_msg: ptr): void
implement
fprocess_0
(
  ntask, p_msg
) = let
//
fun
loop
(
  src: intGte(1)
) : void = let
//
var status: MPI_Status?
//
in
//
if
src < ntask
then let
  val _ = MPI_Recv($UN.cast{msg_t}(p_msg), BUFSZ, MPI_CHAR, src, 0(*tag*), MPI_COMM_WORLD, status)
  val () = println! ($UN.cast{string}(p_msg))
in
  loop (src + 1)
end // end off [then]
else () // end of [else]
//
end // end of [loop]
//
(*
val () = println! ("fprocess_0: ntask = ", ntask)
*)
//
in
  loop (1)
end // end of [fprocess_0]

(* ****** ****** *)

implement
main_fwork () = let
//
var msg =
  @[char][BUFSZ]()
val p_msg = addr@msg
var ntask: int
var taskid: int
//
val _ = MPI_Comm_size(MPI_COMM_WORLD, ntask)
val _ = MPI_Comm_rank(MPI_COMM_WORLD, taskid)
//
in
//
if
(taskid = 0)
then fprocess_0 (ntask, p_msg)
else let
  val _ = $extfcall (int, "sprintf", p_msg, "Greetings from process %i!", taskid)
  val n = length($UN.cast{String}(p_msg))
  val n = sz2i(n)
  val n1 = succ(n)
  val () = assertloc (BUFSZ >= n1)
  val _ = MPI_Send($UN.cast{msg_t}(p_msg), n1, MPI_CHAR, 0(*dest*), 0(*tag*), MPI_COMM_WORLD)
in
  // nothing
end // end of [else]
//
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
