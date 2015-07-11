(* ****** ****** *)
//
// HX-2015-07-11:
// let the multi-party start!
//
(* ****** ****** *)

(*
Bob -> Alice: <String> ::
Bob -> Alice: {
  Time: Alice -> Bob: <Time> :: end
  Greet: Alice -> Bob: <String> :: end
}
*)

(* ****** ****** *)

datasort party = // abstract

(* ****** ****** *)
//
abstype
trans(party, party, a:vt@ype) // p1->p2
//
abstype
trans_end(p1: party, p2: party) // p1->p2
//
(* ****** ****** *)

abstype Time

(* ****** ****** *)
//
datatype
HelloWorld
(Bob:party, Alice:party) =
| HelloWorld(Bob, Alice) of
    (trans(Bob, Alice, String), HelloWorld2(Bob, Alice))
//
and
HelloWorld2
(Bob:party, Alice:party) =
  | HelloWorld2_Time of (trans(Alice, Bob, Time), trans_end(Alice, Bob))
  | HelloWorld2_Greet of (trans(Alice, Bob, String), trans_end(Alice, Bob))
//
(* ****** ****** *)

(* end of [multi-party.dats] *)
