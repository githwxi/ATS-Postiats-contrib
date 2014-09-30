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
  y lxor ((x lxor y) land ~bool2bv (x < y))

fun
max {x,y:bv32} (
  x: int (x), y: int (y)
): int (max(x, y)) =
 x lxor ((x lxor y) land ~bool2bv(x < y))
 
fun
cond_set_or_clear {f:bool} {w,m:bv32} (
  f: bool (f), 
  w: &int (w) >> int (cond_set_or_clear(bv32(f), w, m)), 
  m: int (m)
): void = {
  val () = w := w lxor ((~bool2bv(f) lxor w) land m)
}

fun
swap {x,y:bv32} (
  x: &int (x) >> int (y), y: &int (y) >> int (x)
): void = {
  val () =  x := x lxor y
  val () =  y := y lxor x
  val () =  x := x lxor y
}

fun
swap_bits {b:bv32} {i,j,n:nat | abs(i - j) >  n} (
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
has_byte {x,n:bv32 | ule (n, bv32(0xff))} (
  x: int (x), n: int (n)
): bool (has_byte(x, n)) = let
  val mask = udiv(lnot (0), 0xff) // 0x01010101
  val test = x lxor (mask * n)
in
  has_zero_byte (test)
end

(**
  Encoding Brian Kernighan's Bit Counting Routine in ATS.
  
*)
stacst bits_set_bv32: bv32 -> int
stadef bits_set = bits_set_bv32

dataprop BitCount (b:bv32, bv32, int) =
  | Nil (b, b, 0) of ()
  | {x:bv32 | ugt(x, bv32(0))} {n:int}
    Succ (b, x land (x - bv32(1)), n + 1) of BitCount (b, x, n)
    
extern praxi
bitcount_elim_lemma {b:bv32} {n:int} (
  BitCount (b, bv32(0), n)
): [bits_set (b) == n] void

fun
bits_set {b:bv32} (
  b: int b
): int (bits_set(b)) = let
  //
  fun loop {x:bv32} {n:int} (
    pf: BitCount (b, x, n) | x: int (x), c: int (n)
  ): int (bits_set(b)) =
    if x = 0 then let
      prval () = bitcount_elim_lemma (pf)
    in
      c
    end
    else let
      prval pff = Succ (pf)
    in
      loop (pff | x land (x - 1), succ(c))
    end
  //
in
  loop (Nil() | b, 0)
end
