(* ****** ****** *)
//
// HX-2014-12-25:
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
fun chneg_recv_close (ch: chneg(nil)): void

(* ****** ****** *)

abstype service(type)

(* ****** ****** *)
//
extern
fun
service_create
  {ss:type}
(
  f: chpos(ss) -<cloref1> void
) : service(ss) // end-of-fun
//
extern
fun
service_request{ss:type}(service(ss)): chneg(ss)
//
(* ****** ****** *)
//
typedef ss1 =
  recv(int) :: send(int) :: nil
typedef ss2 =
  recv(int) :: recv(int) :: send(int) :: nil
//
extern val myservice1 : service (ss1)
extern val myservice2 : service (ss2)
//
(* ****** ****** *)

extern fun myservice1_use (int): int
extern fun myservice2_use (int, int): int

(* ****** ****** *)

implement
myservice1 = let
//
fun
fserv
(
  ch: chpos(ss1)
) : void = let
  var x: int
  val () = chpos_recv (ch, x)
  val () = chpos_send (ch, x * x)
  val () = chpos_recv_close (ch)
//
in
  // nothing
end // end of [fserv]
in
  service_create{ss1}(lam (ch) => fserv (ch))
end // end of [myservice1]

(* ****** ****** *)

implement
myservice2 = let
//
fun
fserv
(
  ch: chpos(ss2)
) : void = let
  var x1: int and x2: int
  val () = chpos_recv (ch, x1)
  val () = chpos_recv (ch, x2)
  val () = chpos_send (ch, x1 * x2)
  val () = chpos_recv_close (ch)
//
in
  // nothing
end // end of [fserv]
in
  service_create{ss2}(lam (ch) => fserv (ch))
end // end of [myservice2]

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
val () = chneg_recv_close (ch)
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
val () = chneg_recv_close (ch)
//
in
  res
end // end of [myservice2_use]

(* ****** ****** *)

(* end of [scratch05.dats] *)
