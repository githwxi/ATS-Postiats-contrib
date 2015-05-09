# Interpretations for static stamp sequence operations.
# Will Blair - wdblair@cs.bu.edu

import patsolve

from z3 import *

# Get our solver
s = patsolve.solver

A = Array ("A", IntSort(), IntSort())
B = Array ("B", IntSort(), IntSort())

i, j, x, y, m, n = Ints("i j x y m n")

StampSeq = lambda name: Array (name, IntSort(), IntSort())
StampSeqSort = lambda : ArraySort (IntSort(), IntSort())

T0ype = DeclareSort ("t@ype")

# Some knowledge about sizeof
sizeof = Function ("sizeof", T0ype, IntSort())

a = Const ("a", T0ype)

s.add (
    ForAll (a, sizeof (a) > 0)
)

# Undefined Section of an Array

s.add (
    ForAll ([A, i], Implies (i < 0, A[i] == 0))
)

# The "nil" sequenc

nil = Function ('stampseq_nil', StampSeqSort())

s.add (
    ForAll (i, nil()[i] == 0)
)

# Sing

sing = Function ('stampseq_sing', IntSort(), StampSeqSort())

s.add (
    ForAll ([x, i], Select (sing(x), i) == Select(Store (nil(), 0, x), i))
)

# Cons

cons = Function ('stampseq_cons', IntSort(), StampSeqSort(), 
                 StampSeqSort())

s.add (
    ForAll ([A, x], cons(x, A)[0] == x)
)

s.add (
    ForAll ([A, i, x], Implies (i > 0, cons(x, A)[i] == A[i-1]))
)

# Take

take = Function ('stampseq_take', StampSeqSort(), IntSort(), 
                 StampSeqSort())

s.add (
    ForAll ([A, i, j], take(A, i)[j] == If(j < i, A[j], 0))
)

# Drop

drop = Function ('stampseq_drop', StampSeqSort(), IntSort(), 
                 StampSeqSort())

s.add (
    ForAll ([A, i, j], drop(A, i)[j] == A[i+j])
)

# Insert

insert = Function ('stampseq_insert', StampSeqSort(), IntSort(),
                   IntSort(), StampSeqSort())

s.add (
    ForAll ([A, x, i, j], insert(A, i, x)[j] == If(j < i, A[j],
                                                   If(j == i, x, A[j-1]))
    )
)

# Append

append = Function ('stampseq_append', StampSeqSort(), IntSort(),
                   StampSeqSort(), IntSort(), StampSeqSort())

m, n = Int("m"), Int("n")

s.add (
    ForAll([A, B, m, n , i], append(A,m,B,n)[i] == If(i < m, A[i], B[i - m]))
)

# Sorting

def stampseq_sorted (xs, n):
    """
    The first n elements of xs are sorted.
    """
    i, j = Ints ("i j")

    return ForAll([i, j], Implies (
        And (0 <= i, i <= j, j < n),
        xs[i] <= xs[j])
    )

# This axiom is important for proving the ptr_offset method, but I think asserting
# it generally to Z3 causes proof times to go up too high. I want to be able to
# bind this assertion only in the scope of an individual function...

#l , i = Ints ('l i')

#s.add (
#    ForAll([l, i, a], Implies(i >= 0, ((l+(i*sizeof(a)))-l)/sizeof(a) == i))
#)
