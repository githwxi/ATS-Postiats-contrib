(*
rbuf is a read-only buffer of memory
*)

(* ****** ****** *)
//
absvt@ype rbuf_vt (a:t@ype, int, int, addr) = @(ptr, size_t)
vtypedef rbuf_vt0 (a:t@ype) = rbuf_vt (a, 0, 0, null)?
vtypedef rbuf_vt1 (a:t@ype, n:int, l:addr) = [i:int | i <= n] rbuf_vt (a, i, n, l)
//
fun{a:t@ype}
rbuf_make {n:int} {l:addr} (
  array_v (INV(a), l, n)
| ptr l
, size_t n
, &rbuf_vt0 (a) >> rbuf_vt (a, 0, n, l)
): void
//
fun{a:t@ype}
rbuf_free {n,m:int} {l:addr} (
  // NB. the type given to buf after returning
  // is the same as what it was prior to [buf_make]
  &rbuf_vt (a, n, m, l) >> rbuf_vt0 (a)
): (array_v (a, l, m) | void)
//
fun{a:t@ype}
rbuf_check {n,m:int} {l:addr} (
  &rbuf_vt (a, n, m, l) >> _
): bool (n < m)
//
fun{a:t@ype}
rbuf_rem {n,m:int} {l:addr} (
  &rbuf_vt (a, n, m, l) >> _
): int (m-n)
//
fun{a:t@ype}
rbuf_read {n,m:int | n < m} {l:addr} (
  &rbuf_vt (a, n, m, l) >> rbuf_vt (a, n+1, m, l)
): a
//
(* ****** end of [rbuf.sats] ****** *)
