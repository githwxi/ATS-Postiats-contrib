(* ****** ****** *)
//
// MPST:
// For supporting
// multi-party sessions
//
(* ****** ****** *)
//
staload
"libats/SATS/ilist_prf.sats"
//
(* ****** ****** *)
//
absvtype channel(int, type)
//
(* ****** ****** *)
//
abstype chnil
abstype chcons(a:type, ss:type)
//
stadef nil = chnil
//
stadef :: = chcons
stadef cons = chcons
//
(* ****** ****** *)
//
abstype chtrans
(
  source: int, target: int, data: vt@ype
)
abstype chtrans_end(int)
//
stadef trans = chtrans
stadef trans_end = chtrans_end
//
(* ****** ****** *)
//
fun
channel_send
  {id:int}
  {id1,id2:int | (id)==id1;(id)!=id2}
  {ss:type}{a:vt@ype}
(
  ch: !channel(id, trans(id1, id2, a)::ss) >> channel(id, ss), int(id1), int(id2), x: a
) : void // end-of-function
//
fun
channel_recv
  {id:int}
  {id1,id2:int | (id)!=id1;(id)==id2}
  {ss:type}{a:vt@ype}
  (ch: !channel(id, trans(id1, id2, a)::ss) >> channel(id, ss), int(id1), int(id2)): (a)
//
fun
channel_skip
  {id:int}
  {id1,id2:int | (id)!=id1;(id)!=id2}
  {ss:type}{a:vt@ype}
  (ch: !channel(id, trans(id1, id2, a)::ss) >> channel(id, ss), int(id1), int(id2)): void
//
(* ****** ****** *)
//
fun
channel_nil_wait
  {id:int}{id0:int | (id)!=id0}
  (ch: channel(id, trans_end(id0)), int(id0)): void
fun
channel_nil_close
  {id:int}{id0:int | (id)==id0}
  (ch: channel(id, trans_end(id0)), int(id0)): void
//
(* ****** ****** *)

(* end of [MPST.sats] *)
