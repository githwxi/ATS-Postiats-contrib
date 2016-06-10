;;;;;;
;
; HX-2016-06:
; for Scheme code translated from ATS
;
;;;;;;

;;;;;;
; beg of [SCMlist_cats.scm]
;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (SCMlist_nil) `(list))
(define-macro
 (SCMlist_sing x) `(list ,x))
(define-macro
 (SCMlist_pair x1 x2) `(list ,x1 ,x2))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (SCMlist_cons x0 xs) `(cons ,x0 ,xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; (define
;;  (SCMlist_make_elt n x0)
;;  (letrec
;;    ((loop
;;      (lambda(n res)
;;       (if (> n 0) (loop (- n 1) (SCMlist_cons x0 res)) res))
;;     )
;;    ) (loop n (SCMlist_nil))
;;  ) ;; letrec
;; ) ;; define-SCMlist_make_elt
(define-macro
 (SCMlist_make_elt n x0) `(make-list ,n ,x0))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (SCMlist_is_nil xs) `(null? ,xs))
(define-macro
 (SCMlist_is_cons xs) `(not (null? ,xs)))
(define-macro
 (SCMlist_isnot_nil xs) `(not (null? ,xs)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro (SCMlist_length xs) `(length ,xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro (SCMlist_head xs) `(car ,xs))
(define-macro (SCMlist_tail xs) `(cdr ,xs))
(define-macro (SCMlist_last_pair xs) `(last-pair ,xs))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-macro
 (SCMlist_get_at xs i) `(list-ref ,xs ,i))
(define-macro
 (SCMlist_set_at xs i x0) `(list-set! ,xs ,i ,x0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(define-macro
 (SCMlist_append xs ys) `(append ,xs ,ys))
;;
(define-macro (SCMlist_reverse xs) `(reverse ,xs))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;; end of [SCMlist_cats.scm] ;;;;;;
