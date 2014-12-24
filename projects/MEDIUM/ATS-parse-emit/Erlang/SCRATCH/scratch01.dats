(* ****** ****** *)

typedef str = string

(* ****** ****** *)

(*
client: send(string) -> send(int) -> recv(int)
server: recv(string) -> recv(int) -> send(int)
*)

(* ****** ****** *)

extern
fun{a:t@ype} send (x: a): void
extern
fun{a:t@ype} recv ((*void*)): a

(* ****** ****** *)

extern
fun client (): void
implement
client () =
{
  val () = send ("candy")
  val () = send (1357902468)
  val receipt = recv<int> ()
}

(* ****** ****** *)

extern
fun server (): void
implement
server () =
{
  val name = recv<str> ()
  val number = recv<int> ()
  val receipt = send<int> (12345)
}

(* ****** ****** *)

(* end of [test01.dats] *)
