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

absvtype chanptr(a:vtype)

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
channel0_create
  (cap: intGte(0)): channel0
//
extern
fun channel0_destroy(channel0): void
//
(* ****** ****** *)
//
extern
fun
channel0_split{ss:vtype}
  (chan: !channel0 >> chanpos1(ss)): channeg1(ss)
//
(* ****** ****** *)
//
extern
prfun
channeg1_nil_close (channeg1(chnil)): void
extern
prfun
chanpos1_nil_close (!chanpos1(chnil) >> channel0): void
//
(* ****** ****** *)

extern
fun
chanpos1_recv
{x:vt@ype}{xs:type}
(
  chan: !chanpos1(x::xs) >> chanpos1(xs)
) : x // end of [chanpos1_recv]

(* ****** ****** *)

extern
fun
channeg1_send
{x:vt@ype}{xs:type}
(
  chan: !channeg1(x::xs) >> channeg1(xs), x: (x)
) : void // end of [channeg1_send]

(* ****** ****** *)

datavtype
ss_client =
  | DENY of (chnil)
  | DENY of (channeg1(chnil), chnil)
  | HOLD of (channeg1(chnil), ss_client)
  | GRANT of (channeg1(ss_grant), chnil)
//
and ss_grant = RETURN1 of (chnil)
//
(* ****** ****** *)
//
datavtype
ClientOpt(ss:vtype) =
  | DENY(chnil) of ()
  | DENY(chnil) of channeg1(chnil)
  | HOLD(ss_client) of channeg1(chnil)
  | GRANT(chnil) of (channeg1(ss_grant))
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
chanptr_recv
  {a:vtype}(chan: !chanptr(a)): (a)
extern
fun
chanptr_send
  {a:vtype}(chan: !chanptr(a), x: (a)): void
//
(* ****** ****** *)
//
extern
fun
channeg1_client{ss:vtype}
  (chan: !channeg1(ss_client) >> channeg1(ss), x: ClientOpt(ss)): void
extern
fun
chanpos1_client
  (chan: !chanpos1(ss_client) >> chanpos1(ss)): #[ss:vtype] ClientOpt(ss)
//
(* ****** ****** *)
//
extern
fun
channeg1_grant{ss:vtype}
  (chan: !channeg1(ss_grant) >> channeg1(ss), x: AgentGrantOpt(ss)): void
extern
fun
chanpos1_grant
  (chan: !chanpos1(ss_grant) >> chanpos1(ss)): #[ss:vtype] AgentGrantOpt(ss)
//
(* ****** ****** *)

extern val RANDOM : int

(* ****** ****** *)
//
datavtype
ServerOpt =
  | RETURN0 of (channel0)
  | REQUEST0 of (channeg1(ss_client))
//
(* ****** ****** *)

extern
val
theServer : chanref(ServerOpt)

(* ****** ****** *)
//
extern
fun Server((*void*)): void
extern
fun Client((*void*)): void
//
extern
fun
Agent
(
  agent: channel0
, client: channeg1(ss_client)
) : void // end of [Agent]
//
(* ****** ****** *)
//
extern
fun
chanptr_create
  {a:vtype}
  (cap: intGte(0)): chanptr(a)
//
extern
fun
chanptr_is_empty
  : {a:vtype} (!chanptr(a)) -> bool
extern
fun
chanptr_isnot_empty
  : {a:vtype} (!chanptr(a)) -> bool
//
(* ****** ****** *)

implement
Server() = let
//
fun
loop
(
  pool: chanptr(channel0)
) : void = let
//
val
opt = chanref_recv(theServer)
//
in
//
case+ opt of
| ~RETURN0(agent) => let
    val () =
    chanptr_send(pool, agent)
  in
    loop(pool)
  end // end of [RETURN0]
| ~REQUEST0(client) =>
  if chanptr_isnot_empty(pool)
    then let
      val agent =
        chanptr_recv(pool)
      // end of [val]
      val () = Agent(agent, client)
    in
      loop(pool)
    end // end of [then]
    else let
      val () =
      channeg1_client(client, DENY())
      val () = channeg1_nil_close(client)
    in
      loop(pool)
    end // end of [else]
//  
end // end of [loop]
//
val
pool = chanptr_create(5)
//
in
  loop(pool)
end // end of [Server]
//
(* ****** ****** *)

implement
Agent(agent, client) = let
//
fun
loop
( agent: !channel0
, client: channeg1(ss_client)
) : void = (
//
case
RANDOM of
| 0 => let
    val
    agent2 =
    channel0_split{chnil}(agent)
    val () =
    channeg1_client(client, HOLD(agent2))
    val ((*void*)) = chanpos1_nil_close(agent)
  in
    loop(agent, client)
  end // end of [_]
| 1 => let
    val
    agent2 =
    channel0_split{chnil}(agent)
    val () =
    channeg1_client(client, DENY(agent2))
    val ((*void*)) = chanpos1_nil_close(agent)
    val ((*void*)) = channeg1_nil_close(client)
  in
    // break
  end // end of [1]
| _ => let
    val
    agent2 =
    channel0_split{ss_grant}(agent)
    val () =
    channeg1_client(client, GRANT(agent2))
    val+RETURN1() = chanpos1_grant(agent)
    val ((*void*)) = chanpos1_nil_close(agent)
    val ((*void*)) = channeg1_nil_close(client)
  in
    // break
  end // end of [_]
//
) (* end of [loop] *)
//
val () = loop(agent, client)
//
in
  chanref_send(theServer, RETURN0(agent))
end // end of [Agent]
//
(* ****** ****** *)
//
implement
Client() = let
//
fun
loop
(
  client: channel0
) : void =
(
//
case+
RANDOM
of // case
| _ => let
    val
    client2 =
    channel0_split{ss_client}(client)
    val () =
    chanref_send(theServer, REQUEST0(client2))
  in
    loop2(client)
  end // end of [loop]
//
) (* end of [loop] *)
//
and
loop2
(
  client: chanpos1(ss_client)
) : void = let
//
val opt = chanpos1_client(client)
//
in
//
case+ opt of
| ~DENY() =>
  {
    val () =
    chanpos1_nil_close(client)
    val () = channel0_destroy(client)
  }
| ~DENY(agent) =>
  {
    val () =
    channeg1_nil_close(agent)
    val () =
    chanpos1_nil_close(client)
    val () = channel0_destroy(client)
  }
| ~HOLD(agent) =>
  loop2(client) where
  {
    val () = channeg1_nil_close(agent)
  }
//
| ~GRANT(agent) =>
  {
    val () =
    channeg1_grant(agent, RETURN1())
    val () = channeg1_nil_close(agent)
    val () = chanpos1_nil_close(client)
    val () = channel0_destroy(client)
  }
//
end // end of [loop2]
//
in
  loop(channel0_create(0))
end // end of [Client]

(* ****** ****** *)

(* end of [ClientServer-2.dats] *)
