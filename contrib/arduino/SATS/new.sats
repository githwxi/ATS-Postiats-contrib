(*
** The prelude for Ardunio
*)

(* ****** ****** *)
//
absview
delete_v(l:addr)
//
dataview
new_v (int, addr) =
| {n:nat}
  new_v_fail (n, null) of ()
| {n:nat}
  {l:addr | l > null}
  new_v_succ (n, l(*>0*)) of (bytes(n)@l, delete_v(l))
//
(* ****** ****** *)

(*
void*
operator new(size_t size);
*)
fun
new{n:int}
(
  bsz: size_t(n)
) : [l:addr] (new_v(n, l) | ptr(l)) = "mac#"

(* ****** ****** *)

(*
void operator delete(void *ptr);
*)
fun
delete{n:int}{l:addr}
  (delete_v(l) | bytes(n)@l): void = "mac#"
//
(* ****** ****** *)

(* end of [new.sats] *)
