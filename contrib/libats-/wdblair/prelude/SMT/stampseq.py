# Interpretations for static stamp seqeunce operations.
# Will Blair - wdblair@cs.bu.edu

import patsolve

from z3 import *

# Get our solver
s = patsolve.solver

A = Array ("A", IntSort(), IntSort())
B = Array ("B", IntSort(), IntSort())

i, j, x, y = Int("i"), Int("j"), Int("x"), Int("y")

StampSeq = lambda name: Array (name, IntSort(), IntSort())
StampSeqSort = lambda : ArraySort (IntSort(), IntSort())

# Undefined Section of an Array

s.add (
    ForAll ([A, i], Implies (i < 0, A[i] == 0))
)

# The "nil" sequence

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

B = Array("B", IntSort(), IntSort())

m, n = Int("m"), Int("n")

s.add (
    ForAll([A, B, m, n , i], append(A,m,B,n)[i] == If(i < m, A[i], B[i - m]))
)

# Permutation

permutation = Function ('stampseq_permutation',
                        StampSeqSort(), StampSeqSort(),
                        IntSort(), BoolSort())

C = Array("C", IntSort(), IntSort())

s.add (
    ForAll([A, n], permutation(A, A, n) == True)
)

s.add (
    ForAll([A, B, C, n], Implies (And(permutation(A, B, n), permutation(B, C, n)), permutation(A, C, n)))
)

s.add (
    ForAll([A, B, x, i, n], Implies (And(A == cons (x, B), 0 <= i, i <= n), permutation (A, insert(B, i, x), n)))
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

# for any sequence xs, ordered(xs) means that the entire sequence
# is ordered.

ordered = Function ('stampseq_ordered', StampSeqSort(), BoolSort())

s.add (
    ordered(nil())
)

s.add (
    ForAll(x, ordered(cons(x, nil())))
)

s.add (
    ForAll(x, ordered(insert(nil(), 0, x)))
)

s.add (
    ForAll([A, x], Implies(And (x <= A[0], ordered(A)),
                           ordered(insert(A,0,x)))
    )
)

s.add (
    ForAll([A,B,x], Implies (And (ordered(A), A == cons(x, B)),
                             ordered (B)
                    )
    )
)

s.add (
    ForAll([A, B, x, y, i], Implies(And (ordered(A),
                                         ordered(insert(B, i, y)),
                                         A == cons (x, B),
                                         x <= y
                                    ),
                                    ordered (insert(A, i+1, y))
                            )
    )
)
