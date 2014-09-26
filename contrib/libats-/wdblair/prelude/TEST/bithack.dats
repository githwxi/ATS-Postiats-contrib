(**
  Some examples proving bit twiddling hacks from the following page.
  
  https://graphics.stanford.edu/~seander/bithacks.html
*)

staload "contrib/libats-/wdblair/patsolve/SATS/bitvector.sats"
staload "contrib/libats-/wdblair/prelude/SATS/integer.sats"

fun 
power_of_two {x:bv32} (
  x: int(x)
): bool (is_power_of_2 (x)) =
  if x = 0 then
    false
  else
    ((x land (x - 1)) = 0)
      
fun
has_zero_byte {x:bv32} (
  x: int (x)
): bool (has_zero_byte(x)) =
  ~(((x - 0x01010101) land (lnot(x) land 0x80808080)) = 0)
  
