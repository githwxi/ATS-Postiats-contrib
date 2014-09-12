(*
  An interface that aims to  extend the statics to  handle fixed
  width bit vectors.
*)

(*
  We can  declare an abstract  sort by using the  datasort declaration
  and not providing any constructors along with it.
  
  From the perspective of the external constraint solver, the sort will
  just be called "bit8". In our parser, we can turn this into a bitvector
  of lenght 8.
*)
datasort bit8 = (*abstract*)

(*
  Z3 can transform an integer into a fixed width bit vector. I'm not
  sure about other SMT solvers.
*)
stacst bit8_of_int: (int) -> bit8
stadef bit8 = bit8_of_int

stacst and_bit8_bit8: (bit8, bit8) -> bit8
stadef land = and_bit8_bit8

stacst or_bit8_bit8: (bit8, bit8) -> bit8
stadef lor = or_bit8_bit8

stacst lxor_bit8_bit8: (bit8, bit8) -> bit8
stadef lxor = lxor_bit8_bit8

stacst sub_bit8_bit8: (bit8, bit8) -> bit8
stadef - = sub_bit8_bit8

stacst add_bit8_bit8: (bit8, bit8) -> bit8
stadef + = add_bit8_bit8

stacst eq_bit8_bit8: (bit8, bit8) -> bool
stadef == = eq_bit8_bit8

abst@ype bit8_t0ype (b:bit8) = uint8
typedef bit8 (b:bit8) = bit8_t0ype (b)

fun land_bit8_bit8 {l,r:bit8} (
  bit8 (l), bit8 (r)
): bit8 (l land r) = "mac#"
overload land with land_bit8_bit8

fun lor_bit8_bit8 {l,r:bit8} (
  bit8 (l), bit8 (r)
): bit8 (l lor r) = "mac#"
overload lor with lor_bit8_bit8

fun lxor_bit8_bit8 {l,r:bit8} (
  bit8 (l), bit8 (r)
): bit8 (l lxor r) = "mac#"
overload lxor with lxor_bit8_bit8

fun sub_bit8_bit8 {l,r:bit8} (
  bit8 (l), bit8 (r)
): bit8 (l - r) = "mac#"
overload - with sub_bit8_bit8

fun add_bit8_bit8 {l,r:bit8} (
  bit8 (l), bit8 (r)
): bit8 (l + r) = "mac#"
overload + with add_bit8_bit8

fun equal_bit8_bit8 {l,r:bit8} (
  bit8 (l), bit8 (r)
): bool (l == r)
overload = with equal_bit8_bit8

symintr bit8 

castfn bit8_of_int {n:int} (uint n): bit8 (bit8 (n))

overload bit8 with bit8_of_int