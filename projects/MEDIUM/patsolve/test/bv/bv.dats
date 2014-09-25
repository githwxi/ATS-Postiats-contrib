staload "bv.sats"

typedef Ctrl = [b:bit8 | (b land bit8(1)) == bit8(1)] bit8 (b)

extern
praxi initize_lemma (&Ctrl? >> Ctrl): void

local
  var control : Ctrl
  
  prval () = initize_lemma (control)
in
end

(*
 Try to set c to something such that
 ctrl & 0x1 != 0x1
 and notice that the type checker will reject it.
*)
fun update_controller (ctrl: &Ctrl >> _): void = let
  val c = bit8 (0x101u)
in
  ctrl := c
end