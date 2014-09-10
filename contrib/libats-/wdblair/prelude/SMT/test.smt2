(declare-sort t0ype)
(declare-const p Int)
(declare-const q Int)
(declare-const i Int)
(declare-const a t0ype)

(declare-fun sizeof (t0ype) Int)

(assert (>= i 0))
(assert (> (sizeof a) 0))

(assert (= q (+ p ( * i (sizeof a)))))

(push)
(assert (not (= (div (- q p) (sizeof a)) i)))
(check-sat)
(pop)