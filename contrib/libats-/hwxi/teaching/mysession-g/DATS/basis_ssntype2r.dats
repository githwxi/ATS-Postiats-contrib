(*
** channels
** for 2-role sessions
*)

(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
staload
"./../SATS/basis_intset.sats"
//
staload
"./../SATS/basis_ssntype.sats"
staload
"./../SATS/basis_ssntype2r.sats"
//
(* ****** ****** *)
//
extern
praxi
lemma_iset_sing_is_member
  {x:int}
  ((*void*)): [ismbr(iset(x), x)] void
extern
praxi
lemma_iset_sing_isnot_member
  {x,y:int | x != y}
  ((*void*)): [~ismbr(iset(x), y)] void
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
chan1pos_send
  (chan, x0) = let
//
prval() =
lemma_iset_sing_is_member{0}()
prval() =
lemma_iset_sing_isnot_member{0,1}()
//
in
  channel1_send(chan, 0, 1, x0)
end // end of [chan1pos_send]
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
chan1pos_recv
  (chan, x0) = let
//
prval() =
lemma_iset_sing_is_member{0}()
prval() =
lemma_iset_sing_isnot_member{0,1}()
//
in
  channel1_recv(chan, 1, 0, x0)
end // end of [chan1pos_recv]
//
implement
{a}(*tmp*)
chan1pos_recv_val
  (chan) = x0 where
{
//
var x0: a // uninitize
val () = chan1pos_recv<a>(chan, x0)
//
} (* end of [chan1pos_recv_val] *)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
chan1neg_recv
  (chan, x0) = let
//
prval() =
lemma_iset_sing_is_member{1}()
prval() =
lemma_iset_sing_isnot_member{1,0}()
//
in
  channel1_send(chan, 1, 0, x0)
end // end of [chan1neg_recv]
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
chan1neg_send
  (chan, x0) = let
//
prval() =
lemma_iset_sing_is_member{1}()
prval() =
lemma_iset_sing_isnot_member{1,0}()
//
in
  channel1_recv(chan, 0, 1, x0)
end // end of [chan1neg_send]
//
implement
{a}(*tmp*)
chan1neg_send_val
  (chan) = x0 where
{
//
var x0: a // uninitize
val () = chan1neg_send<a>(chan, x0)
//
} (* end of [chan1neg_send_val] *)
//
(* ****** ****** *)

(*
fun{}
chan1neg_create_exn
  {ssn:type}(fserv: chan1pos(ssn) -<lincloptr1> void): chan1neg(ssn)
*)
implement
{}(*tmp*)
chan1neg_create_exn
  (fserv) = let
//
val G  = intset_int{2}(0)
//
in
  $UN.castvwtp0(cchannel1_create_exn(2, G, $UN.castvwtp0(fserv)))
end // end of [chan1neg_create_exn]

(* ****** ****** *)

(* end of [basis_ssntype2r.dats] *)
