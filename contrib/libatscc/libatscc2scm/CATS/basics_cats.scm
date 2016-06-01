;;
;;;;;;
;
; HX-2016-05:
; for Scheme code
; translated from ATS
;
;;;;;;
;;
;; For some implementations of scheme,
;; we may have to map [define-macro] to [defmacro]
;;
;; (defmacro (define-macro x y) `(defmacro ,x ,y))
;;
;;;;;;

;; ****** ****** ;;

(define atscc2scm_void '())

;; ****** ****** ;;

(define atscc2scm_true #t)
(define atscc2scm_false #f)

;; ****** ****** ;;

(define-macro (ATSINmove0_void) '())
(define-macro (ATSINmove1_void cmd) cmd)

;; ****** ****** ;;

(define-macro (ATSfunclo_fun fc) fc)
(define-macro (ATSfunclo_fclo fc) `(car ,fc))

;; ****** ****** ;;

(define-macro (ATSCKpat_int x y) `(eqv? ,x ,y))
(define-macro (ATSCKpat_bool x y) `(eqv? ,x ,y))
(define-macro (ATSCKpat_string x y) `(eqv? ,x ,y))

;; ****** ****** ;;
;;
(define-macro (ATSCCget_0 xs) `(car ,xs))
(define-macro (ATSCCget_1 xs) `(car (cdr ,xs)))
(define-macro (ATSCCget_2 xs) `(car (cdr (cdr ,xs))))
(define-macro (ATSCCget_3 xs) `(car (cdr (cdr (cdr ,xs)))))
;;
(define-macro (ATSCCget_at xs n) `(list-ref ,(xs) ,n))
;;
;; ****** ****** ;;

;;;;;; end of [basics_cats.scm] ;;;;;;
