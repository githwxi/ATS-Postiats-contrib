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
//
abstype
pid_type(i:int)
//
typedef
pid(i:int) = pid_type(i)
//
typedef pid = [i:nat] pid(i)
//
(* ****** ****** *)
//
extern
fun
pid2int{i:nat}(pid(i)): int(i)
//
(* ****** ****** *)
//
extern
fun
promela$self_get_pid(): pid
//
extern
fun
promela$assert{b:bool}(bool(b)): [b==true] void
//
(* ****** ****** *)
  
extern
fun
promela$wait_until(() -> bool): void
  
(* ****** ****** *)
//
extern
fun
proc$user(): void
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
proc$user() = let
//
val pid =
  promela$self_get_pid()
//
val i = pid2int(pid)
//
val ((*void*)) =
  promela$assert((i = 0) + (i = 1))
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
  val () = promela$wait_until(lam() => (flag_get(pid, i1)=false)+(turn_get()=i0))
//
// This is a critial section
//
  val () = flag_set(pid, i0, false)
}
//
in
  loop()
end // end of [proce$user]

(* ****** ****** *)

(* end of [Peterson.dats] *)
