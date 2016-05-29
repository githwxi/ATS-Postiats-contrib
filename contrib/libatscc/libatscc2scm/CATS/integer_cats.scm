;;
;;;;;;
;
; HX-2016-05:
; for Scheme code
; translated from ATS
;
;;;;;;
;;

;;
;;;;;;
; beg of [integer_cats.hrl]
;;;;;;
;;

;; ****** ****** ;;
;;
;; HX: for signed integers
;;
;; ****** ****** ;;
;;
(defmaco
 (ats2scmpre_neg_int0 x) (- x)
)
(defmaco
 (ats2scmpre_neg_int1 x) (- x)
)
;;
;; ****** ****** ;;
;;
(defmaco
 (ats2scmpre_abs_int0 x) (abs x)
)
(defmaco
 (ats2scmpre_abs_int1 x) (abs x)
)
;;
;; ****** ****** ;;
;;
(defmaco
 (ats2scmpre_succ_int0 x) (+ x 1)
(defmaco
 (ats2scmpre_pred_int0 x) (- x 1)
;;
(defmaco
 (ats2scmpre_succ_int1 x) (+ x 1)
(defmaco
 (ats2scmpre_pred_int1 x) (- x 1)
;;
;; ****** ****** ;;
;;
(defmaco
 (ats2scmpre_add_int0_int0 x y) (+ x y)
(defmaco
 (ats2scmpre_sub_int0_int0 x y) (- x y)
(defmaco
 (ats2scmpre_mul_int0_int0 x y) (* x y)
(defmaco
 (ats2scmpre_div_int0_int0 x y) (quotient x y)
;;
(defmaco
 (ats2scmpre_add_int1_int1 x y) (+ x y)
(defmaco
 (ats2scmpre_sub_int1_int1 x y) (- x y)
(defmaco
 (ats2scmpre_mul_int1_int1 x y) (* x y)
(defmaco
 (ats2scmpre_div_int1_int1 x y) (quotient x y)
;;
;; ****** ****** ;;

;; end of [integer_cats.scm] ;;
