import patsolve

def is_power_of_2_bv16 (x):
    """
    An expression that is true iff x (16 bit vector) is a power of two.
    """
    return reduce(Or, (x == (1 << i) for i in range(16)))
