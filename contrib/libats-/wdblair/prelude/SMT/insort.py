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

# drop and cons

s.add (
    ForAll ([A,B,x,m], Implies(cons(x, B) == drop(A, m), B == drop(A, m+1)))
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
    ForAll([A, B, C, n], 
                Implies (
                               And(permutation(A, B, n), permutation(B, C, n)), permutation(A, C, n)
                 )
     )
)

s.add(
     ForAll([A, B, C, x, i, n], 
                 Implies (
                                And(0 <= i, i < n, A == cons (x, B),
                                        permutation (B, C, n-1)
                                ),
                                permutation (A, insert (C, i, x), n)
                  )
     )
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
