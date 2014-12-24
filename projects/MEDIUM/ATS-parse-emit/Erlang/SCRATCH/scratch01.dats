(* ****** ****** *)
//
// HX-2014-12-23:
// For the purpose of
// studying session types
//
(* ****** ****** *)

(*
client: send(string) -> send(int) -> recv(int)
server: recv(string) -> recv(int) -> send(int)
*)

(* ****** ****** *)

typedef str = string

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

(* end of [scratch01.dats] *)
