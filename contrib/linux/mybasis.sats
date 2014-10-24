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
typedef uptr = [l:addr] uptr_type(l)
typedef uptr0 = [l:agez] uptr_type(l)
typedef uptr1 = [l:addr | l > null] uptr_type(l)
//
(* ****** ****** *)

(* end of [mybasis.sats] *)
