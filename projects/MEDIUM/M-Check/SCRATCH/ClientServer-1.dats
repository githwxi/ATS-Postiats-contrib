(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: February, 2016
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

abstype channel

(* ****** ****** *)
//
extern
fun
channel_recv{a:type}(channel): a
extern
fun
channel_send{a:type}(channel, a): void
//
extern
fun
channel_create(cap: intGte(0)): channel
//
(* ****** ****** *)
//
datatype
AgentReply =
| DENY of (channel)
| HOLD of (channel)
| GRANT of (channel)
//
datatype ClientReply = RETURN0 of ()
datatype ClientRequest = REQUEST0 of (channel)
//
(* ****** ****** *)
//
val
theServer = channel_create(0)
//
(* ****** ****** *)
//
extern
fun
Agent
(
  agent: channel, client: channel
) : void // end of [Agent]
//
(* ****** ****** *)

extern val RAND: int

(* ****** ****** *)
//
implement
Agent(agent, client) = (
//
case RAND of
| 0 => let
    val () =
    channel_send(client, HOLD(agent))
  in
    Agent(agent, client)
  end // end of [_]
| 1 =>
    channel_send(client, DENY(agent))
| _ => let
    val () =
    channel_send(client, GRANT(agent))
    val-RETURN0() =
      channel_recv{ClientReply}(agent)
    // end of [val]
  in
    // break
  end // end of [_]
//
) (* end of [Agent] *)
//
(* ****** ****** *)

(*
#define M 2
active [M] proctype Client()
{
    chan me = [0] of { mtype, chan };
    chan agent;
end:
    do
    :: timeout ->
        server!request(me);
        do
        :: me?hold(agent)
        :: me?deny(agent) -> break
        :: me?grant(agent) -> agent!return0; break
        od
    od
}
*)                                                                    

(* ****** ****** *)
//
extern
fun Client(): void
//
(* ****** ****** *)
//
implement
Client() = let
//
fun
loop
(
  client: channel
) : void =
(
//
case+ RAND of
| _ => let
    val () =
    channel_send(theServer, REQUEST0(client))
  in
    loop2(client)
  end // end of [loop]
//
) (* end of [loop] *)
//
and
loop2
(
  client: channel
) : void = let
  val opt = channel_recv{AgentReply}(client)
in
//
case+ opt of
| DENY(agent) => ()
| HOLD(agent) => loop2(client)
| GRANT(agent) => channel_send(agent, RETURN0())
//
end // end of [loop2]
//
in
  loop(channel_create(0))
end // end of [Client]

(* ****** ****** *)

(* end of [ClientServer-1.dats] *)
