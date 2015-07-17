(* ****** ****** *)
//
// HX-2015-07-11:
// let the multi-party begin!
//
(* ****** ****** *)

staload "libats/SATS/ilist_prf.sats"

(* ****** ****** *)

(*
Bob -> Alice: <String> ::
Bob -> Alice: {
  Time: Alice -> Bob: <Time> :: end
  Greet: Alice -> Bob: <String> :: end
}
*)

(* ****** ****** *)

sortdef party = int

(* ****** ****** *)

abstype
tagging(party, party, type)

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

stadef A = 0
stadef B = 1
stadef C = 2

(* ****** ****** *)
//
datatype
HelloWorld2 =
| HelloWorld2 of
  ( trans(B, A, String)
  , tagging(B, A, HelloWorld2_rest)
  )
//
and
HelloWorld2_rest =
| HelloWorld2_rest_Time of
    (trans(A, B, Time), trans_end(A, B))
| HelloWorld2_rest_Greet of
    (trans(A, B, String), trans_end(A, B))
//
(* ****** ****** *)

sortdef parties = ilist

abstype
mtrans(party, parties, a:vt@ype)
abstype
mtrans_end(p: party, ps: parties)

(* ****** ****** *)

abstype mtagging(party, parties, type)

(* ****** ****** *)

stadef AC = ilist_cons(A, ilist_cons(C, ilist_nil))

(* ****** ****** *)

datatype
HelloWorld3 =
| HelloWorld3 of
  ( trans(B, A, String)
  , trans(B, C, String)
  , mtagging(B, AC, HelloWorld3_rest)
  )

and
HelloWorld3_rest =
  | HelloWorld3_rest_A of (trans(A, B, Time), trans_end(A, B))
  | HelloWorld3_rest_C of (trans(C, B, Time), trans_end(C, B))

(* ****** ****** *)

stadef Seller = 0
stadef Buyer1 = 1
stadef Buyer2 = 2

(*
trans(Buyer1, Seller, book(title))
trans(Seller, Buyer1, book(price))
trans(Buyer1, Buyer2, quote(contribution)
mtrans(Buyer2, [Buyer1,Seller], mtagging(...))
*)

(* ****** ****** *)

(* end of [multi-party.dats] *)
