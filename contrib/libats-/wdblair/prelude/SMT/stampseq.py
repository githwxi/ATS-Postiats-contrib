# Interpretations for static stamp seqeunce operations.
# Will Blair - wdblair@cs.bu.edu

import patsolve

# Get our solver
s = patsolve.solver

A = Array("A", IntSort(), IntSort())
i, j, x = Int("i"), Int("j"), Int("x")

StampSeqSort = ArraySort (IntSort(), IntSort())

# Undefined Section of an Array

s.add (
    ForAll ([A, i], Implies (i < 0, Select(A, i) == 0))
)

nil = Function ('stampseq_nil', StampSeqSort)

s.add (
    ForAll (i, Select (nil(), i) == 0)
)

# Cons

cons = Function ('stampseq_cons', IntSort(), StampSeqSort, StampSeqSort)

s.add (
    ForAll ([A, i, x], Select (cons (x, A), 0) == x)
)

s.add (
    ForAll ([A, i, x], Implies (i > 0,
                                Select (cons (x, A), i) == Select (A, i -1))
    )
)

# Take

take = Function ('stampseq_take', StampSeqSort, IntSort(), StampSeqSort)

s.add (
    ForAll ([A, i, j], Implies (j >= 0, 
                                Select (take (A, i), j) == If(j < i, Select(A, j), 0)))
)

# Drop

drop = Function ('stampseq_drop', StampSeqSort, IntSort(), StampSeqSort)

s.add (
    ForAll ([A, i, j], Implies (And (0 <= i, 0 <= j),
                                Select (drop (A, i), j) == Select (A, i+j)))
)

append = Function ('stampseq_append', StampSeqSort, IntSort(),
                   StampSeqSort, IntSort(), StampSeqSort)

B = Array("B", IntSort(), IntSort())

m, n = Int("m"), Int("n")

s.add (
    ForAll([A,B,m,n,i], Implies(And (i >= 0, m >= 0, n >= 0),
                                Select (append (A, m, B, n), i) == If(i < m, Select(A, i), Select (B, i - m))))
)

print "StampSeq assertions loaded!"
