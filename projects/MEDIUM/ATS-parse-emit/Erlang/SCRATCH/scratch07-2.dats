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
//
(*
//
// HX-2014-12-26:
// this one can readily cause deadlock
//
extern
fun
chpos_chneg_split{ss:type} (): (chpos(ss), chneg(ss))
*)
//
// HX-2014-12-26:
// for creating anonymous service
//
extern
fun
chneg_create{ss:type}
  (f: chpos(ss) -<lincloptr1> void): chneg(ss)
//
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
//
extern
fun
create_ints (n: int): chneg(sslist(int))
//
extern
fun{a:t@ype}
filter_sslist
(
  ch: chneg(sslist(a)), pred: (a) -<cloref> bool
) : chneg(sslist(a))
//
(* ****** ****** *)

extern
val myservice_primes : service(sslist(int))

(* ****** ****** *)

implement
myservice_primes = let
//
fun
fserv
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
    val ch1 =
      chneg_sslist_cons (ch1)
    val p = chneg_send_val (ch1)
    val ch2 = filter_sslist<int> (ch1, lam (n) => n % p > 0)
    val ((*void*)) = chpos_send (ch, p)
  in
    fserv (ch, ch2)
  end // end of [chneg_sslist_cons]
//
end // end of [fserv]
//
in
  service_create{sslist(int)}(lam (ch) => fserv (ch, create_ints(2)))
end // end of [myservice_primes]

(* ****** ****** *)

implement
create_ints(n) = let
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
| ~chpos_sslist_cons (ch) =>
    (chpos_send (ch, n); fserv(n+1, ch))
//
end // end of [fserv]
//
in
  chneg_create (llam (ch) => fserv (n, ch))
end // end of [create_ints]

(* ****** ****** *)

implement
{a}(*tmp*)
filter_sslist
  (ch1, pred) = let
//
fun
fnext
(
  ch1: chneg(sslist(a)), next0: &a? >> _
) : chneg(sslist(a)) = let
  val ch1 =
    chneg_sslist_cons (ch1)
  val next = chneg_send_val (ch1)
in
  if pred(next)
    then (next0 := next; ch1) else fnext (ch1, next0)
  // end of [if]
end // end of [fnext]
//
fun
fserv
(
  ch: chpos(sslist(a)), ch1: chneg(sslist(a))
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
    var next0: a
    val ch1 = fnext (ch1, next0)
    val ((*void*)) = chpos_send (ch, next0)
  in
    fserv (ch, ch1)
  end // end of [chpos_sslist_cons]
//
end // end of [fserv]
//
in
  chneg_create (llam (ch) => fserv (ch, ch1))
end // end of [filter_sslist]

(* ****** ****** *)

(* end of [scratch07-2.dats] *)
