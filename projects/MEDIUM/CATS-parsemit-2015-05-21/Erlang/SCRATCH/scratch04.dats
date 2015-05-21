(* ****** ****** *)
//
// HX-2014-12-24:
// For the purpose of
// studying session types
//
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
extern
fun{a:t@ype}
send{vs:view}
  (pf: !send_v(a) :: vs >> vs | x: a): void
extern
fun{a:t@ype}
recv{vs:view}
  (pf: !recv_v(a) :: vs >> vs | (*void*)): a
//
(* ****** ****** *)
//
dataview
client_v =
| client_v_nil of ()
| client_v_cons of (recv_v(int) :: client_v)
//
dataview
server_v =
| server_v_nil of ()
| server_v_cons of (send_v(int) :: server_v)
datavtype
server_vt =
| server_vt_nil of ()
| server_vt_cons of (send_v(int) :: server_v | (*void*))
//
(* ****** ****** *)
//
extern
fun
server_v_choose (server_v | (*void*)): server_vt
//
(* ****** ****** *)
//
extern
fun
server
  (pf: server_v | int): void
//
implement
server (pf | n) = let
//
val tag = server_v_choose (pf | (*void*))
//
in
//
case+ tag of
| ~server_vt_nil () => ()
| ~server_vt_cons (pf | ) => let
    val () = send (pf | n) in server (pf | n+1)
  end // end of [server_vt_cons]
//
end // end of [server]

(* ****** ****** *)

(* end of [scratch04.dats] *)
