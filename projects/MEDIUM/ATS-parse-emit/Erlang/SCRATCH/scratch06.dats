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
extern
fun{a:vt0p}
chpos_recv_val{ss:type}(ch: !chpos(recv(a) :: ss) >> chpos(ss)): a
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
//
extern
fun
chpos_chneg_connect{ss:type} (ch1: chpos(ss), ch2: chneg(ss)): void
//
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
extern
fun
service_join
  {ss1,ss2:type}
(
  service(ss1), service(ss2)
) : service(send(chneg(ss1)) :: send(chneg(ss2)) :: nil)
//
extern
fun
service_join_sill
  {ss1,ss2:type} (service(ss1), service(ss2)): service(send(chneg(ss1)) :: ss2)
//
(* ****** ****** *)

implement
service_join
  {ss1,ss2}(ss1, ss2) = let
//
typedef
ss12 = send(chneg(ss1)) :: send(chneg(ss2)) :: nil
//
fun
fserv
(
  ch: chpos(ss12)
) : void =
{
//
val ch1 = service_request (ss1)
val ch2 = service_request (ss2)
//
val ((*void*)) = chpos_send (ch, ch1)
val ((*void*)) = chpos_send (ch, ch2)
val ((*void*)) = chpos_recv_close (ch)
//
}
//
in
  service_create{ss12}(lam (ch) => fserv (ch))
end // end of [service_join]

(* ****** ****** *)

implement
service_join_sill
  {ss1,ss2}(ss1, ss2) = let
//
typedef ss12 = send(chneg(ss1)) :: ss2
//
fun
fserv
(
  ch: chpos(ss12)
) : void =
{
//
val ch1 = service_request (ss1)
val ch2 = service_request (ss2)
//
val () = chpos_send (ch, ch1)
val () = chpos_chneg_connect (ch, ch2)
//
}
//
in
  service_create{ss12}(lam (ch) => fserv (ch))
end // end of [service_join_sill]

(* ****** ****** *)
//
extern
fun
service_cond
  {ss1,ss2:type}
(
  f: chneg(ss1) -> service(ss2)
) : service(recv(chneg(ss1)) :: send(chneg(ss2)) :: nil)
//
extern
fun
service_cond_sill
  {ss1,ss2:type}
  (f: chneg(ss1) -> service(ss2)): service(recv(chneg(ss1)) :: ss2)
//
(* ****** ****** *)

implement
service_cond
  {ss1,ss2}(f) = let
//
typedef ss12 =
  recv(chneg(ss1)) :: send(chneg(ss2)) :: nil
//
fun
fserv
(
  ch: chpos(ss12)
) : void = let
  val ch1 = chpos_recv_val (ch)
  val ch2 = service_request (f (ch1))
  val ((*void*)) = chpos_send (ch, ch2)
  val ((*void*)) = chpos_recv_close (ch)
in
  // nothing
end // end of [fserv]
//
in
  service_create{ss12}(lam (ch) => fserv (ch))
end // end of [service_cond]

(* ****** ****** *)

implement
service_cond_sill
  {ss1,ss2}(f) = let
//
typedef ss12 = recv(chneg(ss1)) :: ss2
//
fun
fserv
(
  ch: chpos(ss12)
) : void = let
  val ch1 = chpos_recv_val (ch)
  val ch2 = service_request (f (ch1))
  val ((*void*)) = chpos_chneg_connect (ch, ch2)
in
  // nothing
end // end of [fserv]
//
in
  service_create{ss12}(lam (ch) => fserv (ch))
end // end of [service_cond]

(* ****** ****** *)

(* end of [scratch06.dats] *)
