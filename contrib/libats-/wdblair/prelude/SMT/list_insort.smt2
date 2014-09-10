;; sing and nil

(declare-const undef Int)

(assert (forall ((A (Array Int Int)) (i Int))
  (=> (< i 0) (= (select A i) undef))))

(assert (forall ((i Int))
  (= (select stampseq_nil i) undef)))

(assert (forall ((x Int))
  (= (stampseq_sing x) (store stampseq_nil 0 x))))

;; cons

(assert (forall ((A (Array Int Int))(x Int))
  (= (select (stampseq_cons x A) 0) x)))

(assert (forall ((A (Array Int Int))(x Int) (i Int))
  (=> (> i 0) (= (select (stampseq_cons x A) i) (select A (- i 1))))))

;; insert

(assert (forall ((A (Array Int Int))(x Int) (i Int) (j Int))
  (=> (and (<= 0 j) (<= 0 i))
    (= (select (stampseq_insert A i x) j) 
      (ite (< j i)
        (select A j)
        (ite (= j i)
          x
          (select A (- j 1)))
         )))))