(* ****** ****** *)
//
// HX-2014-12-23:
// For the purpose of
// studying session types
//
(* ****** ****** *)
//
abstype send (a:vt@ype)
abstype recv (a:vt@ype)
//
(* ****** ****** *)

abstype
chseq (a:type, b:type)

(* ****** ****** *)

stadef nil = unit
stadef :: (a:type, b:type) = chseq (a, b)

(* ****** ****** *)
//
absvtype chpos(type)
absvtype chneg(type)
//
(* ****** ****** *)
//
extern
fun{a:vt0p}
chpos_send{ss:type}
  (ch: !chpos(send(a) :: ss) >> chpos(ss), x: a): void
extern
fun{a:vt0p}
chpos_recv{ss:type}
  (ch: !chpos(recv(a) :: ss) >> chpos(ss), x: &a? >> _): void
//
(* ****** ****** *)
//
extern
fun{a:vt0p}
chneg_recv{ss:type}
  (ch: !chneg(recv(a) :: ss) >> chneg(ss), x: a): void
extern
fun{a:vt0p}
chneg_send{ss:type}
  (ch: !chneg(send(a) :: ss) >> chneg(ss), x: &a? >> _): void
//
(* ****** ****** *)

extern
fun chpos_recv_close (ch: chpos(nil)): void
extern
fun chneg_send_close (ch: chneg(nil)): void

(* ****** ****** *)

abstype service(type)

(* ****** ****** *)
//
extern
fun
service_create
  {ss:type}(f: chpos(ss) -> void): service(ss)
//
extern
fun
service_request{ss:type}(service(ss)): chneg(ss)
//
(* ****** ****** *)

extern
val myservice1 : service (recv(int) :: send(int) :: nil)
extern
val myservice2 : service (recv(int) :: recv(int) :: send(int) :: nil)

(* ****** ****** *)

extern fun myservice1_use (int): int
extern fun myservice2_use (int, int): int

(* ****** ****** *)

implement
myservice1_use(x) = let
//
val ch =
  service_request (myservice1)
//
val () = chneg_recv (ch, x)
var res: int
val () = chneg_send (ch, res)
val () = chneg_send_close (ch)
//
in
  res
end // end of [myservice1_use]

(* ****** ****** *)

implement
myservice2_use
  (x1, x2) = let
//
val ch =
  service_request (myservice2)
//
val () = chneg_recv (ch, x1)
val () = chneg_recv (ch, x2)
var res: int
val () = chneg_send (ch, res)
val () = chneg_send_close (ch)
//
in
  res
end // end of [myservice2_use]

(* ****** ****** *)

(* end of [scratch05.dats] *)
