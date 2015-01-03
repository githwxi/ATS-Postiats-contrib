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
extern
fun{a:vt0p}
chneg_send_val{ss:type}(ch: !chneg(send(a) :: ss) >> chneg(ss)): a
//
(* ****** ****** *)

(*
extern
fun chpos_recv_close (ch: chpos(nil)): void
extern
fun chneg_recv_close (ch: chneg(nil)): void
*)

(* ****** ****** *)

abstype service(type)

(* ****** ****** *)
//
extern
fun
service_create{ss:type}
(
  f: chpos(ss) -<cloref1> void
) : service(ss) // end-of-fun
//
extern
fun service_request{ss:type}(service(ss)): chneg(ss)
//
(* ****** ****** *)
//
datatype
sslist (a:t@ype) =
| sslist_nil of (nil)
| sslist_cons of (send(a) :: sslist(a))
//
datavtype
chpos_sslist (a:t@ype) =
| chpos_sslist_nil of ()
| chpos_sslist_cons of (chpos(send(a) :: sslist(a)))
//
(* ****** ****** *)
//
extern
fun
chpos_sslist
  {a:t0p}(chpos(sslist(a))): chpos_sslist(a)
extern
fun
chneg_sslist_nil{a:t0p}(chneg(sslist(a))): void
extern
fun
chneg_sslist_cons
  {a:t0p}(chneg(sslist(a))): chneg(send(a) :: sslist(a))
//
(* ****** ****** *)

extern
val myservice_ints : service(sslist(int))
extern
val myservice_ints_filter : service(recv(chneg(sslist(int))) :: sslist(int))

(* ****** ****** *)

implement
myservice_ints = let
//
fun
fserv
(
  n: int, ch: chpos(sslist(int))
) : void = let
//
val opt = chpos_sslist(ch)
//
in
//
case+ opt of
| ~chpos_sslist_nil () => ()
| ~chpos_sslist_cons (ch) => let
    val () = chpos_send (ch, n) in fserv(n+1, ch)
  end // end of [chpos_sslist_cons]
//
end // end of [fserv]
//
in
  service_create{sslist(int)}(lam (ch) => fserv(0, ch))
end // end of [myservice_ints]

(* ****** ****** *)

implement
myservice_ints_filter = let
//
fun
aux_next
(
  p: int, ch1: chneg(sslist(int)), next0: &int? >> _
) : chneg(sslist(int)) = let
  val ch1 =
    chneg_sslist_cons (ch1)
  val next = chneg_send_val (ch1)
in
  if next % p > 0
    then (next0 := next; ch1) else aux_next (p, ch1, next0)
  // end of [if]
end // end of [aux_next]
//
fnx
fserv1
(
  ch1: chneg(sslist(int))
, ch2: chpos(sslist(int))
) : void = let
//
val opt = chpos_sslist (ch2)
//
in
//
case+ opt of
| ~chpos_sslist_nil
    () => chneg_sslist_nil (ch1)
| ~chpos_sslist_cons
    (ch2) => let
    val ch1 =
      chneg_sslist_cons (ch1)
    // end of [val]
    val first = chneg_send_val (ch1)
    val ((*void*)) = chpos_send (ch2, first)
  in
    fserv2 (first, ch1, ch2)
  end // end of [chpos_sslist_cons]
//
end // end of [fserv1]

and
fserv2
(
  p: int
, ch1: chneg(sslist(int))
, ch2: chpos(sslist(int))
) : void = let
//
val opt = chpos_sslist (ch2)
//
in
//
case opt of
| ~chpos_sslist_nil
    () => chneg_sslist_nil (ch1)
| ~chpos_sslist_cons
    (ch2) => let
    var next: int
    val ch1 = aux_next (p, ch1, next)
    val ((*void*)) = chpos_send (ch2, next)
  in
    fserv2 (p, ch1, ch2)
  end // end of [chpos_sslist_cons]
//
end // end of [fserv2]
//
in
  service_create{recv(chneg(sslist(int))) :: sslist(int)}(lam (ch) => fserv1 (chpos_recv_val(ch), ch))
end // end of [fserv]

(* ****** ****** *)

extern
val myservice_primes : service(sslist(int))

(* ****** ****** *)

implement
myservice_primes = let
//
fnx
fserv
(
  ch: chpos(sslist(int))
) : void = let
  val ch1 =
    service_request (myservice_ints)
  val ch1 =
    chneg_sslist_cons (ch1)
  val-(0) = chneg_send_val (ch1)
  val ch1 =
    chneg_sslist_cons (ch1)
  val-(1) = chneg_send_val (ch1)
in
  fserv2 (ch, ch1)
end // end of [fserv]
//
and
fserv2
(
  ch: chpos(sslist(int))
, ch1: chneg(sslist(int))
) : void = let
//
val opt = chpos_sslist (ch)
//
in
//
case+ opt of
| ~chpos_sslist_nil
    () => chneg_sslist_nil (ch1)
| ~chpos_sslist_cons
    (ch) => let
    val ch2 =
      service_request (myservice_ints_filter)
    // end of [val]
    val () = chneg_recv (ch2, ch1)
    val ch2 = chneg_sslist_cons (ch2)
    val first = chneg_send_val (ch2)
    val () = chpos_send (ch, first)
  in
    fserv2 (ch, ch2)
  end // end of [chpos_sslist_cons]
//
end // end of [fserv2]
//
in
  service_create{sslist(int)}(lam (ch) => fserv (ch))
end // end of [myservice_primes]

(* ****** ****** *)

(* end of [scratch07.dats] *)
