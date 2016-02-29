(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: February, 2016
//
(* ****** ****** *)
//
// Following a Promela-example in
// (Spin Model Checker Primer Reference)
//
(* ****** ****** *)

(*
proctype
Agent(chan listen; chan talk)
{
    do
    :: talk!hold(listen)
    :: talk!deny(listen) -> break
    :: talk!grant(listen) ->
        wait:
        listen?return0; break
    od;
    server!return0(listen)
}
*)

(* ****** ****** *)

abstype chnil
abstype chcons(x:vt@ype, xs:type)

(* ****** ****** *)

stadef :: = chcons

(* ****** ****** *)

abstype chanref(a:vtype)

(* ****** ****** *)
//
absvtype channel0
//
absvtype chanpos1(ss:vtype)
absvtype channeg1(ss:vtype)
//
(* ****** ****** *)
//
extern
fun
channel_split{ss:vtype}
  (chan: !channel0 >> chanpos1(ss)): channeg1(ss)
//
(* ****** ****** *)
//
extern
fun
channeg_nil_close (channeg1(chnil)): void
extern
fun
chanpos_nil_close (chanpos1(chnil)): channel0
//
(* ****** ****** *)

extern
fun
channel_recv
{x:vt@ype}{xs:type}
(
  chan: !chanpos1(x::xs) >> chanpos1(xs)
) : x // end of [channel_recv]

(* ****** ****** *)

extern
fun
channel_send
{x:vt@ype}{xs:type}
(
  chan: !channeg1(x::xs) >> channeg1(xs), x: (x)
) : void // end of [channel_send]

(* ****** ****** *)

datavtype
ss_client =
  | DENY of (chnil)
  | DENY of (channeg1(chnil), chnil)
  | HOLD of (channeg1(chnil), ss_client)
  | GRANT of (channeg1(ss_agent_grant), chnil)
//
and ss_agent_grant = RETURN1 of (chnil)
//
(* ****** ****** *)
//
datavtype
ClientOpt(ss:vtype) =
  | DENY(chnil) of ()
  | DENY(chnil) of channeg1(chnil)
  | HOLD(ss_client) of channeg1(chnil)
  | GRANT(chnil) of (channeg1(ss_agent_grant))
//
datatype
AgentGrantOpt(ss:vtype) = RETURN1(chnil) of ()
//
(* ****** ****** *)
//
extern
fun
chanref_recv
  {a:vtype}(chan: chanref(a)): (a)
extern
fun
chanref_send
  {a:vtype}(chan: chanref(a), x: (a)): void
//
(* ****** ****** *)
//
extern
fun
channeg_client{ss:vtype}
  (chan: !chanpos1(ss_client) >> chanpos1(ss), x: ClientOpt(ss)): void
extern
fun
chanpos_client
  (chan: !chanpos1(ss_client) >> chanpos1(ss)): #[ss:vtype] ClientOpt(ss)
//
(* ****** ****** *)
//
extern
fun
channeg_agent_grant{ss:vtype}
  (chan: !chanpos1(ss_agent_grant) >> chanpos1(ss), x: AgentGrantOpt(ss)): void
extern
fun
chanpos_agent_grant
  (chan: !chanpos1(ss_agent_grant) >> chanpos1(ss)): #[ss:vtype] AgentGrantOpt(ss)
//
(* ****** ****** *)

(* end of [ClientServer-2.dats] *)
