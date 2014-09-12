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

stacst lshl_bv8_int: (bv8, int) -> bv8
stadef << = lshl_bv8_int

stacst lshr_bv8_int: (bv8, int) -> bv8
stadef >> = lshr_bv8_int

stacst ashr_bv8_int: (bv8, int) -> bv8
stadef ashr = ashr_bv8_int 

stacst sub_bv8_bv8: (bv8, bv8) -> bv8
stadef - = sub_bv8_bv8

stacst add_bv8_bv8: (bv8, bv8) -> bv8
stadef + = add_bv8_bv8

stacst mul_bv8_bv8: (bv8, bv8) -> bv8
stadef * = mul_bv8_bv8

stacst div_bv8_bv8: (bv8, bv8) -> bv8
stadef / = div_bv8_bv8

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

stacst ult_bv8_bv8: (bv8, bv8) -> bool
stadef ult = ult_bv8_bv8

stacst ulte_bv8_bv8: (bv8, bv8) -> bool
stadef ule = ulte_bv8_bv8

stacst ugte_bv8_bv8: (bv8, bv8) -> bool
stadef uge = ugte_bv8_bv8

stacst ugt_bv8_bv8: (bv8, bv8) -> bool
stadef ugt = ugt_bv8_bv8

datasort bv16 = (* abstract *)

stacst bv16_of_int: (int) -> bv16
stadef bv16 = bv16_of_int

stacst is_power_of_2_bv16: (bv16) -> bool
stadef is_power_of_2 = is_power_of_2_bv16

stacst and_bv16_bv16: (bv16, bv16) -> bv16
stadef land = and_bv16_bv16

stacst or_bv16_bv16: (bv16, bv16) -> bv16
stadef lor = or_bv16_bv16

stacst xor_bv16_bv16: (bv16, bv16) -> bv16
stadef lxor = xor_bv16_bv16

stacst not_bv16: (bv16) -> bv16
stadef lnot = not_bv16

stacst lshl_bv16_int: (bv16, int) -> bv16
stadef << = lshl_bv16_int

stacst lshr_bv16_int: (bv16, int) -> bv16
stadef >> = lshr_bv16_int

stacst ashr_bv16_int: (bv16, int) -> bv16
stadef ashr = ashr_bv16_int 

stacst sub_bv16_bv16: (bv16, bv16) -> bv16
stadef - = sub_bv16_bv16

stacst add_bv16_bv16: (bv16, bv16) -> bv16
stadef + = add_bv16_bv16

stacst mul_bv16_bv16: (bv16, bv16) -> bv16
stadef * = mul_bv16_bv16

stacst div_bv16_bv16: (bv16, bv16) -> bv16
stadef / = div_bv16_bv16

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

stacst ult_bv16_bv16: (bv16, bv16) -> bool
stadef ult = ult_bv16_bv16

stacst ulte_bv16_bv16: (bv16, bv16) -> bool
stadef ule = ulte_bv16_bv16

stacst ugte_bv16_bv16: (bv16, bv16) -> bool
stadef uge = ugte_bv16_bv16

stacst ugt_bv16_bv16: (bv16, bv16) -> bool
stadef ugt = ugt_bv16_bv16

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

stacst lshl_bv32_int: (bv32, int) -> bv32
stadef << = lshl_bv32_int

stacst lshr_bv32_int: (bv32, int) -> bv32
stadef >> = lshr_bv32_int

stacst ashr_bv32_int: (bv32, int) -> bv32
stadef ashr = ashr_bv32_int

stacst sub_bv32_bv32: (bv32, bv32) -> bv32
stadef - = sub_bv32_bv32

stacst add_bv32_bv32: (bv32, bv32) -> bv32
stadef + = add_bv32_bv32

stacst mul_bv32_bv32: (bv32, bv32) -> bv32
stadef * = mul_bv32_bv32

stacst div_bv32_bv32: (bv32, bv32) -> bv32
stadef / = div_bv32_bv32

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

stacst ult_bv32_bv32: (bv32, bv32) -> bool
stadef ult = ult_bv32_bv32

stacst ulte_bv32_bv32: (bv32, bv32) -> bool
stadef ule = ulte_bv32_bv32

stacst ugte_bv32_bv32: (bv32, bv32) -> bool
stadef uge = ugte_bv32_bv32

stacst ugt_bv32_bv32: (bv32, bv32) -> bool
stadef ugt = ugt_bv32_bv32

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

stacst lshl_bv64_int: (bv64, int) -> bv64
stadef << = lshl_bv64_int

stacst lshr_bv64_int: (bv64, int) -> bv64
stadef >> = lshr_bv64_int

stacst ashr_bv64_int: (bv64, int) -> bv64
stadef ashr = ashr_bv64_int

stacst sub_bv64_bv64: (bv64, bv64) -> bv64
stadef - = sub_bv64_bv64

stacst add_bv64_bv64: (bv64, bv64) -> bv64
stadef + = add_bv64_bv64

stacst mul_bv64_bv64: (bv64, bv64) -> bv64
stadef * = mul_bv64_bv64

stacst div_bv64_bv64: (bv64, bv64) -> bv64
stadef / = div_bv64_bv64

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

stacst ult_bv64_bv64: (bv64, bv64) -> bool
stadef ult = ult_bv64_bv64

stacst ulte_bv64_bv64: (bv64, bv64) -> bool
stadef ule = ulte_bv64_bv64

stacst ugte_bv64_bv64: (bv64, bv64) -> bool
stadef uge = ugte_bv64_bv64

stacst ugt_bv64_bv64: (bv64, bv64) -> bool
stadef ugt = ugt_bv64_bv64
