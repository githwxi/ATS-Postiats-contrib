(**
  Some examples that implement and prove correctness of 
  bit twiddling hacks from the following page.
  
  https://graphics.stanford.edu/~seander/bithacks.html
*)

staload "contrib/libats-/wdblair/patsolve/SATS/bitvector.sats"
staload "contrib/libats-/wdblair/prelude/SATS/integer.sats"

(**
  Assume we're only working with 32 bit numbers in this file.
*)
macdef int2bv = bv32_of_int
macdef bool2bv = bv32_of_bool

fun 
min {x,y:bv32} (
  x: int (x), y: int (y)
): int (min(x, y)) =
  y lxor ((x lxor y) land ~bool2bv(x < y))

fun 
max {x,y:bv32} (
  x: int (x), y: int (y)
): int (max(x, y)) =
  x lxor ((x lxor y) land ~bool2bv(x < y))
  
fun
swap {x,y:bv32} (
  x: &int (x) >> int (y), y: &int (y) >> int (x)
): void = {
  val () =  x := x lxor y
  val () =  y := y lxor x
  val () =  x := x lxor y
}

fun
swap_bits {b:bv32} {i,j,n:nat | i + n < 32; j + n < 32; abs(i - j) >  n} (
  b: int (b), i: int i, j: int j, n: int n
): int (swap (b, bv32(i), bv32(j), bv32(n))) = let
  val i = int2bv (i)
  val j = int2bv (j)
  val n = int2bv (n)
  val one = int2bv(1)
  //
  val mask = (one << n) - one
  val x = ((b >> i) lxor (b >> j)) land mask
  val r = b lxor ((x << i) lor (x << j))
  //
in
  r
end

fun
is_power_of_two {x:bv32} (
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

fun
has_byte {x,n:bv32} (
  x: int (x), n: int (n)
): bool (has_byte(x, n)) = let
  val test = x lxor (int2bv(0x01010101) * (n land int2bv(0xFF)))
in
  has_zero_byte (test)
end