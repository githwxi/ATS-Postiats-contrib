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
    return Implies (ULE(n, 0xff),
                    reduce(Or, (((b >> (8*i)) & 0xff) == n for i in range(4))))

def cond_set_or_clear_bv32 (f, w, m):
    """
    Conditionally set or clear bits.
    """
    return If (f == BitVecVal(1, 32), w | m, w & ~m)


s = patsolve.solver

bits_set = Function("bits_set_bv32", BitVecSort(32), IntSort())

x,y = BitVecs('x y', 32)

s.add (
    ForAll (x, And(bits_set (x) >= 0, bits_set(x) <= 32))
)

s.add (
    ForAll([x,y], Implies (y == 0, bits_set(x - y) == bits_set(x)))
)

s.add (
    ForAll (x, Implies (x == 0, bits_set (x) == 0))
)

s.add (
    ForAll(x, Implies(UGT(x, 0x0),
                      bits_set(x) == BV2Int((x & 1)) + bits_set(LShR(x, 1))
            )
    )
)
