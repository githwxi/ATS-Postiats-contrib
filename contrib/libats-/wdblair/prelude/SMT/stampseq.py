# Interpretations for static stamp seqeunce operations.
# Will Blair - wdblair@cs.bu.edu

import patsolve

# Get our solver
s = patsolve.solver

A = Array("A", IntSort(), IntSort())
i, j, x = Int("i"), Int("j"), Int("x")

StampSeqSort = lambda : ArraySort (IntSort(), IntSort())

# Undefined Section of an Array

s.add (
    ForAll ([A, i], Implies (i < 0, A[i] == 0))
)

# The "nil" array

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
    ForAll ([A, i, x], cons(x, A)[0] == x)
)

s.add (
    ForAll ([A, i, x],
            Implies (i > 0,
                     cons(x, A)[i] == A[i-1])
    )
)

# Take

take = Function ('stampseq_take', StampSeqSort(), IntSort(), 
                 StampSeqSort())

s.add (
    ForAll ([A, i, j],
            Implies (j >= 0,
                     take(A, i)[j] == If(j < i, A[j], 0))
    )
)

# Drop

drop = Function ('stampseq_drop', StampSeqSort(), IntSort(), 
                 StampSeqSort())

s.add (
    ForAll ([A, i, j], 
            Implies (And (0 <= i, 0 <= j),
                     drop(A, i)[j] == A[i+j]))
)

# Insert

insert = Function ('stampseq_insert', StampSeqSort(), IntSort(),
                   IntSort(), StampSeqSort())

s.add (
    ForAll ([A, x, i, j],
            insert(A, i, x)[j] == If(j < i, A[j],
                                     If(j == i, x, A[j-1]))
    )
)

# Append

append = Function ('stampseq_append', StampSeqSort(), IntSort(),
                   StampSeqSort(), IntSort(), StampSeqSort())

B = Array("B", IntSort(), IntSort())

m, n = Int("m"), Int("n")

s.add (
    ForAll([A, B, m, n , i],
           Implies(i >= 0,
                   append(A,m,B,n)[i] == If(i < m, A[i], B[i - m])))
)

# Permutation

permutation = Function ('stampseq_permutation',
                        StampSeqSort(), StampSeqSort(),
                        IntSort(), BoolSort())

s.add (
    ForAll([A, n], permutation(A, A, n) == True)
)
