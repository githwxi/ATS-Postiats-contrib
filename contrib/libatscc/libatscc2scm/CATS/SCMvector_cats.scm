;;;;;;
;
; HX-2016-06:
; for Scheme code translated from ATS
;
;;;;;;

;;;;;;
; beg of [SCMvector_cats.scm]
;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (SCMvector_nil) `(vector))
(define-macro
 (SCMvector_sing x) `(vector ,x))
(define-macro
 (SCMvector_pair x1 x2) `(vector ,x1 ,x2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (SCMvector_make_elt n x0) `(make-vector ,n ,x0)
) ;; define-macro
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (SCMvector_length xs) `(vector-length ,xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (SCMvector_get_at xs i) `(vector-ref ,xs ,i))
(define-macro
 (SCMvector_set_at xs i x0) `(vector-set! ,xs ,i ,x0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; end of [SCMvector_cats.scm] ;;;;;;
