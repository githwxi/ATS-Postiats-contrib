import patsolve

def bv32_of_bool (x):
    """
    Casting bool to bit vectors.
    """
    return If (x == True, BitVecVal(1, 32), BitVecVal(0, 32))

def max_bv32_bv32 (x, y):
    """
    Choose the max of x and y
    """
    return If (x > y, x, y)

def min_bv32_bv32 (x, y):
    """
    Choose the min of x and y
    """
    return If (x < y, x, y)


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

def swap_bits_bv32 (b, i, j, n):
    """
    Swap n bits of n starting at indices i and j.
    """
    mask = (BitVecVal(1, 32) << n) - BitVecVal(1, 32)
    
    x = ((b >> i) ^ (b >> j)) & mask

    return b ^ (x << i | x << j)

def has_byte_bv32 (b, n):
    """
    Check whether b contains a byte of value n.
    """
    return reduce(Or, (((b >> (8*i)) & 0xFF) == (n & 0xFF) for i in range(4)))

