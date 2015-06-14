(* ****** ****** *)
//
// [stampseq]: finite sequences of stamps
//
(* ****** ****** *)
//
// HX-2014-01-25: initiation
// HX-2015-06-14: tidying-up with minor changes
//
(* ****** ****** *)

sortdef stamp = int

(* ****** ****** *)

datasort stampseq = (*abstract*)

(* ****** ****** *)
//
stacst stampseq_nil : () -> stampseq
stacst stampseq_cons : (stamp, stampseq) -> stampseq
//
stacst stampseq_sing : (stamp) -> stampseq
//
stacst stampseq_head : stampseq -> stamp
stacst stampseq_tail : stampseq -> stampseq
//
stacst stampseq_snoc : (stampseq, stamp) -> stampseq
//
(* ****** ****** *)
//
stadef nil = stampseq_nil
stadef cons = stampseq_cons
//
stadef sing = stampseq_sing
//
stadef head = stampseq_head
stadef tail = stampseq_tail
//
stadef snoc = stampseq_snoc
//
(* ****** ****** *)
//
stacst stampseq_get_at : (stampseq, int) -> stamp
stacst stampseq_set_at : (stampseq, int, stamp) -> stampseq
stacst stampseq_interchange : (stampseq, int, int) -> stampseq
//
stadef select = stampseq_get_at
stadef update = stampseq_set_at
stadef interchange = stampseq_interchange
//
(* ****** ****** *)
//
// drop the first n elements
// take the first n elements
//
stacst stampseq_drop: (stampseq, int(*n*)) -> stampseq
stacst stampseq_take: (stampseq, int(*n*)) -> stampseq
//
(* ****** ****** *)

stadef take = stampseq_take
stadef drop = stampseq_drop

(* ****** ****** *)
//
stacst stampseq_prefix_eq: (stampseq, stampseq, int) -> bool
//
stadef prefix_eq = stampseq_prefix_eq
//
(* ****** ****** *)
//
stacst stampseq_insert_at : (stampseq, int, stamp) -> stampseq
stacst stampseq_remove_at : (stampseq, int) -> stampseq
//
stadef insert = stampseq_insert_at
stadef remove = stampseq_remove_at
//
(* ****** ****** *)
//
stacst stampseq_append : (stampseq, int, stampseq, int) -> stampseq
//
stacst stampseq_reverse : (stampseq, int) -> stampseq
stacst stampseq_revappend : (stampseq, int, stampseq, int) -> stampseq
//
stadef append = stampseq_append
stadef reverse = stampseq_reverse
stadef revappend = stampseq_revappend
//
(* ****** ****** *)

(* end of [stampseq.sats] *)
