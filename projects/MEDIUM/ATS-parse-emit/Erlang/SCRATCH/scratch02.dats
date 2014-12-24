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
dataview
send_v (a:t@ype) = SEND of ()
//
dataview
recv_v (a:t@ype) = RECV of ()
//
(* ****** ****** *)

stadef nil = unit_v
stadef :: (a:view, b:view) = (a, b)

(* ****** ****** *)

extern
fun{a:t@ype}
send{ps:view}
  (pf: !send_v(a) :: ps >> ps | x: a): void
extern
fun{a:t@ype}
recv{ps:view}
  (pf: !recv_v(a) :: ps >> ps | (*void*)): a

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
  (pf: client_v | (*void*)): void
//
implement
client
(
  pf | (*void*)
) =
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
