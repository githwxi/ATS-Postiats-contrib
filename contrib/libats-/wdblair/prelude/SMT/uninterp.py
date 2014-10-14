# Playing with uninterpreted functions

from z3 import *

import patsolve

s = patsolve.solver

n, m = Ints ("n m")
undef = Int ("undef")

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
