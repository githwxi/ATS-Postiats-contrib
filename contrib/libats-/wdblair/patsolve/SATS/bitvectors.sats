(**
  The following definitions need to be made for each possible
  bitvector length we encounter. For starters, we can just use
  8,16,32, and 64.
*)
datasort bv8 = (* abstract *)

stacst bv8_of_int: (int) -> bv8
stadef bv8 = bv8_of_int

stacst and_bv8_bv8: (bv8, bv8) -> bv8
stadef land = and_bv8_bv8

stacst or_bv8_bv8: (bv8, bv8) -> bv8
stadef lor = or_bv8_bv8

stacst xor_bv8_bv8: (bv8, bv8) -> bv8
stadef lxor = xor_bv8_bv8

stacst not_bv8: (bv8) -> bv8
stadef lnot = not_bv8

stacst sub_bv8_bv8: (bv8, bv8) -> bv8
stadef - = sub_bv8_bv8

stacst add_bv8_bv8: (bv8, bv8) -> bv8
stadef + = add_bv8_bv8

stacst eq_bv8_bv8: (bv8, bv8) -> bool
stadef == = eq_bv8_bv8

stacst lt_bv8_bv8: (bv8, bv8) -> bool
stadef < = lt_bv8_bv8

stacst lte_bv8_bv8: (bv8, bv8) -> bool
stadef <= = lte_bv8_bv8

stacst gte_bv8_bv8: (bv8, bv8) -> bool
stadef >= = gte_bv8_bv8

stacst gt_bv8_bv8: (bv8, bv8) -> bool
stadef > = gt_bv8_bv8

datasort bv16 = (* abstract *)

stacst bv16_of_int: (int) -> bv16
stadef bv16 = bv16_of_int

stacst and_bv16_bv16: (bv16, bv16) -> bv16
stadef land = and_bv16_bv16

stacst or_bv16_bv16: (bv16, bv16) -> bv16
stadef lor = or_bv16_bv16

stacst xor_bv16_bv16: (bv16, bv16) -> bv16
stadef lxor = xor_bv16_bv16

stacst not_bv16: (bv16) -> bv16
stadef lnot = not_bv16

stacst sub_bv16_bv16: (bv16, bv16) -> bv16
stadef - = sub_bv16_bv16

stacst add_bv16_bv16: (bv16, bv16) -> bv16
stadef + = add_bv16_bv16

stacst eq_bv16_bv16: (bv16, bv16) -> bool
stadef == = eq_bv16_bv16

stacst lt_bv16_bv16: (bv16, bv16) -> bool
stadef < = lt_bv16_bv16

stacst lte_bv16_bv16: (bv16, bv16) -> bool
stadef <= = lte_bv16_bv16

stacst gte_bv16_bv16: (bv16, bv16) -> bool
stadef >= = gte_bv16_bv16

stacst gt_bv16_bv16: (bv16, bv16) -> bool
stadef > = gt_bv16_bv16

datasort bv32 = (* abstract *)

stacst bv32_of_int: (int) -> bv32
stadef bv32 = bv32_of_int

stacst and_bv32_bv32: (bv32, bv32) -> bv32
stadef land = and_bv32_bv32

stacst or_bv32_bv32: (bv32, bv32) -> bv32
stadef lor = or_bv32_bv32

stacst xor_bv32_bv32: (bv32, bv32) -> bv32
stadef lxor = xor_bv32_bv32

stacst not_bv32: (bv32) -> bv32
stadef lnot = not_bv32

stacst sub_bv32_bv32: (bv32, bv32) -> bv32
stadef - = sub_bv32_bv32

stacst add_bv32_bv32: (bv32, bv32) -> bv32
stadef + = add_bv32_bv32

stacst eq_bv32_bv32: (bv32, bv32) -> bool
stadef == = eq_bv32_bv32

stacst lt_bv32_bv32: (bv32, bv32) -> bool
stadef < = lt_bv32_bv32

stacst lte_bv32_bv32: (bv32, bv32) -> bool
stadef <= = lte_bv32_bv32

stacst gte_bv32_bv32: (bv32, bv32) -> bool
stadef >= = gte_bv32_bv32

stacst gt_bv32_bv32: (bv32, bv32) -> bool
stadef > = gt_bv32_bv32

datasort bv64 = (* abstract *)

stacst bv64_of_int: (int) -> bv64
stadef bv64 = bv64_of_int

stacst and_bv64_bv64: (bv64, bv64) -> bv64
stadef land = and_bv64_bv64

stacst or_bv64_bv64: (bv64, bv64) -> bv64
stadef lor = or_bv64_bv64

stacst xor_bv64_bv64: (bv64, bv64) -> bv64
stadef lxor = xor_bv64_bv64

stacst not_bv64: (bv64) -> bv64
stadef lnot = not_bv64

stacst sub_bv64_bv64: (bv64, bv64) -> bv64
stadef - = sub_bv64_bv64

stacst add_bv64_bv64: (bv64, bv64) -> bv64
stadef + = add_bv64_bv64

stacst eq_bv64_bv64: (bv64, bv64) -> bool
stadef == = eq_bv64_bv64

stacst lt_bv64_bv64: (bv64, bv64) -> bool
stadef < = lt_bv64_bv64

stacst lte_bv64_bv64: (bv64, bv64) -> bool
stadef <= = lte_bv64_bv64

stacst gte_bv64_bv64: (bv64, bv64) -> bool
stadef >= = gte_bv64_bv64

stacst gt_bv64_bv64: (bv64, bv64) -> bool
stadef > = gt_bv64_bv64
