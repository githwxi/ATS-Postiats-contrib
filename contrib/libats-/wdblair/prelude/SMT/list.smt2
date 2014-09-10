(assert (forall ((A (Array Int Int)) (i Int))
  (=> (< i 0) (= (select A i) 0))))

;; cons

(assert (forall ((A (Array Int Int))(x Int))
  (= (select (stampseq_cons x A) 0) x)))

(assert (forall ((A (Array Int Int))(x Int) (i Int))
  (=> (> i 0) (= (select (stampseq_cons x A) i) (select A (- i 1))))))

;; append
(assert (forall ((A (Array Int Int)) (B (Array Int Int)) (m Int) (n Int) (i Int))
  (=> (>= i 0)
    (= (select (stampseq_append A m B n) i ) 
      (ite (< i m) (select A i) (select B (- i m)))))))