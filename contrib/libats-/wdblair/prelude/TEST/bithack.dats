(**
  Some examples demonstrating bit twiddling hacks from the following page.
  
  https://graphics.stanford.edu/~seander/bithacks.html
*)

staload "contrib/libats-/wdblair/patsolve/SATS/bitvector.sats"
staload "contrib/libats-/wdblair/prelude/SATS/integer.sats"

fun power_of_two {x:bv16}
  (x: int(x)): bool (is_power_of_2(x)) =
    if x = 0 then
      false
    else
      (x land (x - 1)) = 0
      
fun has_null_byte {x:bv16}
  (x: int(x)): bool (has_null_byte(x)) = false
