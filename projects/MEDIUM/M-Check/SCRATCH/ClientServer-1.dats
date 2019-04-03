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

extern
fun
channel_is_empty : channel -> bool
extern
fun
channel_isnot_empty : channel -> bool

(* ****** ****** *)
//
datatype
ClientOpt =
  | DENY of ()
  | DENY of (channel)
  | HOLD of (channel)
  | GRANT of (channel)
//
datatype
ClientReply = RETURN0 of ()
//
datatype
ServerOpt =
  | RETURN0 of (channel)
  | REQUEST0 of (channel)
//
(* ****** ****** *)

extern val RANDOM: int

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
//
implement
Agent(agent, client) = let
//
fun
loop
( agent: channel
, client: channel
) : void = (
//
case
RANDOM of
| 0 => let
    val () =
    channel_send(client, HOLD(agent))
  in
    loop(agent, client)
  end // end of [_]
| 1 =>
    channel_send(client, DENY(agent))
| _ => let
    val () =
    channel_send(client, GRANT(agent))
    val+RETURN0() =
      channel_recv{ClientReply}(agent)
    // end of [val]
  in
    // break
  end // end of [_]
//
) (* end of [loop] *)
//
val () = loop(agent, client)
//
in
  channel_send(theServer, agent)
end // end of [Agent]
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
case+
RANDOM
of // case
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
  val opt = channel_recv{ClientOpt}(client)
in
//
case+ opt of
| DENY() => ()
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

(*
active
proctype Server()
{
    chan agents[N] = [0] of { mtype };
    chan pool = [N] of { chan };
    chan client, agent;
    byte i;
    do
    :: i < N -> pool!agents[i]; i++
    :: else -> break
    od;
    end:
    do
    :: server?request(client) ->
        if
        :: empty(pool) ->
            client!deny(0)
        :: nempty(pool) ->
            pool?agent;
            run Agent(agent,client)
        fi
    :: server?return0(agent) ->
        pool!agent
    od
}
*)

(* ****** ****** *)
//
extern
fun Server((*void*)): void
//
implement
Server() = let
//
fun
loop
(
  pool: channel
) : void = let
//
val
opt =
channel_recv{ServerOpt}(theServer)
//
in
//
case+ opt of
| RETURN0(agent) => let
    val () =
    channel_send{channel}(pool, agent)
  in
    loop(pool)
  end // end of [RETURN0]
| REQUEST0(client) =>
  if channel_isnot_empty(pool)
    then let
      val agent =
        channel_recv{channel}(pool)
      // end of [val]
      val () = Agent(agent, client)
    in
      loop(pool)
    end // end of [then]
    else let
      val () =
      channel_send(client, DENY((*void*)))
    in
      loop(pool)
    end // end of [else]
//  
end // end of [loop]
//
val
pool = channel_create(5)
//
in
  loop(pool)
end // end of [Server]
//
(* ****** ****** *)

(* end of [ClientServer-1.dats] *)
