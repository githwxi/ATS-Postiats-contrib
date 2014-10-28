(* ****** ****** *)
//
// For linux-kernel programming
//
(* ****** ****** *)
//
(*
** HX-2011-02-20:
** a pointer is in kernel space by default
*)
abstype
uptr_type (l:addr) // user space pointers
//
typedef uPtr = [l:addr] uptr_type(l)
typedef uPtr0 = [l:agez] uptr_type(l)
typedef uPtr1 = [l:addr | l > null] uptr_type(l)
//
(* ****** ****** *)
//
absview
kfree_v(l:addr)
//
dataview kmalloc_v
  (n: int, l: addr) =
| {l==null}
  kmalloc_v_none (n, l) of ()
| {l > null}
  kmalloc_v_some (n, l) of (b0ytes(n)@l, kfree_v(l) | ptr(l))
//
praxi kfree_null_elim (pf: kfree_v(null)): void
//
(* ****** ****** *)

(* end of [basics.sats] *)
