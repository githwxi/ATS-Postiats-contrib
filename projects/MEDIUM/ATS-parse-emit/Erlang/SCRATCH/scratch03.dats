(* ****** ****** *)
//
// HX-2014-12-23:
// For the purpose of
// studying session types
//
(* ****** ****** *)

(*
client1: send(int) -> recv(int)
client2: send(int) -> send(int) -> recv(int)
*)

(* ****** ****** *)

(*
server1: recv(int) -> send(int)
server2: recv(int) -> recv(int) -> send(int)
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
//
viewdef // for accessing a unary service
client1_v = send_v(int) :: recv_v(int) :: nil
viewdef // for accessing a binary service
client2_v = send_v(int) :: send_v(int) :: recv_v(int) :: nil
//
(* ****** ****** *)

viewdef // for providing a unary service
server1_v = recv_v(int) :: send_v(int) :: nil
viewdef // for providing a binary service
server2_v = recv_v(int) :: recv_v(int) :: send_v(int) :: nil

(* ****** ****** *)

absview adisj_v (v1:view, v2: view)

(* ****** ****** *)

extern
fun client1 (pf: client1_v | (*void*)): void
extern
fun client2 (pf: client2_v | (*void*)): void

(* ****** ****** *)
//
absview
aconj (v1:view, v2:view)
datavtype
adisj_vt (v1:view, v2:view) =
  | adisj_vt_left (v1, v2) of (v1 | (*void*))
  | adisj_vt_right (v1, v2) of (v2 | (*void*))
//
(* ****** ****** *)
//
extern
fun inject_l{v1,v2:view}
(
  pf: !adisj_v (v1, v2) >> v1 | (*void*)
) : adisj_vt (v1, v2) // end of [inject_l]
extern
fun inject_r{v1,v2:view}
(
  pf: !adisj_v (v1, v2) >> v2 | (*void*)
) : adisj_vt (v1, v2) // end of [inject_r]
//
extern
fun choose_conj{v1,v2:view}
  (pf: aconj (v1, v2) | (*void*)): adisj_vt (v1, v2)
//
(* ****** ****** *)

extern
fun server1 (pf: server1_v | (*void*)): void
extern
fun server2 (pf: server2_v | (*void*)): void
extern // [server] combines [server1] and [server2]
fun server (pf: aconj (server1_v, server2_v) | (*void*)): void

(* ****** ****** *)

implement
server(pf | (*void*)) = let
  val tag = choose_conj (pf | (*void*))
in
  case+ tag of
  | ~adisj_vt_left (pf1 | ) => server1 (pf1 | (*void*))
  | ~adisj_vt_right (pf2 | ) => server2 (pf2 | (*void*))
end // end of [server]

(* ****** ****** *)

(* end of [scratch03.dats] *)
