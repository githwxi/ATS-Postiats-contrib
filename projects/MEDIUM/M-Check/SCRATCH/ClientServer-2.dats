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

abstype ssnil()
abstype sscons(x:vt@ype, xs:type)

(* ****** ****** *)

stadef :: = sscons

(* ****** ****** *)
//
absvtype channel()
//
absvtype chanpos(ss:type)
absvtype channeg(ss:type)
//
(* ****** ****** *)

extern
fun
chanpos_recv
{x:vt@ype}{xs:type}
(
  chan: !chanpos(x::xs) >> channeg(xs)
) : x // end of [channel_recv]

(* ****** ****** *)

extern
fun
channel_send
{x:vt@ype}{xs:type}
(
  chan: !chanpos(x::xs) >> chanpos(xs), x: (x)
) : void // end of [channel_send]

(* ****** ****** *)
////
datatype
ClientOpt =
  | DENY of ()
  | DENY of (chanpos(ssnil))
  | HOLD of (chanpos(ss_hold))
  | GRANT of (chanpos(ss_grand))
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

(* end of [ClientServer-2.dats] *)
