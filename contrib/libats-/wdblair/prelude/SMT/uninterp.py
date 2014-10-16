# 
# Representing Recursive Functions using 
#

from z3 import *

import patsolve

s = patsolve.solver

n, m, p = Ints ("n m p")
undef = Int ("undef")

# Factorial

fact = Function ("fact_int", IntSort(), IntSort())

s.add (
    ForAll ([n], Implies (n < 0, fact(n) == undef))
)

s.add (
    ForAll ([n], Implies (n >= 0, fact(n) >= 1))
)

s.add (
    ForAll ([n], Implies (n == 0, fact(n) == 1))
)

s.add (
    ForAll ([n], Implies (n > 0, fact (n) == n * fact(n-1)))
)

# Fibonacci

fib = Function ("fib_int", IntSort(), IntSort())

s.add (
    ForAll([n], Implies (n < 0, fib(n) == undef))
)

s.add (
    ForAll([n],
           Implies (n >= 0, fib(n) >= 0)
    )
)

s.add (
    ForAll([n], Implies (And (0 <= n, n < 2), fib(n) == n))
)

s.add (
    ForAll([n], Implies (n > 1, fib(n) == fib(n-1) + fib(n-2)))
)

# Euclid's Algorithm

gcd = Function ("gcd_int", IntSort(), IntSort(), IntSort())

s.add (
    ForAll([n,m], Implies (Or (n < 0, m < 0), gcd(n, m) == undef))
)

s.add (
    ForAll([n], Implies (n > 0, gcd(n, 0) == n))
)

s.add (
    ForAll([n,m], Implies (And (n > 0, m > 0), gcd (n, m) == gcd (m, n % m)))
)

# Power

power = Function ("power_int_int", IntSort(), IntSort(), IntSort())

s.add (
    ForAll([n], power (n, 0) == 1)
)

s.add (
    ForAll([n,p], Implies (p > 0, power (n,p) == n * power(n, p-1)))
)

