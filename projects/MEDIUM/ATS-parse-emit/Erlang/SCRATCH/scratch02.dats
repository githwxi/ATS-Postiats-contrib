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
//
absview send_v (a:t@ype)
absview recv_v (a:t@ype)
//
(* ****** ****** *)

stadef nil = unit_v
stadef :: (a:view, b:view) = (a, b)

(* ****** ****** *)

extern
fun{a:t@ype}
send{vs:view}
  (pf: !send_v(a) :: vs >> vs | x: a): void
extern
fun{a:t@ype}
recv{vs:view}
  (pf: !recv_v(a) :: vs >> vs | (*void*)): a

(* ****** ****** *)
//
viewdef
client_v = send_v(str) :: send_v(int) :: recv_v(int) :: nil
viewdef
server_v = recv_v(str) :: recv_v(int) :: send_v(int) :: nil
//
(* ****** ****** *)
//
extern
fun
client
  (pf: client_v | (*void*)): int
//
implement
client
(
  pf | (*void*)
) = receipt where
{
  val () = send (pf | "candy")
  val () = send (pf | 1357902468)
  val receipt = recv (pf | (*void*))
  prval () = unit_v_elim (pf)
}
//
(* ****** ****** *)
//
extern
fun
server
  (pf: server_v | (*void*)) : void
//
implement
server
(
  pf | (*void*)
) =
{
  val name = recv (pf | (*void*))
  val number = recv (pf | (*void*))
  val ((*void*)) = send (pf | 12345)
  prval () = unit_v_elim (pf)
}
//
(* ****** ****** *)

(* end of [scratch02.dats] *)
