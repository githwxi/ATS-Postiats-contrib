(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: December, 2015
//
(* ****** ****** *)

(*
//
// the shared variables, booleans
bool turn, flag[2];
byte ncrit; // number of procs in critical section
//
*)

(* ****** ****** *)

(*
//
// two processes
//
active[2]
proctype user()
{
  assert(_pid == 0 || _pid == 1);
  again:
  flag[_pid] = 1; turn = _pid;
  (flag[1 - _pid] == 0 || turn == 1 - _pid);
//
  ncrit++;
  assert(ncrit == 1); // critical section
  ncrit--;
//
  flag[_pid] = 0; goto again
}
*)

(* ****** ****** *)

staload "./Promela.sats"

(* ****** ****** *)
//
extern
fun
proctype$user(): void
//
//
sortdef two = {a:nat | a < 2}
//
extern
fun
flag_get{i:two}(pid(i), int(1-i)): bool
and
flag_set{i:two}(pid(i), int( i ), bool): void
//
(* ****** ****** *)
//
extern
fun turn_get(): natLt(2)
extern
fun turn_set{i:two}(pid(i), int(1-i)): void
//
(* ****** ****** *)

implement
proctype$user() = let
//
val pid =
  Promela$mypid()
//
val i = pid2int(pid)
//
val ((*void*)) =
  Promela$assert((i=0)+(i=1))
//
fun
loop
(
// argless
) : void = loop() where
{
  val i0 = i
  val i1 = 1 - i
  val () = turn_set(pid, i1)
  val () = flag_set(pid, i0, true)
  val () = Promela$wait_until(lam() => (flag_get(pid, i1)=false)+(turn_get()=i0))
//
// This is a critial section
//
  val () = flag_set(pid, i0, false)
}
//
in
  loop()
end // end of [proctype$user]

(* ****** ****** *)

(* end of [Peterson.dats] *)
