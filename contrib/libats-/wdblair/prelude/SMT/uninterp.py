# Playing with uninterpreted functiosn

from z3 import *

import patsolve

s = patsolve.solver

fact = Function ("fact_int", IntSort(), IntSort())

n = Int ("n")
undef = Int ("n")

s.add (
    ForAll ([n], Implies (n < 0, fact(n) == undef))
)

s.add (
    fact(0) == 1
)

s.add (
    ForAll ([n], Implies (n > 0, fact(n+1) == (n+1) * fact(n)))
)

s.add (
    ForAll ([n], Implies (n > 0, fact(n) == n * fact(n-1)))
)
