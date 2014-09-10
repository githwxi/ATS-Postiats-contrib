(assert (forall ((A (Array Int Int)) (i Int))
  (=> (< i 0) (= (select A i) 0))))

(assert (forall ((i Int))
  (= (select stampseq_nil i) 0)))

;; cons

(assert (forall ((A (Array Int Int)) (x Int))
  (= (select (stampseq_cons x A) 0) x)))

(assert (forall ((A (Array Int Int))(x Int) (i Int))
  (=> (> i 0) (= (select (stampseq_cons x A) i) (select A (- i 1))))))

;; take
(assert (forall ((A (Array Int Int)) (i Int) (j Int))
  (=> (<= 0 j)
    (= (select (stampseq_take A i) j) (ite (< j i) (select A j) 0)))))

;; drop
(assert (forall ((A (Array Int Int)) (i Int) (j Int))
  (=> (<= 0 i)
    (= (select (stampseq_drop A i) j) (select A (+ i j))))
))

;; append
(assert (forall ((A (Array Int Int)) (B (Array Int Int)) (m Int) (n Int) (i Int))
  (=> (>= i 0)
    (= (select (stampseq_append A m B n) i ) 
      (ite (< i m) (select A i) (select B (- i m)))))))

;; permutation
(assert (forall ((A (Array Int Int)) (n Int))
  (= (stampseq_permutation A A n) true)
  ))