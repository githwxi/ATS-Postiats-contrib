import patsolve

def is_power_of_2_bv32 (x):
    """
    A 32 bitvector x is a power of two.
    """
    return reduce(Or, (x == (1 << i) for i in range(32)))

def has_zero_byte_bv32 (x):
    """
    A 32 bitvector x contains at least one zero byte.
    """
    return reduce(Or, (((x >> (8*i)) & 0xFF) == 0 for i in range(4)))

